using System;

namespace CVT_MermasRecepcion.Reporteria
{
    public partial class InformeDetenciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cb_finicio.Date = DateTime.Now.AddMonths(-1);
                cb_fhasta.Date = DateTime.Now;
            }
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            GvDatos.DataBind();
        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //    this.ASPxGridViewExporter1.FileName = "Informe Detenciones";
        //    Options.SheetName = this.ASPxGridViewExporter1.FileName;
        //    this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        //}

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Informe Detenciones";
            }
        }
    }
}