using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBMermasRecepcion;
using System.Data;

namespace CVT_MermasRecepcion.RRHH
{
    public partial class ComparativoDetalleAsistencia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                CargaPivot();
            }
        }
        private void CargaPivot()
        {

            DateTime fdesde = cbo_Fdesde.Date;
            DateTime fhasta = cbo_Fhasta.Date;
            AsistenciaClass vASIS = new AsistenciaClass();
            DataTable dt = new DataTable();
            dt = vASIS.SP_COMPARATIVOAREAPERSONALABORASITENCIA(fdesde, fhasta);
            PvComparaAreaLaborxPersona.DataSource = dt;
            Session["datosPvComparaAreaLabor"] = dt;
            PvComparaAreaLaborxPersona.DataBind();
        }
        protected void btn_Generar_Click(object sender, EventArgs e)
        {
            CargaPivot();
        }
        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {
            DevExpress.Export.ExportSettings.DefaultExportType = DevExpress.Export.ExportType.WYSIWYG;
            ASPxPivotGridExporter1.ExportXlsToResponse("Comparativo Detalle Persona.xlsx");
        }
    }
}