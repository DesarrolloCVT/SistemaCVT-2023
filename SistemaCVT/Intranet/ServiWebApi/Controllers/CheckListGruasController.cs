using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common.CommandTrees;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ServiWebApi.Controllers
{
    //Nuevo controlador CheckListGruas
    [RoutePrefix("api/CheckListGruas")]
    public class CheckListGruasController : ApiController
    {
        DBMLCVTDESAINTDataContext dbDsa = new DBMLCVTDESAINTDataContext();

        [HttpGet]
        [Route("TiposMaquinaria")]
        public List<string> ObtieneTiposMaquinaria()
        {
            List<string> ret = new List<string>();
            try
            {
                ret = (
                    from l in dbDsa.CVT_Gruas
                    select l.Tipo).Distinct().ToList<string>();
            }
            catch (Exception)
            {

            }
            return ret;
        }

        [HttpGet]
        [Route("NumeroGrua")]
        public List<string> ObtieneNumeroGrua()
        {
            List<string> ret = new List<string>();
            try
            {
                ret = (
                    from l in dbDsa.CVT_Gruas
                    select l.Grua_Numero).Distinct().ToList<string>();
            }
            catch (Exception)
            {

            }
            return ret;
        }
    }
}