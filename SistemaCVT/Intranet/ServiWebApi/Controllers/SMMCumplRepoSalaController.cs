using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ServiWebApi.Controllers
{
    public class SMMCumplRepoSalaController : ApiController
    {
        DBMLCVTWMSMETRODataContext wmsM = new DBMLCVTWMSMETRODataContext();
        DBMLCVTMMETRODataContext DBMmetro = new DBMLCVTMMETRODataContext();

        [HttpGet]
        public string InsertaRegistroControlReposicion(int idNVerificado, int Verificador, string CodProd, string CodBar, string dispo, string limp, string fefo, string fleje, string fechVenc)
        {
            String ret = "";
            try
            {
                SMM_Cump_Reposicion_Sala vCum = new SMM_Cump_Reposicion_Sala();

                vCum.FechaRegistro = DateTime.Now;
                vCum.IdNomVerificado =idNVerificado;
                vCum.IdVerificador = Verificador;
                vCum.CodBarra = CodBar;
                vCum.CodProducto = CodProd;
                vCum.DispoProducto = dispo;
                vCum.Limpieza = limp;
                vCum.FeFo = fefo;
                vCum.Fleje = fleje;
                vCum.FechaVencProd = Convert.ToDateTime(fechVenc);
                wmsM.SMM_Cump_Reposicion_Sala.InsertOnSubmit(vCum);
                wmsM.SubmitChanges();
                ret = "0";

            }
            catch(Exception ex)
            {
                ret = ex.Message;

            }
            return ret;
        }

        [HttpGet]
        public IEnumerable<SMM_Reponedores> ListaReponedoresSMM()
        {
            var ListaReponedores = wmsM.SMM_Reponedores.ToList();
            return ListaReponedores;
        }
    }
}