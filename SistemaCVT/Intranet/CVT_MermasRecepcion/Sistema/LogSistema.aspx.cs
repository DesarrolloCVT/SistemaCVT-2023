using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Sistema
{
    public partial class LogSistema : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {
            DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
            this.ASPxGridViewExporter1.FileName = "Informe Registro de Sistema";
            this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        }
    }
}