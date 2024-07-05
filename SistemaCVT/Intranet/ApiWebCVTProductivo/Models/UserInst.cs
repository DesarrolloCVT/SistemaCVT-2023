using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ApiWebCVTProductivo.Models
{
    public class UserInst
    {
        [Required(ErrorMessage = "Nombre obligatorio")]
        public string Nombre { get; set; }

        [Required(ErrorMessage = "Apellido obligatorio")]
        public string Apellido { get; set; }
    }
}