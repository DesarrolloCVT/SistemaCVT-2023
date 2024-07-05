using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ServiWebApi.Controllers
{
    public class ExhibicionSalaSMMController : ApiController
    {

        DBMLCVTWMSMETRODataContext wmsM = new DBMLCVTWMSMETRODataContext();
        DBMLCVTMMETRODataContext DBMmetro = new DBMLCVTMMETRODataContext();
        
        [HttpGet]
        public bool InsertaRegistroExhibicion(string pasillo,int columna,int nivel,string CodBar,string codProd,int CantCaras)
        {
            bool ret = false;
            try
            {
                SMM_ExhibicionSala vEx = new SMM_ExhibicionSala();

                vEx.Pasillo = pasillo;
                vEx.Columna = columna;
                vEx.Nivel = nivel;
                vEx.CodBarra = CodBar;
                vEx.CodProducto = codProd;
                vEx.CantCaras = CantCaras;          
                wmsM.SMM_ExhibicionSala.InsertOnSubmit(vEx);
                wmsM.SubmitChanges();
                ret = true;

            }
            catch
            {
                ret = false;

            }
            return ret;
        }

    }
}