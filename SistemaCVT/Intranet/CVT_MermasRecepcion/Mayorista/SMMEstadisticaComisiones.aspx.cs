using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Mayorista
{
    public partial class SMMEstadisticaComisiones : System.Web.UI.Page
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
            MMetroClass cC = new MMetroClass();
            DataTable dt = cC.SMM_SP_EstadisticasDeVentasComisiones(dteFini.Date, dteTermino.Date);
            GvDatos.DataSource = dt;
            GvDatos.DataBind();

        }
    }
}