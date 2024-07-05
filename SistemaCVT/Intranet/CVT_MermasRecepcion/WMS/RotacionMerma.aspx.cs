using DBMermasRecepcion;
using System;
using System.Data;
using System.Web.UI;

namespace CVT_MermasRecepcion.WMS
{
    public partial class RotacionMerma : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargaPivot();
        }

        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {

            DevExpress.Export.ExportSettings.DefaultExportType = DevExpress.Export.ExportType.WYSIWYG;
            ASPxPivotGridExporter1.ExportXlsToResponse("Proyeccion de Cobranzas");
        }

        private void CargaPivot()
        {
            MermasClass mr = new MermasClass();
            DataTable dt = new DataTable();
            dt = mr.SP_RotacionMerma();
            PvDatos.DataSource = dt;
            PvDatos.DataBind();
        }
    }
}