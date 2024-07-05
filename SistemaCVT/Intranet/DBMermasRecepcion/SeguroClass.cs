using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace DBMermasRecepcion
{
   public class SeguroClass
    {
        public SeguroClass() { }
        DBMLCVTDESAINTDataContext DBDesaint = new DBMLCVTDESAINTDataContext();

        public int BuscaIdTipoSeguro(string nomPol)
        {
            int ret = 0;
            try
            {
                var temp = (from u in DBDesaint.CVT_Seguro
                            where u.Poliza.Equals(nomPol)                                 
                            select new { u.IdTipoSeguro }).First();
                if (temp != null)
                {
                    ret =Convert.ToInt32(temp.IdTipoSeguro);
                }
            }
            catch { }
            return ret;
        }

        public DataTable SP_ListadoSeguros()

        {
            DataTable ret = new DataTable();
            try
            {
                DBDesaint.CommandTimeout = 6000;
              ret = Utilidades.LINQToDataTable(DBDesaint.CVT_ListadoSeguros());
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public bool InsertaNuevoDetalleSeguo(CVT_Seguro_Detalle nuevo)
        {
            bool ret = false;
            try
            {
                DBDesaint.CVT_Seguro_Detalle.InsertOnSubmit(nuevo);
                DBDesaint.SubmitChanges();
                ret = true;

            }
            catch
            {


            }
            return ret;
        }
    }
}
