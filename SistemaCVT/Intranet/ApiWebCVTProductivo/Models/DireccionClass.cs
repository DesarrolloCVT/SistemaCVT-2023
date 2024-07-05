using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApiWebCVTProductivo.Models
{
    public class DireccionClass
    {             
        public string CodCliente { get; set; }   
        public string Direccion { get; set; }
        public string Comuna { get; set; }
        public string Ciudad { get; set; }
        public int Region { get; set; }
      
    }
}