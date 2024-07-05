using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DBMermasRecepcion;

namespace ServiWebApi.Controllers
{
    public class TomaInventarioSMMController : ApiController
    {
        DBMLCVTWMSMETRODataContext wmsM = new DBMLCVTWMSMETRODataContext();
        DBMLCVTMMETRODataContext DBMmetro = new DBMLCVTMMETRODataContext();

        [HttpGet]
        public IEnumerable<SMM_FOLIOS_INVENTARIOS_XAMARIN> Get()
        {
            var listadoFolio = wmsM.SMM_FOLIOS_INVENTARIOS_XAMARIN.ToList();
            return listadoFolio;
        }

        [HttpGet]
        public int ValidaBodegaSMM(string CodBodega)
        {
            int ret = 0;
            try
            {
                var temp = (from l in wmsM.SMM_Site
                            where l.Site_Description.Equals(CodBodega)
                            select new { l.Site_Id }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.Site_Id);
                }
            }
            catch
            {
            }
            return ret;
        }

        [HttpGet]
        public string ValidaCodProducto(string CodBarraProd)
        {
            string ret = "";
            try
            {
                var temp = (from p in DBMmetro.SMM_VW_CodigosdeBarra
                            where p.BcdCode.Equals(CodBarraProd)
                            select new { p.ItemCode, p.ItemName }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToString(temp.ItemCode + ' ' + temp.ItemName);
            }
            catch
            {
            }
            return ret;
        }

        [HttpGet]
        public string TraeCodProd(string CodBarr)
        {
            string ret = "";
            try
            {
                var temp = (from p in DBMmetro.SMM_VW_CodigosdeBarra
                            where p.BcdCode.Equals(CodBarr)
                            select new { p.ItemCode }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToString(temp.ItemCode);
            }
            catch
            {
            }
            return ret;
        }
        [HttpGet]
        public string TraeCodBarraProducto(string CodProductoBarra,string npalletProd)
        {
            string ret = "";
            try
            {
                var temp = (from p in DBMmetro.SMM_VW_CodigosdeBarra
                            where p.ItemCode.Equals(CodProductoBarra) 
                            select new { p.BcdCode }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToString(temp.BcdCode);
            }
            catch
            {
            }
            return ret;
        }

        [HttpGet]
        public string TraeProducto(string PalletProducto)
        {
            string ret = "";
            try
            {
                var temp = (from p in wmsM.SMM_Package
                            where p.Package_SSCC.Equals(PalletProducto) 
                            select new { p.ItemCode }).FirstOrDefault();
                if (temp != null)
                    ret = temp.ItemCode;
            }
            catch
            {
            }
            return ret;
        }

        [HttpGet]
        public bool InsertaRegistroInventarioSMM(int vInventario_Id, string vDun14, string vCodProducto, string vCantidad, int vSiteID, int vIdUsuario, string vUbiPasillo, DateTime Fvenc,string vCantxEmp,int vCantBase,string vTipoEmpaque)
        {
            bool ret = false;
            try
            {
                SMM_InventarioDetalle vDet = new SMM_InventarioDetalle();

                vDet.Inventario_Id = vInventario_Id;
                vDet.Dun14 = vDun14;
                vDet.CodProducto = vCodProducto;
                vDet.Cantidad = Convert.ToDecimal(vCantidad);
                vDet.SiteID = vSiteID;
                vDet.IdUsuario = vIdUsuario;
                vDet.FechaRegistro = DateTime.Now;
                vDet.UbiPasillo = vUbiPasillo;
                vDet.FechaVencimiento = Fvenc;
                vDet.CantEmp = vCantxEmp;
                vDet.CantBase = vCantBase;
                vDet.TipoEmpaque = vTipoEmpaque;

                wmsM.SMM_InventarioDetalle.InsertOnSubmit(vDet);
                wmsM.SubmitChanges();
                ret = true;

            }
            catch
            {


            }
            return ret;
        }

        [HttpGet]

        public int ValidaNumeroDePallet(int NumeroDePallet,string Codpro)
        {
            int ret = 0;
            try
            {
                var temp = (from p in wmsM.SMM_Package
                            where p.Package_SSCC.Equals(NumeroDePallet) && p.ItemCode.Equals(Codpro)
                            select new { p.Package_Id}).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToInt32(temp.Package_Id);
            }
            catch
            {
            }
            return ret;
        }


        [HttpGet]
        public int ValidaPalletEnBodega(int PalletVerifica)
        {
            int ret = 0;
            try
            {
                var temp = (from p in wmsM.SMM_Package
                            where p.Package_SSCC.Equals(PalletVerifica)
                            select new { p.Package_Id }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToInt32(temp.Package_Id);
            }
            catch
            {
            }
            return ret;
        }
        [HttpGet]
        public int ValidaUbicacion(int bodega,int ubicacion)
        {
            int ret = 0;
            try
            {
                var temp = (from p in wmsM.SMM_Layout
                            where p.Layout_Id.Equals(ubicacion) && p.Site_Id.Equals(bodega)
                            select new { p.Layout_Id }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToInt32(temp.Layout_Id);
            }
            catch
            {
            }
            return ret;
        }

        [HttpGet]
        public bool InsertaDetalleInventarioBodega(int vInventario_Id, string vDun14, string vCodProducto, string vCantidad, int vSiteID, int vIdUsuario, int vUbicacion, DateTime Fvenc,int SSCC, string vCantxEmp, int vCantBase, string vTipoEmpaque)
        {
            bool ret = false;
            try
            {
                SMM_InventarioDetalle vDet = new SMM_InventarioDetalle();

                vDet.Inventario_Id = vInventario_Id;
                vDet.Dun14 = vDun14;
                vDet.CodProducto = vCodProducto;
                vDet.Cantidad = Convert.ToDecimal(vCantidad);
                vDet.SiteID = vSiteID;
                vDet.IdUsuario = vIdUsuario;
                vDet.FechaRegistro = DateTime.Now;
                vDet.Location_Id= vUbicacion;
                vDet.FechaVencimiento = Fvenc;
                vDet.Package_SSCC = SSCC;
                vDet.CantEmp = vCantxEmp;
                vDet.CantBase = vCantBase;
                vDet.TipoEmpaque = vTipoEmpaque;
                wmsM.SMM_InventarioDetalle.InsertOnSubmit(vDet);
                wmsM.SubmitChanges();
                ret = true;

            }
            catch
            {


            }
            return ret;
        }

        [HttpGet]

        public List<SMM_VW_DATO_PROD_RECEPCION> ObtieneDetosProdRecepcion(string itemcode, string codBar)
        {
            List<SMM_VW_DATO_PROD_RECEPCION> ret = new List<SMM_VW_DATO_PROD_RECEPCION>();
            try
            {
                ret = (from r in DBMmetro.SMM_VW_DATO_PROD_RECEPCION
                       where r.ItemCode.Equals(itemcode) && r.BcdCode.Equals(codBar)
                       select r).ToList<SMM_VW_DATO_PROD_RECEPCION>();
            }
            catch (Exception ex)
            {
                string a = ex.Message.ToString();
            }
            return ret;
        }


        [HttpGet]
        public string CodBarraBodega02(int NpalletBodega02)
        {
            string ret = "";
            try
            {
                var temp = (from p in wmsM.SMM_Package
                            where p.Package_SSCC.Equals(NpalletBodega02)
                            select new { p.Package_SN }).FirstOrDefault();
                if (temp != null)
                    ret = temp.Package_SN.ToString();
            }
            catch
            {
            }
            return ret;
        }


    }
}