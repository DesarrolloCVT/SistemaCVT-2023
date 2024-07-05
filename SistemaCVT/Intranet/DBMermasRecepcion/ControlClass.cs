using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBMermasRecepcion
{
    public class ControlClass
    {
        DBMLCVTDESAINTDataContext DBDESAINT = new DBMLCVTDESAINTDataContext();
        DBMLCVTWMSMETRODataContext DBWMSMMETRO = new DBMLCVTWMSMETRODataContext();
        public ControlClass()
        {
        }
        public bool InsertaJustificacion(int IdControl, int UsuarioJust, string Justificacion)
        {
            bool ret = false;
            try
            {
                var temp = (from c in DBDESAINT.CVT_ControlBodega
                            where c.Control_Id.Equals(IdControl)
                            select c).FirstOrDefault();
                temp.Staff_Id_Justificacion = UsuarioJust;
                temp.Justificacion = Justificacion;
                temp.Fecha_Justificacion = DateTime.Now;
                temp.Justificado = true;
                DBDESAINT.SubmitChanges();
            }
            catch (Exception)
            {
                
                
            }
            return ret;
        }
        public int ObtieneUbicacionDefecto(int siteid, int tipo)
        {
            int ret = 0;
            try
            {
                var temp = (from d in DBDESAINT.CVT_UbicacionDefecto
                            where d.Site_Id.Equals(siteid) && d.Tipo.Equals(tipo)
                            select new { d.Layout_Id }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToInt32(temp.Layout_Id);
            }
            catch (Exception)
            {
                
                
            }
            return ret;
        }
        public int ObtieneSMMUbicacionDefecto(int siteid)
        {
            int ret = 0;
            try
            {
                var temp = (from d in DBWMSMMETRO.SMM_Layout
                            where d.Site_Id.Equals(siteid) && d.UbicacionxDefecto.Equals("Y")
                            select new { d.Layout_Id }).FirstOrDefault();
                if (temp != null)
                    ret = Convert.ToInt32(temp.Layout_Id);
            }
            catch (Exception)
            {


            }
            return ret;
        }
    }
}
