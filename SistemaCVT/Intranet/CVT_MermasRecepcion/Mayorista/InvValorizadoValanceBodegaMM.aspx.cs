using DBMermasRecepcion;
using System;
using System.Data;
using System.Web.UI;

namespace CVT_MermasRecepcion.Mayorista
{
    public partial class InvValorizadoValanceBodegaMM : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargaPivot();
        }

        private void CargaPivot()
        {
            MMetroClass vME = new MMetroClass();
            DataTable dt = new DataTable();
            dt = vME.SP_InvValorizadoVsBalanceBodegaMM();
            PvDatos.DataSource = dt;
            PvDatos.DataBind();
        }

        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {
            DevExpress.Export.ExportSettings.DefaultExportType = DevExpress.Export.ExportType.WYSIWYG;
            ASPxPivotGridExporter1.ExportXlsToResponse("Inventario Valorizado Vs Balance Bodega SMM.xlsx");
        }
    }
}