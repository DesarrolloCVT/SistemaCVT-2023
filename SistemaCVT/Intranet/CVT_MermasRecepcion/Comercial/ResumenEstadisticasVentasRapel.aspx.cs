using DBMermasRecepcion;
using System;
using System.Data;
using System.Web.UI;

namespace CVT_MermasRecepcion.Comercial
{
    public partial class ResumenEstadisticasVentasRapel : System.Web.UI.Page
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
            ComercialClass cC = new ComercialClass();
            DataTable dt = cC.SP_EAstadisticasDeVentasRapel(dteFini.Date, dteTermino.Date);
            PvDatos.DataSource = dt;
            PvDatos.DataBind();
        }

        protected void cmdExcel_Click1(object sender, ImageClickEventArgs e)
        {
            DevExpress.Export.ExportSettings.DefaultExportType = DevExpress.Export.ExportType.WYSIWYG;
            ASPxPivotGridExporter1.ExportXlsToResponse("Resumen Estadisticas Ventas Rapel");
        }
    }
}