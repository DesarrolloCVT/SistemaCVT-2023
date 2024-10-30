using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace DBMermasRecepcion
{
   public class ComercialClass
    {
        DBMLCVTSAPDataContext DBSap = new DBMLCVTSAPDataContext();
        DBMLCVTDESAINTDataContext DBDesaint = new DBMLCVTDESAINTDataContext();


        public ComercialClass() { }

        public  DataTable SP_ComparacionCostosAnuales(int ano)

        {
            DataTable ret = new DataTable();
            try
            {
                DBSap.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSap.ComparacionCostosAnuales(ano));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public DataTable SP_CompEstadisticaDeVentasComerciales(DateTime fdesde, DateTime fhasta)

        {
            DataTable ret = new DataTable();
            try
            {
                DBSap.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSap.ComparativoEstadisticasVentasComerciales(fdesde,fhasta));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public bool InsertaDetalleRapel(CVT_Porcentaje_Rapel nuevo)
        {
            bool ret = false;
            try
            {
                DBDesaint.CVT_Porcentaje_Rapel.InsertOnSubmit(nuevo);
                DBDesaint.SubmitChanges();
                ret = true;
            }
            catch
            {
            }
            return ret;
        }

        public DataTable SP_EAstadisticasDeVentasRapel(DateTime fdesde, DateTime fhasta)

        {
            DataTable ret = new DataTable();
            try
            {
                DBSap.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSap.CVT_EstadisticasVentas_Rapel(fdesde, fhasta,0,0,0,0,0,0));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public DataTable SP_EstadisticasDeVentasRapel2023(DateTime fdesde, DateTime fhasta)

        {
            DataTable ret = new DataTable();
            try
            {
                DBSap.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSap.CVT_EstadisticasVentas_Rapel_testNuevo(fdesde, fhasta, 0, 0, 0, 0, 0, 0));
            }
            catch (Exception)
            {

            }
            return ret;
        }


        public DataTable SP_AnalisisCompra(int Codprov,int CodFam,int Mes,int Ano)

        {
            DataTable ret = new DataTable();
            try
            {
                DBSap.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSap.CVT_ANALISISCOMPRAS(Codprov,CodFam,Mes,Ano));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public DataTable SP_AnalisisCompraDetFactura(int Codprov, int CodFam, int Mes, int Ano)

        {
            DataTable ret = new DataTable();
            try
            {
                DBSap.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSap.CVT_ANALISISCOMPRAS_DETFACTURAS(Codprov, CodFam, Mes, Ano));
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_ComparativoEstadisticaDeVentas(DateTime fini,DateTime fter)

        {
            DataTable ret = new DataTable();
            try
            {
                DBSap.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSap.CVT_ListadoVentasComparaAño(fini, fter));
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_IndicadorComercialxCliente(DateTime fini, DateTime fter,decimal Kilo)

        {
            DataTable ret = new DataTable();
            try
            {
                DBSap.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSap.SP_CVT_INDICADORES_xCliente(fini, fter,Kilo));
            }
            catch (Exception)
            {

            }
            return ret;
        }


        public DataTable SP_IndicadorComercialxTipoNegocio(DateTime fini, DateTime fter, decimal Kilo)

        {
            DataTable ret = new DataTable();
            try
            {
                DBSap.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSap.SP_CVT_INDICADORES_COMERCIALES_TipoNegocio( fini, fter, Kilo));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public DataTable SP_EstVentasCVTSMM(DateTime fini, DateTime fter)

        {
            DataTable ret = new DataTable();
            try
            {
                DBSap.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSap.SP_Estadistica_Ventas_SMM_CVT(fini, fter));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public DataTable SP_EstadisticasCVT(DateTime fini, DateTime fter, int Inf, int ValorKM)

        {
            DataTable ret = new DataTable();
            try
            {
                DBSap.CommandTimeout = 60000;
                
                
                ret = Utilidades.LINQToDataTable(DBSap.SP_EstadisticasVentasCVT_Copia_Test(fini, fter,Inf, ValorKM));
              
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public int SP_CargaProductoPresupuesto(int presupuesto, string cardcode, string cardname, int tipo)
        {
            int ret = 0;
            try
            {
                
                var temp = (from r in DBDesaint.CVT_PresupuestoDetalle
                            where r.Presupuesto_ID.Equals(presupuesto) && r.CardCode.Equals(cardcode)
                            select new { r.Presupuesto_ID }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.Presupuesto_ID);
                }
            }
            catch { }
            if (ret == 0)
            {
                DBDesaint.SP_CargaPresupuesto(presupuesto, cardcode, cardname, tipo);
            }
            return ret;
        }

    }
}
