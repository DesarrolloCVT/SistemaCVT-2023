using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Tesoreria
{
    public partial class RendicionCostos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["FechaRegistro"] = DateTime.Now;
            e.NewValues["IDUsuarioCrea"] = Session["IDCVTUsuario"];
            e.NewValues["FechaCreacion"]= DateTime.Now;

        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                Session["idRendi"] = e.KeyValue;
                Response.Redirect("~/Tesoreria/RendicionCostoDetalle.aspx");
            }
        }
    }
}