using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Informatica
{
    public partial class RegAlarmasDetalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["IdContrato"] = Session["idAlarma"];
        }

        protected void Atras_Click(object sender, ImageClickEventArgs e)
        {

            Response.Redirect("RegAlarmas.aspx");
        }
    }
}