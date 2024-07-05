using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.KPI
{
    public partial class Envasado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_refrescar_Click(object sender, EventArgs e)
        {
            Gv_PesoPallet.DataBind();
            Graf_PesoPallet.DataBind();
        }

        protected void btn_RefrescarDetenciones_Click(object sender, EventArgs e)
        {
            GvDetenciones.DataBind();
            GrafDetenciones.DataBind();
        }

        protected void btn_RefrescarMetas_Click(object sender, EventArgs e)
        {
            Gv_MetasProduccion.DataBind();
            Graf_MetasProduccion.DataBind();
        }
    }
}