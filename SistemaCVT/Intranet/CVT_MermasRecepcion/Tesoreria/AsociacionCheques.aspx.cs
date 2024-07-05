using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Tesoreria
{
    public partial class AsociacionCheques : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {
            DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
            this.ASPxGridViewExporter1.FileName = "Asociacion Cheques mal foliados";
            Options.SheetName = this.ASPxGridViewExporter1.FileName;
            this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        }
        protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        {
            GvDatos.AddNewRow();
        }
    }
}