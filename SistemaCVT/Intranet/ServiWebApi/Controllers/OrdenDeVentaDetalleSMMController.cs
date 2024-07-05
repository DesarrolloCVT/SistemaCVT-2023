using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ServiWebApi.Controllers
{
    public class OrdenDeVentaDetalleSMMController : ApiController
    {
        DBMLCVTWMSMETRODataContext wmsM = new DBMLCVTWMSMETRODataContext();
        DBMLCVTMMETRODataContext DBMmetro = new DBMLCVTMMETRODataContext();

        [HttpGet]
        public IEnumerable<VW_SMM_PRODUCTOS_ORDEN_DE_VENTAS> ListadoProductosOrden()
        {
            var listadoPro = DBMmetro.VW_SMM_PRODUCTOS_ORDEN_DE_VENTAS.ToList();
            return listadoPro;
        }

        [HttpGet]
        public int InsertaDetalleOrden(int idOrden,string codProd,int cantidad,int PorcDesc)
        {
            int ret = 0;

            SAPSMM sp = new SAPSMM();
            CVTWMSMetroClass mt = new CVTWMSMetroClass();

            List<VW_SMM_PRODUCTOS_ORDEN_DE_VENTAS> ls = sp.ListaProductosOrdenVenta(codProd);

            try
            {
                foreach (var t in ls)
                {
                    SMM_Orden_de_Ventas_Detalle or = new SMM_Orden_de_Ventas_Detalle();

                    or.IdOrdenVentas = idOrden;
                    or.CodProducto = codProd;
                    or.Upc = t.UnxCaja;
                    or.Familia = t.Familia;
                    or.PrecioVenta = t.Precio;
                   //or.Margen = t.Margen;
                    or.Stock = t.Stock;
                    or.Contribucion = t.Contribucion;
                    or.Cantidad = cantidad;
                    or.Porc_Descuento =PorcDesc;
                    or.PrecioPromedio = t.CostoPromedio;
                  

                    wmsM.SMM_Orden_de_Ventas_Detalle.InsertOnSubmit(or);
                    wmsM.SubmitChanges();

                    ret = or.IdDetalleOrden;
                 
                }
            }
            catch 
            {

              
            }

            return ret;          
        }

        [HttpGet]
        public DataTable GetDatosRegistroOV(int idFolio)
        {
            DataTable ret = new DataTable();
            try
            {
                wmsM.CommandTimeout = 60000;
                ret = Utilidades.LINQToDataTable(wmsM.SMM_DETALLE_OV(idFolio));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        [HttpGet]
        public DataTable GetDatosTotalOrden(int idOrdendeVenta)
        {
            DataTable ret = new DataTable();
            try
            {
                wmsM.CommandTimeout = 60000;
                ret = Utilidades.LINQToDataTable(wmsM.SP_ResumenOV(idOrdendeVenta));
            }
            catch (Exception)
            {

            }
            return ret;
        }
    }
}