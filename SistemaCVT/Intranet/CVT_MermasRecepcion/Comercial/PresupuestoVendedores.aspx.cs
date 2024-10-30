using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Comercial
{
    public partial class PresupuestoVendedores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GVPresupuestoEnc_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                Session["PresupuestoID"] = e.KeyValue;
                Session["SlpCode"] = (int)GVPresupuestoEnc.GetRowValuesByKeyValue(e.KeyValue, "Vendedor");
                Response.Redirect("~/Comercial/PresupuestoDetalle.aspx");
            }
        }
    }
}