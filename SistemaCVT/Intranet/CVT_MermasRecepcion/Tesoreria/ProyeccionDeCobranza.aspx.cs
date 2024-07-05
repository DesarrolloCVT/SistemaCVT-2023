using DBMermasRecepcion;
using System;
using System.Data;
using System.Web.UI;

namespace CVT_MermasRecepcion.Tesoreria
{
    public partial class ProyeccionDeCobranza : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargaPivot();

            if (!IsPostBack)
            {
                DateTime fi = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
                dteInicio.Value = fi.AddMonths(-1);
                dteTermino.Value = fi.AddDays(-1);
                CargaPivot();
            }
        }

        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {

            DevExpress.Export.ExportSettings.DefaultExportType = DevExpress.Export.ExportType.WYSIWYG;
            ASPxPivotGridExporter1.ExportXlsToResponse("Proyeccion de Cobranzas.xlsx");
        }

        private void CargaPivot()
        {
            TesoreriaClass Ts = new TesoreriaClass();
            DataTable dt = new DataTable();

            DateTime fini = Convert.ToDateTime(dteInicio.Value);
            DateTime fter = Convert.ToDateTime(dteTermino.Value);

            dt = Ts.SP_cierreTesoreriaProyeccioncobranza(fini, fter);

            PvDatos.DataSource = dt;
            PvDatos.DataBind();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            CargaPivot();
        }
    }
}