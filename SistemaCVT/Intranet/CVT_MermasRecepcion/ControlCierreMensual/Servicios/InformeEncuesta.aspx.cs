using System;

namespace CVT_MermasRecepcion.ControlCierreMensual.Servicios
{
    public partial class InformeEncuesta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_ver_Click(object sender, EventArgs e)
        {
            GvDatoRespuestas.DataBind();
            GvDatosAspecto.DataBind();
            GvDatospreguntas.DataBind();
        }
    }
}