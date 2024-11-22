using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Comercial
{
    public partial class InformePresupuestoVentas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Btn_Refrescar_Click(object sender, EventArgs e)
        {
            GvInfPresupuesto.DataBind();
        }
    }
}