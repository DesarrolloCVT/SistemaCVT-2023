using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Reporteria
{
    public partial class InfEstadisticaGastos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {
            DevExpress.Export.ExportSettings.DefaultExportType = DevExpress.Export.ExportType.WYSIWYG;
            ASPxPivotGridExporter1.ExportXlsxToResponse("EstadisticaGastos.xlsx");
        }
    }
}