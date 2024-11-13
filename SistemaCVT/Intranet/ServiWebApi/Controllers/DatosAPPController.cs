using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ServiWebApi.Controllers
{
    public class DatosAPPController : ApiController
    {
        DBMLCVTDESAINTDataContext dbDsa = new DBMLCVTDESAINTDataContext();

        [HttpGet]
        public string ObtieneVersion(int idAPP)
        {
            string ret ="0.0.0";
            try
            {
                var temp = (from l in dbDsa.DatoVersionesAPPXAM
                            where l.id_Version.Equals(idAPP)
                            select new { l.CodVersion }).FirstOrDefault();
                if (temp != null)
                {
                    ret = temp.CodVersion;
                }
            }
            catch (Exception)
            {
                
            }
            return ret;
        }

        [HttpGet]
        [Route("LogUsabilidad")]
        public bool LOGUsabilidad(int idUsuario, int? submenu, string tipoRegistro)
        {
            bool res = false;
            try
            {
                CVT_LogSistema logSis = new CVT_LogSistema();
                logSis.IdUsuario = idUsuario;
                logSis.IdSubMenu = submenu;
                logSis.Tipo = tipoRegistro;
                logSis.Fecha = DateTime.Now;
                dbDsa.CVT_LogSistema.InsertOnSubmit(logSis);
                dbDsa.SubmitChanges();
                res = true;
            }
            catch (Exception)
            {
            }
            return res;
        }

        [HttpGet]
        [Route("RegistroLog")]
        public bool InsertaRegistroLogDesaint(string Entidad, int Entidad_Id
        , string Usuario_Id, string Valor_Antiguo, string Valor_Nuevo)
        {
            bool ret = false;
            try
            {
                LOG_SistemaCVT vNuevo = new LOG_SistemaCVT();
                vNuevo.Entidad = Entidad;
                vNuevo.Entidad_Id = Entidad_Id;
                vNuevo.Fecha = DateTime.Now;
                vNuevo.Usuario_Id = Usuario_Id;
                vNuevo.Valor_Antiguo = Valor_Antiguo;
                vNuevo.Valor_Nuevo = Valor_Nuevo;
                dbDsa.LOG_SistemaCVT.InsertOnSubmit(vNuevo);
                dbDsa.SubmitChanges();
                ret = true;
            }
            catch (Exception)
            {
            }
            return ret;
        }
    }
}