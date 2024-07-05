using DBMermasRecepcion;
using System;
namespace CVT_MermasRecepcion.Inventario
{
    public partial class EstadoProductos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 69, "Ingreso");
            }
        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    LogClass vLog = new LogClass();
        //    vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 69, "Boton");
        //    DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //    this.ASPxGridViewExporter1.FileName = "Inventario Estado Producto";
        //    this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        //}

        //protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        //{
        //    LogClass vLog = new LogClass();
        //    vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 69, "Boton");
        //    GvDatos.AddNewRow();
        //}

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 69, "Boton");
                Session["EstProd_ID"] = e.KeyValue;
                Response.Redirect("~/Inventario/EstadoProductoDetalle.aspx");
            }
        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {

        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Inventario Estado Producto";
            }
        }
    }
}