using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;

namespace WebApiAndroidCVT.Controllers
{
    [RoutePrefix("api/Usuario")]
    //[Authorize]
    public class UsuariosController : ApiController
    {
        DBMLCVTDESAINTDataContext dbDsa = new DBMLCVTDESAINTDataContext();
        DBMLCVTWMSDataContext WMSD = new DBMLCVTWMSDataContext();

        //[HttpGet]      
        //[Route("ListaUsuarios")]
        //[ApiExplorerSettings(IgnoreApi = true)]
        //public List<CVT_Test_WSIntranet> GetListUsuario()
        //{
        //    var listadoUser = dbDsa.CVT_Test_WSIntranet.ToList();
        //    return listadoUser;
        //}


        [HttpGet]
        [Route("ValidaUsuario/{usuario}/{pass}")]
        public int ValidaIngresoUsuario(string usuario, string pass)
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
    }
}