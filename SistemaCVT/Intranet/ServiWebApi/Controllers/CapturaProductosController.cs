using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ServiWebApi.Controllers
{
    public class CapturaProductosController : ApiController
    {
        DBMLCVTDESAINTDataContext dbDsa = new DBMLCVTDESAINTDataContext();
        DBMLCVTWMSDataContext DBDatos = new DBMLCVTWMSDataContext();
        DBMLCVTSAPDataContext dbSap = new DBMLCVTSAPDataContext();

        [HttpGet]
        public List<CVT_CBARRAS> DatosProductos(string codbarr)
        {
            List<CVT_CBARRAS> ret = new List<CVT_CBARRAS>();
            try
            {
                ret = (from t in dbSap.CVT_CBARRAS
                       where t.CBarras.Equals(codbarr)
                       select t).ToList<CVT_CBARRAS>();
            }
            catch (Exception)
            {


            }
            return ret;
        }


    }
}