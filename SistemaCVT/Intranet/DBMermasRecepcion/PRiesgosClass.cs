using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBMermasRecepcion
{
     public  class PRiesgosClass
    {
        DBMLCVTDESAINTDataContext DbDesait = new DBMLCVTDESAINTDataContext();

        #region PTS
        public int CuentaCantRegPTS()
        {
            int ret = 0;
            try
            {
                var temp = (from s in DbDesait.CVT_PermisoTrabajoSeguro                          
                            select s.Id_Pts).Max();
                ret = Convert.ToInt32(temp) + 1;
            }
            catch (Exception ex)
            {
                /* string ms = ex.Message*/
                ;
            }
            return ret;
        }

        public bool InsertaRegistroRutaArchivoPTS(CVT_PermisoTrabajoSeguro_PTS nuevo)
        {
            bool ret = false;
            try
            {
                DbDesait.CVT_PermisoTrabajoSeguro_PTS.InsertOnSubmit(nuevo);
                DbDesait.SubmitChanges();
            }
            catch
            {


            }
            return ret;
        }

        public string BuscaNombreArchivoPTS(int idArch)
        {
            string res = "";

            try
            {

                var tem = (from u in DbDesait.CVT_PermisoTrabajoSeguro_PTS
                           where u.ID_Archivo.Equals(idArch)
                           select new { u.NombreArchivo }).First();
                if (tem != null)
                {
                    res = tem.NombreArchivo;
                }
            }
            catch (Exception)
            {

                return res;
            }

            return res;
        }
        public int BuscaIDPTArch(int idPts)
        {
            int res = 0;
            try
            {
                var tem = (from u in DbDesait.CVT_PermisoTrabajoSeguro_PTS
                           where u.Id_Pts.Equals(idPts)
                           select new { u.ID_Archivo }).First();
                if (tem != null)
                {
                    res = tem.ID_Archivo;
                }
            }
            catch (Exception)
            {

               return res;
            }
           
            return res;
        }
        public int InsertaPreReg(CVT_PermisoTrabajoSeguro nuevo)
        {
            int ret = 0;
            try
            {
                DbDesait.CVT_PermisoTrabajoSeguro.InsertOnSubmit(nuevo);
                DbDesait.SubmitChanges();
                ret = nuevo.Id_Pts;

            }
            catch(Exception ex)
            {
                string ms = ex.Message;

            }
            return ret;

        }

        public bool eliminaNuevoPermiso(int IdPermiso)
        {
            bool ret = false;
            try
            {

                //List<CVT_Tickets_Respuesta> dt = new List<CVT_Tickets_Respuesta>();
                var dt = (from tr in DbDesait.CVT_PermisoTrabajoSeguro
                          where tr.Id_Pts.Equals(IdPermiso)
                          select tr);/*.ToList<CVT_Tickets_Respuesta>();*/
                foreach (var n in dt)
                {
                    //if (n.Id_Ticket == IdTicket)
                    //{
                    DbDesait.CVT_PermisoTrabajoSeguro.DeleteOnSubmit(n);
                    //DBDESAINT.CVT_DetalleNoConformidad.InsertOnSubmit(vEditado);
                    DbDesait.SubmitChanges();
                    //}
                    return true;
                }
                ret = true;

            }
            catch (Exception)
            {


            }
            return ret;
        }
        public bool eliminaRegArchPTS(int idArch)
        {
            bool ret = false;
            try
            {

                //List<CVT_Tickets_Respuesta> dt = new List<CVT_Tickets_Respuesta>();
                var dt = (from tr in DbDesait.CVT_PermisoTrabajoSeguro_PTS
                          where tr.ID_Archivo.Equals(idArch)
                          select tr);/*.ToList<CVT_Tickets_Respuesta>();*/
                foreach (var n in dt)
                {
                    //if (n.Id_Ticket == IdTicket)
                    //{
                    DbDesait.CVT_PermisoTrabajoSeguro_PTS.DeleteOnSubmit(n);
                    //DBDESAINT.CVT_DetalleNoConformidad.InsertOnSubmit(vEditado);
                    DbDesait.SubmitChanges();
                    //}
                    return true;
                }
                ret = true;

            }
            catch (Exception)
            {


            }
            return ret;
        }

        public bool RegistraDatosPTS(string Emp, string AreTrabajo, string Tarea, string Responsable, string TipoTrabaj,DateTime FeInicio,DateTime FeTermino,string Estado,string Comentarios,int idPts)
        {
            bool ret = false;

            try
            {
                var t = from a in DbDesait.CVT_PermisoTrabajoSeguro
                        where a.Id_Pts.Equals(idPts)
                        select a;
                foreach (var r in t)
                {

                    r.Empresa = Emp;
                    r.AreaTrabajo = AreTrabajo;
                    r.Tarea = Tarea;
                    r.Responsable = Responsable;
                    r.TipoTrabajo = TipoTrabaj;
                    r.FechaInicio = FeInicio;
                    r.FechaTermino = FeTermino;
                    r.Estado = Estado;
                    r.Comentario = Comentarios;
                    //DBDESAINT.CVT_DetalleNoConformidad.InsertOnSubmit(vEditado);
                    DbDesait.SubmitChanges();
                }
                ret = true;
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public string BuscaRutaArchPTS(int idPts)
        {
            string res = "";
            try
            {
                var tem = (from u in DbDesait.CVT_PermisoTrabajoSeguro_PTS
                           where u.ID_Archivo.Equals(idPts)
                           select new { u.Ruta }).First();
                if (tem != null)
                {
                    res = tem.Ruta;
                }
            }
            catch (Exception)
            {

                return res;
            }

            return res;
        }

        public string BuscaEstadoPts(int idPts)
        {
            string res = "";
            try
            {
                var tem = (from u in DbDesait.CVT_PermisoTrabajoSeguro
                           where u.Id_Pts.Equals(idPts)
                           select new { u.Estado }).First();
                if (tem != null)
                {
                    res = tem.Estado;
                }
            }
            catch (Exception)
            {

                return res;
            }

            return res;
        }

        public int BuscaIdPts(int idPts)
        {
            int res = 0;
            try
            {
                var tem = (from u in DbDesait.CVT_PermisoTrabajoSeguro
                           where u.Id_Pts.Equals(idPts)
                           select new { u.Id_Pts }).First();
                if (tem != null)
                {
                    res = tem.Id_Pts;
                }
            }
            catch (Exception)
            {

                return res;
            }

            return res;
        }
        #endregion

        #region AST
        public int TraeCantAST(int idPTS)
        {
            int ret = 0;
            try
            {
                var temp = (from s in DbDesait.CVT_PermisoTrabajoSeguro_AST
                            where s.Id_Pts.Equals(idPTS)
                            select s.Id_Ast).Count();

                ret = Convert.ToInt32(temp) + 1;

            }
            catch (Exception ex)
            {
                /* string ms = ex.Message*/
                ;
            }
            return ret;
        }

        public int InsertaRegistroRutaArchivoAST(CVT_PermisoTrabajoSeguro_AST nuevo)
        {
            int ret = 0;
            try
            {
                DbDesait.CVT_PermisoTrabajoSeguro_AST.InsertOnSubmit(nuevo);
                DbDesait.SubmitChanges();
                ret = nuevo.Id_Ast;
            }
            catch(Exception ex)
            {
                string err = ex.Message;

            }
            return ret;
        }

        public string BuscaRutaArchAST(int idAST)
        {
            string res = "";
            try
            {
                var tem = (from u in DbDesait.CVT_PermisoTrabajoSeguro_AST
                           where u.Id_Ast.Equals(idAST)
                           select new { u.UrlAst }).First();
                if (tem != null)
                {
                    res = tem.UrlAst;
                }
            }
            catch (Exception)
            {

                return res;
            }

            return res;
        }

        public bool RegistraDatosAST(int idpts, int idast, string Ruta, string nombreArch,int astOrd)
        {
            bool ret = false;

            try
            {
                var t = from a in DbDesait.CVT_PermisoTrabajoSeguro_AST
                        where a.Id_Ast.Equals(idast)
                        select a;
                foreach (var r in t)
                {

                    r.Id_Pts = idpts;
                    r.UrlAst = Ruta;
                    r.NombreArchivo = nombreArch;
                    r.ASTOrder = astOrd;
                    //r. = Responsable;
                    //r.TipoTrabajo = TipoTrabaj;
                    //r.FechaInicio = FeInicio;
                    //r.FechaTermino = FeTermino;
                    //r.Estado = Estado;
                    //r.Comentario = Comentarios;
                    //DBDESAINT.CVT_DetalleNoConformidad.InsertOnSubmit(vEditado);
                    DbDesait.SubmitChanges();
                }
                ret = true;
            }
            catch (Exception)
            {


            }
            return ret;
        }
       
        #endregion

        public bool ActualizaEstadoPermiso(int IdInsp, string Estado, int verificador)
        {
            bool ret = false;

            try
            {
                var t = from a in DbDesait.CVT_PermisoTrabajoSeguro
                        where a.Id_Pts.Equals(IdInsp)
                        select a;
                foreach (var r in t)
                {

                    r.Estado = Estado;
                    //r.IdVerificador = verificador;
                    //r.FechaVerificacion = DateTime.Now;
                    //DBDESAINT.CVT_DetalleNoConformidad.InsertOnSubmit(vEditado);
                    DbDesait.SubmitChanges();
                }
                ret = true;
            }
            catch (Exception)
            {


            }
            return ret;
        }
    }
}
