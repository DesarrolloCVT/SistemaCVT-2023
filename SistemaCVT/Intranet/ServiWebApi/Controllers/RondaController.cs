using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DBMermasRecepcion;

namespace ServiWebApi.Controllers
{
    public class RondaController : ApiController
    {
        DBMLCVTDESAINTDataContext dbDsa = new DBMLCVTDESAINTDataContext();

        [HttpGet]
        public bool InsertaRegistroRonda(DateTime Fecha, string Usuario, string Ubicacion, int Punto)
        {
            bool ret = false;
            try
            {
                CVT_Ronda_Registro vNuevo=new CVT_Ronda_Registro();
                vNuevo.Fecha=Fecha;
                vNuevo.Usuario=Usuario;
                vNuevo.URL_Ubicacion=Ubicacion;
                vNuevo.Punto=Punto;
                dbDsa.CVT_Ronda_Registro.InsertOnSubmit(vNuevo);
                dbDsa.SubmitChanges();
                ret = true;
            }
            catch (Exception ex)
            {
                ret = false;
            }
            return ret;
        }
    }
}