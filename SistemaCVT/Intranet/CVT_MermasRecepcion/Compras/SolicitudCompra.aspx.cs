using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Compras
{
    public partial class SolicitudCompra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 0, "Ingreso");
            }
        }

        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {

        }
    }
}