using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Comercial
{
    public partial class EstadisticasVentasRapel2023 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                GvDatosEstVentas2023.DataSource = Session["datos"];
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            CargaGrid();
        }

        private void CargaGrid()
        {
            ComercialClass cC = new ComercialClass();
            DataTable dt = cC.SP_EstadisticasDeVentasRapel2023(dteFini.Date, dteTermino.Date);
            GvDatosEstVentas2023.DataSource = dt;
            GvDatosEstVentas2023.DataBind();
            Session["datos"] = dt;

        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatosEstVentas2023.SettingsExport.FileName = "Estadistica de ventas Rapel";
                GvDatosEstVentas2023.SettingsExport.ExcelExportMode = DevExpress.Export.ExportType.Default;

            }

        }
               
    }
}