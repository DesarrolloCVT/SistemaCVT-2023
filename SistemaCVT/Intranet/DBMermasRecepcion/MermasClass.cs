using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace DBMermasRecepcion
{
    public class MermasClass
    {
        DBMLCVTDESAINTDataContext DBDESAINT = new DBMLCVTDESAINTDataContext();
        DBMLCVTSAPDataContext DBSAP = new DBMLCVTSAPDataContext();
        public MermasClass()
        {
        }
        public DataTable SP_ObtieneRecepciones(int NumGuia, string RefCliente, int NumOC, int NumRecepWMS, string Lote, DateTime FRecep)
        {
            DataTable ret = new DataTable();
            try
            {
                ret=Utilidades.LINQToDataTable(DBDESAINT.CVT_InfMermasRec_BuscaRecepciones(NumGuia, RefCliente, NumOC, NumRecepWMS, Lote, FRecep));  
            }
            catch
            {
            }
            return ret;
        }
        public DataTable SP_ObtieneDetRecep(int DocEntryRecep)
        {
            DataTable ret = new DataTable();
            try
            {
                ret = Utilidades.LINQToDataTable(DBDESAINT.CVT_InfMermasRec_BuscaDetRecepciones(DocEntryRecep));
            }
            catch
            {
            }
            return ret;
        }
        public DataTable InformeMermas(int OC, string CardCode, string Itemcode, string Lote, int? grupoproducto, int? recepwms, int? recepsap,
                                        int? indFec, DateTime? fecini, DateTime? fecter, string factura, string guia)
        {
            DataTable ret = new DataTable();
            try
            {
                DBSAP.CommandTimeout = 250000;
                ret = Utilidades.LINQToDataTable(DBSAP.CVT_Rpt_InformeDeMermas2(OC, CardCode, Itemcode, Lote, grupoproducto, recepwms, recepsap, indFec, fecini, fecter, factura, guia));
            }
            catch
            {
            }
            return ret;
        }
        public int OFModificadas(int of)
        {
            int ret = 0;
            try
            {
                var temp = (from o in DBDESAINT.OF_Modificadas
                            where o.Orden_Fabricacion.Equals(of)
                            select new { o.Orden_Fabricacion }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToInt32(temp.Orden_Fabricacion);
            }
            catch
            {
                ret = 0;
            }
            return ret;
        }
        public DataTable ObtieneDatosPedido(DateTime FechaEntrega, int Pedido)
        {
            DataTable ret = new DataTable();
            try
            {
                ret = Utilidades.LINQToDataTable(DBDESAINT.CVT_LOGTRANS_Rpt_OrdenCarga(Pedido, FechaEntrega));
            }
            catch
            {
            }
            return ret;
        }
        public bool AgregaCheckListArmadoPedido(CVT_CheckList_ArmadoPedido nuevo)
        {
            bool ret = false;
            try
            {
                DBDESAINT.CVT_CheckList_ArmadoPedido.InsertOnSubmit(nuevo);
                DBDESAINT.SubmitChanges();
                ret = true;
            }
            catch
            {


            }
            return ret;
        }

        public DataTable SP_PorcRecuperacionProducto(DateTime FInicio,DateTime FTermino)
        {
            DataTable ret = new DataTable();
            try
            {
                ret = Utilidades.LINQToDataTable(DBSAP.CVT_MERMA_PORC_RECUPERACION_PRODUCTO(FInicio,FTermino));
            }
            catch
            {
            }
            return ret;
        }

        public DataTable SP_informeRecepcion(DateTime FInicio, DateTime FTermino)
        {
            DataTable ret = new DataTable();
            try
            {
                ret = Utilidades.LINQToDataTable(DBSAP.CVT_CIERREMENSUAL_BPT_INFORME_RECEPCIONES(FInicio, FTermino));
            }
            catch
            {
            }
            return ret;
        }

        public DataTable SP_informeSalidaDesecho(int Mes, int ano)
        {
            DataTable ret = new DataTable();
            try
            {
                ret = Utilidades.LINQToDataTable(DBSAP.CVT_SP_InformeSalidasDesecho(Mes, ano));
            }
            catch
            {
            }
            return ret;
        }

        public DataTable SP_RotacionMerma()
        {
            DataTable ret = new DataTable();
            try
            {
                ret = Utilidades.LINQToDataTable(DBSAP.SP_CVT_ResumenMerma());
            }
            catch
            {
            }
            return ret;
        }
        
    }
}
