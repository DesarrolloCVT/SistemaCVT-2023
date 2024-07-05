using DBMermasRecepcion;
using System;
using System.Data;
using System.Web.UI;

namespace CVT_MermasRecepcion.Logistica
{
    public partial class PendientesEntrega : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargaPivot();


            if (!IsPostBack)
            {

                ////CargaPivot();

            }


        }
        private void CargaPivot()
        {
            LogisticaClass VLogis = new LogisticaClass();
            DataTable dt2 = new DataTable();
            dt2 = VLogis.SP_ListadoPendienteEntrega();
            PvDatos2.DataSource = dt2;
            PvDatos2.DataBind();


        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            CargaPivot();
        }

        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {
            //ASPxPivotGridExporter1.ExportToXlsx();
            DevExpress.Export.ExportSettings.DefaultExportType = DevExpress.Export.ExportType.WYSIWYG;
            ASPxPivotGridExporter1.ExportXlsToResponse("Pendientes Entrega.xlsx");
        }

        protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        {

        }
    }
}