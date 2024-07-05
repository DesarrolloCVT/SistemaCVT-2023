using DBMermasRecepcion;
using System;
using System.Data;

namespace CVT_MermasRecepcion.WMS
{
    public partial class InfDetalleRecepcionDiarias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GvDatos.DataSource = Session["Opcion"];
        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    GvDatos.ExportXlsxToResponse("Detalle Recepcion Diarias", new XlsxExportOptionsEx { ExportType = ExportType.Default });
        //}

        protected void btnBuscar_Click(object sender, EventArgs e)
        {

            WMSClass vWMS = new WMSClass();
            DataTable dt = new DataTable();
            dt = vWMS.SP_DetalleRecepcionDiaria(dteInicio.Date, dteTermino.Date);
            GvDatos.DataSource = dt;
            Session["Opcion"] = dt;
            GvDatos.DataBind();
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Detalle Recepcion Diarias";
            }
        }
    }
}