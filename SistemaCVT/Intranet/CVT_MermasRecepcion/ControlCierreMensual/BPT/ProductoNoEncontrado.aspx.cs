using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.ControlCierreMensual.BPT
{
    public partial class ProductoNoEncontrado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Producto No Encontrado";
            }
        }
    }
}