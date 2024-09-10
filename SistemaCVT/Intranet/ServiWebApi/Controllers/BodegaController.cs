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
    //[Route("api/BodegaController")]
    public class BodegaController : ApiController
    {
        DBMLCVTDESAINTDataContext dbDsa = new DBMLCVTDESAINTDataContext();
        DBMLCVTWMSDataContext DBDatos = new DBMLCVTWMSDataContext();

        [HttpGet]
        public DataTable GetConsultaTransferencias(int transferId)
        {
            DataTable ret = new DataTable();
            try
            {
                DBDatos.CommandTimeout = 60000;
                ret = Utilidades.LINQToDataTable(DBDatos.SP_ConsultaTransferencia(transferId));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        [HttpGet]
        public int ObtieneSiteLayout(int? layoutid)
        {
            int ret = 0;
            try
            {
                var temp = (from l in DBDatos.Layout
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
        public string ObtieneNombreCortoSitio(int siteid)
        {
            string ret = string.Empty;
            try
            {
                var temp = (from s in DBDatos.Site
                            where s.Site_Id.Equals(siteid)
                            select new { s.Site_ShortDescription }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Site_ShortDescription;
                }
            }
            catch (Exception)
            {


            }
            return ret;
        }

        [HttpGet]
        public List<CVT_DatosLayout> ObtieneInfoLayout(int CodLayoutInfo)
        {
            List<CVT_DatosLayout> ret = new List<CVT_DatosLayout>();
            try
            {
                ret = (from t in DBDatos.CVT_DatosLayout
                       where t.Layout_Id.Equals(CodLayoutInfo)
                       select t).ToList<CVT_DatosLayout>();
            }
            catch (Exception)
            {


            }
            return ret;
        }

        [HttpGet]

        public List<VW_BODEGAS_XAMARIN> ObtieneBodegas()
        {
            List<VW_BODEGAS_XAMARIN> ret = new List<VW_BODEGAS_XAMARIN>();
            try
            {
                ret = (from t in DBDatos.VW_BODEGAS_XAMARIN                   
                       select t).ToList<VW_BODEGAS_XAMARIN>();
            }
            catch (Exception)
            {


            }
            return ret;
        }

        [HttpGet]
        public bool AgregaPalletTransferRF(int transferid, int packageid, string username)
        {
            bool ret = false;
            try
            {
                WMSClass vWms = new WMSClass();
                vWms.AgregaBultoTransferenciaRF(transferid, packageid, username);
                ret = true;
            }
            catch (Exception)
            {

                throw;
            }
            return ret;
        }

        [HttpGet]
        public List<Transfer> ObtieneTransferenciasAbiertas(int tranferencias)
        {
            List<Transfer> ret = new List<Transfer>();
            try
            {
                ret = (from t in DBDatos.Transfer
                       where t.Status.Equals(1)
                       select t).ToList<Transfer>();
            }
            catch (Exception)
            {


            }
            return ret;
        }


    }
}