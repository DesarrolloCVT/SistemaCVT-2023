using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace DBMermasRecepcion
{
    public class TorniqueteClass
    {
        public TorniqueteClass()
        {

        }
        //DBControlAccesoDataContext DBControlAcceso = new DBControlAccesoDataContext();
        DBMLCVTControlBIODataContext DbBio = new DBMLCVTControlBIODataContext();
        public DataTable ObtieneInformeTorniquete(int Empresa, DateTime fdesde, DateTime fhasta, string area, string rut)
        {
            DataTable ret = new DataTable();
            try
            {
               // ret = Utilidades.LINQToDataTable(DBControlAcceso.CVT_Informe_Torniquete_Valorizado(Empresa, fdesde, fhasta, area, rut));
            }
            catch
            {

            }
            return ret;
        }

        
        public string TraeNombrepersonal2(string runp)
        {
            string res = "";
            try
            {
                var temp = (from u in DbBio.pers_person
                            where u.pin.Equals(runp)
                            select new { u.name }).First();
                if (temp != null)
                {
                    res = temp.name;
                }
            }
            catch { }
            return res;

        }

       
        public string TraeApellidoPersonal2(string runp)
        {
            string res = "";
            try
            {
                var temp = (from u in DbBio.pers_person
                            where u.pin.Equals(runp)
                            select new { u.last_name }).First();
                if (temp != null)
                {
                    res = temp.last_name;
                }
            }
            catch { }
            return res;

        }
    }
}
