using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBMermasRecepcion
{
   public  class RendicionClass
    {
        DBMLCVTDESAINTDataContext DBDESAINT = new DBMLCVTDESAINTDataContext();
        DBMLCVTControlBIODataContext Bio = new DBMLCVTControlBIODataContext();
        public RendicionClass() { }

        public bool AgregaDatosArchivo(string  Ruta, string Ext,string NomDoc,int idDet)
        {
            bool ret = false;

            try
            {
                var t = from a in DBDESAINT.CVT_RendicionCostos_Detalle
                        where a.ID_Det_Rendi.Equals(idDet)
                        select a;
                foreach (var r in t)
                {

                    r.RutaDoc=Ruta;
                    r.ExtencionDoc = Ext;
                    r.NombreDoc = NomDoc;
                    //DBDESAINT.CVT_DetalleNoConformidad.InsertOnSubmit(vEditado);
                    DBDESAINT.SubmitChanges();
                }
                ret = true;
            }
            catch (Exception)
            {


            }
            return ret;
        }

        public string TraeRutaArchivo(int idDetRend)
        {
            string ret = "";
            try
            {
                var temp = (from u in DBDESAINT.CVT_RendicionCostos_Detalle
                            where u.ID_Det_Rendi.Equals(idDetRend)
                            select new { u.RutaDoc }).First();
                if (temp != null)
                {
                    ret = Convert.ToString(temp.RutaDoc);
                }
            }
            catch { }
            return ret;
        }

        public string TraeNumDocumento(int idDetRend)
        {
            string ret = "";
            try
            {
                var temp = (from u in DBDESAINT.CVT_RendicionCostos_Detalle
                            where u.ID_Det_Rendi.Equals(idDetRend)
                            select new { u.Comprobante }).First();
                if (temp != null)
                {
                    ret = Convert.ToString(temp.Comprobante);
                }
            }
            catch { }
            return ret;
        }

    }
}
