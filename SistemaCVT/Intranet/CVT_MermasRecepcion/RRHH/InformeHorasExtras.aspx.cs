using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.RRHH
{
    public partial class InformeHorasExtras : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ASPxPivotGrid1.DataBind();
        }

        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {
            DevExpress.Export.ExportSettings.DefaultExportType = DevExpress.Export.ExportType.WYSIWYG;
            ASPxPivotGridExporter1.ExportXlsToResponse("Informe Horas Extras.xlsx");
        }
    }
}