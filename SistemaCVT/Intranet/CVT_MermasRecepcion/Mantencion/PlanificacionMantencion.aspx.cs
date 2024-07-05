using DBMermasRecepcion;
using System;

namespace CVT_MermasRecepcion.Mantencion
{
    public partial class PlanificacionMantencion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 0, "Ingreso");
            }
        }
    }
}