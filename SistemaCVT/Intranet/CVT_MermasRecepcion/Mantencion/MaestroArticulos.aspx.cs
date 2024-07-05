using DBMermasRecepcion;
using System;

namespace CVT_MermasRecepcion.Mantencion
{
    public partial class MaestroArticulos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 35, "Ingreso");
            }
        }

        //protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        //{
        //    LogClass vLog = new LogClass();
        //    vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 35, "Boton");
        //    GvDatos.AddNewRow();
        //}

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    LogClass vLog = new LogClass();
        //    vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 35, "Boton");
        //    DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //    this.ASPxGridViewExporter1.FileName = "Maestro Articulos Mantencion "+DateTime.Now.ToShortDateString();
        //    this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        //}

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["Articulo_Stock"] = 0;
            e.NewValues["Tipo_Articulo"] = "M";
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Maestro Articulos Mantencion " + DateTime.Now.ToShortDateString();
            }
        }
    }
}