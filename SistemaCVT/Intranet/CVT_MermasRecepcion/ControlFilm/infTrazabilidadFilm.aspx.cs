using System;

namespace CVT_MermasRecepcion.ControlFilm
{
    public partial class infTrazabilidadFilm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GvDetMov_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDetMov.SettingsExport.FileName = "Trazabilidad Film -" + txt_pallet.Text;
            }
        }
    }
}