using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBMermasRecepcion
{
    public class UtilidadCVTClass
    {
        DBMLCVTDESAINTDataContext DBDESAINT = new DBMLCVTDESAINTDataContext();
        DBMLCVTWMSDataContext DBDatos = new DBMLCVTWMSDataContext();

        public UtilidadCVTClass() { }

        public bool SP_EliminaPallet(int nPallet)

        {
            bool ret = false;
            try
            {
                DBDatos.CommandTimeout = 6000;
              ret=Convert.ToBoolean(Utilidades.LINQToDataTable(DBDatos.P_EliminaPallet(nPallet)));
                
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public bool SP_EliminaRecepcion(int nRecp)

        {
            bool ret = false;
            try
            {
                DBDatos.CommandTimeout = 6000;
               ret=Convert.ToBoolean(Utilidades.LINQToDataTable(DBDatos.P_EliminaRecepcion(nRecp)));
           
            }
            catch (Exception)
            {

            }
            return ret;
        }


        public bool InsertaRegistroLogUtilidades(CVT_LogUtilidades vNuevo)
        {
            bool ret = false;
            DBDESAINT.CVT_LogUtilidades.InsertOnSubmit(vNuevo);
            DBDESAINT.SubmitChanges();
            return ret;
        }

        public int TruncaTablaRutas()
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBDESAINT.CVT_RutaCertificadoFumigacion                          
                            select s);
                if (temp != null)
                {
                    DBDESAINT.CVT_RutaCertificadoFumigacion.DeleteAllOnSubmit(temp);
                    DBDESAINT.SubmitChanges();
                }
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public bool InsertarutaCertificadosFumigacion(CVT_RutaCertificadoFumigacion nuevo)
        {
            bool ret = false;
            try
            {
                DBDESAINT.CVT_RutaCertificadoFumigacion.InsertOnSubmit(nuevo);
                DBDESAINT.SubmitChanges();
                ret = true;

            }
            catch
            {


            }
            return ret;

        }
        public bool InsertaLogErrInforme(CVT_LogErrorInformes nuevo)
        {
            bool ret = false;
            try
            {
                DBDESAINT.CVT_LogErrorInformes.InsertOnSubmit(nuevo);
                DBDESAINT.SubmitChanges();
                ret = true;

            }
            catch
            {


            }
            return ret;

        }

    }
}
