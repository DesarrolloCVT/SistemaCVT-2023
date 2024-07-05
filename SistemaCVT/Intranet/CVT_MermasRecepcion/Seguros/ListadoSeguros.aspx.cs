using DBMermasRecepcion;
using System;
using System.Data;
using System.Web.UI;

namespace CVT_MermasRecepcion.Seguros
{
    public partial class ListadoSeguros : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargaPivot();
        }
        private void CargaPivot()
        {
            SeguroClass sg = new SeguroClass();
            DataTable dt = new DataTable();
            dt = sg.SP_ListadoSeguros();
            PvDatos.DataSource = dt;
            PvDatos.DataBind();
        }

        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {
            DevExpress.Export.ExportSettings.DefaultExportType = DevExpress.Export.ExportType.WYSIWYG;
            ASPxPivotGridExporter1.ExportXlsToResponse("Listado Seguros.xlsx");
        }
    }
}