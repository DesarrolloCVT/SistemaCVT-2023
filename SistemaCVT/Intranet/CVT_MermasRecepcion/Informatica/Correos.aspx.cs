using DBMermasRecepcion;
using System;

namespace CVT_MermasRecepcion.Informatica
{
    public partial class Correos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Gvdatos.DataBind();
        }

        protected void Gvdatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                Gvdatos.SettingsExport.FileName = "Correos";
            }
        }

        protected void Gvdatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 169, "Elimina Registro");
        }

        protected void Gvdatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 169, "Crea Registro");
        }

        protected void Gvdatos_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 169, "Actualiza Registro");
        }
    }
}