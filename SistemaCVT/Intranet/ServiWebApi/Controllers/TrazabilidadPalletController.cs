using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DBMermasRecepcion;


namespace ServiWebApi.Controllers
{
    public class TrazabilidadPalletController : ApiController
    {

        DBMLCVTDESAINTDataContext dbDsa = new DBMLCVTDESAINTDataContext();
        DBMLCVTWMSDataContext DBDatos = new DBMLCVTWMSDataContext();

        [HttpGet]
        public List<VW_TRAZABILIDAD_PALLET_MOVIL> TrazabilidadPallet(int NumPallet)
        {
            List<VW_TRAZABILIDAD_PALLET_MOVIL> ret = new List<VW_TRAZABILIDAD_PALLET_MOVIL>();
            try
            {
                ret = (from t in DBDatos.VW_TRAZABILIDAD_PALLET_MOVIL
                       where t.Package_SSCC.Equals(NumPallet)
                       select t).ToList<VW_TRAZABILIDAD_PALLET_MOVIL>();
            }
            catch (Exception)
            {


            }
            return ret;
        }

        [HttpGet]
        public List<VW_SOPORTANTE_MOVIL> TrazabilidadPalletSoportante(int NPallet)
        {
            List<VW_SOPORTANTE_MOVIL> ret = new List<VW_SOPORTANTE_MOVIL>();
            try
            {
                ret = (from t in DBDatos.VW_SOPORTANTE_MOVIL
                       where t.Package_SSCC.Equals(NPallet)
                       orderby t.FECHA descending
                       select t
                       ).ToList<VW_SOPORTANTE_MOVIL>();
            }
            catch (Exception)
            {


            }
            return ret;
        }
    }
}