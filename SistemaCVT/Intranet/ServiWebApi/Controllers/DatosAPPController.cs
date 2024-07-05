using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ServiWebApi.Controllers
{
    public class DatosAPPController : ApiController
    {
        DBMLCVTDESAINTDataContext dbDsa = new DBMLCVTDESAINTDataContext();

        [HttpGet]
        public string ObtieneVersion(int idAPP)
        {
            string ret ="0.0.0";
            try
            {
                var temp = (from l in dbDsa.DatoVersionesAPPXAM
                            where l.id_Version.Equals(idAPP)
                            select new { l.CodVersion }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.CodVersion;
                }
            }
            catch (Exception)
            {
                
            }
            return ret;
        }

    }
}