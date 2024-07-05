using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace DBMermasRecepcion
{
    public class TesoreriaClass
    {
        public TesoreriaClass()
        {

        }
        DBMLCVTSAPDataContext DBSAP = new DBMLCVTSAPDataContext();
        public string ModificaMetodoPagoFacturaProveedor(int DocEntry, string Metodo)
        {
            string ret = "-1";
            SAPbobsCOM.Company oCmp;
            string reterror = string.Empty;
            SAPClass vSAP = new SAPClass();
            oCmp = vSAP.CnxSAP(ref reterror);
            try
            {
                int iError = 0;


                SAPbobsCOM.Documents doc;
                doc = oCmp.GetBusinessObject(SAPbobsCOM.BoObjectTypes.oPurchaseInvoices);
                doc.GetByKey(DocEntry);
                doc.PaymentMethod = Metodo;
                iError = doc.Update();
                if (iError == 0)
                {
                    ret = "0";
                }
                else
                {
                    ret = oCmp.GetLastErrorDescription();
                }
                oCmp.Disconnect();
            }
            catch
            {
                oCmp.Disconnect();
            }
            return ret;
        }
        public DataTable SP_ListarPagoCobranzaPeriodo(DateTime FInicio, DateTime FTermino)
        {
            DataTable ret = new DataTable();
            try
            {
                DBSAP.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSAP.CVT_ControlCierreMes_Tes_PagoYCobranza(FInicio, FTermino));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public DataTable SP_ListarPagoCobranzaClientePeriodo(DateTime FInicio, DateTime FTermino)
        {
            DataTable ret = new DataTable();
            try
            {
                DBSAP.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSAP.CVT_ListaCobranzaCliente(FInicio, FTermino));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public DataTable SP_ListarCartolaVsSAP(DateTime FInicio, DateTime FTermino)
        {
            DataTable ret = new DataTable();
            try
            {
                DBSAP.CommandTimeout = 2000;
               //ret = Utilidades.LINQToDataTable(DBSAP.CVT_CARTOLA_VS_CUENTASAP_1(FInicio, FTermino));
            }
            catch (Exception ex)
            {

            }
            return ret;
        }

        public DataTable SP_ListarEstadoReconciliaciones(DateTime FInicio, DateTime FTermino)
        {
            DataTable ret = new DataTable();
            try
            {
                DBSAP.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSAP.CVT_Estado_Reconciliaciones(FInicio, FTermino));
            }
            catch (Exception ex)
            {

            }
            return ret;
        }

        public DataTable SP_ListarPagadosPorCC(DateTime FInicio, DateTime FTermino)
        {
            DataTable ret = new DataTable();
            try
            {
                DBSAP.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSAP.CVT_ListaPagadosPorCC(FInicio, FTermino));
            }
            catch (Exception ex)
            {

            }
            return ret;
        }

        public DataTable SP_ListaCumplimientoCondPago(DateTime FInicio, DateTime FTermino)
        {
            DataTable ret = new DataTable();
            try
            {
                DBSAP.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSAP.CVT_ListaCumplimientoCondPago(FInicio, FTermino));
            }
            catch (Exception ex)
            {

            }
            return ret;
        }

        public DataTable SP_ListaProyeccionPagos(DateTime FMes)
        {
            DataTable ret = new DataTable();
            try
            {
                DBSAP.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSAP.CVT_ListarProyeccionPagos(FMes));
            }
            catch (Exception ex)
            {

            }
            return ret;
        }

        public DataTable SP_ListaProyeccionCobranza(DateTime FMes)
        {
            DataTable ret = new DataTable();
            try
            {
                DBSAP.CommandTimeout = 2000;
                ret = Utilidades.LINQToDataTable(DBSAP.CVT_CierreMes_Tes_ProyeccionCobranza(FMes));
            }
            catch (Exception ex)
            {

            }
            return ret;
        }

        public DataTable SP_cierreTesoreria(DateTime Fini, DateTime Fterm,string Cuent)

        {
            DataTable ret = new DataTable();
            try
            {
                DBSAP.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSAP.CVT_CIERRE_TESORERIA_LISTADOPAGOXPERIODO(Fini,Fterm,Cuent));
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_cierreTesoreriaProyeccionPagos(DateTime Fini, DateTime Fterm, string Cuent)

        {
            DataTable ret = new DataTable();
            try
            {
                DBSAP.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSAP.CVT_CIERRE_TESORERIA_PROYECCIONDEPAGOS(Fini, Fterm, Cuent));
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_cierreTesorerialistadoCobranzaPeriodo(DateTime Fini, DateTime Fterm, string Cuent)

        {
            DataTable ret = new DataTable();
            try
            {
                DBSAP.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSAP.CVT_CIERRE_TESORERIA_lISTADOCOMBRANZA_X_PERIODO(Fini, Fterm, Cuent));
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_cierreTesoreriaProyeccioncobranza(DateTime Fini, DateTime Fterm)

        {
            DataTable ret = new DataTable();
            try
            {
                DBSAP.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSAP.CVT_CIERRE_TESORERIA_PROYECCIONCOBRANZA(Fini, Fterm, ""));
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_cierreTesoreriaCondicionPagoCompra(DateTime Fini, DateTime Fterm, string Cuent)

        {
            DBSAP.CommandTimeout = 6000;
            DataTable ret = new DataTable();
            try
            {
                ret = Utilidades.LINQToDataTable(DBSAP.CVT_CIERRE_TESORERIA_CONDICION_PAGO_COMPRA(Fini, Fterm, Cuent));
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_cierreTesoreriaPendienteReconciliacion(DateTime Fini, DateTime Fterm, string Cuent)

        {
            DataTable ret = new DataTable();
            try
            {
                DBSAP.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSAP.CVT_CIERRE_TESORERIA_PENDIENTE_RECONCILIACION(Fini, Fterm, Cuent));
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_cierreTesoreriaFacturaCentroCostos(DateTime Fini, DateTime Fterm, string Cuent)

        {
            DataTable ret = new DataTable();
            try
            {
                DBSAP.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSAP.CVT_CIERRE_TESORERIA_FACTURAS_CENTRO_COSTO(Fini, Fterm, Cuent));
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_cierreTesoreriaCartolaBancaria(DateTime Fini, DateTime Fterm, string Cuent)

        {
            DataTable ret = new DataTable();
            try
            {
                DBSAP.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSAP.CVT_CIERRE_TESORERIA_CARTOLA_BANCARIA(Fini, Fterm, Cuent));
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_cierreTesoreriaCondicionPagoVentas(DateTime Fini, DateTime Fterm, string Cuent)

        {
            DBSAP.CommandTimeout = 6000;
            DataTable ret = new DataTable();
            try
            {
                ret = Utilidades.LINQToDataTable(DBSAP.CVT_CIERRE_TESORERIA_CUMPLIMIENTO_CONDICION_PAGO_VENTAS(Fini, Fterm, Cuent));
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_cierreTesoreriaDespachoComunaCamion(DateTime Fini, DateTime Fterm, string Cuent)

        {
            DataTable ret = new DataTable();
            try
            {
                DBSAP.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSAP.CVT_CIERRE_TESORERIA_DESPACHO_COMUNA_CAMION(Fini, Fterm, Cuent));
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_cierreTesoreriaItemGastos(DateTime Fini, DateTime Fterm, string Cuent)

        {
            DataTable ret = new DataTable();
            try
            {
                DBSAP.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSAP.CVT_CIERRE_TESORERIA_PEDIDOS_ITEMGASTOS(Fini, Fterm, Cuent));
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_cierreTesoreriaPorcCompraProveedor(DateTime Fini, DateTime Fterm, string Cuent)

        {
            DataTable ret = new DataTable();
            try
            {
                DBSAP.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSAP.CVT_CIERRE_TESORERIA_PORC_COMPRAS_PROVEEDOR(Fini, Fterm, Cuent));
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_cierreTesoreriaPorcVentasClientes(DateTime Fini, DateTime Fterm, string Cuent)

        {
            DataTable ret = new DataTable();
            try
            {
                DBSAP.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSAP.CVT_CIERRE_TESORERIA_PORC_VENTAS_CLIENTES(Fini, Fterm, Cuent));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public DataTable SP_cierreTesoreriaComprasMayorA(DateTime Fini, DateTime Fterm, int Cuent)

        {
            DataTable ret = new DataTable();
            try
            {
                DBSAP.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSAP.CVT_CIERRE_TESORERIA_COMPRAS_MAYOR_A(Fini, Fterm, Cuent));
            }
            catch (Exception)
            {

            }
            return ret;
        }
    }
}
