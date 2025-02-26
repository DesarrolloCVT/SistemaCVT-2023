﻿using DBMermasRecepcion;
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
        [Route("GetConsultaTransferencias")]
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
        [Route("FoliosTransferenciasAsignacion")]
        public List<CVT_VW_FoliosTransferenciasAsignacion> FoliosTransferenciasAsignacion()
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
        [Route("FoliosPedidosAsignacion")]
        public List<CVT_VW_FoliosPedidosAsignacion> FoliosPedidosAsignacion()
        {
            List<CVT_VW_FoliosPedidosAsignacion> ret = new List<CVT_VW_FoliosPedidosAsignacion>();
            try
            {
                ret = (from ft in dbDsa.CVT_VW_FoliosPedidosAsignacion
                       select ft).ToList<CVT_VW_FoliosPedidosAsignacion>();
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
                        p.Package_Quantity,
                        p.Reception_Id
                    }).FirstOrDefault();

                if (rest != null) 
                {
                    ret.Add(rest.Package_Lot);
                    ret.Add(rest.ArticleProvider_CodClient);
                    ret.Add(rest.Package_Quantity.ToString());
                    ret.Add(rest.Reception_Id.ToString());
                }
            }
            catch (Exception)
            {
                return ret;
            }
            return ret;
        }

        [HttpGet]
        [Route("TransfernciasAsignadas")]
        public List<CVT_TransferAsignacion> TransferenciasAsignadas(string TransferID)
        {
            List<CVT_TransferAsignacion> ret = new List<CVT_TransferAsignacion>();
            try
            {
                ret = (from t in dbDsa.CVT_TransferAsignacion
                       where t.Transfer_Id.Equals(TransferID)
                       select t).ToList<CVT_TransferAsignacion>();
            }
            catch
            {
            }
            return ret;
        }

        [HttpGet]
        [Route("PedidosAsignados")]
        public List<CVT_OrderAsignacion> PedidosAsignados(string OrderID)
        {
            List<CVT_OrderAsignacion> ret = new List<CVT_OrderAsignacion>();
            try
            {
                ret = (from o in dbDsa.CVT_OrderAsignacion
                       where o.Order_ID.Equals(OrderID)
                       select o).ToList<CVT_OrderAsignacion>();
            }
            catch
            {
            }
            return ret;
        }

        [HttpGet]
        [Route("DetalleTransferenciasAsignadas")]
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
        [Route("DetallePedidosAsignados")]
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

        [HttpGet]
        [Route("UbicacionMPAsignacion")]
        public DataTable UbicacionMPAsignacion(string itemCode, string lote)
        {
            DataTable ret = new DataTable();
            try
            {
                DBDatos.CommandTimeout = 60000;
                ret = Utilidades.LINQToDataTable(DBDatos.SP_UbicacionMPAsignacion(itemCode, lote));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        [HttpGet]
        [Route("UbicacionPedidoAsignacion")]
        public DataTable UbicacionPedidoAsignacion(string itemCode, string lote)
        {
            DataTable ret = new DataTable();
            try
            {
                DBDatos.CommandTimeout = 60000;
                ret = Utilidades.LINQToDataTable(DBDatos.SP_UbicacionPedidoAsignacion(itemCode, lote));
            }
            catch (Exception)
            {

            }
            return ret;
        }
    }
}