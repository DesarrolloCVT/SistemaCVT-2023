using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Calidad
{
    public partial class CategoriaHallazgo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        {
            GvCategoriaHallazgo.AddNewRow();
            GvCategoriaHallazgo.DataBind();
        }

        protected void GvCategoriaHallazgo_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                Session["Id_CategoriaHallazgo"] = e.KeyValue;
                Response.Redirect("~/Calidad/TipoHallazgos.aspx");
            }
        }
    }
}