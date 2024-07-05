using DBMermasRecepcion;
using System;

namespace CVT_MermasRecepcion.Produccion
{
    public partial class InformeOFConsumo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 40, "Ingreso");
            }
        }

        protected void btn_Generar_Click(object sender, EventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 40, "Boton");
            GvResumen.DataBind();
            ASPxGridView1.DataBind();
        }
    }
}