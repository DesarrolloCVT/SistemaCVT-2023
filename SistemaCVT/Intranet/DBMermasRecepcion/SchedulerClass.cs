using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace DBMermasRecepcion
{
    public class SchedulerClass
    {
        public SchedulerClass()
        {
        }
        DBMLCVTDESAINTDataContext DBDesaint = new DBMLCVTDESAINTDataContext();
        public List<CVT_Agendamiento> ObtieneAgendamientos()
        {
            List<CVT_Agendamiento> ret = new List<CVT_Agendamiento>();
            ret = (from a in DBDesaint.CVT_Agendamiento
                   select a).ToList<CVT_Agendamiento>();
            return ret;
        }
        public List<CVT_Agendamiento> ObtieneAgendamientoxId(int ID)
        {
            List<CVT_Agendamiento> ret = new List<CVT_Agendamiento>();
            ret = (from a in DBDesaint.CVT_Agendamiento
                   where a.AgendamientoId.Equals(ID)
                   select a).ToList<CVT_Agendamiento>();
            return ret;
        }
        public int AgregaAgendamiento(CVT_Agendamiento vNuevo)
        {
            int ret = 0;
            try
            {
                DBDesaint.CVT_Agendamiento.InsertOnSubmit(vNuevo);
                DBDesaint.SubmitChanges();
                ret = vNuevo.AgendamientoId;
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public bool AgregaLineasAgendamiento(int idAgendamineto, int idlinea)
        {
            bool ret = false;
            try
            {
                CVT_AgendamientoLinea vNuevo = new CVT_AgendamientoLinea
                {
                    Agendamiento_Id = idAgendamineto,
                    LineaId = idlinea
                };
                DBDesaint.CVT_AgendamientoLinea.InsertOnSubmit(vNuevo);
                DBDesaint.SubmitChanges();
            }
            catch
            {
            }
            return ret;
        }
        public List<CVT_AgendamientoLinea> ObtieneLineasAgendamiento(int IdAgen)
        {
            List<CVT_AgendamientoLinea> ret = new List<CVT_AgendamientoLinea>();
            ret = (from a in DBDesaint.CVT_AgendamientoLinea
                   where a.Agendamiento_Id.Equals(IdAgen)
                   select a).ToList<CVT_AgendamientoLinea>();
            return ret;
        }
        public DataTable ObtienePrevision(string Codigo, decimal cantidad)
        {
            DataTable ret = new DataTable();
            try
            {
                var temp = DBDesaint.CVT_AGENDAPROD_LeeStockReceta(Codigo, cantidad);
                ret = Utilidades.LINQToDataTable(temp);
            }
            catch
            {
            }
            return ret;
        }
        public bool ActualizaAgendamiento(int idagen, CVT_Agendamiento vEditado)
        {
            bool ret = false;
            try
            {
                var t = from a in DBDesaint.CVT_Agendamiento
                        where a.AgendamientoId.Equals(idagen)
                        select a;
                foreach (var r in t)
                {
                    r.Asunto = vEditado.Asunto;
                    r.CantidadPlanificada = vEditado.CantidadPlanificada;
                    r.CantidadProducida = vEditado.CantidadProducida;
                    r.Descripcion = vEditado.Descripcion;
                    r.Estado = vEditado.Estado;
                    r.Estado_OF = vEditado.Estado_OF;
                    r.FechaLimite = vEditado.FechaLimite;
                    r.Inicio = vEditado.Inicio;
                    r.OF_DocEntry = vEditado.OF_DocEntry;
                    r.ProductoCode = vEditado.ProductoCode;
                    r.RecursoId = vEditado.RecursoId;
                    r.Semana = vEditado.Semana;
                    r.Termino = vEditado.Termino;
                    r.Tipo_Produccion = vEditado.Tipo_Produccion;
                    r.Turno = vEditado.Turno;
                }
                ret = true;
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public bool EliminaLineasAgendamiento(int IdAgen)
        {
            bool ret = false;
            try
            {
                DBDesaint.CVT_AgendamientoLinea.Where(x => x.Agendamiento_Id == IdAgen).ToList().ForEach(DBDesaint.CVT_AgendamientoLinea.DeleteOnSubmit);
                DBDesaint.SubmitChanges();
                ret = true;
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public bool CambiaEstadoAgenda(int Agenda, int Estado)
        {
            bool flag = false;
            try
            {
                IQueryable<CVT_Agendamiento> queryable = from t in this.DBDesaint.CVT_Agendamiento
                                                         where t.AgendamientoId.Equals(Agenda)
                                                         select t;
                foreach (CVT_Agendamiento tr in queryable)
                {
                    tr.Estado = Convert.ToInt16(Estado);
                }
              this.DBDesaint.SubmitChanges();
                flag = true;
            }
            catch
            {
                flag = false;
            }
            return flag;

        }
    }

}
