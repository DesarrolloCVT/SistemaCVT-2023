using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;


namespace DBMermasRecepcion
{
    public class UsuarioClass
    {
        DBMLCVTDESAINTDataContext DBDatos = new DBMLCVTDESAINTDataContext();
        public UsuarioClass()
        { }
        public int VerificaUsuario(string nomusu, string contrasena)
        {
            int ret = 0;
            try
            {
                var temp = (from u in DBDatos.CVT_Usuarios
                            where u.UsuarioSistema.Equals(nomusu) &&
                                  u.Clave.Equals(contrasena)
                            select new { u.IdUsuario }).First();
                if (temp != null)
                {
                    ret = temp.IdUsuario;
                }
            }
            catch { }
            return ret;
        }
        public List<CVT_Usuarios> ObtieneUsuariosNotificaciones(int idnotificacion, int usumodifica)
        {
            List<CVT_Usuarios> ret = new List<CVT_Usuarios>();
            try
            {
                ret = ((from u in DBDatos.CVT_Usuarios
                        join nu in DBDatos.CVT_NotificacionesUsuario on u.IdUsuario equals nu.Usuario_Id
                        where nu.Notificacion_Id.Equals(idnotificacion)
                        select u).Union(from u1 in DBDatos.CVT_Usuarios
                                        where u1.IdUsuario.Equals(usumodifica)
                                        select u1)).ToList<CVT_Usuarios>();
            }
            catch
            {
            }
            return ret;

        }
        public List<CVT_Usuarios> ObtieneDatosUsuarioPorID(int CID)
        {
            List<CVT_Usuarios> ret = new List<CVT_Usuarios>();
            try
            {
                ret = (from u in DBDatos.CVT_Usuarios
                       where u.IdUsuario.Equals(CID)
                       select u).ToList<CVT_Usuarios>();
            }
            catch { }
            return ret;
        }

        public int obtenerId(string nomUser)
        {
            int res = 0;

            var tem = (from u in DBDatos.CVT_Usuarios
                       where u.UsuarioSistema.Equals(nomUser)
                       select new { u.IdUsuario }).First();
            if (tem != null)
            {
                res = tem.IdUsuario;
            }
            return res;
        }
        public int VerificaJefeArea(int idUser)
        {
            int res = 0;

            var tem = (from u in DBDatos.CVT_Usuarios
                       where u.IdUsuario.Equals(idUser)
                       select new { u.JefeArea }).First();
            if (tem != null)
            {
                res =Convert.ToInt32(tem.JefeArea);
            }
            return res;
        }

        public String VerificaClave(string idUsu, string contrasena)
        {
            string ret = "";
            try
            {
                var temp = (from u in DBDatos.CVT_Usuarios
                            where u.UsuarioSistema.Equals(idUsu) &&
                                  u.Clave.Equals(contrasena)
                            select new { u.Clave }).First();
                if (temp != null)
                {
                    ret = temp.Clave;
                }
            }
            catch { }
            return ret;
        }

        public void SP_actualizarContrasena(string clave, int idUser)
        {

            try
            {
                DBDatos.CVT_ACTUALIZAR_CLAVE(clave, idUser);
            }
            catch { }

        }

        public void SP_actualizarContrasenaEncriptada(string clave, int idUser)
        {

            try
            {
                DBDatos.CVT_ACTUALIZAR_CLAVE_ENCRIPTADA(clave, idUser);
            }
            catch { }

        }

        public int VerificaUsuarioClaveEncriptada(string nomusu, string contrasena)
        {
            int ret = 0;
            try
            {
                var temp = (from u in DBDatos.CVT_Usuarios
                            where u.UsuarioSistema.Equals(nomusu) &&
                                  u.ClaveEncriptada.Equals(contrasena)
                            select new { u.IdUsuario }).First();
                if (temp != null)
                {
                    ret = temp.IdUsuario;
                }
            }
            catch { }
            return ret;
        }

        public String VerificaClaveEncrip(string idUsu, string contrasena)
        {
            string ret = "";
            try
            {
                var temp = (from u in DBDatos.CVT_Usuarios
                            where u.UsuarioSistema.Equals(idUsu) &&
                                  u.ClaveEncriptada.Equals(contrasena)
                            select new { u.ClaveEncriptada }).First();
                if (temp != null)
                {
                    ret = temp.ClaveEncriptada;
                }
            }
            catch { }
            return ret;

        }      

        public int TraeIdUsuarioVerificador(string nomusu, string contrasena)
        {
            int ret = 0;
            try
            {
                var temp = (from u in DBDatos.CVT_Usuarios
                            where u.UsuarioSistema.Equals(nomusu) &&
                                  u.ClaveEncriptada.Equals(contrasena) && u.Verificador.Equals(1)
                            select new { u.IdUsuario }).First();
                if (temp != null)
                {
                    ret = temp.IdUsuario;
                }
            }
            catch { }
            return ret;
        }
        public string TraeBodegaUsuario(int idUser)
        {
            string ret = "";
            try
            {
                var temp = (from u in DBDatos.CVT_Usuarios
                            where u.IdUsuario.Equals(idUser)
                            select new { u.RestriccionBodega }).First();
                if (temp != null)
                {
                    ret = temp.RestriccionBodega;
                }
            }
            catch { }
            return ret;
        }

        public string TraeNomUsuario(int idUser)
        {
            string ret = "";
            try
            {
                var temp = (from u in DBDatos.CVT_Usuarios
                            where u.IdUsuario.Equals(idUser)
                            select new { u.NombreUsuario }).First();
                if (temp != null)
                {
                    ret = temp.NombreUsuario;
                }
            }
            catch { }
            return ret;
        }

        public int TraeIdArea(int idUser)
        {
            int ret = 0;
            try
            {
                var temp = (from u in DBDatos.CVT_Usuarios
                            where u.IdUsuario.Equals(idUser)
                            select new { u.Id_Area }).First();
                if (temp != null)
                {
                    ret = temp.Id_Area;
                }
            }
            catch { }
            return ret;
        }


        public string idUsuarioVerificador(int idusu)
        {
            string ret ="0";
            try
            {
                var temp = (from u in DBDatos.CVT_Usuarios
                            where u.IdUsuario.Equals(idusu)                                
                            select new { u.Verificador }).First();
                if (temp != null)
                {
                    ret = Convert.ToString(temp.Verificador);
                }
            }
            catch { }
            return ret;
        }
    }
}
