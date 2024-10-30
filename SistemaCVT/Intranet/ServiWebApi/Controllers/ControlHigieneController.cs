using DBMermasRecepcion;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ServiWebApi.Controllers
{
    [RoutePrefix("api/ControlHigiene")]
    public class ControlHigieneController : ApiController
    {
        DBMLCVTDESAINTDataContext dbDsa = new DBMLCVTDESAINTDataContext();
        [HttpGet]
        [Route("listaMonitor")]
        public IEnumerable<CVT_Personal> ListaPersonal()
        {



            var ListaReponedores = (from p in dbDsa.CVT_Personal
                                    where p.monitor.Equals(true)
                                    select p).ToList<CVT_Personal>();
            return ListaReponedores;
        }

        [HttpGet]
        [Route("listaArea")]
        public IEnumerable<VW_AREA_TRABAJO> ListaAreaTrabajo()
        {
            var ListaAreas = dbDsa.VW_AREA_TRABAJO.ToList();

            return ListaAreas;
        }

        [HttpGet]
        [Route("listaPersonal")]
        public IEnumerable<CVT_Personal> ListaPersonalFull()
        {
            var ListaPersonal = (from p in dbDsa.CVT_Personal
                                 orderby p.Nombre ascending
                                 select p).ToList<CVT_Personal>();

            return ListaPersonal;
        }

        [HttpPost]
        [Route("PostControl")]
        public HttpResponseMessage AgregaControlhig(CVT_ControlHigene con, HttpRequestMessage request)
        {
            String ret = "-1";
            try
            {
                CVT_ControlHigene ch = new CVT_ControlHigene();
                ch.Fecha = DateTime.Now;
                ch.Id_Monitor = con.Id_Monitor;
                ch.Id_Area = con.Id_Area;
                ch.Tipo_Contrato = con.Tipo_Contrato;
                ch.Id_Persona = con.Id_Persona;
                ch.Limpieza_Uniforme = con.Limpieza_Uniforme;
                ch.Afeitado_PeloCorto = con.Afeitado_PeloCorto;
                ch.Uñas = con.Uñas;
                ch.Joyas = con.Joyas;
                ch.Higene = con.Higene;
                ch.Accion_Correctiva = con.Accion_Correctiva;
                ch.Estado_Uniforme = con.Estado_Uniforme;
                ch.Herida_Expuesta = con.Herida_Expuesta;
                dbDsa.CVT_ControlHigene.InsertOnSubmit(ch);
                dbDsa.SubmitChanges();
                ret = ch.Id_ControlHigene.ToString();

            }
            catch (Exception ex)
            {
                ret = ex.Message;

            }           

            string respuesta = JsonConvert.SerializeObject(ret);
            var res = Request.CreateResponse(HttpStatusCode.Created);
            res.Content = new StringContent(respuesta, System.Text.Encoding.UTF8, "application/json");
            return res;


        }




    }
}