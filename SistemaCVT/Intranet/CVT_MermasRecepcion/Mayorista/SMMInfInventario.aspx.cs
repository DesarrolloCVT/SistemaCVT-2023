using System;

namespace CVT_MermasRecepcion.Mayorista
{
    public partial class SMMInfInventario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {

        }

        protected void GvDatos1_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export1"))
            {
                GvDatos1.SettingsExport.FileName = "informe por Usuario";
            }
        }

        protected void gvdatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                gvdatos.SettingsExport.FileName = "informe por Bodega y Producto";
            }
        }
    }
}