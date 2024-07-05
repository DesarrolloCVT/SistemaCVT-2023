using DBMermasRecepcion;
using System;
using System.Data;
using System.Web.UI;

namespace CVT_MermasRecepcion.Comercial
{
    public partial class ComparacionCostosAnuales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargaPivot();

            if (!IsPostBack)
            {
                CargaPivot();
            }
        }

        protected void cmdExcel_Click1(object sender, ImageClickEventArgs e)
        {
            DevExpress.Export.ExportSettings.DefaultExportType = DevExpress.Export.ExportType.WYSIWYG;
            ASPxPivotGridExporter1.ExportXlsToResponse("Comparacion Costos Anuales.xlsx");
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            CargaPivot();
        }

        private void CargaPivot()
        {
            ComercialClass Com = new ComercialClass();
            DataTable dt = new DataTable();
            int anoSel = Convert.ToInt32(cboAno.Value);
            dt = Com.SP_ComparacionCostosAnuales(anoSel);
            PvDatos.DataSource = dt;
            PvDatos.DataBind();
        }
    }
}