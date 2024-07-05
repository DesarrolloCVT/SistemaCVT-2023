using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ServiWebApi.Controllers
{
    public class PosicionamientoSMMController : ApiController
    {
        DBMLCVTWMSMETRODataContext wmsM = new DBMLCVTWMSMETRODataContext();
        DBMLCVTMMETRODataContext DBMmetro = new DBMLCVTMMETRODataContext();

        //[HttpGet]
        //public List<SMM_Package> ObtieneInfoPalletPosicionamientoSMM(string SSCC)
        //{
        //    List<SMM_Package> ret = new List<SMM_Package>();
        //    try
        //    {
        //        ret = (from p in wmsM.SMM_Package
        //               where (p.Package_Status.Equals(2) || p.Package_Status.Equals(3)) && p.Package_OutDate.Equals(null) && p.Package_SSCC.Equals(SSCC)
        //               select p).ToList<SMM_Package>();
        //    }
        //    catch
        //    {
        //    }
        //    return ret;
        //}

        [HttpGet]
        public int ObtienePackageIdPosicionamiento(string NumPallet)
        {
            int ret = 0;
            try
            {
                var temp = (from p in wmsM.SMM_Package
                            where p.Package_SSCC.Equals(NumPallet) && (p.Package_Status.Equals(3) || p.Package_Status.Equals(2))
                            select new { p.Package_Id }).FirstOrDefault();
                if (temp != null)
                    ret = temp.Package_Id;
            }
            catch (Exception)
            {

                ret = 0;
            }
            return ret;
        }

        [HttpGet]

        public string TraeDescripcionLayout(int idLayout)
        {
            string ret = "";
            try
            {
                var temp = (from l in wmsM.SMM_Layout
                            where l.Layout_Id.Equals(idLayout)
                            select new { l.Layout_Y_Pasillo,l.Layout_Z_Columna,l.Layout_X_Fila }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Layout_Y_Pasillo+"-"+temp.Layout_Z_Columna+"-"+temp.Layout_X_Fila;
                }
            }
            catch
            {
            }
            return ret;
        }


        [HttpGet]

        public string TraeNombreSitoxLayout(int idPosicion)
        {
            string ret = "";
           
            try
            {
                var temp = (from l in wmsM.SMM_Layout
                            join p in wmsM.SMM_Site on l.Site_Id equals p.Site_Id
                            where l.Layout_Id.Equals(idPosicion)
                            select new { p.Site_Description }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Site_Description;
                }
            }
            catch
            {
            }
            return ret;
        }
        [HttpGet]
        public List<VW_DATOS_PACKAGE_XAMRIN> ObtienedatosProducto(string NumeroPalletPos)
        {
            List<VW_DATOS_PACKAGE_XAMRIN> ret = new List<VW_DATOS_PACKAGE_XAMRIN>();
            try
            {
                ret = (from p in wmsM.VW_DATOS_PACKAGE_XAMRIN
                       where  p.Package_SSCC.Equals(NumeroPalletPos)
                       select p).ToList<VW_DATOS_PACKAGE_XAMRIN>();
            }
            catch
            {
            }
            return ret;
        }

        [HttpGet]
        public bool ActualizaLayoutPackage(int PackageId, int layoutid)
        {
            bool flag = false;
            try
            {
                IQueryable<SMM_Package> queryable = from t in this.wmsM.SMM_Package
                                                where t.Package_Id.Equals(PackageId)
                                                select t;
                foreach (SMM_Package package in queryable)
                {
                    package.Package_Status = 2;
                    package.Layout_Id = layoutid;

                }
                this.wmsM.SubmitChanges();

                flag = true;
            }
            catch
            {
                flag = false;
            }
            return flag;
        }

        [HttpGet]
        public bool AddLocation(int PackageId, int LayoutDestinoId, int idUsuario)
        {
            bool flag = false;
            DateTime now = DateTime.Now;
            CVTWMSMetroClass vWms = new CVTWMSMetroClass();
            try
            {
                IQueryable<SMM_Location> queryable = from t in this.wmsM.SMM_Location
                                                 where t.Package_Id.Equals(PackageId) && t.Location_OutDate.Equals(null)
                                                 select t;
                foreach (SMM_Location location in queryable)
                {

                    location.Location_OutDate = DateTime.Now;

                }
                this.wmsM.SubmitChanges();
                List<SMM_Layout> dt = vWms.ObtieneInfoLayout(LayoutDestinoId);
                foreach (var l in dt)
                {
                    SMM_Location entity = new SMM_Location
                    {                      
                        Site_Id = l.Site_Id,                      
                        Layout_Id = LayoutDestinoId,
                        Package_Id = PackageId,
                        Location_InDate = now,
                        idUsuario = new int?(idUsuario)
                    };
                    this.wmsM.SMM_Location.InsertOnSubmit(entity);
                    this.wmsM.SubmitChanges();
                }
                flag = true;
            }
            catch
            {
                flag = false;
            }

            return flag;
        }
    }
}