using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Description;
using System.Web.Services.Protocols;
using DBMermasRecepcion;

namespace WSIntranetTest
{
    /// <summary>
    /// Descripción breve de ServiceCVT
    /// </summary>
    [WebService(Namespace = "http://wsintranet.cvt.local/ServiceCVT.asmx")]   
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // Para permitir que se llame a este servicio web desde un script, usando ASP.NET AJAX, quite la marca de comentario de la línea siguiente. 
    //[System.Web.Script.Services.ScriptService]
    public class ServiceCVT : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            string mensaje = "Hola a todos";
            return mensaje;
        }

        [WebMethod]
        public bool AgregaDatos(string nombre, string apellido)
        {
            DBMLCVTDESAINTDataContext DBDESAINT = new DBMLCVTDESAINTDataContext();
            bool ret = false;
            try
            {
                CVT_Test_WSIntranet nuevo = new CVT_Test_WSIntranet();
                nuevo.Nombre = nombre;
                nuevo.Apellido = apellido;        
                DBDESAINT.CVT_Test_WSIntranet.InsertOnSubmit(nuevo);
                DBDESAINT.SubmitChanges();
                ret = true;
            }
            catch (Exception)
            {


            }
            return ret;
           
        }
        [WebMethod]
        public int Suma(int a, int b)
        {
            int sum = 0;
            try {
                return sum = a + b;
            }catch { }
               
            return sum;
        }
    }
}
