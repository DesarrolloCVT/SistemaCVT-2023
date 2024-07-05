using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ServiWebApi.Controllers
{
    public class StockController : ApiController
    {
        DBMLCVTDESAINTDataContext dbDsa = new DBMLCVTDESAINTDataContext();
        DBMLCVTWMSDataContext DBDatos = new DBMLCVTWMSDataContext();

        [HttpGet]
        public DataTable GetFefoStock(int IdBodega, string CodProducto)
        {
            DataTable ret = new DataTable();
            try
            {
                DBDatos.CommandTimeout = 60000;
                ret = Utilidades.LINQToDataTable(DBDatos.SP_FEFOSTOCK_XAMARIN(IdBodega,CodProducto));
            }
            catch (Exception)
            {

            }
            return ret;
        }
    }
}