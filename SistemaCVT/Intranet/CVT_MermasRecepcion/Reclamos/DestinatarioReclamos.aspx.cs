using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Reclamos
{
    public partial class DestinatarioReclamos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_NReclamo.Text = Session["idReclamo"].ToString();
        }

        protected void cmdVolver_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Reclamos/RegistroReclamos.aspx");
        }

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["id_Reclamo"]=Session["idReclamo"];
            GvDatosDestiReclamo.DataBind();
        }

        
    }
}