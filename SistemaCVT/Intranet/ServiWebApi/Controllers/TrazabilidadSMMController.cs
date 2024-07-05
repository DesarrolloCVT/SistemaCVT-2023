using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ServiWebApi.Controllers
{
    public class TrazabilidadSMMController : ApiController
    {
        DBMLCVTWMSMETRODataContext wmsM = new DBMLCVTWMSMETRODataContext();
        DBMLCVTMMETRODataContext DBMmetro = new DBMLCVTMMETRODataContext();

        [HttpGet]
        public List<SMM_VW_TRAZABILIDAD_BUSQUEDA> TrazabilidadPalletBusqueda(string NumPallet)
        {
            List<SMM_VW_TRAZABILIDAD_BUSQUEDA> ret = new List<SMM_VW_TRAZABILIDAD_BUSQUEDA>();
            try
            {
                ret = (from t in wmsM.SMM_VW_TRAZABILIDAD_BUSQUEDA
                       where t.NPallet.Equals(NumPallet)
                       select t).ToList<SMM_VW_TRAZABILIDAD_BUSQUEDA>();
            }
            catch (Exception)
            {


            }
            return ret;
        }

        [HttpGet]
        public List<SMM_VW_TRAZABILIDAD_PALLET> TrazabilidadPallet(string PalletTraza)
        {
            List<SMM_VW_TRAZABILIDAD_PALLET> ret = new List<SMM_VW_TRAZABILIDAD_PALLET>();
            try
            {


                ret = (from t in wmsM.SMM_VW_TRAZABILIDAD_PALLET
                       where t.NPallet.Equals(PalletTraza)
                       orderby t.fecha descending
                       select t).ToList<SMM_VW_TRAZABILIDAD_PALLET>();
            }
            catch (Exception)
            {


            }
            return ret;
        }
    }
}