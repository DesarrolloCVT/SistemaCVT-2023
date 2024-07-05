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
    public partial class VerificacionRecetas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargaDatos();
        }

        private void CargaDatos()
        {
            MMetroClass Mc = new MMetroClass();

            DataTable dt = new DataTable();
            dt = Mc.SP_VerificacionRecetas();
            GvDatos.DataSource = dt;
            GvDatos.DataBind();

        }
    }
}