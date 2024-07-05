using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.MayoristaOP
{
    public partial class SMMSolicitudTransferenciaDetalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cmdVolver_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/MayoristaOP/SMMSolicitudTransferencia.aspx");
        }

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["Id_Solicitud"] = Session["solicitudID"];
        }
    }
}