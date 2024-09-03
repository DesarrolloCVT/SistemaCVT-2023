using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Porteria
{
    public partial class ProveedoresNacionales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GvProveedoresNacionales_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdSalida")
            {
                ControlAccesoClass vControl = new ControlAccesoClass();
                vControl.IngresaHoraSalidaProvNac(Convert.ToInt32(e.KeyValue));
                GvProveedoresNacionales.DataBind();
            }
        }

        protected void GvProveedoresNacionales_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["FechaIngreso"] = DateTime.Now;
            e.NewValues["Usuario"]= Session["CIDUsuario"].ToString();
        }

        protected void GvProveedoresNacionales_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != DevExpress.Web.GridViewRowType.Data) return;
            if (e.GetValue("FechaSalida") != null)
            {
                System.Web.UI.WebControls.ImageButton imgSalida = GvProveedoresNacionales.FindRowCellTemplateControl(e.VisibleIndex, null, "Salida") as System.Web.UI.WebControls.ImageButton;
                imgSalida.Visible = false;
            }
        }
    }
}