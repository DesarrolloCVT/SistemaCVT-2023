using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace DBMermasRecepcion
{
    public class AsistenciaJBDClass
    {
        DBMLCVTDESAINTDataContext DBDesaint = new DBMLCVTDESAINTDataContext();
        public AsistenciaJBDClass()
        {

        }
        public bool InsertaRegistroAsistencia(CVT_Asistencia_JBD nuevo)
        {
            bool ret = false;
            try
            {
                DBDesaint.CommandTimeout = 6000;
                DBDesaint.CVT_Asistencia_JBD.InsertOnSubmit(nuevo);
                DBDesaint.SubmitChanges();
            }
            catch
            {


            }
            return ret;
        }

        public int obtenerIdUsuario(string user)
        {
            int ret = 0;
            try
            {
                var temp = (from u in DBDesaint.CVT_Usuarios
                            where u.UsuarioSistema.Equals(user)
                            select new { u.IdUsuario }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.IdUsuario;
                }
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public DataTable SP_ListaAsistenciaFiltro(int idArea, DateTime fini, DateTime fter, int idLabor)
        {
            DataTable ret = new DataTable();
            try
            {
                ret = Utilidades.LINQToDataTable(DBDesaint.CVT_DetalleAsistenciaFiltro(idArea, fini, fter, idLabor));
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable SP_ListaAsistenciaResumenDia(int idArea, DateTime fini, DateTime fter, int idLabor)
        {
            DataTable ret = new DataTable();
            try
            {
                ret = Utilidades.LINQToDataTable(DBDesaint.CVT_DetalleAsistenciaResumenDia(idArea, fini, fter, idLabor));
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public int ObtieneIdArea(string Departamento)
        {
            int ret = 0;
            try
            {
                var temp = (from a in DBDesaint.CVT_AreaTrabajo
                            where a.Nombre.Equals(Departamento)
                            select new { a.Id_Area }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.Id_Area);
                }
            }
            catch
            { 
            
            }
            return ret;
        }


        public DataTable sp_ResumenasistenciaArea(DateTime fini, DateTime fter)
        {
            DataTable ret = new DataTable();
            try
            {
                ret = Utilidades.LINQToDataTable(DBDesaint.SP_CVT_ResumenAsistenciaFecha(fini, fter));
            }
            catch (Exception)
            {

            }
            return ret;
        }
        public DataTable sp_InconsistenciasFechas(DateTime fini, DateTime fter)
        {
            DataTable ret = new DataTable();
            try
            {
                ret = Utilidades.LINQToDataTable(DBDesaint.SP_CVT_InconsistenciasAsistenciaFecha(fini, fter));
            }
            catch (Exception)
            {

            }
            return ret;
        }


    }
}
