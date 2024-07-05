using DBMermasRecepcion;
using System;
using System.Data;
using System.Web.UI;

namespace CVT_MermasRecepcion.Comex
{
    public partial class InformeSemana : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargaPivot();

            if (!IsPostBack)
            {
                DateTime fi = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
                dteInicio.Value = fi.AddMonths(-1);
                dteFtermino.Value = fi.AddDays(-1);
                CargaPivot();
            }
        }

        private void CargaPivot()
        {
            ComexClass Comx = new ComexClass();
            DataTable dt = new DataTable();
            DateTime fechainicio = new DateTime(dteInicio.Date.Year, dteInicio.Date.Month, dteInicio.Date.Day);
            DateTime fechatermino = new DateTime(dteFtermino.Date.Year, dteFtermino.Date.Month, dteFtermino.Date.Day);
            dt = Comx.SP_Informe40(fechainicio, fechatermino);
            PvDatos.DataSource = dt;
            PvDatos.DataBind();
        }


        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            CargaPivot();
        }

        protected void cmdExcel_Click1(object sender, ImageClickEventArgs e)
        {
            //ASPxPivotGridExporter1.ExportToXlsx();
            DevExpress.Export.ExportSettings.DefaultExportType = DevExpress.Export.ExportType.WYSIWYG;
            ASPxPivotGridExporter1.ExportXlsToResponse("Informe Semanal.xlsx");
        }
    }
}