using DBMermasRecepcion;
using System;
using System.Data;
using System.Web.UI;

namespace CVT_MermasRecepcion.Produccion
{
    public partial class CompromisoStockSMM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargaPivot();
        }
        private void CargaPivot()
        {
            MMetroClass mMet = new MMetroClass();
            DataTable dt = new DataTable();
            dt = mMet.SP_StockSMMCompromiso();
            PvDatos.DataSource = dt;
            PvDatos.DataBind();

        }

        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {
            DevExpress.Export.ExportSettings.DefaultExportType = DevExpress.Export.ExportType.WYSIWYG;
            ASPxPivotGridExporter1.ExportXlsToResponse("Compromiso Stock.xlsx");
        }
    }
}