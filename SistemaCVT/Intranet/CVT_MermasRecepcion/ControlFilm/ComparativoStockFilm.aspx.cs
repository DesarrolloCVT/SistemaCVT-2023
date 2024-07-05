using DBMermasRecepcion;
using System;
using System.Data;
using System.Web.UI;

namespace CVT_MermasRecepcion.ControlFilm
{
    public partial class ComparativoStockFilm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                PvDatos.DataSource = Session["datos"];
            }
        }

        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {
            DevExpress.Export.ExportSettings.DefaultExportType = DevExpress.Export.ExportType.WYSIWYG;
            ASPxPivotGridExporter1.ExportXlsToResponse("Comparativo stock.xlsx");
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string CodPro = Convert.ToString(cboProducto.Value);
            string Bodega = Convert.ToString(cboBodega.Value);
            string lote = txtLote.Text;

            ControlFilmClass cfc = new ControlFilmClass();
            DataTable dt = new DataTable();
            dt = cfc.SP_CompStockFilm(CodPro, Bodega, lote);
            PvDatos.DataSource = dt;
            Session["datos"] = dt;
            PvDatos.DataBind();
        }
    }
}