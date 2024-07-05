using DBMermasRecepcion;
using System;
using System.Data;
using System.Web.UI;

namespace CVT_MermasRecepcion.Gestion
{
    public partial class EmpresasRelacionadas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargaPivot();
        }

        protected void cmdExcel_Click1(object sender, ImageClickEventArgs e)
        {
            DevExpress.Export.ExportSettings.DefaultExportType = DevExpress.Export.ExportType.WYSIWYG;

            ASPxPivotGridExporter1.ExportXlsToResponse("Empresas Relacionadas.xlsx");
        }
        private void CargaPivot()
        {
            ServiciosClass mme = new ServiciosClass();
            DataTable dt = new DataTable();
            dt = mme.SP_EmpresasRelacionadas();
            PvDatos.DataSource = dt;
            PvDatos.DataBind();

            DataTable dte = new DataTable();
            dte = mme.SP_EmpresasRelacionadasDocumentos();
            PvDatos2.DataSource = dte;
            PvDatos2.DataBind();

            GvDetalleDoc.DataSource = dte;
            GvDetalleDoc.DataBind();
        }

        protected void PvDatos_CustomCellStyle(object sender, DevExpress.Web.ASPxPivotGrid.PivotCustomCellStyleEventArgs e)
        {
            if (Convert.ToDecimal(e.Value) < 0)
            {
                e.CellStyle.ForeColor = System.Drawing.Color.Red;

            }
            else
            {

                e.CellStyle.ForeColor = System.Drawing.Color.Blue;
            }
        }

        protected void PvDatos2_CustomCellStyle(object sender, DevExpress.Web.ASPxPivotGrid.PivotCustomCellStyleEventArgs e)
        {
            if (Convert.ToDecimal(e.Value) < 0)
            {
                e.CellStyle.ForeColor = System.Drawing.Color.Red;

            }
            else
            {

                e.CellStyle.ForeColor = System.Drawing.Color.Blue;
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            DevExpress.Export.ExportSettings.DefaultExportType = DevExpress.Export.ExportType.WYSIWYG;

            ASPxPivotGridExporter2.ExportXlsToResponse("Empresas Relacionadas en Base Documentos.xlsx");
        }

        protected void GvDetalleDoc_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDetalleDoc.SettingsExport.FileName = "Detalle Documentos";
            }
        }
    }
}