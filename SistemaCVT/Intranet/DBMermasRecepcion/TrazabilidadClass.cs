using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace DBMermasRecepcion
{
    public  class TrazabilidadClass
    {
        DBMLCVTSAPDataContext DBSap = new DBMLCVTSAPDataContext();
        DBMLCVTDESAINTDataContext DBDesaint = new DBMLCVTDESAINTDataContext();
        DBMLCVTWMSDataContext DBWMS = new DBMLCVTWMSDataContext();
        public TrazabilidadClass()
        {

        }
        public bool ExecAnalizaLotes(string Lote, short? TipoLote, string Itemcode, short? TipoLlamado, short? Nivel, string Clave)
        {
            bool ret = false;
            try
            {
                DBSap.CommandTimeout = 60000;
                DBSap.CVT_BalanceMasaAnalizaLotes_1(Lote, TipoLote, Itemcode, TipoLlamado, Nivel, Clave);
                ret= true;

            }
            catch(Exception ex)
            {
                string a = ex.Message;
            }
            return ret;
        }
        public List<TMP_Traza_ConsumiblesOF> ObtieneAnalisisLote(string Clave)
        {
            List<TMP_Traza_ConsumiblesOF> ret = new List<TMP_Traza_ConsumiblesOF>();
            try
            {

                DBSap.CommandTimeout = 60000;
                ret = (from t in DBDesaint.TMP_Traza_ConsumiblesOF
                       where t.Clave.Equals(Clave)
                       select t).ToList<TMP_Traza_ConsumiblesOF>();
            }
            catch
            {

            }
            return ret;
        }
        public DataTable ObtieneAnalisisLotePT(string Clave)
        {
            DataTable ret = new DataTable();
            try
            {
                DBSap.CommandTimeout = 60000;
                var temp = from a in DBDesaint.CVT_VW_TrazaBalanceMasaAnalizaLotesPT
                           where a.Clave.Equals(Clave)
                           select a;
                if(temp!=null)
                {
                    ret = Utilidades.LINQToDataTable(temp);
                }
            }
            catch
            {

            }
            return ret;
        }
        public DataTable ObtieneAnalisisLoteMP(string Clave)
        {
            DataTable ret = new DataTable();
            try
            {
                DBSap.CommandTimeout = 60000;
                var temp = from a in DBDesaint.CVT_VW_TrazaBalanceMasaAnalizaLotesMP
                           where a.Clave.Equals(Clave)
                           select a;
                if (temp != null)
                {
                    ret = Utilidades.LINQToDataTable(temp);
                }
            }
            catch
            {

            }
            return ret;
        }
        public DataTable ObtieneAnalisisLoteRep(string Clave)
        {
            DataTable ret = new DataTable();
            try
            {
                DBSap.CommandTimeout = 60000;
                var temp = from a in DBDesaint.CVT_VW_TrazaBalanceMasaAnalizaLotesREP
                           where a.Clave.Equals(Clave)
                           select a;
                if (temp != null)
                {
                    ret = Utilidades.LINQToDataTable(temp);
                }
            }
            catch
            {

            }
            return ret;
        }
        public DataTable ExecBalanceMasaLoteMPTrazado(string Lote, string itemcode)
        {
            DataTable ret = new DataTable();
            try
            {
                DBSap.CommandTimeout = 60000;
                ret = Utilidades.LINQToDataTable(DBSap.CVT_BalanceMasaLoteMPTRazado_1(Lote, itemcode));
            }
            catch
            {

            }
            return ret;
        }
        public DataTable ExecBalanceMasaFacturacion(string Lote)
        {
            DataTable ret = new DataTable();
            try
            {
                DBSap.CommandTimeout = 60000;
                ret = Utilidades.LINQToDataTable(DBSap.CVT_BalanceMasaFacturacion_1(Lote));
            }
            catch(Exception ex)
            {
                string A = ex.Message;
            }
            return ret;
        }
        public DataTable ExecObtieneDatosOF(int OF)
        {
            DataTable ret = new DataTable();
            try
            {
                DBSap.CommandTimeout = 60000;
                ret = Utilidades.LINQToDataTable(DBSap.CVT_Rpt_Traza_1_ObtieneDatosOF_1(OF));
            }
            catch (Exception ex)
            {
                string A = ex.Message;
            }
            return ret;
        }

        public DataTable ObtieneEjercicioTrazabilidad(int Tipo, string Lote)
        {
            DataTable ret = new DataTable();
            try
            {
                DBWMS.CommandTimeout = 120000;
                ret = Utilidades.LINQToDataTable(DBWMS.CVT_SP_TRAZABILIDAD(Lote, Tipo));
            }
            catch (Exception ex)
            {
                string A = ex.Message;
            }
            return ret;
        }


    }
}
