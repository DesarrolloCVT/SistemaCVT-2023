using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Sistema
{
    public partial class Log_RegPrecioEntrega : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dteFechaInicio.Date = DateTime.Now.AddDays(-1);
                dteTermino.Date = DateTime.Now.AddDays(7);
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {

        }
    }
}