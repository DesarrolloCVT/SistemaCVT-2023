using DBMermasRecepcion;
using System;
using System.Data;
using System.Web.UI;

namespace CVT_MermasRecepcion.Mayorista
{
    public partial class FlujoProductos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargaPivot();

            if (!IsPostBack)
            {
                DateTime fi = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
                dteFinicio.Value = fi.AddMonths(-1);
                dteFTermino.Value = fi.AddDays(-1);
                CargaPivot();
            }
        }

        private void CargaPivot()
        {
            MMetroClass VLogis = new MMetroClass();
            DataTable dt = new DataTable();
            DateTime fechainicio = new DateTime(dteFinicio.Date.Year, dteFinicio.Date.Month, dteFinicio.Date.Day);
            DateTime fechatermino = new DateTime(dteFTermino.Date.Year, dteFTermino.Date.Month, dteFTermino.Date.Day);
            dt = VLogis.SP_FlujoProductos(fechainicio, fechatermino);
            PvDatos.DataSource = dt;
            PvDatos.DataBind();

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            CargaPivot();
        }

        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {
            //ASPxPivotGridExporter1.ExportToXlsx();
            DevExpress.Export.ExportSettings.DefaultExportType = DevExpress.Export.ExportType.WYSIWYG;
            ASPxPivotGridExporter1.ExportXlsToResponse("EstadisticasVentas.xlsx");
        }
    }
}