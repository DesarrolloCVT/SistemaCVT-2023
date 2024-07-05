using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Calidad
{
    public partial class TipoHallazgos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GvTipoHallazgo.DataBind();
        }

        protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        {
            GvTipoHallazgo.AddNewRow();
        }

        protected void GvTipoHallazgo_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["Id_CategoriaHallazgo"] = Convert.ToInt32(Session["Id_CategoriaHallazgo"]);
        }
    }
}