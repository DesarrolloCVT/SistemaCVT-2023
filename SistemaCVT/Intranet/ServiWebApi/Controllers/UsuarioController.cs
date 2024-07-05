using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ServiWebApi.Controllers
{
    public class UsuarioController : ApiController
    {
        DBMLCVTDESAINTDataContext dbDsa = new DBMLCVTDESAINTDataContext();
        DBMLCVTWMSDataContext WMSD = new DBMLCVTWMSDataContext();

        [HttpGet]
        public List<CVT_Test_WSIntranet> GetListUsuario()
        {
            var listadoUser = dbDsa.CVT_Test_WSIntranet.ToList();
            return listadoUser;
        }

        [HttpGet]
        public int GetUsuario(string usuario,string pass)
        {

            LogClass lg = new LogClass();
            string clave = lg.Encrypt(pass, true);
            
            int res = 0;

            var tem = (from u in dbDsa.CVT_Usuarios
                       where u.UsuarioSistema.Equals(usuario) && u.ClaveEncriptada.Equals(clave)
                       select new { u.IdUsuario }).First();
            if (tem != null)
            {
                res = tem.IdUsuario;
            }
            return res;
        }
        [HttpGet]
        public bool PostUsuario(string nombre,string apellido )
        {
            bool ret = false;
            CVT_Test_WSIntranet nu = new CVT_Test_WSIntranet();
            nu.Nombre = nombre;
            nu.Apellido = apellido;
            try
            {            
                dbDsa.CVT_Test_WSIntranet.InsertOnSubmit(nu);
                dbDsa.SubmitChanges();
                ret = true;
            }
            catch
            {

            }
            return ret;
        }

        [HttpGet]
        public List<VW_Usuarios_XAMARIN> ObtienedetUserIs(int idUser)
        {
            List<VW_Usuarios_XAMARIN> ret = new List<VW_Usuarios_XAMARIN>();
            try
            {
                ret = (from u in dbDsa.VW_Usuarios_XAMARIN
                       where u.IdUsuario.Equals(idUser)
                       select u).ToList<VW_Usuarios_XAMARIN>();
            }
            catch { }
            return ret;
        }
        [HttpGet]
        public int ObtieneIdStaff(string usernameWMS)
        {
            int ret = 0;
            try
            {
                var temp = (from s in WMSD.Staff
                            where s.Staff_UserName.Equals(usernameWMS)
                            select new { s.Staff_Id }).FirstOrDefault();
                if (temp != null)
                    ret = temp.Staff_Id;
            }
            catch
            {
                ret = 0;

            }
            return ret;
        }

        [HttpGet]
        public List<VW_MENUXAMARIN> ObtieneMenu(int idPerfilUsuario)
        {
            List<VW_MENUXAMARIN> ret = new List<VW_MENUXAMARIN>();
            try
            {
                ret = (from u in dbDsa.VW_MENUXAMARIN
                       where u.idPerfil.Equals(idPerfilUsuario)
                       select u).ToList<VW_MENUXAMARIN>();
            }
            catch { }
            return ret;
        }
    }
}
