using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBMermasRecepcion;

namespace CVT_MermasRecepcion.Insumos
{
    public partial class PlanillaInsumos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GvPlanillaInsumos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                Session["PInsumosId"] = e.KeyValue;
                Response.Redirect("~/Insumos/PlanillaInsumosDetalle.aspx");
            }
        }

        protected void GvPlanillaInsumos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvPlanillaInsumos.SettingsExport.FileName = "Planilla Mensual Insumos";
            }
        }

        protected void GvPlanillaInsumos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            
            e.NewValues["Fecha_Registro"] = DateTime.Now;
            e.NewValues["Usuario_Sistema"] = Convert.ToInt32(Session["IDCVTUsuario"].ToString());

        }
    }
}