using DBMermasRecepcion;
using System;

namespace CVT_MermasRecepcion
{
    public partial class Blank : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int perfil = Convert.ToInt32(Session["PerfilId"]);
            PlanMantencionClass PLM = new PlanMantencionClass();

            if (perfil == 8)
            {
                int estado = PLM.BuscaEstadoAviso("Creado");
                int pendientes = PLM.TraeCantidadRegistrosCreados();
                if (estado != 0)
                {
                    popAviso.ShowOnPageLoad = true;
                    lblPendientes.Text = pendientes.ToString();
                    //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Tienes: " + pendientes + " Mantenciones programadas sin terminar porfavor revisar ');",true);
                    //   //if () { }
                    //   //Response.Redirect("Mantencion/PlanMantencion.aspx");


                }
            }
        }

        protected void btnIrAgenda_Click(object sender, EventArgs e)
        {
            Response.Redirect("Mantencion/AgendaMantencion.aspx");
        }

        protected void btnPlanificador_Click(object sender, EventArgs e)
        {
            Response.Redirect("Mantencion/PlanMantencion.aspx");
        }
    }
}