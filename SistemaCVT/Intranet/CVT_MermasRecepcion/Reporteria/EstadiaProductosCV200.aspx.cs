using System;

namespace CVT_MermasRecepcion.Reporteria
{
    public partial class EstadiaProductosCV200 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //CargaGrilla();

        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //    this.ASPxGridViewExporter1.FileName = "Informe Estadia Productos CV200";
        //    Options.SheetName = this.ASPxGridViewExporter1.FileName;
        //    this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        //}

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Informe Estadia Productos CV200";
            }
        }

        //private void CargaGrilla()
        //{
        //    WMSClass Ts = new WMSClass();
        //    DataTable dt = new DataTable();    

        //    dt = Ts.SP_EstadiaProdCV200();

        //    GvDatos.DataSource = dt;
        //    GvDatos.DataBind();
        //}
    }
}