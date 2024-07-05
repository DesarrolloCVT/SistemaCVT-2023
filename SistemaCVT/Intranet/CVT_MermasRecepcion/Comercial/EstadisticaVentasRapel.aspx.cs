using DBMermasRecepcion;
using System;
using System.Data;

namespace CVT_MermasRecepcion.Comercial
{
    public partial class EstadisticaVentasRapel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                CargaGrid();
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            CargaGrid();
        }

        private void CargaGrid()
        {
            ComercialClass cC = new ComercialClass();
            DataTable dt = cC.SP_EAstadisticasDeVentasRapel(dteFini.Date, dteTermino.Date);
            GvDatos.DataSource = dt;
            GvDatos.DataBind();

        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Estadistica de ventas Rapel";
                GvDatos.SettingsExport.ExcelExportMode = DevExpress.Export.ExportType.Default;
                


            }
            
        }
    }
}