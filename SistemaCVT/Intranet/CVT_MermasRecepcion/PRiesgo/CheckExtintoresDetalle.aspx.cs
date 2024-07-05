using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.PRiesgo
{
    public partial class CheckExtintoresDetalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {

        }

        protected void Atras_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/PRiesgo/CheckExtintores.aspx");
        }
    }
}