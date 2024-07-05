using DBMermasRecepcion;
using System;

namespace CVT_MermasRecepcion.Inventario
{
    public partial class InventarioResumenUsuarioProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 70, "Ingreso");
            }
        }

        protected void ASPxGridView1_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                ASPxGridView1.SettingsExport.FileName = "Resumen Inventario Usuario Prodructo";
            }
        }
    }
}