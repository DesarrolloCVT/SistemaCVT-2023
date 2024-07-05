using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DBMermasRecepcion
{
    public class AuditoriaClass
    {
        DBMLCVTDESAINTDataContext DBDatos = new DBMLCVTDESAINTDataContext();
        public AuditoriaClass()
        {
        }
        public bool ActualizaAuditoria(int ID, int posicionamiento, int rotulado, string comentario, string usuario)
        {
            bool ret = false;
            try
            {
                var temp = (from ar in DBDatos.CVT_AuditoriaRecepciones
                           where ar.Id_Auditoria.Equals(ID)
                           select ar).FirstOrDefault();
                temp.Posicionamiento = posicionamiento;
                temp.Rotulado = rotulado;
                temp.Comentario = comentario;
                temp.Usuario=usuario;
                temp.Fecha_Auditoria=DateTime.Now;
                DBDatos.SubmitChanges();
                ret = true;
            }
            catch (Exception)
            {
                
                
            }
            return ret;
        }
    }
}
