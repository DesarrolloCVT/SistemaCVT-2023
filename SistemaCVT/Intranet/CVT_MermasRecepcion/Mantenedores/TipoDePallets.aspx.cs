using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Mantenedores
{
    public partial class TipoDePallets : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["Supportive_LoadCapacity"] =Convert.ToDecimal(50);
            e.NewValues["Supportive_Height"]=Convert.ToDecimal(100);
            e.NewValues["Supportive_Factor"] =Convert.ToDecimal(1);
            e.NewValues["Supportive_NetWeight"] =Convert.ToDecimal(50);
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Tipo de Pallets";
            }
        }
    }
}