using ApiWebCVTProductivo.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;


namespace ApiWebCVTProductivo.Controllers
{
    [RoutePrefix("api/Add")]
    [Authorize]
    public class AddController : ApiController
    {
        #region Post_Orden_Ventas
        ///<summary>
        ///create a new purchase order in B+, return success or error message and transaction code
        ///</summary>
        ///<param name="OrdenVenta">List purchase order B+ </param>
        /////<param name="password">create in CVTrading</param>
        //////*<returns>list of products</returns>*/
        [HttpPost]
        [Route("PostOC")]
        public HttpResponseMessage AgregaOV(List<PedidoOVClass> OrdenVenta, HttpRequestMessage request)
        {
            //if (!ModelState.IsValid)
            //{
            //    return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            //}
            //else
            //{
            TokenInfo tk = new TokenInfo();
            var dat = tk.GetTokenInfo(request);

            //int IdUser = 0;
            //string Nombre = "";
            string usur = "";
            foreach (var t in dat)
            {
                //IdUser = t.IdUser;
                //Nombre = t.nombre;
                usur = t.nombreUser;
            }
            SapSBOClass sap = new SapSBOClass();

            List<RespSAPClass> reslt = sap.CreaDocumentoVenta(usur, OrdenVenta);

            int codRes = 0;
            int nTrasn = 0;
            string MensaResp = "";

            foreach (var t in reslt)
            {
                codRes = t.Codigo;
                nTrasn = Convert.ToInt32(t.NTransac);
                MensaResp = t.Mensaje;
            }

            ResultPosOV resultP = new ResultPosOV();
            List<ResultPosOV> lisResultPos = new List<ResultPosOV>();

            resultP.Ack = Convert.ToInt16(codRes);
            resultP.msgNumber = nTrasn;
            resultP.msgDescription = MensaResp;

            lisResultPos.Add(resultP);


            if (codRes == 0)
            {

                string respuesta = JsonConvert.SerializeObject(resultP);
                var res = Request.CreateResponse(HttpStatusCode.Created);
                res.Content = new StringContent(respuesta, System.Text.Encoding.UTF8, "application/json");
                return res;
            }
            else
            {
                string respuesta = JsonConvert.SerializeObject(resultP);
                var res = Request.CreateResponse(HttpStatusCode.InternalServerError);
                res.Content = new StringContent(respuesta, System.Text.Encoding.UTF8, "application/json");
                return res;
            }

            //}


        }
        ///<summary>
        ///create a new purchase order in CVtrading, return success or error message and transaction code
        ///</summary>
        ///<param name="OrdenVentaCVT">List purchase order CVtrading </param>
        /////<param name="password">create in CVTrading</param>
        //////*<returns>list of products</returns>*/

        [HttpPost]
        [Route("PostCVTOC")]
        public HttpResponseMessage AgregaOVCVT(List<PedidoCVTOVClass> OrdenVentaCVT, HttpRequestMessage request)
        {
            //if (!ModelState.IsValid)
            //{
            //    return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            //}
            //else
            //{
            TokenInfo tk = new TokenInfo();
            var dat = tk.GetTokenInfo(request);

            //int IdUser = 0;
            //string Nombre = "";
            string usur = "";
            foreach (var t in dat)
            {
                //IdUser = t.IdUser;
                //Nombre = t.nombre;
                usur = t.nombreUser;
            }
            SapCVTClass sap = new SapCVTClass();

            List<RespSAPClass> reslt = sap.CreaDocumentoVentaCVT(usur, OrdenVentaCVT);

            int codRes = 0;
            int nTrasn = 0;
            string MensaResp = "";

            foreach (var t in reslt)
            {
                codRes = t.Codigo;
                nTrasn = Convert.ToInt32(t.NTransac);
                MensaResp = t.Mensaje;
            }

            ResultPosOV resultP = new ResultPosOV();
            List<ResultPosOV> lisResultPos = new List<ResultPosOV>();

            resultP.Ack = Convert.ToInt16(codRes);
            resultP.msgNumber = nTrasn;
            resultP.msgDescription = MensaResp;

            lisResultPos.Add(resultP);


            if (codRes == 0)
            {

                string respuesta = JsonConvert.SerializeObject(resultP);
                var res = Request.CreateResponse(HttpStatusCode.Created);
                res.Content = new StringContent(respuesta, System.Text.Encoding.UTF8, "application/json");
                return res;
            }
            else
            {
                string respuesta = JsonConvert.SerializeObject(resultP);
                var res = Request.CreateResponse(HttpStatusCode.InternalServerError);
                res.Content = new StringContent(respuesta, System.Text.Encoding.UTF8, "application/json");
                return res;
            }

            //}


        }


        #endregion
        #region Post_CreaCliente
        ///<summary>
        ///create a new Client, return success or error message and client code
        ///</summary>
        ///<param name="Client">Class Client </param>
        /////<param name="password">create in CVTrading</param>
        //////*<returns>list of products</returns>*/
        [HttpPost]
        [Route("PostClienteDireciones")]
        public HttpResponseMessage AgregaClienteDireccion(ClienteClass Client, HttpRequestMessage request)
        {
            if (!ModelState.IsValid)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }
            else
            {
                //TokenInfo tk = new TokenInfo();
                //var dat = tk.GetTokenInfo(request);

                ////int IdUser = 0;
                ////string Nombre = "";
                //string usur = "";
                //foreach (var t in dat)
                //{
                //    //IdUser = t.IdUser;
                //    //Nombre = t.nombre;
                //    usur = t.nombreUser;
                //}
                SapSBOClass sap = new SapSBOClass();
                List<RespSAPClass> reslt = sap.CreaSocioNegocio(Client);

                int codRes = 0;
                string nTrasn = "";
                string MensaResp = "";

                foreach (var t in reslt)
                {
                    codRes = t.Codigo;
                    nTrasn = t.NTransac;
                    MensaResp = t.Mensaje;
                }

                ResultPosSMM resultP = new ResultPosSMM();
                List<ResultPosSMM> lisResultPos = new List<ResultPosSMM>();

                resultP.Ack = Convert.ToInt16(codRes);
                resultP.CodTransac = nTrasn;
                resultP.msgDescription = MensaResp;
                lisResultPos.Add(resultP);

                if (codRes == 0)
                {

                    string respuesta = JsonConvert.SerializeObject(lisResultPos);
                    var res = Request.CreateResponse(HttpStatusCode.Created);
                    res.Content = new StringContent(respuesta, System.Text.Encoding.UTF8, "application/json");
                    return res;
                }
                else
                {
                    string respuesta = JsonConvert.SerializeObject(resultP);
                    var res = Request.CreateResponse(HttpStatusCode.InternalServerError);
                    res.Content = new StringContent(respuesta, System.Text.Encoding.UTF8, "application/json");
                    return res;
                }

            }


        }

        [HttpPost]
        [Route("PostAddDirecciones")]
        public HttpResponseMessage AgregaDirecciones(DireccionClass DirClient, HttpRequestMessage request)
        {
            if (!ModelState.IsValid)
            {
                return Request.CreateErrorResponse(HttpStatusCode.BadRequest, ModelState);
            }
            else
            {
                //TokenInfo tk = new TokenInfo();
                //var dat = tk.GetTokenInfo(request);

                ////int IdUser = 0;
                ////string Nombre = "";
                //string usur = "";
                //foreach (var t in dat)
                //{
                //    //IdUser = t.IdUser;
                //    //Nombre = t.nombre;
                //    usur = t.nombreUser;
                //}
                SapSBOClass sap = new SapSBOClass();
                List<RespSAPClass> reslt = sap.AgregaDireccionesSocioNegocio(DirClient);

                int codRes = 0;
                string nTrasn = "";
                string MensaResp = "";

                foreach (var t in reslt)
                {
                    codRes = t.Codigo;
                    nTrasn = t.NTransac;
                    MensaResp = t.Mensaje;
                }

                ResultPosSMM resultP = new ResultPosSMM();
                List<ResultPosSMM> lisResultPos = new List<ResultPosSMM>();

                resultP.Ack = Convert.ToInt16(codRes);
                resultP.CodTransac = nTrasn;
                resultP.msgDescription = MensaResp;
                lisResultPos.Add(resultP);

                if (codRes == 0)
                {

                    string respuesta = JsonConvert.SerializeObject(lisResultPos);
                    var res = Request.CreateResponse(HttpStatusCode.Created);
                    res.Content = new StringContent(respuesta, System.Text.Encoding.UTF8, "application/json");
                    return res;
                }
                else
                {
                    string respuesta = JsonConvert.SerializeObject(resultP);
                    var res = Request.CreateResponse(HttpStatusCode.InternalServerError);
                    res.Content = new StringContent(respuesta, System.Text.Encoding.UTF8, "application/json");
                    return res;
                }

            }


        }
        #endregion
    }
}