using System;

namespace CVT_MermasRecepcion.Mayorista
{
    public partial class SMMDiferenciaInventario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GvDuplicados_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDuplicados.SettingsExport.FileName = "Duplicados";
            }
        }

        protected void GvCantidad_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvCantidad.SettingsExport.FileName = "Diferencia por Cantidad";
            }
        }

    }
}