using DBMermasRecepcion;
using System;
using System.Data;
using System.Web.UI;

namespace CVT_MermasRecepcion.Comercial
{
    public partial class AnalisisCompra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                CargaPivot();
            }
            else
            {
                cboAno.SelectedIndex = 0;
                cboMes.SelectedIndex = 0;
                cboProveedor.SelectedIndex = 0;
                cboArticulo.SelectedIndex = 0;
            }


        }

        protected void cmdExcel_Click1(object sender, ImageClickEventArgs e)
        {
            DevExpress.Export.ExportSettings.DefaultExportType = DevExpress.Export.ExportType.WYSIWYG;
            ASPxPivotGridExporter1.ExportXlsToResponse("AnalisisdeCompras.xlsx");
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            CargaPivot();
        }
        private void CargaPivot()
        {
            ComercialClass cC = new ComercialClass();
            DataTable dt = cC.SP_AnalisisCompra(Convert.ToInt32(cboProveedor.Value), Convert.ToInt32(cboArticulo.Value), Convert.ToInt32(cboMes.Value), Convert.ToInt32(cboAno.Value));
            PvDatos.DataSource = dt;
            PvDatos.DataBind();
        }
    }
}