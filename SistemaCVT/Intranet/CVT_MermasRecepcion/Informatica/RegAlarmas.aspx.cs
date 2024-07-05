using System;

namespace CVT_MermasRecepcion.Informatica
{
    public partial class RegAlarmas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {

            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                Session["idAlarma"] = e.KeyValue;
                Response.Redirect("~/Informatica/RegAlarmasDetalle.aspx");
            }
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Registro alarmas";
            }
        }
    }
}