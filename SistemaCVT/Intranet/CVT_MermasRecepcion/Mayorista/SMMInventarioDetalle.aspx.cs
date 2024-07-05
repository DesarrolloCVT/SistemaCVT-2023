 using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Mayorista
{
    public partial class SMMInventarioDetalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Inventario_" + Session["Inventario_Id"].ToString();
            }
        }

        protected void cmdVolver_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/Mayorista/SMMInventario.aspx");
        }

        protected void GvDatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 245, "Elimina Registro");
        }

        protected void GvDatos_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 245, "Actualiza Registro");
        }
    }
}