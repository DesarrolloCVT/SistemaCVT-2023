using DBMermasRecepcion;
using System;

namespace CVT_MermasRecepcion.WMS
{
    public partial class AuditoriaRecepcion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GvDatos_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 18, "Actualiza Registro");

            int key = Convert.ToInt32(e.Keys[0]);
            AuditoriaClass vAudi = new AuditoriaClass();
            int pos = e.NewValues["Posicionamiento"] == null ? 0 : Convert.ToInt32(e.NewValues["Posicionamiento"]);
            int rot = e.NewValues["Rotulado"] == null ? 0 : Convert.ToInt32(e.NewValues["Rotulado"]);
            string comentario = e.NewValues["Comentario"] == null ? string.Empty : e.NewValues["Comentario"].ToString();
            vAudi.ActualizaAuditoria(key, pos, rot, comentario, Session["NombreUsuario"].ToString());
            e.Cancel = true;
            GvDatos.CancelEdit();
            //vAudi.ActualizaAuditoria(key, 
        }
    }
}