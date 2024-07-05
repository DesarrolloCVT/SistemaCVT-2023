using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Porteria
{
    public partial class LibroNovedades : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void GvLibroNovedades_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvLibroNovedades.SettingsExport.FileName = "LibroNovedades";
            }
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Nuevo"))
            {
                GvLibroNovedades.AddNewRow();
            }
        }

        protected void GvLibroNovedades_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["Usuario_Id"] = Convert.ToInt32(Session["IDCVTUsuario"]);
            e.NewValues["Fecha"]=DateTime.Now;
        }
    }
}