using DBMermasRecepcion;
using System;
using System.Data;

namespace CVT_MermasRecepcion.ControlCierreMensual.BPT
{
    public partial class PorcRecuperacionProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                GvDatos.DataSource = Session["opcion"];
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            MermasClass vMer = new MermasClass();
            dt = vMer.SP_PorcRecuperacionProducto(Convert.ToDateTime(dteDesde.Value), Convert.ToDateTime(dteHasta.Value));
            GvDatos.Columns.Clear();
            GvDatos.AutoGenerateColumns = true;
            GvDatos.DataSource = dt;
            Session["opcion"] = dt;
            GvDatos.DataBind();
        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    GvDatos.ExportXlsxToResponse("Porcentaje recuperacion de productos", new XlsxExportOptionsEx { ExportType = ExportType.Default });
        //}

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Porcentaje recuperacion de productos";
            }
        }
    }
}