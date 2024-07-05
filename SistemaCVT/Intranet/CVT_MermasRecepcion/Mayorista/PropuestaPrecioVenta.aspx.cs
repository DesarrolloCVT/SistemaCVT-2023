using DBMermasRecepcion;
using System;
using System.Data;

namespace CVT_MermasRecepcion.Mayorista
{
    public partial class PropuestaPrecioVenta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargaPivot();

            if (!IsPostBack)
            {
                CargaPivot();
            }
        }
        private void CargaPivot()
        {
            MMetroClass mme = new MMetroClass();
            DataTable dt = new DataTable();
            dt = mme.SP_PropuestaPrecioVenta();
            GvDatos.DataSource = dt;
            GvDatos.DataBind();
        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    GvDatos.ExportXlsxToResponse("Propuesta Precio Venta", new XlsxExportOptionsEx { ExportType = ExportType.Default });
        //}

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Propuesta Precio Venta";
            }
        }
    }
}