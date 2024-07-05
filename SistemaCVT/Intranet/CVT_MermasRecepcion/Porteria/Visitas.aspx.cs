using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBMermasRecepcion;

namespace CVT_MermasRecepcion.Porteria
{
    public partial class Visitas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GvVisita_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdSalida")
            {
                ControlAccesoClass vControl = new ControlAccesoClass();
                vControl.IngresaHoraSalidaVisita(Convert.ToInt32(e.KeyValue));
                GvVisita.DataBind();
            }
        }

        protected void GvVisita_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["FechaEntrada"]=DateTime.Now;
        }

        protected void GvVisita_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != DevExpress.Web.GridViewRowType.Data) return;
            if (e.GetValue("FechaSalida") != null)
            {
                System.Web.UI.WebControls.ImageButton imgSalida = GvVisita.FindRowCellTemplateControl(e.VisibleIndex, null, "Salida") as System.Web.UI.WebControls.ImageButton;
                imgSalida.Visible = false;
            }
        }

        protected void GvVisita_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvVisita.SettingsExport.FileName = "Visitas";
            }
        }
    }
}