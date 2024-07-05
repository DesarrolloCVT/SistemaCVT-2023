using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Transporte
{
    public partial class RevisionCamionFactura : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GvDatos.DataBind();
        }

        protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        {
            GvDatos.AddNewRow();

        }

        protected void cmdVolver_Click(object sender, ImageClickEventArgs e)
        {

            ServiciosClass sV = new ServiciosClass();
            Session["FechaCrea"] = sV.BuscaFechaCreacion(Convert.ToInt32(Session["Id_RevisionCamion"]));
            Response.Redirect("~/Transporte/RevisionCamiones.aspx");

        }

        protected void GvDatos_RowInserting1(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            //int id = Convert.ToInt32(Session["Id_RevisionCamion"]);
            e.NewValues["Id_RevisionCamion"] = Session["Id_RevisionCamion"];
            GvDatos.DataBind();
        }

    }
}