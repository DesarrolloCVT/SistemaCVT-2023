using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace DBMermasRecepcion
{
    public class MMetroClass
    {
        DBMLCVTMMETRODataContext dbMetro = new DBMLCVTMMETRODataContext();
        DBMLCVTDESAINTDataContext DBDESAINT = new DBMLCVTDESAINTDataContext();
        DBMLCVTSAPDataContext dbSap = new DBMLCVTSAPDataContext();


        public MMetroClass() { }

        public DataTable SP_FlujoProductos(DateTime Fini, DateTime Fterm)

        {

            DataTable ret = new DataTable();
            try
            {

                dbMetro.CommandTimeout = 20000;
                //Fini = Convert.ToDateTime(Fini.ToShortDateString());
                //Fterm = Convert.ToDateTime(Fterm.ToShortDateString());
                ret = Utilidades.LINQToDataTable(dbMetro.MMetro_SP_FlujoProductos(Fini, Fterm));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public DataTable SP_ListadoVentas(DateTime fini, DateTime fter)

        {
            DataTable ret = new DataTable();
            try
            {
                dbMetro.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(dbMetro.CVT_ListadoVentas(fini, fter, 0, 0, 0, 0, 0, 0));
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_AnalisisdeVentas(DateTime fini, DateTime fter)

        {
            DataTable ret = new DataTable();
            try
            {
                dbMetro.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(dbMetro.SMM_SP_ANALISIS_VENTAS(fini, fter));
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_ListadoVentas_DiVenti(DateTime fini, DateTime fter)

        {
            DataTable ret = new DataTable();
            try
            {
                dbMetro.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(dbMetro.CVT_ListadoVentas_DiVenti(fini, fter));
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_ListadoPrecios()

        {
            DataTable ret = new DataTable();
            try
            {
                dbMetro.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(dbMetro.SMM_ListadoPrecios());
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_ListadoPreciosPadreHijo()

        {
            DataTable ret = new DataTable();
            try
            {
                dbMetro.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(dbMetro.MMETRO_ListaPreciosPadreHijo());
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public bool InsertaNuevoPrecioCompra(MMetro_UltimoPrecioCompra nuevo)
        {
            bool ret = false;
            try
            {
                DBDESAINT.MMetro_UltimoPrecioCompra.InsertOnSubmit(nuevo);
                DBDESAINT.SubmitChanges();
                ret = true;
            }
            catch
            {


            }
            return ret;
        }
        public bool InsertaNuevoLogPrecioCompra(MMetro_LogUltimoPrecioCompra nuevo)
        {
            bool ret = false;
            try
            {
                DBDESAINT.MMetro_LogUltimoPrecioCompra.InsertOnSubmit(nuevo);
                DBDESAINT.SubmitChanges();
            }
            catch
            {


            }
            return ret;
        }

        public DataTable SP_PropuestaPrecioVenta()

        {
            DataTable ret = new DataTable();
            try
            {
                dbMetro.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(dbMetro.SP_MMetro_PropuestaPrecioVenta());
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public DataTable SP_ConsultaDocumento(int tipoDoc, int numeDoc)

        {
            DataTable ret = new DataTable();
            try
            {
                dbMetro.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(dbMetro.MMETRO_ConsultaDocumento(tipoDoc, numeDoc));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public DataTable SP_StockVentas(DateTime fini,DateTime fter)

        {
            DataTable ret = new DataTable();
            try
            {
                dbMetro.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(dbMetro.SMM_STOCKMASVENTA(fini,fter));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public DataTable SP_indicadores(DateTime fini, DateTime fter)

        {
            DataTable ret = new DataTable();
            try
            {
                dbMetro.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(dbMetro.SMM_VENTASHORARIO(fini, fter));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public DataTable SP_VentasxDia(DateTime fini, DateTime fter)

        {
            DataTable ret = new DataTable();
            try
            {
                dbMetro.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(dbMetro.SMM_VentasDia(fini, fter));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public DataTable SP_InventarioValorizadoGrilla()

        {
            DataTable ret = new DataTable();
            try
            {
                dbMetro.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(dbMetro.CVT_InventarioValorizadoGrilla());
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public DataTable SP_InvValorizadoVsBalanceBodegaMM()

        {
            DataTable ret = new DataTable();
            try
            {
                dbMetro.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(dbMetro.MMETRO_InventarioValorizadoVsBalanceBodega());
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_StockSMMCompromiso()

        {
            DataTable ret = new DataTable();
            try
            {
                dbMetro.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(dbSap.CVT_STOCKPRODUCTO_CVT_SMM_COMPROMISO());
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public DataTable SP_InvProdTerceros()

        {
            DataTable ret = new DataTable();
            try
            {
                dbMetro.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(dbSap.SP_CVT_InventarioProdTerceros());
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public string ObtieneProductoPrecioCompra(int idReg)
        {
            string rest = "";
            try
            {
                var tem = (from u in DBDESAINT.MMetro_UltimoPrecioCompra
                           where u.id_RegistroPrecio.Equals(idReg)
                           select new { u.ItemCode }).First();
                if (tem != null)
                {
                    rest = tem.ItemCode;
                }

            }
            catch { }
            return rest;
        }

        public string ObtieneProductoPrecioCompraNoregistrado(int idReg)
        {
            string rest = "";
            try
            {
                var tem = (from u in DBDESAINT.MMetro_UltimoPrecioCompra
                           where u.id_RegistroPrecio.Equals(idReg)
                           select new { u.ProductoNoRegistrado }).First();
                if (tem != null)
                {
                    rest = tem.ProductoNoRegistrado;
                }

            }
            catch { }
            return rest;
        }

        public string ObtieneCodProductoOFSMM(int DocNum)
        {
            string ret = string.Empty;
            try
            {
                var temp = (from vo in dbMetro.SMM_VW_ListaOFLiberadas
                            where vo.OF.Equals(DocNum)
                            select new { vo.CodProducto }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.CodProducto.ToString();
                }
            }
            catch
            {
            }
            return ret;
        }

        public string ObtieneProductoOFSMM(int DocNum)
        {
            string ret = string.Empty;
            try
            {
                var temp = (from vo in dbMetro.SMM_VW_ListaOFLiberadas
                            where vo.OF.Equals(DocNum)
                            select new { vo.Producto }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.Producto.ToString();
                }
            }
            catch
            {
            }
            return ret;
        }
        public DataTable SP_InvValorizadoVsBalanceSMM(string sn)

        {
            DataTable ret = new DataTable();
            try
            {
                dbMetro.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(dbMetro.SMM_InventarioValorizadoVsBalance(sn));
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_InformeHarina(DateTime fini, DateTime fterm)

        {
            DataTable ret = new DataTable();
            try
            {
                dbMetro.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(dbMetro.SP_InformeHarina(fini, fterm));
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_SugerenciaPrecios()

        {
            DataTable ret = new DataTable();
            try
            {
                dbMetro.CommandTimeout = 60000;
                ret = Utilidades.LINQToDataTable(dbMetro.SMM_SugerenciaCompras(0));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public string ObtieneSiglaProveedor(string idProv)
        {
            string ret = "";
            try
            {
                var temp = (from t in dbMetro.MMetro_OCRD
                            where t.CardCode.Equals(idProv)
                            select new { t.U_SiglaLote }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.U_SiglaLote;
                }
            }
            catch
            {
                ret = "";

            }
            return ret;
        }

        public DataTable SP_VerificacionRecetas()

        {
            DataTable ret = new DataTable();
            try
            {
                dbMetro.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(dbMetro.SMM_VerificacionRecetas());
            }
            catch (Exception)
            {
                

            }
            return ret;



        }
        public DataTable SP_MaestroProductos()

        {
            DataTable ret = new DataTable();
            try
            {
                dbMetro.CommandTimeout = 60000;
                ret = Utilidades.LINQToDataTable(dbMetro.SMM_MaestroProductos());
               
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public DataTable sp_Rentabilidad(DateTime fini ,DateTime fter)

        {
            DataTable ret = new DataTable();
            try
            {
                dbMetro.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(dbMetro.CVT_Rentabilidad(fini,fter));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public string TraeCodProveedorAcuerdo(int folioAcuerdo)
        {
            string res ="";
            try
            {
                var temp = (from u in DBDESAINT.CVT_Acuerdo_Comercial
                            where u.Id_AcuerdoComercial.Equals(folioAcuerdo)
                            select new { u.Cod_Proveedor }).FirstOrDefault();
                if (temp != null)
                {
                    res = temp.Cod_Proveedor;
                }

            }
            catch { }
            return res;
        }
        public bool InsertaDetalleAcuerdo(CVT_Acuerdo_Comercial_Detalle nuevo)
        {
            bool ret = false;
            try
            {
                DBDESAINT.CVT_Acuerdo_Comercial_Detalle.InsertOnSubmit(nuevo);
                DBDESAINT.SubmitChanges();
                ret = true;
            }
            catch
            {


            }
            return ret;
        }
        public DataTable SP_DocVentasporPagar(int IdDepto)

        {
            DataTable ret = new DataTable();
            try
            {
                dbMetro.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(dbMetro.SMM_DOCVENTAS_POR_PAGAR(IdDepto));
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_ConsolidadoPedidoGrilla(DateTime Fecha,string depa)

        {
            DataTable ret = new DataTable();
            try
            {
                dbMetro.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(dbMetro.SMM_ConsolidadoPedidos_Grilla(Fecha,depa));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public DataTable SP_ConsolidadoPedido_FacturaGrilla(DateTime Fecha,string depa)

        {
            DataTable ret = new DataTable();
            try
            {
                dbMetro.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(dbMetro.SMM_ConsolidadoPedidos_Facturas_Grilla(Fecha,depa));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public DataTable SP_AnalisisDeVentas(DateTime fini, DateTime fter, string Grupo)

        {
            DataTable ret = new DataTable();
            try
            {
                dbMetro.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(dbMetro.SP_ANALISIS_VENTAS(fini, fter,Grupo));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public DataTable SMM_SP_EstadisticasDeVentasComisiones(DateTime fdesde, DateTime fhasta)

        {
            DataTable ret = new DataTable();
            try
            {
                dbMetro.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(dbMetro.SMM_EstadisticasVentas_Rapel(fdesde, fhasta, 0, 0, 0, 0, 0, 0));
            }
            catch (Exception)
            {

            }
            return ret;
        }


    }
}
