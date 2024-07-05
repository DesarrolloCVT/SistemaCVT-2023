using DBMermasRecepcion;
using System;
using System.Data;
using System.Web.UI;

namespace CVT_MermasRecepcion.RRHH
{
    public partial class ResumenAsistenciaArea : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                CargaPivot();
            }
        }

        protected void cmdExcel_Click1(object sender, ImageClickEventArgs e)
        {
            DevExpress.Export.ExportSettings.DefaultExportType = DevExpress.Export.ExportType.WYSIWYG;
            ASPxPivotGridExporter.ExportXlsToResponse("Resumen Asistencia por Area.xlsx");
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            CargaPivot();
        }
        private void CargaPivot()
        {
            AsistenciaClass Com = new AsistenciaClass();
            DataTable dt = new DataTable();
            dt = Com.sp_ResumenasistenciaArea(Convert.ToDateTime(dteInicio.Value), Convert.ToDateTime(dteTermino.Value));
            PvDatos.DataSource = dt;
            PvDatos.DataBind();

            DataTable dt2 = Com.sp_InconsistenciasFechas(Convert.ToDateTime(dteInicio.Value), Convert.ToDateTime(dteTermino.Value));
            GvDatos.DataSource = dt2;
            GvDatos.DataBind();
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Inconsistencia Fechas";
            }
        }
    }
}