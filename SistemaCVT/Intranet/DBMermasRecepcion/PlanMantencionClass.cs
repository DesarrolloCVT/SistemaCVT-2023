using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBMermasRecepcion
{
   public class PlanMantencionClass
    {
        DBMLCVTDESAINTDataContext DBDESAINT = new DBMLCVTDESAINTDataContext();

        public PlanMantencionClass()
        {
        }

        public string BuscaDescripcionMaquinaComponente(int ID)
        {
            string ret = "";
            try
            {
                var temp = (from u in DBDESAINT.CVT_MaquinaComponente
                            where u.ID.Equals(ID)
                            select new { u.Descricion }).First();
                if (temp != null)
                {
                    ret = temp.Descricion;
                }
            }
            catch { }
            return ret;
        }
        public int BuscaCodigoMaquinaComponente(int ID)
        {
            int ret =0;
            try
            {
                var temp = (from u in DBDESAINT.CVT_MaquinaComponente
                            where u.ID.Equals(ID)
                            select new { u.ID }).First();
                if (temp != null)
                {
                    ret = temp.ID;
                }
            }
            catch { }
            return ret;
        }
      
        public bool InsertaMaquina(CVT_PlanMantencion_Maquina maq)
        {
            bool ret = false;
            try
            {
                DBDESAINT.CVT_PlanMantencion_Maquina.InsertOnSubmit(maq);
                DBDESAINT.SubmitChanges();
                ret = true;
            }
            catch
            {

            }
            return ret;
        }
        public bool InsertaParte(CVT_PlanMantencion_Parte maq)
        {
            bool ret = false;
            try
            {
                DBDESAINT.CVT_PlanMantencion_Parte.InsertOnSubmit(maq);
                DBDESAINT.SubmitChanges();
                ret = true;
            }
            catch
            {

            }
            return ret;
        }

        public bool InsertaPieza(CVT_PlanMantencion_Pieza piez)
        {
            bool ret = false;
            try
            {
                DBDESAINT.CVT_PlanMantencion_Pieza.InsertOnSubmit(piez);
                DBDESAINT.SubmitChanges();
                ret = true;
            }
            catch
            {

            }
            return ret;
        }
        public bool InsertaHerramienta(CVT_PlanMantencion_Herramienta herr)
        {
            bool ret = false;
            try
            {
                DBDESAINT.CVT_PlanMantencion_Herramienta.InsertOnSubmit(herr);
                DBDESAINT.SubmitChanges();
                ret = true;
            }
            catch
            {

            }
            return ret;
        }
        public bool InsertaRepuesto(CVT_PlanMantencion_Repuesto rep)
        {
            bool ret = false;
            try
            {
                DBDESAINT.CVT_PlanMantencion_Repuesto.InsertOnSubmit(rep);
                DBDESAINT.SubmitChanges();
                ret = true;
            }
            catch
            {

            }
            return ret;
        }
        public bool InsertaRRHH(CVT_PlanMantencion_RRHH rrhh)
        {
            bool ret = false;
            try
            {
                DBDESAINT.CVT_PlanMantencion_RRHH.InsertOnSubmit(rrhh);
                DBDESAINT.SubmitChanges();
                ret = true;
            }
            catch
            {

            }
            return ret;
        }

        public string BuscaEstado(int ID)
        {
            string ret = "";
            try
            {
                var temp = (from u in DBDESAINT.CVT_PlanMantencion_Encabezado
                            where u.Id_PlanMantencion.Equals(ID)
                            select new { u.Estado }).First();
                if (temp != null)
                {
                    ret = temp.Estado;
                }
            }
            catch { }
            return ret;
        }

        public bool ActualizaEstadoPlan(int IdPlan)
        {
            bool ret = false;
            try
            {
                var t = from a in DBDESAINT.CVT_PlanMantencion_Encabezado
                        where a.Id_PlanMantencion.Equals(IdPlan)
                        select a;
                foreach (var r in t)
                {

                    r.Estado = "Terminado";
                    //DBDESAINT.CVT_DetalleNoConformidad.InsertOnSubmit(vEditado);
                    DBDESAINT.SubmitChanges();
                }
                ret = true;
            }
            catch (Exception)
            {


            }
            return ret;
        }
        public int BuscaCodigoMaquinaNombre(string ID)
        {
            int ret = 0;
            try
            {
                var temp = (from u in DBDESAINT.CVT_MaquinaComponente
                            where u.ID.Equals(ID)
                            select new { u.ID }).First();
                if (temp != null)
                {
                    ret = temp.ID;
                }
            }
            catch { }
            return ret;
        }

        public int BuscaEstadoAviso(string estado)
        {
            int ret = 0;
            estado = "Creado";
            try
            {
                var temp = (from u in DBDESAINT.CVT_PlanMantencion_Encabezado
                            where u.Estado.Equals(estado)
                            select new { u.Id_PlanMantencion }).First();
                if (temp != null)
                {
                    ret = temp.Id_PlanMantencion;
                }
            }
            catch { }
            return ret;
        }
        public int TraeCantidadRegistrosCreados()
        {
            int ret = 0;
            try
            {
                List<CVT_PlanMantencion_Encabezado> dt = new List<CVT_PlanMantencion_Encabezado>();
                dt = (from tr in DBDESAINT.CVT_PlanMantencion_Encabezado
                      where tr.Estado.Equals("Creado")
                      select tr).ToList<CVT_PlanMantencion_Encabezado>();
                foreach (var n in dt)
                {
                    ret = ret + 1;                  

                }
                return ret;
            }
            catch (Exception)
            {


            }
            return ret;
        }
    }
}
