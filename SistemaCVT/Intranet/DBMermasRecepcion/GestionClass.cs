using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace DBMermasRecepcion
{
    public class GestionClass
    {
        DBMLCVTSAPDataContext DBSAP = new DBMLCVTSAPDataContext();
        DBMLCVTWMSDataContext DBWMS = new DBMLCVTWMSDataContext();
        public GestionClass()
        {

        }
        public DataTable ObtieneCalculoDescargas(DateTime desde, DateTime hasta)
        {
            DataTable ret = new DataTable();
            try
            {
                ret = Utilidades.LINQToDataTable(DBWMS.SP_CalculoDescargas(desde, hasta));
                
            }
            catch
            {

            }
            return ret;
        }
        public DataTable ObtieneCalculoPedidosCamionPropio(DateTime desde, DateTime hasta)
        {
            DataTable ret = new DataTable();
            try
            {
                ret = Utilidades.LINQToDataTable(DBSAP.SP_CalculoPedidosCamionPropio(desde, hasta));

            }
            catch
            {

            }
            return ret;
        }
        public DataTable ObtieneCalculoPedidosCamionExterno(DateTime desde, DateTime hasta)
        {
            DataTable ret = new DataTable();
            try
            {
                ret = Utilidades.LINQToDataTable(DBSAP.SP_CalculoPedidosCamionExterno(desde, hasta));

            }
            catch
            {

            }
            return ret;
        }
        public DataTable ObtieneCalculoPedidosRetiraCliente(DateTime desde, DateTime hasta)
        {
            DataTable ret = new DataTable();
            try
            {
                ret = Utilidades.LINQToDataTable(DBSAP.SP_CalculoPedidosRetiroCliente(desde, hasta));

            }
            catch
            {

            }
            return ret;
        }
    }
}
