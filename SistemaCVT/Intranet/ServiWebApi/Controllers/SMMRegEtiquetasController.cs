using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DBMermasRecepcion;

namespace ServiWebApi.Controllers
{
    public class SMMRegEtiquetasController : ApiController
    {
        DBMLCVTWMSMETRODataContext wmsM = new DBMLCVTWMSMETRODataContext();
        [HttpGet]

        public string InsertaRegImpEtiq(string codProd)
        {
            string ret = "0";
            try
            {
                SMM_RegImpEtiqueta vReg = new SMM_RegImpEtiqueta();

                vReg.CodProd = codProd;
                vReg.FechRegistro = DateTime.Now;
                vReg.Estado = 1;
                wmsM.SMM_RegImpEtiqueta.InsertOnSubmit(vReg);
                wmsM.SubmitChanges();

                return ret;

            }
            catch(Exception ex)
            {
                 ret = ex.Message;

            }
            return ret;
        }

        [HttpGet]
        public string InsertaRegPallSala(string codProd,string DetProd,int cantidad, string fVenci)
        {
            string ret = "0";
            try
            {
                SMM_RegPalletSala vReg = new SMM_RegPalletSala();

                vReg.CodProducto = codProd;
                vReg.DetProducto = DetProd;
                vReg.Cantidad = cantidad;
                vReg.FechaVenc =Convert.ToDateTime(fVenci);
                vReg.Estado = 1;

                wmsM.SMM_RegPalletSala.InsertOnSubmit(vReg);
                wmsM.SubmitChanges();

                return ret;

            }
            catch (Exception ex)
            {
                ret = ex.Message;

            }
            return ret;
        }
    }
}