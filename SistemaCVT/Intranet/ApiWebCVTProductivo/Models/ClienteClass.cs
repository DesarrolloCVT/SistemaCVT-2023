using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApiWebCVTProductivo.Models
{
    public class ClienteClass
    {
        //public string Codido { get; set; }
        public string Nombre { get; set; }
        //public int GrupoCliente { get; set; }
        public string Rut { get; set; }
        public string Telefono { get; set; }
        public string Email { get; set; }
        public string Direccion { get; set; }
        public string Comuna { get; set; }
        public string Ciudad { get; set; }
        public int Region { get; set; }
        //public string TipoDireccion { get; set; }
        public string Giro { get; set; }
        public int IDVendAsignado { get; set; }
    }
}