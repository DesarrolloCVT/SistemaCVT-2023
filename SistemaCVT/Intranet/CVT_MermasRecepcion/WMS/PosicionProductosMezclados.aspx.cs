using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.WMS
{
    public partial class PosicionProductosMezclados : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //    this.ASPxGridViewExporter1.FileName = "Posicion Productos Mezclados";
        //    Options.SheetName = this.ASPxGridViewExporter1.FileName;
        //    this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        //}

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                try
                {
                    Session["LayoutId"] = e.KeyValue;
                    GvDatos0.DataBind();
                    ASPxPopupControl1.ShowOnPageLoad = true;
                }
                catch
                {
                }
            }
        }
        protected void cmdExcel1_Click(object sender, ImageClickEventArgs e)
        {
            DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
            this.ASPxGridViewExporter2.FileName = "Producto Mezclado Detalle";
            Options.SheetName = this.ASPxGridViewExporter1.FileName;
            this.ASPxGridViewExporter2.WriteXlsToResponse(Options);
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Posicion Productos Mezclados";
            }
        }

        protected void GvDatos0_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("ExportDet"))
            {
                GvDatos0.SettingsExport.FileName = "Detalle Productos Mezclados";
            }
        }
    }
}