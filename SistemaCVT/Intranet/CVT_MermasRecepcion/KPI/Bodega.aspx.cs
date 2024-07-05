using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.KPI
{
    public partial class Bodega : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_refrescar_Click(object sender, EventArgs e)
        {
            Gv_TransTiempoCierre.DataBind();
            Graf_TransTiempoCierre.DataBind();
           
        }

        protected void btn_refrescarTon_Click(object sender, EventArgs e)
        {
            Gv_TonMovidas.DataBind();
            Graf_TonMovidas.DataBind();
        }

        protected void btn_refrescartiempopedido_Click(object sender, EventArgs e)
        {
            Gv_TiempoBajadaPedido.DataBind();
            Graf_TiempoPedido.DataBind();
        }
    }
}