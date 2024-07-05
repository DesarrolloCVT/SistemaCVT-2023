using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBMermasRecepcion;
using System.Data;

namespace CVT_MermasRecepcion.WMS
{
    public partial class StockAsignacionProduccion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                CargaPivot();
            }
        }

        protected void btn_Generar_Click(object sender, EventArgs e)
        {
            CargaPivot();
        }

        private void CargaPivot()
        {
            string codproducto = cbo_producto.Value != null ? cbo_producto.Value.ToString() : "";
            string lote = txt_lote.Text;
            int sitioid = Convert.ToInt32(cbo_bodega.Value);
            WMSClass vSMM = new WMSClass();
            DataTable dt = new DataTable();
            dt = vSMM.SP_InformeStock(sitioid, codproducto, lote);
            PvStockAsigProd.DataSource = dt;
            Session["datosInfStock"] = dt;
            PvStockAsigProd.DataBind();
        }


            protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {
            DevExpress.Export.ExportSettings.DefaultExportType = DevExpress.Export.ExportType.WYSIWYG;
            ASPxPivotGridExporter1.ExportXlsToResponse("Stock Asignacion Produccion.xlsx");
        }
    }
}