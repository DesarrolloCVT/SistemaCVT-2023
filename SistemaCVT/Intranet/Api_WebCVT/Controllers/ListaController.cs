using Api_WebCVT.Models;
using DBMermasRecepcion;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;

namespace Api_WebCVT.Controllers
{
 
    [RoutePrefix("api/Test")]
    [Authorize]
    [ApiExplorerSettings(IgnoreApi = true)]
    public class ListaController : ApiController
    {
        DBMLCVTWMSDataContext DBDatos = new DBMLCVTWMSDataContext();
        DBMLCVTDESAINTDataContext dbDsa = new DBMLCVTDESAINTDataContext();

        [HttpGet]
        [Route("listaTodo")]
        public List<VW_BODEGAS_XAMARIN> ListaBodega()
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
        [Route("BuscaBod/{idBod}")]
        public string BuscaBodega(int idBod)
        {
            string ret = "";
            try
            {
                var temp = (from p in DBDatos.VW_BODEGAS_XAMARIN
                            where p.Site_Id.Equals(idBod)
                            select new { p.Site_Description }).FirstOrDefault();
                if (temp != null)
                    ret = temp.Site_Description;
                else ret = "No Encontrado";
            }
            catch
            {

            }
            return ret;
        }

        [HttpPost]
        [Route("PosUser")]        
        public HttpResponseMessage insertaUs(UserInst CdUs)
        {
            if(!ModelState.IsValid)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);                
            }
            else
            {
                int ret = 0;
                try
                {
                    CVT_Test_WSIntranet vDet = new CVT_Test_WSIntranet();

                    vDet.Nombre = CdUs.Nombre;
                    vDet.Apellido = CdUs.Apellido;

                    dbDsa.CVT_Test_WSIntranet.InsertOnSubmit(vDet);
                    dbDsa.SubmitChanges();
                    
                    ret = vDet.Id;

                    if (ret != 0)
                    {
                        List<ResultPosOV> ls = new List<ResultPosOV>();

                        ResultPosOV re = new ResultPosOV();
                        re.Ack = Convert.ToInt16(ret);
                        re.msgNumber = 12345;
                        re.msgDescription = "Registrado";
                        ls.Add(re);


                        string outputString = JsonConvert.SerializeObject(ls);
                        var response = Request.CreateResponse(HttpStatusCode.Created);
                        response.Content = new StringContent(outputString, System.Text.Encoding.UTF8, "application/json");
                        return response;
                    }
                    else
                    {
                        var response = Request.CreateResponse(HttpStatusCode.InternalServerError);
                        response.Content = new StringContent("Error en Consulta", System.Text.Encoding.UTF8, "application/json");
                        return response;
                    }
                }
                catch (Exception ex)
                {
                    var response = Request.CreateResponse(HttpStatusCode.InternalServerError);
                    response.Content = new StringContent(ex.Message.ToString(), System.Text.Encoding.UTF8, "application/json");
                    return response;
                }
            }


        }


        [HttpPost]
        [Route("PostBodega")]
        public HttpResponseMessage LitProduc(List<BodegaClass> Bodega, HttpRequestMessage request)
        {

            List<BodegaClass> ls = Bodega;

            
            string outputString = JsonConvert.SerializeObject(ls);
            var response = Request.CreateResponse(HttpStatusCode.InternalServerError);
            response.Content = new StringContent("Resultado"+ outputString, System.Text.Encoding.UTF8, "application/json");
            return response;
        }

        [HttpPost]
        [Route("PosteaOC")]

        public HttpResponseMessage AgregaOC(PedidoOVClass oc, HttpRequestMessage request)
        {
            if (!ModelState.IsValid)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }
            else
            {
                //int ret = 0;
                //try
                //{
                //    CVT_Test_WSIntranet vDet = new CVT_Test_WSIntranet();

                //    vDet.Nombre = CdUs.Nombre;
                //    vDet.Apellido = CdUs.Apellido;

                //    dbDsa.CVT_Test_WSIntranet.InsertOnSubmit(vDet);
                //    dbDsa.SubmitChanges();

                //    ret = vDet.Id;

                //    if (ret != 0)
                //    {
                //        List<ResultPosOC> ls = new List<ResultPosOC>();

                //        ResultPosOC re = new ResultPosOC();
                //        re.Ack = Convert.ToInt16(ret);
                //        re.msgNumber = 12345;
                //        re.msgDescription = "Registrado";
                //        ls.Add(re);


                //        string outputString = JsonConvert.SerializeObject(ls);
                //        var response = Request.CreateResponse(HttpStatusCode.Created);
                //        response.Content = new StringContent(outputString, System.Text.Encoding.UTF8, "application/json");
                //        return response;
                //    }
                //    else
                //    {
                //        var response = Request.CreateResponse(HttpStatusCode.InternalServerError);
                //        response.Content = new StringContent("Error en Consulta", System.Text.Encoding.UTF8, "application/json");
                //        return response;
                //    }
                //}
                //catch (Exception ex)
                //{
                //    var response = Request.CreateResponse(HttpStatusCode.InternalServerError);
                //    response.Content = new StringContent(ex.Message.ToString(), System.Text.Encoding.UTF8, "application/json");
                //    return response;
                //}

                TokenInfo tk = new TokenInfo();
                var dir = tk.GetTokenInfo(request);


                int IdUser = 0;
                string Nombre = "";
                string usur = "";
                foreach (var t in dir)
                {
                    IdUser = t.IdUser;
                    Nombre = t.nombre;
                    usur = t.nombreUser;
                }

                string outputString = JsonConvert.SerializeObject(dir);
                var response = Request.CreateResponse(HttpStatusCode.InternalServerError);
                response.Content = new StringContent(outputString, System.Text.Encoding.UTF8, "application/json");
                return response;
            }
        }
    }
}