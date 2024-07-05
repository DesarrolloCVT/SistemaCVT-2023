using System;

namespace CVT_MermasRecepcion.ControlCierreMensual.BPT
{
    public partial class PorcentajeUbicacionCV100 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GvDatos.DataBind();
            GvDatos2.DataBind();
        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //    this.ASPxGridViewExporter1.FileName = "Porcentajes CV100";
        //    Options.SheetName = this.ASPxGridViewExporter1.FileName;
        //    this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        //}

        //protected void cmd_Excel2_Click(object sender, ImageClickEventArgs e)
        //{
        //    DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //    this.ASPxGridViewExporter2.FileName = "Porcentajes Rack Pasillo";
        //    Options.SheetName = this.ASPxGridViewExporter2.FileName;
        //    this.ASPxGridViewExporter2.WriteXlsToResponse(Options);
        //}

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Porcentajes CV100";
            }
        }

        protected void GvDatos2_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos2.SettingsExport.FileName = "Porcentajes Rack Pasillo";
            }
        }
    }
}