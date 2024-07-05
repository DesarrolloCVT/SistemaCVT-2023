using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace DBMermasRecepcion
{
  public  class ContabilidadClass
    {

        public ContabilidadClass() { }
        DBMLCVTDESAINTDataContext DBDesaint = new DBMLCVTDESAINTDataContext();
        DBMLCVTSAPDataContext DBSAP = new DBMLCVTSAPDataContext();

        public DataTable SP_DetCenCosto(int Ano,int Mes, string Uadm)

        {
            DataTable ret = new DataTable();
            try
            {
                DBSAP.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBSAP.CVT_DetalleCentroCosto(Ano,Mes, Uadm));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public DataTable SP_Balance(int ano,int mes,string tipo)
        {
            DataTable ret = new DataTable();
            try
            {
                DBSAP.CommandTimeout = 60000;
                ret = Utilidades.LINQToDataTable(DBSAP.CVT_BALANCE_8_COLUMNAS(ano,mes,tipo));
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_InformeGestion(int ano, int mes, string UAdm)
        {
            DataTable ret = new DataTable();
            try
            {
                DBSAP.CommandTimeout = 60000;
                ret = Utilidades.LINQToDataTable(DBSAP.CVT_INFORME_GESTION(ano, mes, UAdm));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public DataTable SP_ResumenGestion(DateTime fini, DateTime ftermino, int tipo)
        {
            DataTable ret = new DataTable();
            try
            {
                DBSAP.CommandTimeout = 60000;
                ret = Utilidades.LINQToDataTable(DBSAP.SP_ResumenGestion(fini, ftermino, tipo));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public bool InsertaRegistroActivoFijo(CVT_ActivoFIjo nuevo)
        {
            bool ret = false;
            try
            {
                DBDesaint.CVT_ActivoFIjo.InsertOnSubmit(nuevo);
                DBDesaint.SubmitChanges();

                ret = true;
            }
            catch(Exception ex)
            {
                ret = false;

            }
            return ret;
        }


    }
}
