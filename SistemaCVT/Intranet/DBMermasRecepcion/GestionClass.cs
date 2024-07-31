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
        DBMLCVTDESAINTDataContext DBDESAINT = new DBMLCVTDESAINTDataContext();
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
        public bool CierreFallaGrua(int Id,
            int UsuarioId)
        {
            bool ret = false;
            try
            {
                IQueryable<CVT_RegistroFallaGruas> queryable = from t in this.DBDESAINT.CVT_RegistroFallaGruas
                                                               where t.RFG_ID == Id
                                                         select t;
                foreach (CVT_RegistroFallaGruas td in queryable)
                {

                    td.FechaCierre=DateTime.Now;
                    td.UsuarioCierre=UsuarioId;
                }
                this.DBDESAINT.SubmitChanges();
                ret=true;

            }
            catch
            {

            }
            return ret;
        }
    }
}
