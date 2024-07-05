using DBMermasRecepcion;
using System;
using System.Data;
using System.Web.UI;

namespace CVT_MermasRecepcion.Inventario
{
    public partial class InformeInventario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            // CargaPivot();

            if (IsPostBack)
            {
                PvDatos.DataSource = Session["datos"];
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {

            CargaPivot();

        }


        private void CargaPivot()
        {
            string CodPro = Convert.ToString(cbo_CodProducto.Value);
            string Bodega = Convert.ToString(cbo_Bodega.Value);

            InventarioClass Comx = new InventarioClass();
            DataTable dt = new DataTable();
            dt = Comx.SP_InfInventario(CodPro, Bodega);
            PvDatos.DataSource = dt;
            PvDatos.DataBind();
            Session["datos"] = dt;
        }

        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {
            DevExpress.Export.ExportSettings.DefaultExportType = DevExpress.Export.ExportType.WYSIWYG;
            ASPxPivotGridExporter1.ExportXlsToResponse("Comparativo stock.xlsx");
        }
    }
}