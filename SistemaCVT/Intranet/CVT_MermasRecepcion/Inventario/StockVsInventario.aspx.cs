using DBMermasRecepcion;
using System;
using System.Data;
using System.Web.UI;

namespace CVT_MermasRecepcion.Inventario
{
    public partial class StockVsInventario : System.Web.UI.Page
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

        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {
            DevExpress.Export.ExportSettings.DefaultExportType = DevExpress.Export.ExportType.WYSIWYG;
            ASPxPivotGridExporter1.ExportXlsToResponse("Comparativo stock Vs Inventario.xlsx");
        }
        private void CargaPivot()
        {
            string CodPro = Convert.ToString(cbo_CodProducto.Value);
            string Bodega = Convert.ToString(cbo_Bodega.Value);
            int folInv = Convert.ToInt32(cboFolioInventario.Value);

            InventarioClass Comx = new InventarioClass();
            DataTable dt = new DataTable();
            dt = Comx.SP_CompStockVsInventario(CodPro, Bodega, folInv);
            PvDatos.DataSource = dt;
            PvDatos.DataBind();
        }
    }
}