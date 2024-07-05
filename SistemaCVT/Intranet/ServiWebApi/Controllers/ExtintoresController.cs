using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ServiWebApi.Controllers
{
    public class ExtintoresController : ApiController
    {
        DBMLCVTDESAINTDataContext dbDsa = new DBMLCVTDESAINTDataContext();
        DBMLCVTWMSDataContext DBWms = new DBMLCVTWMSDataContext();

        [HttpGet]
        public int InsertaNuevoCheck(int Usuario,int NumExtintor,DateTime Vigencia,string UbicaExtintor,int PesoExtintor,string TipoAgente)
        {
            int ret = 0;
            //string lot = Lote.Replace("¡", "+");        

            try
            {
               CVT_REVISION_EXTINTOR rs = new CVT_REVISION_EXTINTOR();

                rs.Id_Usuario = Usuario;
                rs.Fecha_Inspeccion = DateTime.Now;
                rs.NExtintor = NumExtintor;
                rs.VigenciaRecarga = Vigencia;
                rs.Ubicacion = UbicaExtintor;
                rs.PesoExtintor = PesoExtintor;
                rs.TipoAgente = TipoAgente;

                dbDsa.CVT_REVISION_EXTINTOR.InsertOnSubmit(rs);
                dbDsa.SubmitChanges();

                ret = rs.Id_Revision_Extintor;             
            }
            catch
            {


            }
            return ret;
        }

        [HttpGet]
        public int InsertaDetalle(int idExtintor,string resp,string obs,string preg)
        {
            int ret = 0;
            //string lot = Lote.Replace("¡", "+");   
          
            try
            {
                CVT_REVISION_EXTINTOR_DETALLE det = new CVT_REVISION_EXTINTOR_DETALLE();

                det.Id_Revision_Extintor = idExtintor;
                det.Pregunta =preg;
                det.Respuesta = resp;
                det.Observacion = obs;           
                dbDsa.CVT_REVISION_EXTINTOR_DETALLE.InsertOnSubmit(det);
                dbDsa.SubmitChanges();

                ret = det.Id_DetExtintor;
            }
            catch
            {


            }
            return ret;

        }

        [HttpGet]
        public int InsertaEntorno(string pregunta,string respuesta,string observacion,int idRevisionEx)
        {
            int ret = 0;
            //string lot = Lote.Replace("¡", "+");   

            try
            {
                CVT_REVISION_EXTINTOR_ENTORNO en = new CVT_REVISION_EXTINTOR_ENTORNO();

                en.Id_Revision_Extintor = idRevisionEx;
                en.RespuestaEntorno = respuesta;
                en.PreguntaEntorno = pregunta;            
                en.ObservacionEntorno = observacion;
                dbDsa.CVT_REVISION_EXTINTOR_ENTORNO.InsertOnSubmit(en);
                dbDsa.SubmitChanges();

                ret = en.Id_RevisionEntorno;
            }
            catch
            {


            }
            return ret;

        }

        [HttpGet]
        public int InsertaRegistroFosfina( string hora, string FechaFumi, string Bodega, string MayorPP,string A1,string Distancia)
        {
            int ret = 0;
            //string lot = Lote.Replace("¡", "+");   

            try
            {
                CVT_CONTROL_FOSFINA det = new CVT_CONTROL_FOSFINA();

                //  TimeSpan hrIn = TimeSpan.Parse(hora);

             //   DateTime fFug =Convert.ToDateTime(Convert.ToDateTime(FechaFumi).Year + "-" + Convert.ToDateTime(FechaFumi).Month + "-" + Convert.ToDateTime(FechaFumi).Day);
                
                det.FechaReg = DateTime.Today;
                det.Hora = hora;
                det.FechaFumigacion = Convert.ToDateTime(FechaFumi);
                det.Bodega = Bodega;
                det.MayorPPM =Convert.ToDecimal(MayorPP);
                det.A1_A2 = A1;
                det.DistanciaFumigacion = Distancia;

                dbDsa.CVT_CONTROL_FOSFINA.InsertOnSubmit(det);
                dbDsa.SubmitChanges();

                ret = det.IdControlFosfina;
            }
            catch
            {


            }
            return ret;

        }

    }
}