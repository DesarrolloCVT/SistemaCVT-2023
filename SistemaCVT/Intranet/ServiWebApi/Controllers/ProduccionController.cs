using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ServiWebApi.Controllers
{
    public class ProduccionController : ApiController
    {
        DBMLCVTDESAINTDataContext dbDsa = new DBMLCVTDESAINTDataContext();
        DBMLCVTWMSDataContext DBDatos = new DBMLCVTWMSDataContext();

        [HttpGet]
        public DataTable GetConsultaPosicion(int Idpos)
        {
            DataTable ret = new DataTable();
            try
            {
                DBDatos.CommandTimeout = 60000;
                ret = Utilidades.LINQToDataTable(DBDatos.SP_CONSULTAPOSICION_XAMARIN(Idpos));
            }
            catch (Exception)
            {

            }
            return ret;
        }
        [HttpGet]
        public DataTable GetResumenConsultaPosision(int NumPosicion)
        {
            DataTable ret = new DataTable();
            try
            {
                DBDatos.CommandTimeout = 60000;
                ret = Utilidades.LINQToDataTable(DBDatos.SP_RESUMEN_CONSULTAPOSICION_XAMARIN(NumPosicion));
            }
            catch (Exception)
            {

            }
            return ret;
        }
        [HttpGet]
        public List<VW_XAMARIN_PACKAGE> ListaInfoPallet(string NumeroDePallet)
        {
            List<VW_XAMARIN_PACKAGE> ret = new List<VW_XAMARIN_PACKAGE>();
            try
            {
                ret = (from p in dbDsa.VW_XAMARIN_PACKAGE
                       where p.Package_Status.Equals(3) && p.Package_OutDate.Equals(null) && p.Package_SSCC.Equals(NumeroDePallet)
                       select p).ToList<VW_XAMARIN_PACKAGE>();
            }
            catch
            {
            }
            return ret;
        }
        [HttpGet]
        public List<Package> ObtieneInfoPallet(string SSCC)
        {
            List<Package> ret = new List<Package>();
            try
            {
                ret = (from p in DBDatos.Package
                       where p.Package_Status.Equals(3) && p.Package_OutDate.Equals(null) && p.Package_SSCC.Equals(SSCC)
                       select p).ToList<Package>();
            }
            catch
            {
            }
            return ret;
        }
        [HttpGet]
        public List<ArticleProvider> ObtieneInfoProducto(int ID)
        {
            List<ArticleProvider> ret = new List<ArticleProvider>();
            ret = (from r in DBDatos.ArticleProvider
                   where r.ArticleProvider_Id.Equals(ID)
                   select r).ToList<ArticleProvider>();
            return ret;
        }
        
        [HttpGet]
        public List<VW_PRODUCTOS_XAMARIN> ObtieneProductos()
        {
            List<VW_PRODUCTOS_XAMARIN> ret = new List<VW_PRODUCTOS_XAMARIN>();
            try
            {
                ret = (from t in DBDatos.VW_PRODUCTOS_XAMARIN
                       select t).ToList<VW_PRODUCTOS_XAMARIN>();
            }
            catch (Exception)
            {


            }
            return ret;
        }
        [HttpGet]
        public int VerificaReservaPallet(string numPallet)
        {
            int ret = 0;
            try
            {
                var temp = (from r in DBDatos.Package
                            where r.Package_SSCC.Equals(numPallet)
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
        public bool RepaletizaConDestino(string Origen, string Destino, int Cantidad, string username)
        {
            bool ret = false;
            try
            {
                List<Package> PO = ObtieneInfoPallet(Origen);
                BodegaController bo = new BodegaController();
                WMSClass wmsc = new WMSClass();
                foreach (var p in PO)
                {
                    if (p.Package_Quantity - Cantidad >= 0)
                    {
                        #region Transacciones
                        //Agrega PickingList
                        PickingList NPL = new PickingList();
                        NPL.Company_Id = p.Company_Id;
                        NPL.Site_Id = bo.ObtieneSiteLayout(p.Layout_Id);
                        NPL.PickingList_Date = DateTime.Now;
                        NPL.Order_Type = 0;
                        NPL.Order_Id = 0;
                        NPL.PickingList_ProductCode =wmsc.ObtieneCodProduct(p.ArticleProvider_Id);
                        NPL.ArticleProvider_Id = p.ArticleProvider_Id;
                        NPL.MeasurementUnit_Id = 1;
                        NPL.PickingList_Quantity = Cantidad;
                        NPL.Package_Id_Origin = p.Package_Id;
                        NPL.Package_SSCC_Origin = p.Package_SSCC;
                        NPL.Package_Id_Destiny = wmsc.ObtienePackageId(Destino);
                        NPL.Package_SSCC_Destiny = Destino;
                        NPL.PickingList_Level = 1;
                        NPL.Staff_Id =wmsc.ObtieneIdStaff(username);
                        DBDatos.PickingList.InsertOnSubmit(NPL);
                        DBDatos.SubmitChanges();

                        // Agrega Movimientos
                        wmsc.AddMovement(wmsc.ObtieneSiteLayout(p.Layout_Id), 2, Cantidad, 7, wmsc.ObtieneIdStaff(username), p.Package_Quantity - Cantidad, 1, 1, p.Package_Id);
                        //Actualiza Origen
                        wmsc.ActualizaRestaCantidadPackage(p.Package_Id, Cantidad);
                        List<Package> PD = ObtieneInfoPallet(Destino);
                        foreach (var p1 in PD)
                        {
                            //Agrega Movimiento Destino
                           wmsc.AddMovement(wmsc.ObtieneSiteLayout(p.Layout_Id), 1, Cantidad, 7, wmsc.ObtieneIdStaff(username), p1.Package_Quantity + Cantidad, 1, 1, p1.Package_Id);
                            //Actualiza Destino
                            wmsc.ActualizaSumaCantidadPackage(p1.Package_Id, Cantidad);
                            wmsc.AddLocation(p1.Package_Id, (int)p.Layout_Id, wmsc.ObtieneIdStaff(username));
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
        public string RepaletizaNuevo(string BOrigen, int Cantidad, string NusuarioSis)
        {
            string ret = string.Empty;
            int packageNuevo = 0;
            WMSClass wmsc = new WMSClass();
            List<Package> PO = ObtieneInfoPallet(BOrigen);
            try
            {

                foreach (var p in PO)
                {
                    if (p.Package_Quantity >= Cantidad)
                    {
                        packageNuevo = wmsc.ClonePackage(p);
                        #region Transacciones
                        //Agrega PickingList
                        PickingList NPL = new PickingList();
                        NPL.Company_Id = p.Company_Id;
                        NPL.Site_Id = wmsc.ObtieneSiteLayout(p.Layout_Id);
                        NPL.PickingList_Date = DateTime.Now;
                        NPL.Order_Type = 0;
                        NPL.Order_Id = 0;
                        NPL.PickingList_ProductCode = wmsc.ObtieneCodProduct(p.ArticleProvider_Id);
                        NPL.ArticleProvider_Id = p.ArticleProvider_Id;
                        NPL.MeasurementUnit_Id = 1;
                        NPL.PickingList_Quantity = Cantidad;
                        NPL.Package_Id_Origin = p.Package_Id;
                        NPL.Package_SSCC_Origin = p.Package_SSCC;
                        NPL.Package_Id_Destiny = wmsc.ObtienePackageId(packageNuevo.ToString());
                        NPL.Package_SSCC_Destiny = packageNuevo.ToString();
                        NPL.PickingList_Level = 1;
                        NPL.Staff_Id = wmsc.ObtieneIdStaff(NusuarioSis);
                        DBDatos.PickingList.InsertOnSubmit(NPL);
                        DBDatos.SubmitChanges();

                        // Agrega Movimientos
                        wmsc.AddMovement(wmsc.ObtieneSiteLayout(p.Layout_Id), 2, Cantidad, 7, wmsc.ObtieneIdStaff(NusuarioSis), p.Package_Quantity - Cantidad, 1, 1, p.Package_Id);
                        //Actualiza Origen
                        wmsc.ActualizaRestaCantidadPackage(p.Package_Id, Cantidad);
                        List<Package> PD = ObtieneInfoPallet(packageNuevo.ToString());
                        foreach (var p1 in PD)
                        {
                            //Agrega Movimiento Destino
                            wmsc.AddMovement(wmsc.ObtieneSiteLayout(p.Layout_Id), 1, Cantidad, 7, wmsc.ObtieneIdStaff(NusuarioSis), p1.Package_Quantity + Cantidad, 1, 1, p1.Package_Id);
                            //Actualiza Destino
                            wmsc.ActualizaSumaCantidadPackage(p1.Package_Id, Cantidad);
                            wmsc.AddLocation(p1.Package_Id, (int)p.Layout_Id, wmsc.ObtieneIdStaff(NusuarioSis));
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
        [HttpGet]
        public bool ActualizaLayoutPackage(int PackageId, int layoutid)
        {
            bool flag = false;
            try
            {
                IQueryable<Package> queryable = from t in this.DBDatos.Package
                                                where t.Package_Id.Equals(PackageId)
                                                select t;
                foreach (Package package in queryable)
                {
                    package.Package_Status = 3;
                    package.Layout_Id = layoutid;

                }
                this.DBDatos.SubmitChanges();
            }
            catch
            {
                flag = false;
            }
            return flag;
        }
        [HttpGet]
        public bool AddLocation(int PackageId, int LayoutDestinoId, int StaffId)
        {
            bool flag = false;
            DateTime now = DateTime.Now;
            WMSClass vWms = new WMSClass();
            try
            {
                IQueryable<Location> queryable = from t in this.DBDatos.Location
                                                 where t.Package_Id.Equals(PackageId) && t.Location_OutDate.Equals(null)
                                                 select t;
                foreach (Location location in queryable)
                {

                    location.Location_OutDate = DateTime.Now;

                }
                this.DBDatos.SubmitChanges();
                List<Layout> dt = vWms.ObtieneInfoLayout(LayoutDestinoId);
                foreach (var l in dt)
                {
                    Location entity = new Location
                    {
                        Company_Id = 1,
                        Site_Id = l.Site_Id,
                        Warehouse_Id = l.Warehouse_Id,
                        Layout_Id = LayoutDestinoId,
                        Package_Id = PackageId,
                        Location_InDate = now,
                        Staff_Id = new int?(StaffId)
                    };
                    this.DBDatos.Location.InsertOnSubmit(entity);
                    this.DBDatos.SubmitChanges();
                }
                flag = true;
            }
            catch
            {
                flag = false;
            }


            return flag;
        }

        [HttpGet]
        [Route("ValidaPallet")]
        public bool ValidaPallet(string SSCC)
        {
            bool ret = false;
            try
            {
                var resp = (from p in DBDatos.Package
                       where p.Package_SSCC.Equals(SSCC) && p.Package_Status.Equals(3)
                       select p.Package_SSCC);
                if (resp.Count() > 0) 
                {
                    ret = true;
                }
            }
            catch
            {
            }
            return ret;
        }
        [HttpGet]
        [Route("ObtieneOrderDetail")]
        public int ObtieneOrderDetail(int orderID, string lote)
        {
            int ret = 0;
            try
            {
                ret = (int)(from od in DBDatos.OrderDetail
                       join p in DBDatos.Package
                       on od.Package_Id equals p.Package_Id
                       where od.Order_Id.Equals(orderID) && p.Package_Lot.Equals(lote)
                       select od.OrderDetail_Quantity).Sum();
            }
            catch (Exception)
            {
            }
            return ret;
        }
    }
}