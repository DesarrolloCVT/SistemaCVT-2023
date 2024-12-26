using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ServiWebApi.Controllers
{
    public class PosicionamientoController : ApiController
    {
        DBMLCVTDESAINTDataContext dbDsa = new DBMLCVTDESAINTDataContext();
        DBMLCVTWMSDataContext DBDatos = new DBMLCVTWMSDataContext();

        [HttpGet]
        public List<Package> ObtieneInfoPalletPosicionamiento(string SSCC)
        {
            List<Package> ret = new List<Package>();
            try
            {
                ret = (from p in DBDatos.Package
                       where (p.Package_Status.Equals(2) || p.Package_Status.Equals(3)) && p.Package_OutDate.Equals(null) && p.Package_SSCC.Equals(SSCC)
                       select p).ToList<Package>();
            }
            catch
            {
            }
            return ret;
        }
        [HttpGet]
        public List<VW_XAMARIN_PACKAGE> ObtieneInfoPalletPos(string SSCCPack)
        {
            List<VW_XAMARIN_PACKAGE> ret = new List<VW_XAMARIN_PACKAGE>();
            try
            {
                ret = (from p in dbDsa.VW_XAMARIN_PACKAGE
                       where (p.Package_Status.Equals(2) || p.Package_Status.Equals(3)) && p.Package_OutDate.Equals(null) && p.Package_SSCC.Equals(SSCCPack)
                       select p).ToList<VW_XAMARIN_PACKAGE>();
            }
            catch
            {
            }
            return ret;
        }
        [HttpGet]
        public int ObtienePackageIdPosicionamiento(string NumPallet)
        {
            int ret = 0;
            try
            {
                var temp = (from p in DBDatos.Package
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
        [Route("ValidaLayout")]
        public bool ValidarLayoutExistente(int LayoutID)
        {
            bool ret = false;
            try
            {
                var temp = (from l in DBDatos.Location
                            where l.Layout_Id.Equals(LayoutID)
                            select l.Layout_Id ).FirstOrDefault();

                if(temp != 0)
                {
                    ret = true;
                }
            }
            catch (Exception) 
            {

            }
            return ret;
        }
    }
}