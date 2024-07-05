using System;

namespace CVT_MermasRecepcion.Reporteria
{
    public partial class MovimientosProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //    this.GridExporter.GridViewID = "ASPxGridView1";
        //    this.GridExporter.FileName = "Informe Mov Producto";
        //    Options.SheetName = this.GridExporter.FileName;
        //    this.GridExporter.WriteXlsToResponse(Options);
        //}

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            ASPxGridView1.DataBind();
        }

        protected void ASPxGridView1_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                ASPxGridView1.SettingsExport.FileName = "Informe Mov Producto";
            }
        }
    }
}