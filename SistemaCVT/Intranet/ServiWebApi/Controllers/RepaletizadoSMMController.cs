using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ServiWebApi.Controllers
{
    public class RepaletizadoSMMController : ApiController
    {
        DBMLCVTWMSMETRODataContext DBWMSMetro = new DBMLCVTWMSMETRODataContext();
        DBMLCVTMMETRODataContext Mmtro = new DBMLCVTMMETRODataContext();

        [HttpGet]
        public List<SMM_Package> ObtieneDatosDelBultoSMM(int pkg)
        {
            List<SMM_Package> ret = new List<SMM_Package>();

            try
            {
                ret = (from fd in DBWMSMetro.SMM_Package
                       where fd.Package_SSCC.Equals(pkg)
                       select fd).ToList<SMM_Package>();
            }
            catch
            {
            }
            return ret;
        }

        [HttpGet]
        public string ObtieneNombreProducto(string itemCod)
        {
            string ret = "";
            try
            {
                var temp = (from t in Mmtro.MMetro_OITM
                            where t.ItemCode.Equals(itemCod)
                            select new { t.ItemName }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToString(temp.ItemName);
                }
            }
            catch
            {
                ret = "";
            }
            return ret;
        }


        [HttpGet]
        public int ObtieneSiteLayoutSMM(int? layoutid)
        {
            int ret = 0;
            try
            {
                var temp = (from l in DBWMSMetro.SMM_Layout
                            where l.Layout_Id.Equals(layoutid)
                            select new { l.Site_Id }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Site_Id;
                }
            }
            catch (Exception)
            {

                ret = 0;
            }
            return ret;
        }


        [HttpGet]
        public string ObtieneNombreCortoSitioSMM(int siteid)
        {
            string ret = string.Empty;
            try
            {
                var temp = (from s in DBWMSMetro.SMM_Site
                            where s.Site_Id.Equals(siteid)
                            select new { s.Site_Description }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Site_Description;
                }
            }
            catch (Exception)
            {


            }
            return ret;
        }


        [HttpGet]
        public int VerificaReservaPalletSMM(string SSCC)
        {
            int ret = 0;
            try
            {
                var temp = (from r in DBWMSMetro.SMM_Package
                            where r.Package_SSCC.Equals(SSCC)
                            select new { r.Package_ReserveQuantity }).FirstOrDefault();
                if (temp != null)
                {
                    ret = (int)temp.Package_ReserveQuantity;
                }
            }
            catch
            {
                ret = 0;
            }
            return ret;
        }


        [HttpGet]
        public bool RepaletizaConDestinoSMM(string Origen, string Destino, string Cant, int username)
        {
            bool ret = false;

            decimal Cantidad = Convert.ToDecimal(Cant);
            CVTWMSMetroClass wmsMe = new CVTWMSMetroClass();
            try
            {
                List<SMM_Package> PO = wmsMe.ObtieneInfoPalletSMM(Origen);
                SAPSMM sp = new SAPSMM();

                foreach (var p in PO)
                {
                    if (p.Package_Quantity - Cantidad >= 0)
                    {
                        #region Transacciones
                        //Agrega PickingList
                        SMM_PickingList NPL = new SMM_PickingList();
                        NPL.Site_Id = ObtieneSiteLayoutSMM(p.Layout_Id);
                        NPL.PickingList_Date = DateTime.Now;
                        NPL.itemCode = p.ItemCode;
                        NPL.itemName = sp.ObtieneNombreProducto(p.ItemCode).ToString();
                        NPL.PickingList_Quantity = Cantidad;
                        NPL.Package_Id_Origin = p.Package_Id;
                        NPL.Package_SSCC_Origin = p.Package_SSCC;
                        NPL.Package_Id_Destiny = wmsMe.ObtienePackageIdSMM(Destino);
                        NPL.Package_SSCC_Destiny = Destino;
                        NPL.IdUsuario = username;
                        DBWMSMetro.SMM_PickingList.InsertOnSubmit(NPL);
                        DBWMSMetro.SubmitChanges();

                        // Agrega Movimientos
                        //AddMovement(ObtieneSiteLayout(p.Layout_Id), 2, Cantidad, 7, ObtieneIdStaff(username), p.Package_Quantity - Cantidad, 1, 1, p.Package_Id);
                        //Actualiza Origen
                        wmsMe.ActualizaRestaCantidadPackageSMM(p.Package_Id, Cantidad);
                        List<SMM_Package> PD = wmsMe.ObtieneInfoPalletSMM(Destino);
                        foreach (var p1 in PD)
                        {
                            //Agrega Movimiento Destino
                            //AddMovement(ObtieneSiteLayout(p.Layout_Id), 1, Cantidad, 7, ObtieneIdStaff(username), p1.Package_Quantity + Cantidad, 1, 1, p1.Package_Id);
                            //Actualiza Destino
                            wmsMe.ActualizaSumaCantidadPackageSMM(p1.Package_Id, Cantidad);
                            wmsMe.AddLocation(p1.Package_Id, (int)p.Layout_Id, username);
                        }
                        #endregion
                    }
                }
                ret = true;
            }
            catch (Exception)
            {

                ret = false;
            }
            return ret;
        }

        [HttpGet]
        public string RepaletizaNuevo(string Origen, string Cantidad, int user)
        {
            string ret = string.Empty;
            int packageNuevo = 0;

            CVTWMSMetroClass wmsMe = new CVTWMSMetroClass();
            List<SMM_Package> PO = wmsMe.ObtieneInfoPalletSMM(Origen);
            SAPSMM sp = new SAPSMM();
            try
            {

                foreach (var p in PO)
                {
                    if (p.Package_Quantity >=Convert.ToDecimal(Cantidad))
                    {
                        packageNuevo = wmsMe.ClonePackage(p);
                        #region Transacciones
                        //Agrega PickingList
                        SMM_PickingList NPL = new SMM_PickingList();
                        NPL.Site_Id = ObtieneSiteLayoutSMM(p.Layout_Id);
                        NPL.PickingList_Date = DateTime.Now;
                        NPL.itemCode = p.ItemCode;
                        NPL.itemName = sp.ObtieneNombreProducto(p.ItemCode).ToString();
                        NPL.PickingList_Quantity =Convert.ToDecimal(Cantidad);
                        NPL.Package_Id_Origin = p.Package_Id;
                        NPL.Package_SSCC_Origin = p.Package_SSCC;
                        NPL.Package_Id_Destiny = wmsMe.ObtienePackageIdSMM(packageNuevo.ToString());
                        NPL.Package_SSCC_Destiny = packageNuevo.ToString();
                        NPL.IdUsuario = user;
                        DBWMSMetro.SMM_PickingList.InsertOnSubmit(NPL);
                        DBWMSMetro.SubmitChanges();

                        // Agrega Movimientos
                        //AddMovement(ObtieneSiteLayout(p.Layout_Id), 2, Cantidad, 7, ObtieneIdStaff(username), p.Package_Quantity - Cantidad, 1, 1, p.Package_Id);
                        //Actualiza Origen
                        wmsMe.ActualizaRestaCantidadPackageSMM(p.Package_Id,Convert.ToDecimal(Cantidad));
                        List<SMM_Package> PD = wmsMe.ObtieneInfoPalletSMM(packageNuevo.ToString());
                        foreach (var p1 in PD)
                        {
                            //Agrega Movimiento Destino
                            //AddMovement(ObtieneSiteLayout(p.Layout_Id), 1, Cantidad, 7, ObtieneIdStaff(username), p1.Package_Quantity + Cantidad, 1, 1, p1.Package_Id);
                            //Actualiza Destino
                            wmsMe.ActualizaSumaCantidadPackageSMM(p1.Package_Id,Convert.ToDecimal(Cantidad));
                            wmsMe.AddLocation(p1.Package_Id, (int)p.Layout_Id, user);
                        }

                    }

                    #endregion
                    ret = packageNuevo.ToString();
                }
            }
            catch (Exception)
            {

                ret = string.Empty;
            }
            return ret;
        }


    }
}