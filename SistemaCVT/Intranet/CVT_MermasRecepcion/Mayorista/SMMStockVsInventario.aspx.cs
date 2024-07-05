using DBMermasRecepcion;
using System;
using System.Data;
using System.Web.UI;

namespace CVT_MermasRecepcion.Mayorista
{
    public partial class SMMStockVsInventario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                CargaPivot();
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            CargaPivot();
        }
        private void CargaPivot()
        {

            int folInv = Convert.ToInt32(cboFolioInventario.Value);

            SMMInventarioClass inv = new SMMInventarioClass();
            DataTable dt = new DataTable();
            dt = inv.SP_CompStockVsInventarioSMM(folInv);
            PvDatos.DataSource = dt;
            PvDatos.DataBind();
        }

        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {
            DevExpress.Export.ExportSettings.DefaultExportType = DevExpress.Export.ExportType.WYSIWYG;
            ASPxPivotGridExporter1.ExportXlsToResponse("Comparativo stock Vs Inventario.xlsx");
        }
    }
}