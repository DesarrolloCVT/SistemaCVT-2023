using ApiWebCVTProductivo.Models;
using DBMermasRecepcion;
using Microsoft.IdentityModel.JsonWebTokens;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using System.Web.Http;

namespace ApiWebCVTProductivo.Controllers
{
    public class LoginController : ApiController
    {
        // POST: api/Login
        ///<summary>
        /// login to api , return Authorization token, token expires after 2 hours
        ///</summary>
        ///<param name="usuarioLogin">user and password create in CVtrading</param>

        [HttpPost]
        [AllowAnonymous]

        public async Task<IHttpActionResult> LoginAsync(UserLogin usuarioLogin)
        {
            if (usuarioLogin == null)
                return BadRequest("Usuario y Contraseña requeridos.");

            var _userInfo = await AutenticarUsuarioAsync(usuarioLogin.Usuario, usuarioLogin.Password);
            if (_userInfo != null)
            {
                return Ok(new { token = GenerarTokenJWT(_userInfo) });
            }
            else
            {
                return Unauthorized();
            }
        }

        // COMPROBAMOS SI EL USUARIO EXISTE EN LA BASE DE DATOS 


        ////*<returns>list of products</returns>*/
        private async Task<InfoUser> AutenticarUsuarioAsync(string usuario, string password)
        {
            // AQUÍ LA LÓGICA DE AUTENTICACIÓN //

            // Supondremos que el usuario existe en la Base de Datos.
            // Retornamos un objeto del tipo UsuarioInfo, con toda
            // la información del usuario necesaria para el Token.

            int idUser = ValidaUsuario(usuario, password);
            List<CVT_Usuarios> ls = ObtienedetUserIs(idUser);


            if (ls.Count != 0)
            {
                int idU = 0;
                string Nombreus = "";
                string us = "";
                int idPrf = 0;
                string perf = "";

                foreach (var t in ls)
                {
                    idU = t.IdUsuario;
                    Nombreus = t.NombreUsuario;
                    us = t.UsuarioSistema;
                    idPrf = t.IdPerfil;
                    perf = TraeNombrePerfil(idPrf);
                }

                return new InfoUser()
                {
                    // Id del Usuario en el Sistema de Información (BD)
                    IdUser = idU,
                    Nombre = Nombreus,
                    UserName = us,
                    Perfil = perf,


                };
            }
            else { return null; }


            // Supondremos que el usuario NO existe en la Base de Datos.
            // Retornamos NULL.

        }

        // GENERAMOS EL TOKEN CON LA INFORMACIÓN DEL USUARIO
        private string GenerarTokenJWT(InfoUser usuarioInfo)
        {
            // RECUPERAMOS LAS VARIABLES DE CONFIGURACIÓN
            var _ClaveSecreta = ConfigurationManager.AppSettings["ClaveSecreta"];
            var _Issuer = ConfigurationManager.AppSettings["Issuer"];
            var _Audience = ConfigurationManager.AppSettings["Audience"];
            if (!Int32.TryParse(ConfigurationManager.AppSettings["Expires"], out int _Expires))
                _Expires = 24;


            // CREAMOS EL HEADER //
            var _symmetricSecurityKey = new SymmetricSecurityKey(
                    Encoding.UTF8.GetBytes(_ClaveSecreta));
            var _signingCredentials = new SigningCredentials(
                    _symmetricSecurityKey, SecurityAlgorithms.HmacSha256
                );
            var _Header = new System.IdentityModel.Tokens.Jwt.JwtHeader(_signingCredentials);

            // CREAMOS LOS CLAIMS //
            var _Claims = new[] {
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                new Claim(JwtRegisteredClaimNames.NameId, usuarioInfo.IdUser.ToString()),
                new Claim("nombre", usuarioInfo.Nombre),
                new Claim("Usuario", usuarioInfo.UserName),
                new Claim("Perfil", usuarioInfo.Perfil.ToString()),
            };

            // CREAMOS EL PAYLOAD //
            var _Payload = new System.IdentityModel.Tokens.Jwt.JwtPayload(
                    issuer: _Issuer,
                    audience: _Audience,
                    claims: _Claims,
                    notBefore: DateTime.UtcNow,
                    // Exipra a la 2 horas.
                    expires: DateTime.UtcNow.AddHours(_Expires)
                );

            // GENERAMOS EL TOKEN //
            var _Token = new System.IdentityModel.Tokens.Jwt.JwtSecurityToken(
                    _Header,
                    _Payload
                );

            return new System.IdentityModel.Tokens.Jwt.JwtSecurityTokenHandler().WriteToken(_Token);
        }

        private int ValidaUsuario(string usuario, string pass)
        {
            DBMLCVTDESAINTDataContext dbDsa = new DBMLCVTDESAINTDataContext();

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

        private List<CVT_Usuarios> ObtienedetUserIs(int idUser)
        {
            DBMLCVTDESAINTDataContext dbDsa = new DBMLCVTDESAINTDataContext();
            List<CVT_Usuarios> ret = new List<CVT_Usuarios>();
            try
            {
                ret = (from u in dbDsa.CVT_Usuarios
                       where u.IdUsuario.Equals(idUser)
                       select u).ToList<CVT_Usuarios>();
            }
            catch { }
            return ret;
        }

        private string TraeNombrePerfil(int IdPer)
        {
            DBMLCVTDESAINTDataContext dbDsa = new DBMLCVTDESAINTDataContext();
            string ret = "";
            try
            {
                var temp = (from c in dbDsa.CVT_PerfilUsuario
                            where c.IdPerfil.Equals(IdPer)
                            select new { c.Nombre_Perfil }).FirstOrDefault();
                if (temp != null)
                {
                    ret = Convert.ToString(temp.Nombre_Perfil);
                }
            }
            catch (Exception)
            {


            }
            return ret;
        }
    }
}