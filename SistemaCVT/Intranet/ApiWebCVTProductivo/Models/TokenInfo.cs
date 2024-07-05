using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;


namespace ApiWebCVTProductivo.Models
{
    public class TokenInfo
    {
        public int IdUser { get; set; }
        public string nombre { get; set; }
        public string nombreUser { get; set; }


        public List<TokenInfo> GetTokenInfo(HttpRequestMessage request)
        {

            string token = ValidaToken(request);
            List<TokenInfo> ls = new List<TokenInfo>();
            var tokeninf = token;
            var handler = new System.IdentityModel.Tokens.Jwt.JwtSecurityTokenHandler();
            var jwtSecurityToken = handler.ReadJwtToken(tokeninf);


            var idU = jwtSecurityToken.Claims.First(claim => claim.Type == "nameid").Value;
            var nomb = jwtSecurityToken.Claims.First(claim => claim.Type == "nombre").Value;
            var nomUser = jwtSecurityToken.Claims.First(claim => claim.Type == "Usuario").Value;

            TokenInfo tk = new TokenInfo();

            // Id del Usuario en el Sistema de Información (BD)
            tk.IdUser = Convert.ToInt32(idU);
            tk.nombre = nomb;
            tk.nombreUser = nomUser;

            ls.Add(tk);
            return ls;
        }

        private string ValidaToken(HttpRequestMessage request)
        {
            string token1 = "";
            ;

            foreach (var item in request.Headers)
            {
                if (item.Key.Equals("Authorization"))
                {
                    token1 = item.Value.First();
                }
            }
            return token1;
        }
    }
}