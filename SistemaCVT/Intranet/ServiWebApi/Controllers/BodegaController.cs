using DBMermasRecepcion;
using Newtonsoft.Json.Linq;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ServiWebApi.Controllers
{
    //[Route("api/BodegaController")]
    public class BodegaController : ApiController
    {
        DBMLCVTDESAINTDataContext dbDsa = new DBMLCVTDESAINTDataContext();
        DBMLCVTWMSDataContext DBDatos = new DBMLCVTWMSDataContext();

        [HttpGet]
        public DataTable GetConsultaTransferencias(int transferId)
        {
            DataTable ret = new DataTable();
            try
            {
                DBDatos.CommandTimeout = 60000;
                ret = Utilidades.LINQToDataTable(DBDatos.SP_ConsultaTransferencia(transferId));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        [HttpGet]
        public int ObtieneSiteLayout(int? layoutid)
        {
            int ret = 0;
            try
            {
                var temp = (from l in DBDatos.Layout
                            where l.Layout_Id.Equals(layoutid)
                            select new { l.Site_Id }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Site_Id;
                }
            }
            catch (Exception)
            {

                ret = 0;
            }
            return ret;
        }

        [HttpGet]
        public string ObtieneNombreCortoSitio(int siteid)
        {
            string ret = string.Empty;
            try
            {
                var temp = (from s in DBDatos.Site
                            where s.Site_Id.Equals(siteid)
                            select new { s.Site_ShortDescription }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Site_ShortDescription;
                }
            }
            catch (Exception)
            {


            }
            return ret;
        }

        [HttpGet]
        public List<CVT_DatosLayout> ObtieneInfoLayout(int CodLayoutInfo)
        {
            List<CVT_DatosLayout> ret = new List<CVT_DatosLayout>();
            try
            {
                ret = (from t in DBDatos.CVT_DatosLayout
                       where t.Layout_Id.Equals(CodLayoutInfo)
                       select t).ToList<CVT_DatosLayout>();
            }
            catch (Exception)
            {


            }
            return ret;
        }

        [HttpGet]

        public List<VW_BODEGAS_XAMARIN> ObtieneBodegas()
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
        public bool AgregaPalletTransferRF(int transferid, int packageid, string username)
        {
            bool ret = false;
            try
            {
                WMSClass vWms = new WMSClass();
                vWms.AgregaBultoTransferenciaRF(transferid, packageid, username);
                ret = true;
            }
            catch (Exception)
            {

                throw;
            }
            return ret;
        }

        [HttpGet]
        public List<Transfer> ObtieneTransferenciasAbiertas(int tranferencias)
        {
            List<Transfer> ret = new List<Transfer>();
            try
            {
                ret = (from t in DBDatos.Transfer
                       where t.Status.Equals(1)
                       select t).ToList<Transfer>();
            }
            catch (Exception)
            {


            }
            return ret;
        }

        [HttpGet]
        [Route("FoliosAsignaciones")]
        public List<CVT_VW_FoliosTransferenciasAsignacion> ObtieneOrdenesActivas()
        {
            List<CVT_VW_FoliosTransferenciasAsignacion> ret = new List<CVT_VW_FoliosTransferenciasAsignacion>();
            try
            {
                ret = (from ft in dbDsa.CVT_VW_FoliosTransferenciasAsignacion
                        select ft).ToList<CVT_VW_FoliosTransferenciasAsignacion>();
            }
            catch (Exception)
            {
            }
            return ret;
        }

        [HttpGet]
        [Route("ObtieneDatos")]
        public List<string> ObtieneDatos(int packageSSCC)
        {
            List<string> ret = new List<string>();
            try
            {
                var rest = 
                    (
                    from p in DBDatos.Package
                    join ap in DBDatos.ArticleProvider 
                    on p.ArticleProvider_Id equals ap.ArticleProvider_Id
                    where p.Package_SSCC.Equals(packageSSCC)
                    select new 
                    {
                        p.Package_Lot,
                        ap.ArticleProvider_CodClient, 
                        p.Package_Quantity 
                    }).FirstOrDefault();

                if (rest != null) 
                {
                    ret.Add(rest.Package_Lot);
                    ret.Add(rest.ArticleProvider_CodClient);
                    ret.Add(rest.Package_Quantity.ToString());
                }
            }
            catch (Exception)
            {
                return ret;
            }
            return ret;
        }

        [HttpGet]
        [Route("InsertaMP")]
        public bool InsertarAsignacionMP(int transferID, string itemCode, string Lote)
        {
            bool ret = false;

            try
            {
                CVT_TransferAsignacion vNuevo = new CVT_TransferAsignacion
                {
                    Transfer_Id = transferID,
                    ItemCode = itemCode,
                    Lote = Lote
                };

                dbDsa.CVT_TransferAsignacion.InsertOnSubmit(vNuevo);
                dbDsa.SubmitChanges();
                ret = true;
            }
            catch (Exception)
            {
            }
            return ret;
        }

        [HttpGet]
        [Route("InsertaPedido")]
        public bool InsertarAsignacionPedidos(int orderID, string itemCode, string Lote, int cantidad)
        {
            bool ret = false;

            try
            {
                CVT_OrderAsignacion vNuevo = new CVT_OrderAsignacion
                {
                    Order_ID = orderID,
                    Itemcode = itemCode,
                    Lote = Lote,
                    Cantidad = cantidad
                };

                dbDsa.CVT_OrderAsignacion.InsertOnSubmit(vNuevo);
                dbDsa.SubmitChanges();
                ret = true;
            }
            catch (Exception)
            {
            }
            return ret;
        }

        [HttpGet]
        [Route("TransfernciasAsignadas")]
        public List<CVT_TransferAsignacion> TransferenciasAsignadas(string TransferID)
        {
            List<CVT_TransferAsignacion> lista = new List<CVT_TransferAsignacion> ();

            try
            {
                lista = (from t in dbDsa.CVT_TransferAsignacion
                       select t).ToList<CVT_TransferAsignacion>();
            }
            catch (Exception)
            {
            }
            return lista;
        }

        [HttpGet]
        [Route("PedidosAsignados")]
        public List<CVT_OrderAsignacion> PedidosAsignados(string TransferID)
        {
            List<CVT_OrderAsignacion> lista = new List<CVT_OrderAsignacion>();

            try
            {
                lista = (from t in dbDsa.CVT_OrderAsignacion
                         select t).ToList<CVT_OrderAsignacion>();
            }
            catch (Exception)
            {
            }
            return lista;
        }
        [HttpGet]
        public DataTable DetalleTransferenciasAsignadas(int transferId)
        {
            DataTable ret = new DataTable();
            try
            {
                DBDatos.CommandTimeout = 60000;
                ret = Utilidades.LINQToDataTable(dbDsa.SP_DETALLE_TRANSFERENCIAS_ASIGNADAS(transferId));
            }
            catch (Exception)
            {
            }
            return ret;
        }
        [HttpGet]
        public DataTable DetallePedidosAsignados(int orderID)
        {
            DataTable ret = new DataTable();
            try
            {
                DBDatos.CommandTimeout = 60000;
                ret = Utilidades.LINQToDataTable(dbDsa.SP_DETALLE_PEDIDOS_ASIGNADOS(orderID));
            }
            catch (Exception)
            {
            }
            return ret;
        }
    }
}