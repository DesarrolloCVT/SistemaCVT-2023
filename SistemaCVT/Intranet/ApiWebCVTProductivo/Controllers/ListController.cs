using DBMermasRecepcion;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;

namespace ApiWebCVTProductivo.Controllers
{
    [RoutePrefix("api/List")]
    [Authorize]
    public class ListController : ApiController
    {
        DBMLCVTSAPDataContext DBSap = new DBMLCVTSAPDataContext();
        DBMLCVTMMETRODataContext DBSMMSap = new DBMLCVTMMETRODataContext();
        #region ListasCVT
        #region Sucursales

        ///<summary>
        ///returns a list of branches
        ///</summary>

        [HttpGet]
        [Route("GetSucursales")]
        public HttpResponseMessage ListaSucursales()
        {
            try
            {
                var listadoSuc = DBSap.VW_CVT_ListaSucursales_GetSucursales.ToList();
                string outputString = JsonConvert.SerializeObject(listadoSuc);


                if (outputString.Equals("[]"))
                {
                    var response = Request.CreateResponse(HttpStatusCode.BadRequest);
                    response.Content = new StringContent("Error en Consulta", System.Text.Encoding.UTF8, "application/json");
                    return response;
                }
                else
                {
                    var response = Request.CreateResponse(HttpStatusCode.OK);
                    response.Content = new StringContent(outputString, System.Text.Encoding.UTF8, "application/json");
                    return response;
                }


            }
            catch (Exception ex)
            {
                var response = Request.CreateResponse(HttpStatusCode.BadRequest);
                response.Content = new StringContent(ex.Message.ToString(), System.Text.Encoding.UTF8, "application/json");
                return response;
            }
        }


        ///<summary>
        ///search for a branch by identifier
        ///</summary>
        ///<param name="CodCli"></param>
        ///<param name="CodSuc"></param>
        ///<returns>list of branch</returns>
        [HttpGet]
        [Route("GetConsultaSuc/{CodCli},{CodSuc}")]
        [ApiExplorerSettings(IgnoreApi = true)]
        public HttpResponseMessage ConsultaProductos(string CodCli, string CodSuc)
        {
            try
            {
                var listadoSuc = (from u in DBSap.VW_CVT_ListaSucursales_GetSucursales
                                  where u.Cod_Cliente.Equals(CodCli) || (u.Cod_Cliente.Equals(CodCli) && u.Cod_Interno.Equals(CodSuc))
                                  select u).ToList<VW_CVT_ListaSucursales_GetSucursales>();
                string outputString = JsonConvert.SerializeObject(listadoSuc);

                if (outputString.Equals("[]"))
                {
                    var response = Request.CreateResponse(HttpStatusCode.BadRequest);
                    response.Content = new StringContent("Error en Consulta", System.Text.Encoding.UTF8, "application/json");
                    return response;

                }
                else
                {

                    var response = Request.CreateResponse(HttpStatusCode.OK);
                    response.Content = new StringContent(outputString, System.Text.Encoding.UTF8, "application/json");
                    return response;
                }

            }
            catch (Exception ex)
            {
                var response = Request.CreateResponse(HttpStatusCode.BadRequest);
                response.Content = new StringContent(ex.Message.ToString(), System.Text.Encoding.UTF8, "application/json");
                return response;
            }
        }
        #endregion
        #region Clientes

        ///<summary>
        ///returns a list of Client
        ///</summary>
        [HttpGet]
        [Route("GetClientes")]
        public HttpResponseMessage ListaClientes()
        {
            try
            {
                var listadoUser = DBSap.VW_CVT_ListaClientes_GetClientes.ToList();
                string outputString = JsonConvert.SerializeObject(listadoUser);


                if (outputString.Equals("[]"))
                {
                    var response = Request.CreateResponse(HttpStatusCode.BadRequest);
                    response.Content = new StringContent("Error en Consulta", System.Text.Encoding.UTF8, "application/json");
                    return response;
                }
                else
                {
                    var response = Request.CreateResponse(HttpStatusCode.OK);
                    response.Content = new StringContent(outputString, System.Text.Encoding.UTF8, "application/json");
                    return response;
                }


            }
            catch (Exception ex)
            {
                var response = Request.CreateResponse(HttpStatusCode.BadRequest);
                response.Content = new StringContent(ex.Message.ToString(), System.Text.Encoding.UTF8, "application/json");
                return response;
            }
        }

        [HttpGet]
        [Route("GetConsultaClientes/{codC}")]
        [ApiExplorerSettings(IgnoreApi = true)]
        public HttpResponseMessage ConsultaClientes(string codC)
        {
            try
            {
                var listadoUser = (from u in DBSap.VW_CVT_ListaClientes_GetClientes
                                   where u.Cod_Interno.Equals(codC)
                                   select u).ToList<VW_CVT_ListaClientes_GetClientes>();
                string outputString = JsonConvert.SerializeObject(listadoUser);

                if (outputString.Equals("[]"))
                {
                    var response = Request.CreateResponse(HttpStatusCode.BadRequest);
                    response.Content = new StringContent("Error en Consulta", System.Text.Encoding.UTF8, "application/json");
                    return response;

                }
                else
                {

                    var response = Request.CreateResponse(HttpStatusCode.OK);
                    response.Content = new StringContent(outputString, System.Text.Encoding.UTF8, "application/json");
                    return response;
                }

            }
            catch (Exception ex)
            {
                var response = Request.CreateResponse(HttpStatusCode.BadRequest);
                response.Content = new StringContent(ex.Message.ToString(), System.Text.Encoding.UTF8, "application/json");
                return response;
            }
        }
        #endregion
        #region Productos

        ///<summary>
        ///returns a list of Product
        ///</summary>
        [HttpGet]
        [Route("GetProductos")]
        public HttpResponseMessage ListaProductos()
        {
            try
            {
                var listadoProd = DBSap.VW_CVT_ListaProductos_GetProductos.ToList();
                string outputString = JsonConvert.SerializeObject(listadoProd);


                if (outputString.Equals("[]"))
                {
                    var response = Request.CreateResponse(HttpStatusCode.BadRequest);
                    response.Content = new StringContent("Error en Consulta", System.Text.Encoding.UTF8, "application/json");
                    return response;
                }
                else
                {
                    var response = Request.CreateResponse(HttpStatusCode.OK);
                    response.Content = new StringContent(outputString, System.Text.Encoding.UTF8, "application/json");
                    return response;
                }


            }
            catch (Exception ex)
            {
                var response = Request.CreateResponse(HttpStatusCode.BadRequest);
                response.Content = new StringContent(ex.Message.ToString(), System.Text.Encoding.UTF8, "application/json");
                return response;
            }
        }

        [HttpGet]
        [Route("GetConsultaProd/{codProd}")]
        [ApiExplorerSettings(IgnoreApi = true)]
        public HttpResponseMessage ConsultaProductos(string codProd)
        {
            try
            {
                var listadoProd = (from u in DBSap.VW_CVT_ListaProductos_GetProductos
                                   where u.Erp.Equals(codProd)
                                   select u).ToList<VW_CVT_ListaProductos_GetProductos>();
                string outputString = JsonConvert.SerializeObject(listadoProd);

                if (outputString.Equals("[]"))
                {
                    var response = Request.CreateResponse(HttpStatusCode.BadRequest);
                    response.Content = new StringContent("Error en Consulta", System.Text.Encoding.UTF8, "application/json");
                    return response;

                }
                else
                {

                    var response = Request.CreateResponse(HttpStatusCode.OK);
                    response.Content = new StringContent(outputString, System.Text.Encoding.UTF8, "application/json");
                    return response;
                }

            }
            catch (Exception ex)
            {
                var response = Request.CreateResponse(HttpStatusCode.BadRequest);
                response.Content = new StringContent(ex.Message.ToString(), System.Text.Encoding.UTF8, "application/json");
                return response;
            }
        }
        #endregion
        #endregion
        #region ListasSMM
        #region SMMSucursales

        ///<summary>
        ///returns a list of branches, corresponding to wholesale supermarket
        ///</summary>
        [HttpGet]
        [Route("SMMGetSucursales")]
        public HttpResponseMessage ListaSucursalesSMM()
        {
            try
            {
                var listadoSuc = DBSMMSap.VW_SMM_ListaSucursales_GetSucursales.ToList();
                string outputString = JsonConvert.SerializeObject(listadoSuc);


                if (outputString.Equals("[]"))
                {
                    var response = Request.CreateResponse(HttpStatusCode.BadRequest);
                    response.Content = new StringContent("Error en Consulta", System.Text.Encoding.UTF8, "application/json");
                    return response;
                }
                else
                {
                    var response = Request.CreateResponse(HttpStatusCode.OK);
                    response.Content = new StringContent(outputString, System.Text.Encoding.UTF8, "application/json");
                    return response;
                }


            }
            catch (Exception ex)
            {
                var response = Request.CreateResponse(HttpStatusCode.BadRequest);
                response.Content = new StringContent(ex.Message.ToString(), System.Text.Encoding.UTF8, "application/json");
                return response;
            }
        }
        #endregion
        #region SMMClientes

        ///<summary>
        ///returns a list of Clients, corresponding to wholesale supermarket
        ///</summary>
        [HttpGet]
        [Route("SMMGetClientes")]
        public HttpResponseMessage ListaClientesSMM()
        {
            try
            {
                var listadoUser = DBSMMSap.VW_SMM_ListaClientes_GetClientes.ToList();
                string outputString = JsonConvert.SerializeObject(listadoUser);


                if (outputString.Equals("[]"))
                {
                    var response = Request.CreateResponse(HttpStatusCode.BadRequest);
                    response.Content = new StringContent("Error en Consulta", System.Text.Encoding.UTF8, "application/json");
                    return response;
                }
                else
                {
                    var response = Request.CreateResponse(HttpStatusCode.OK);
                    response.Content = new StringContent(outputString, System.Text.Encoding.UTF8, "application/json");
                    return response;
                }


            }
            catch (Exception ex)
            {
                var response = Request.CreateResponse(HttpStatusCode.BadRequest);
                response.Content = new StringContent(ex.Message.ToString(), System.Text.Encoding.UTF8, "application/json");
                return response;
            }
        }
        [HttpGet]
        [Route("SMMConsultaClientes/{CodClient}")]
        public HttpResponseMessage BuscaClientesSMM(string CodClient)
        {
            try
            {
                var listadoProd = (from u in DBSMMSap.VW_SMM_ListaClientes_GetClientes
                                   where u.Rut.Equals(CodClient)
                                   select u).ToList<VW_SMM_ListaClientes_GetClientes>();
                string outputString = JsonConvert.SerializeObject(listadoProd);

                if (outputString.Equals("[]"))
                {
                    var response = Request.CreateResponse(HttpStatusCode.BadRequest);
                    response.Content = new StringContent("Error en Consulta", System.Text.Encoding.UTF8, "application/json");
                    return response;

                }
                else
                {

                    var response = Request.CreateResponse(HttpStatusCode.OK);
                    response.Content = new StringContent(outputString, System.Text.Encoding.UTF8, "application/json");
                    return response;
                }

            }
            catch (Exception ex)
            {
                var response = Request.CreateResponse(HttpStatusCode.BadRequest);
                response.Content = new StringContent(ex.Message.ToString(), System.Text.Encoding.UTF8, "application/json");
                return response;
            }
        }
        #endregion
        #region SMMProductos

        ///<summary>
        ///returns a list of Products, corresponding to wholesale supermarket
        ///</summary>
        ///
        [HttpGet]
        [Route("SMMGetProductos")]
        public HttpResponseMessage ListaProductosSMM()
        {
            try
            {
                var listadoProd = DBSMMSap.VW_SMM_ListaProductos_GetProductos.ToList();
                string outputString = JsonConvert.SerializeObject(listadoProd);


                if (outputString.Equals("[]"))
                {
                    var response = Request.CreateResponse(HttpStatusCode.BadRequest);
                    response.Content = new StringContent("Error en Consulta", System.Text.Encoding.UTF8, "application/json");
                    return response;
                }
                else
                {
                    var response = Request.CreateResponse(HttpStatusCode.OK);
                    response.Content = new StringContent(outputString, System.Text.Encoding.UTF8, "application/json");
                    return response;
                }


            }
            catch (Exception ex)
            {
                var response = Request.CreateResponse(HttpStatusCode.BadRequest);
                response.Content = new StringContent(ex.Message.ToString(), System.Text.Encoding.UTF8, "application/json");
                return response;
            }
        }

        [HttpGet]
        [Route("SMMGetProductosUnidades")]
        public HttpResponseMessage ListaProductosUnidadesSMM()
        {
            try
            {
                var listadoProd = DBSMMSap.VW_SMM_ListaProductos_Unidades_GetProductos.ToList();
                string outputString = JsonConvert.SerializeObject(listadoProd);


                if (outputString.Equals("[]"))
                {
                    var response = Request.CreateResponse(HttpStatusCode.BadRequest);
                    response.Content = new StringContent("Error en Consulta", System.Text.Encoding.UTF8, "application/json");
                    return response;
                }
                else
                {
                    var response = Request.CreateResponse(HttpStatusCode.OK);
                    response.Content = new StringContent(outputString, System.Text.Encoding.UTF8, "application/json");
                    return response;
                }


            }
            catch (Exception ex)
            {
                var response = Request.CreateResponse(HttpStatusCode.BadRequest);
                response.Content = new StringContent(ex.Message.ToString(), System.Text.Encoding.UTF8, "application/json");
                return response;
            }
        }


        ///<summary>
        /// returns a product consulted by its code
        ///</summary>
        ///<param name="codProd">itemcode of list products </param>
        [HttpGet]
        [Route("GetSMMConsultaProd/{codProd}")]
        //[ApiExplorerSettings(IgnoreApi = true)]
        public HttpResponseMessage ConsultaProductosSMM(string codProd)
        {
            try
            {
                var listadoProd = (from u in DBSMMSap.VW_SMM_ListaProductos_GetProductos
                                   where u.ItemCode.Equals(codProd)
                                   select u).ToList<VW_SMM_ListaProductos_GetProductos>();
                string outputString = JsonConvert.SerializeObject(listadoProd);

                if (outputString.Equals("[]"))
                {
                    var response = Request.CreateResponse(HttpStatusCode.BadRequest);
                    response.Content = new StringContent("Error en Consulta", System.Text.Encoding.UTF8, "application/json");
                    return response;

                }
                else
                {

                    var response = Request.CreateResponse(HttpStatusCode.OK);
                    response.Content = new StringContent(outputString, System.Text.Encoding.UTF8, "application/json");
                    return response;
                }

            }
            catch (Exception ex)
            {
                var response = Request.CreateResponse(HttpStatusCode.BadRequest);
                response.Content = new StringContent(ex.Message.ToString(), System.Text.Encoding.UTF8, "application/json");
                return response;
            }
        }
        #endregion
        #region SMMListaPrecios

        ///<summary>
        ///returns a price list, corresponding to wholesale supermarket
        ///</summary>
        ///
        [HttpGet]
        [Route("SMMGetListaPrecio")]


        public HttpResponseMessage ListaPreciosSMM()
        {
            try
            {
                var listaPrecios = DBSMMSap.VW_SMM_ListadoPrecios_API.ToList();
                string outputString = JsonConvert.SerializeObject(listaPrecios);


                if (outputString.Equals("[]"))
                {
                    var response = Request.CreateResponse(HttpStatusCode.BadRequest);
                    response.Content = new StringContent("Error en Consulta", System.Text.Encoding.UTF8, "application/json");
                    return response;
                }
                else
                {
                    var response = Request.CreateResponse(HttpStatusCode.OK);
                    response.Content = new StringContent(outputString, System.Text.Encoding.UTF8, "application/json");
                    return response;
                }


            }
            catch (Exception ex)
            {
                var response = Request.CreateResponse(HttpStatusCode.BadRequest);
                response.Content = new StringContent(ex.Message.ToString(), System.Text.Encoding.UTF8, "application/json");
                return response;
            }
        }

        [HttpGet]
        [Route("SMMGetListaPrecioUnidades")]


        public HttpResponseMessage ListaPreciosSMMUnidades()
        {
            try
            {
                var listaPrecios = DBSMMSap.VW_SMM_ListadoPrecios_Unidades_API.ToList();
                string outputString = JsonConvert.SerializeObject(listaPrecios);


                if (outputString.Equals("[]"))
                {
                    var response = Request.CreateResponse(HttpStatusCode.BadRequest);
                    response.Content = new StringContent("Error en Consulta", System.Text.Encoding.UTF8, "application/json");
                    return response;
                }
                else
                {
                    var response = Request.CreateResponse(HttpStatusCode.OK);
                    response.Content = new StringContent(outputString, System.Text.Encoding.UTF8, "application/json");
                    return response;
                }


            }
            catch (Exception ex)
            {
                var response = Request.CreateResponse(HttpStatusCode.BadRequest);
                response.Content = new StringContent(ex.Message.ToString(), System.Text.Encoding.UTF8, "application/json");
                return response;
            }
        }

        [HttpGet]
        [Route("SMMGetListaPrecioDistribucion")]


        public HttpResponseMessage ListaPreciosDistribucionSMM()
        {
            try
            {
                var listaPrecios = DBSMMSap.VW_SMM_ListadoPrecios_Distribucion_API.ToList();
                string outputString = JsonConvert.SerializeObject(listaPrecios);


                if (outputString.Equals("[]"))
                {
                    var response = Request.CreateResponse(HttpStatusCode.BadRequest);
                    response.Content = new StringContent("Error en Consulta", System.Text.Encoding.UTF8, "application/json");
                    return response;
                }
                else
                {
                    var response = Request.CreateResponse(HttpStatusCode.OK);
                    response.Content = new StringContent(outputString, System.Text.Encoding.UTF8, "application/json");
                    return response;
                }


            }
            catch (Exception ex)
            {
                var response = Request.CreateResponse(HttpStatusCode.BadRequest);
                response.Content = new StringContent(ex.Message.ToString(), System.Text.Encoding.UTF8, "application/json");
                return response;
            }
        }
        #endregion
        #region SMMStock
        ///<summary>
        /// returns a stock list of available products
        ///</summary>
        [HttpGet]
        [Route("SMMGetStock")]
        public HttpResponseMessage StockSMM()
        {
            try
            {
                var listaPrecios = DBSMMSap.VW_SMM_STOCK.ToList();
                string outputString = JsonConvert.SerializeObject(listaPrecios);


                if (outputString.Equals("[]"))
                {
                    var response = Request.CreateResponse(HttpStatusCode.BadRequest);
                    response.Content = new StringContent("Error en Consulta", System.Text.Encoding.UTF8, "application/json");
                    return response;
                }
                else
                {
                    var response = Request.CreateResponse(HttpStatusCode.OK);
                    response.Content = new StringContent(outputString, System.Text.Encoding.UTF8, "application/json");
                    return response;
                }


            }
            catch (Exception ex)
            {
                var response = Request.CreateResponse(HttpStatusCode.BadRequest);
                response.Content = new StringContent(ex.Message.ToString(), System.Text.Encoding.UTF8, "application/json");
                return response;
            }
        }

        ///<summary>
        /// returns the stock of a product consulted by its code
        ///</summary>
        ///<param name="codProd">itemcode of list products </param>
        ////*<returns>list of products</returns>*/

        [HttpGet]
        [Route("GetSMMConsultaStockProd/{codProd}")]
        //[ApiExplorerSettings(IgnoreApi = true)]
        public HttpResponseMessage ConsultaStockProductosSMM(string codProd)
        {
            try
            {
                var listadoProd = (from u in DBSMMSap.VW_SMM_STOCK
                                   where u.itemcode.Equals(codProd)
                                   select u).ToList<VW_SMM_STOCK>();
                string outputString = JsonConvert.SerializeObject(listadoProd);

                if (outputString.Equals("[]"))
                {
                    var response = Request.CreateResponse(HttpStatusCode.BadRequest);
                    response.Content = new StringContent("Error en Consulta", System.Text.Encoding.UTF8, "application/json");
                    return response;

                }
                else
                {

                    var response = Request.CreateResponse(HttpStatusCode.OK);
                    response.Content = new StringContent(outputString, System.Text.Encoding.UTF8, "application/json");
                    return response;
                }

            }
            catch (Exception ex)
            {
                var response = Request.CreateResponse(HttpStatusCode.BadRequest);
                response.Content = new StringContent(ex.Message.ToString(), System.Text.Encoding.UTF8, "application/json");
                return response;
            }
        }
        #endregion

        #endregion
    }
}