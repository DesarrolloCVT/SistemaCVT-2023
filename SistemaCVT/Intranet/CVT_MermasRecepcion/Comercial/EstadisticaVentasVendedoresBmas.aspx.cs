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
    public partial class EstadisticaVentasVendedoresBmas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargaPivot();

            if (!IsPostBack)
            {
                CargaPivot();
            }

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            CargaPivot();
        }
        private void CargaPivot()
        {
            MMetroClass mme = new MMetroClass();
            DataTable dt = new DataTable();
            dt = mme.SP_ListadoVentas(dteFinicio.Date, dteFTermino.Date);
            GvDatos.DataSource = dt;
            GvDatos.DataBind();
        }
        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Estadisticas de Ventas";
            }
        }
    }
}