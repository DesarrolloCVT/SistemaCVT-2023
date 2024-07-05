
using Microsoft.Web.Administration;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace TestApiEnvioAuto.Controllers
{
    [RoutePrefix("api/InicioPool")]
    public class IniciaPoolsController : ApiController
    {
        [HttpGet]
        [Route("ReiniciaPools")]
        public HttpResponseMessage RecycleAppPoolApi()
        {
            string resp = "";
            try
            {
                string appPoolName = "bmas"; // Cambia esto con el nombre tu Application Pool
                using (ServerManager serverManager = new ServerManager())
                {
                    ApplicationPool appPool = serverManager.ApplicationPools[appPoolName];
                    if (appPool != null)
                    {
                        if (appPool.State == ObjectState.Stopped)
                        {
                            appPool.Start();
                        }
                        else
                        {
                            appPool.Recycle();
                        }

                        resp = "Application Pool " + appPoolName + " ha sido reciclado.";
                        string respuesta = JsonConvert.SerializeObject(resp);
                        var res = Request.CreateResponse(HttpStatusCode.Created);
                        res.Content = new StringContent(respuesta, System.Text.Encoding.UTF8, "application/json");
                        return res;
                    }
                    else
                    {
                       
                        resp = "No se pudo encontrar el Application Pool " + appPoolName + ".";
                        string respuesta = JsonConvert.SerializeObject(resp);
                        var res = Request.CreateResponse(HttpStatusCode.Created);
                        res.Content = new StringContent(respuesta, System.Text.Encoding.UTF8, "application/json");
                        return res;
                    }
                }
            }
            catch (Exception ex)
            {
              
                resp = "Error al reciclar Application Pool: " + ex.Message;
                string respuesta = JsonConvert.SerializeObject(resp);
                var res = Request.CreateResponse(HttpStatusCode.Created);
                res.Content = new StringContent(respuesta, System.Text.Encoding.UTF8, "application/json");
                return res;
            }
        }
    }
}