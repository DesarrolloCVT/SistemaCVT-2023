using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ServiWebApi.Controllers
{
    public class ConsultaProductosSMMController : ApiController
    {
        DBMLCVTWMSMETRODataContext wmsM = new DBMLCVTWMSMETRODataContext();
        DBMLCVTMMETRODataContext DBMmetro = new DBMLCVTMMETRODataContext();

        [HttpGet]
        public string ValidaCodProductoSMM(string BarraProd)
        {
            string ret = "";
            try
            {
                var temp = (from p in DBMmetro.SMM_VW_ValidaProductosSMM
                            where p.BcdCode.Equals(BarraProd)
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
        public List<SMM_VW_ValidaProductosSMM> DatosPackageSMM(string  NumBarra)
        {
            List<SMM_VW_ValidaProductosSMM> ret = new List<SMM_VW_ValidaProductosSMM>();
            try
            {
                ret = (from p in DBMmetro.SMM_VW_ValidaProductosSMM
                       where p.BcdCode.Equals(NumBarra)
                       select p).ToList<SMM_VW_ValidaProductosSMM>();
            }
            catch
            {
            }
            return ret;
        }
    }
}