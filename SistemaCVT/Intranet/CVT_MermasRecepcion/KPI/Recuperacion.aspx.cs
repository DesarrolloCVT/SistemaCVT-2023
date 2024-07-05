using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.KPI
{
    public partial class Recuperacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_refrescar_Click(object sender, EventArgs e)
        {
            Gv_Desecho.DataBind();
            Graf_Desecho.DataBind();
        }
    }
}