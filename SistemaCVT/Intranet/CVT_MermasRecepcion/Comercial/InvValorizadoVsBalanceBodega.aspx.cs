using DBMermasRecepcion;
using System;
using System.Data;
using System.Web.UI;

namespace CVT_MermasRecepcion.Comercial
{
    public partial class InvValorizadoVsBalanceBodega : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargaPivot();
        }

        private void CargaPivot()
        {
            InventarioClass inv = new InventarioClass();
            DataTable dt = new DataTable();
            dt = inv.SP_InvValorizadoVsBalanceBodegaReporteB();
            PvDatos.DataSource = dt;
            PvDatos.DataBind();
        }

        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {
            DevExpress.Export.ExportSettings.DefaultExportType = DevExpress.Export.ExportType.WYSIWYG;
            ASPxPivotGridExporter1.ExportXlsToResponse("Inventario Valorizado Vs Balance Bodega.xlsx");
        }
    }
}