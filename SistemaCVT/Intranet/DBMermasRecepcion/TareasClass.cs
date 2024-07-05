using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBMermasRecepcion
{
    public class TareasClass
    {
        DBMLCVTDESAINTDataContext DBDESAINT = new DBMLCVTDESAINTDataContext();
        public TareasClass() { }

        public string InsertaTarea(CVT_Registro_Tareas tarea)
        {
            string ret ="0";
            try
            {
                DBDESAINT.CVT_Registro_Tareas.InsertOnSubmit(tarea);
                DBDESAINT.SubmitChanges();
                return ret;
            }
            catch( Exception ex)
            {
                return ret = ex.Message;
            }         
        }

        public string EliminaTarea(int idTask)
        {
            string ret = "0";

            try
            {
                var temp = from p in DBDESAINT.CVT_Registro_Tareas
                           where p.IdTarea.Equals(idTask)
                           select p;
                foreach (var detail in temp)
                {
                    DBDESAINT.CVT_Registro_Tareas.DeleteOnSubmit(detail);
                }
                DBDESAINT.SubmitChanges();
                return ret;
            }
            catch (Exception ex)
            {
                return ex.Message;
            }           
        }
        public List<VW_RESUMEN_TAREAS> InfoTarea(int taskID)
        {
            List<VW_RESUMEN_TAREAS> ret = new List<VW_RESUMEN_TAREAS>();
            try
            {
                ret = (from td in DBDESAINT.VW_RESUMEN_TAREAS
                       where td.NTarea.Equals(taskID)
                       select td).ToList<VW_RESUMEN_TAREAS>();
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public string ActualizaTarea(int Task, CVT_Registro_Tareas vTarea)
        {
            string ret = "0";
            try
            {
                var t = from a in DBDESAINT.CVT_Registro_Tareas
                        where a.IdTarea.Equals(Task)
                        select a;
                foreach (var r in t)
                {
                    r.DptoID = vTarea.DptoID;
                    r.FechaInicio = vTarea.FechaInicio;
                    r.FechaTermino = vTarea.FechaTermino;
                    r.Prioridad = vTarea.Prioridad;
                    r.Estado = vTarea.Estado;
                    r.Asunto = vTarea.Asunto;
                    r.Detalle = vTarea.Detalle;
                    r.PrcCumpli = vTarea.PrcCumpli;
                    r.IdAsignado = vTarea.IdAsignado;
                    r.Resolucion = vTarea.Resolucion;
                    r.FechaInicioReal = vTarea.FechaInicioReal;
                    r.HoraInicioReal = vTarea.HoraInicioReal;
                    r.FechaTerminoReal = vTarea.FechaTerminoReal;
                    r.HoraTeminoReal = vTarea.HoraTeminoReal;
                    r.TiempoEstimado = vTarea.TiempoEstimado;

                    //DBDESAINT.CVT_DetalleNoConformidad.InsertOnSubmit(vEditado);
                    DBDESAINT.SubmitChanges();
                }
                return ret;
            }
            catch (Exception ex)
            {
                return ex.Message;

            }
            
        }

        public int EstadoTarea(int idtsk)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBDESAINT.CVT_Registro_Tareas
                            where s.IdTarea.Equals(idtsk)
                            select new { s.Estado }).FirstOrDefault();

                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.Estado);
                }
            }
            catch (Exception)
            {
                ret = 0;
            }
            return ret;
        }

        public int AreaUser(int idUS)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DBDESAINT.CVT_Usuarios
                            where s.IdUsuario.Equals(idUS)
                            select new { s.Id_Area }).FirstOrDefault();

                if (temp != null)
                {
                    ret = Convert.ToInt32(temp.Id_Area);
                }
            }
            catch (Exception)
            {
                ret = 0;
            }
            return ret;
        }

    }
}
