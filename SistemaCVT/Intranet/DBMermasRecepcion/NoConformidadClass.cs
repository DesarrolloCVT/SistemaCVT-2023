using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBMermasRecepcion
{
    public class NoConformidadClass
    {
        DBMLCVTDESAINTDataContext DBDESAINT = new DBMLCVTDESAINTDataContext();

        public NoConformidadClass()
        {
        }

        public List<CVT_NoConformidades> ObtieneDatos(int idConformidad)
        {
            List<CVT_NoConformidades> ret = new List<CVT_NoConformidades>();
            try
            {
                ret = (from p in DBDESAINT.CVT_NoConformidades
                       where p.Id_NoConformidad.Equals(idConformidad)
                       select p).ToList<CVT_NoConformidades>();
            }
            catch
            {

            }
            return ret;
        }

        public String obtieneArea(int idArea)
        {
            String res ="";

            var tem = (from u in DBDESAINT.CVT_AreaNoConformidad
                       where u.id_AreaNoConformidad.Equals(idArea)
                       select new { u.Area }).First();
            if (tem != null)
            {
                res = tem.Area;
            }
            return res;
        }

        public bool InsertaRegistroDetalle(CVT_DetalleNoConformidad nuevo)
        {
            bool ret = false;
            try
            {
                DBDESAINT.CVT_DetalleNoConformidad.InsertOnSubmit(nuevo);
                DBDESAINT.SubmitChanges();
            }
            catch
            {


            }
            return ret;
        }


        public bool InsertaRegistroRutaArchivo(CVT_RutaArchivoNoConformidad nuevo)
        {
            bool ret = false;
            try
            {
                DBDESAINT.CVT_RutaArchivoNoConformidad.InsertOnSubmit(nuevo);
                DBDESAINT.SubmitChanges();
            }
            catch
            {


            }
            return ret;
        }

        public List<CVT_DetalleNoConformidad> DatosDetalleNoConformidad(int idConformidad)
        {
            List<CVT_DetalleNoConformidad> ret = new List<CVT_DetalleNoConformidad>();
            try
            {
                ret = (from p in DBDESAINT.CVT_DetalleNoConformidad
                       where p.Id_NoConformidad.Equals(idConformidad)
                       select p).ToList<CVT_DetalleNoConformidad>();
            }
            catch
            {

            }
            return ret;

        }

        public int ValidaIdConformidadEnDetalle(int idNoConformidad)
        {
            int res = 0;

            var tem = (from u in DBDESAINT.CVT_DetalleNoConformidad
                       where u.Id_NoConformidad.Equals(idNoConformidad)
                       select new { u.Id_NoConformidad }).FirstOrDefault();
            if (tem != null)
            {
                res = tem.Id_NoConformidad;
            }
            return res;
        }

        public bool ActualizaDetalle(int idNoconformidad, CVT_DetalleNoConformidad vEditado)
        {
            bool ret = false;
            try
            {
                var t = from a in DBDESAINT.CVT_DetalleNoConformidad
                        where a.Id_NoConformidad.Equals(idNoconformidad)
                        select a;
                foreach (var r in t)
                {
                    r.Origen = vEditado.Origen;
                    r.Usuario = vEditado.Usuario;
                    r.Descripcion = vEditado.Descripcion;
                    r.CausaOrigen = vEditado.CausaOrigen;
                    r.DescAccionInmediata = vEditado.DescAccionInmediata;
                    r.FechPlazoAccionInmediata = vEditado.FechPlazoAccionInmediata;
                    r.CumpleAccioninmediata = vEditado.CumpleAccioninmediata;
                    r.DescAccionCorrectiva = vEditado.DescAccionCorrectiva;
                    r.FechPlazoAccionCorrectiva = vEditado.FechPlazoAccionCorrectiva;
                    r.CumpleAccionCorrectiva = vEditado.CumpleAccionCorrectiva;
                    r.DecSupervisionEjecucion = vEditado.DecSupervisionEjecucion;
                    r.FechSupervisionEjecucion = vEditado.FechSupervisionEjecucion;
                    r.DecEficaciaAccion = vEditado.DecEficaciaAccion;
                    r.CumpleEficaciaAccion = vEditado.CumpleEficaciaAccion;
                    r.FechEvaluacionEficaciaAccion = vEditado.FechEvaluacionEficaciaAccion;

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


        public string BuscaNombreUsuario(int idUser)
        {
            string res ="";

            var tem = (from u in DBDESAINT.CVT_Usuarios
                       where u.IdUsuario.Equals(idUser)
                       select new { u.NombreUsuario }).First();
            if (tem != null)
            {
                res = tem.NombreUsuario;
            }
            return res;
        }


        public string BuscaNombreArchivo(int idRuta)
        {
            string res = "";

            var tem = (from u in DBDESAINT.CVT_RutaArchivoNoConformidad
                       where u.Id_RutaArchivoNoConformidad.Equals(idRuta)
                       select new { u.Nombre }).First();
            if (tem != null)
            {
                res = tem.Nombre;
            }
            return res;
        }

        public bool ActualizaEncNoconformidad(int idNocon,string user)
        {
            bool ret = false;
            try
            {
                var t = from a in DBDESAINT.CVT_NoConformidades
                        where a.Id_NoConformidad.Equals(idNocon)
                        select a;
                foreach (var r in t)
                {
                    int vr =Convert.ToInt32(r.Version);
                    r.Version =vr+1;
                    r.fechaUltimaMod =DateTime.Now;
                    r.UsuarioultimaMod = user;
                  
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

        public bool ActualizaNoconformidadUpArchivo(int idNocon, string user)
        {
            bool ret = false;
            try
            {
                var t = from a in DBDESAINT.CVT_NoConformidades
                        where a.Id_NoConformidad.Equals(idNocon)
                        select a;
                foreach (var r in t)
                {
                   
                    r.fechaUltimaMod = DateTime.Now;
                    r.UsuarioultimaMod = user;

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

        public bool ActualizaEstado(int idNocon,string Estado)
        {
            bool ret = false;
            try
            {
                var t = from a in DBDESAINT.CVT_NoConformidades
                        where a.Id_NoConformidad.Equals(idNocon)
                        select a;
                foreach (var r in t)
                {

                    r.Estado = Estado;

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

        public bool ActualizaEstadoYfecha(int idNocon, string Estado)
        {
            bool ret = false;
            try
            {
                var t = from a in DBDESAINT.CVT_NoConformidades
                        where a.Id_NoConformidad.Equals(idNocon)
                        select a;
                foreach (var r in t)
                {

                    r.Estado = Estado;
                    r.FechaCierre = DateTime.Now;

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

        public string BuscaEstado(int idNConformidad)
        {
            string res = "";

            var tem = (from u in DBDESAINT.CVT_NoConformidades
                       where u.Id_NoConformidad.Equals(idNConformidad)
                       select new { u.Estado }).First();
            if (tem != null)
            {
                res = tem.Estado;
            }
            return res;
        }

 

    }



}

