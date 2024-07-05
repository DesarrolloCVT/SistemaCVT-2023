using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace DBMermasRecepcion
{
    public class TransporteClass
    {
        DBMLCVTDESAINTDataContext DBDESAINT = new DBMLCVTDESAINTDataContext();
        public TransporteClass()
        { }


        public DataTable SP_GastoCamion(DateTime fini, DateTime fter)

        {
            DataTable ret = new DataTable();
            try
            {
                DBDESAINT.CommandTimeout = 6000;
                ret = Utilidades.LINQToDataTable(DBDESAINT.SP_GastosCamion(fini, fter));
            }
            catch (Exception)
            {

            }
            return ret;
        }

        public int InsertaRegistoCargaUrea(CVT_RegistroCargaUrea nuevo)
        {
            int ret = 0;
            try
            {
                DBDESAINT.CVT_RegistroCargaUrea.InsertOnSubmit(nuevo);
                DBDESAINT.SubmitChanges();
                ret =nuevo.Id_CargaUrea;

            }
            catch
            {


            }
            return ret;
        }

        public int TraeCostoLitro()
        {
            int ret = 0;
            try
            {
                var temp = (from p in DBDESAINT.VW_Reg_CompraUrea_UltimoPrecioLitro                           
                            select new { p.PrecioLitro }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToInt32(temp.PrecioLitro);
            }
            catch
            {
            }
            return ret;
        }
    }
}
