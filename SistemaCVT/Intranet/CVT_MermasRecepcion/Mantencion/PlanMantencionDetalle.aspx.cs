using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Mantencion
{
    public partial class PlanMantencionDetalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            limpiaAgregar();
            if (IsPostBack)
            {
                GvDatoMaquina.DataBind();
                GvDatoParte.DataBind();
                GvDatoPieza.DataBind();
                GvDatosHerramienta.DataBind();
                GvDatosRepuestos.DataBind();
                GvDatosRRHH.DataBind();

            }
        }

        protected void cmdAgregarMaquina_Click1(object sender, ImageClickEventArgs e)
        {
            PlanMantencionClass PMC = new PlanMantencionClass();
            CVT_PlanMantencion_Maquina maq = new CVT_PlanMantencion_Maquina();
            int idFol = Convert.ToInt32(Session["Id_PlanMantencion"]);
            int codMaquina = PMC.BuscaCodigoMaquinaComponente(Convert.ToInt32(cbo_Maquina.Value));
            string desc = PMC.BuscaDescripcionMaquinaComponente(Convert.ToInt32(cbo_Maquina.Value));
            if (cbo_Maquina.Value != null)
            {
                maq.CodMaquina = Convert.ToString(codMaquina);
                maq.Descripcion = desc;
                maq.Id_PlanMantencion = idFol;
                PMC.InsertaMaquina(maq);
                GvDatoMaquina.DataBind();
            }




        }

        protected void cmdAgregarPartes_Click(object sender, ImageClickEventArgs e)
        {
            PlanMantencionClass PMC = new PlanMantencionClass();
            CVT_PlanMantencion_Parte par = new CVT_PlanMantencion_Parte();
            int idFol = Convert.ToInt32(Session["Id_PlanMantencion"]);
            int codParte = PMC.BuscaCodigoMaquinaComponente(Convert.ToInt32(cbo_Partes.Value));
            string desc = PMC.BuscaDescripcionMaquinaComponente(Convert.ToInt32(cbo_Partes.Value));
            if (cbo_Partes.Value != null)
            {
                par.CodParte = Convert.ToString(codParte);
                par.Descripcion = desc;
                par.Id_PlanMantencion = idFol;
                PMC.InsertaParte(par);
                GvDatoParte.DataBind();
            }

        }

        protected void cmdAgregarPieza_Click(object sender, ImageClickEventArgs e)
        {
            PlanMantencionClass PMC = new PlanMantencionClass();
            CVT_PlanMantencion_Pieza pie = new CVT_PlanMantencion_Pieza();
            int idFol = Convert.ToInt32(Session["Id_PlanMantencion"]);
            int codpie = PMC.BuscaCodigoMaquinaComponente(Convert.ToInt32(cbo_Pieza.Value));
            string desc = PMC.BuscaDescripcionMaquinaComponente(Convert.ToInt32(cbo_Pieza.Value));
            if (cbo_Pieza.Value != null)
            {
                pie.CodPieza = Convert.ToString(codpie);
                pie.Descripcion = desc;
                pie.Id_PlanMantencion = idFol;
                PMC.InsertaPieza(pie);
                GvDatoPieza.DataBind();
            }

        }

        protected void cmdAgregarHerramienta_Click(object sender, ImageClickEventArgs e)
        {
            PlanMantencionClass PMC = new PlanMantencionClass();
            CVT_PlanMantencion_Herramienta he = new CVT_PlanMantencion_Herramienta();
            int idFol = Convert.ToInt32(Session["Id_PlanMantencion"]);
            string desc = txt_herramienta.Text;
            if (txt_herramienta.Text != "")
            {
                he.Descripcion = desc;
                he.Id_PlanMantencion = idFol;
                PMC.InsertaHerramienta(he);
                GvDatosHerramienta.DataBind();
                txt_herramienta.Text = string.Empty;
            }

        }

        protected void cmdAgregarRepuesto_Click(object sender, ImageClickEventArgs e)
        {
            PlanMantencionClass PMC = new PlanMantencionClass();
            CVT_PlanMantencion_Repuesto rep = new CVT_PlanMantencion_Repuesto();
            int idFol = Convert.ToInt32(Session["Id_PlanMantencion"]);
            string desc = txtRepuesto.Text;
            if (txtRepuesto.Text != "")
            {
                rep.Descripcion = desc;
                rep.Id_PlanMantencion = idFol;
                PMC.InsertaRepuesto(rep);
                GvDatosRepuestos.DataBind();
                txtRepuesto.Text = string.Empty;
            }

        }

        protected void cmdAgregarRRHH_Click(object sender, ImageClickEventArgs e)
        {
            PlanMantencionClass PMC = new PlanMantencionClass();
            TorniqueteClass Tor = new TorniqueteClass();
            CVT_PlanMantencion_RRHH rh = new CVT_PlanMantencion_RRHH();
            int idFol = Convert.ToInt32(Session["Id_PlanMantencion"]);
            string rutrh = Convert.ToString(cboRRHH.Value);
            string nombrerh = Tor.TraeNombrepersonal2(rutrh);
            string apellidorh = Tor.TraeApellidoPersonal2(rutrh);

            if (cboRRHH.Value != null)
            {
                rh.Run = rutrh;
                rh.Nombre = nombrerh;
                rh.Apellido = apellidorh;
                rh.Id_PlanMantencion = idFol;
                PMC.InsertaRRHH(rh);
                GvDatosRRHH.DataBind();
                cboRRHH.SelectedIndex = -1;
            }


        }

        protected void cmdVolver_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/Mantencion/PlanMantencion.aspx");
        }

        private void limpiaAgregar()
        {
            PlanMantencionClass PMC = new PlanMantencionClass();
            string Estado = PMC.BuscaEstado(Convert.ToInt32(Session["Id_PlanMantencion"]));
            if (Estado.Equals("Terminado"))
            {
                cmdAgregarMaquina.Visible = false;
                Label1.Visible = false;
                cmdAgregarPartes.Visible = false;
                Label2.Visible = false;
                cmdAgregarPieza.Visible = false;
                Label3.Visible = false;
                cmdAgregarHerramienta.Visible = false;
                Label4.Visible = false;
                cmdAgregarRepuesto.Visible = false;
                Label5.Visible = false;
                cmdAgregarRRHH.Visible = false;
                Label6.Visible = false;
                GvDatoMaquina.Columns[0].Visible = false;
                GvDatoParte.Columns[0].Visible = false;
                GvDatoPieza.Columns[0].Visible = false;
                GvDatosHerramienta.Columns[0].Visible = false;
                GvDatosRepuestos.Columns[0].Visible = false;
                GvDatosRRHH.Columns[0].Visible = false;
                cbo_Maquina.Enabled = false;
                cbo_Partes.Enabled = false;
                cbo_Pieza.Enabled = false;
                txtRepuesto.Enabled = false;
                txt_herramienta.Enabled = false;
                cboRRHH.Enabled = false;



            }
        }

        protected void GvDatoMaquina_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            PlanMantencionClass pm = new PlanMantencionClass();

            string cod = Convert.ToString(e.NewValues["Descripcion"]);
            int id = pm.BuscaCodigoMaquinaNombre(cod);
            string des = pm.BuscaDescripcionMaquinaComponente(Convert.ToInt32(cod));
            e.NewValues["CodMaquina"] = id;
            e.NewValues["Descripcion"] = des;
        }

        protected void GvDatoParte_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            PlanMantencionClass pm = new PlanMantencionClass();

            string cod = Convert.ToString(e.NewValues["Descripcion"]);
            int id = pm.BuscaCodigoMaquinaNombre(cod);
            string des = pm.BuscaDescripcionMaquinaComponente(Convert.ToInt32(cod));
            e.NewValues["CodParte"] = id;
            e.NewValues["Descripcion"] = des;
        }

        protected void GvDatoPieza_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            PlanMantencionClass pm = new PlanMantencionClass();

            string cod = Convert.ToString(e.NewValues["Descripcion"]);
            int id = pm.BuscaCodigoMaquinaNombre(cod);
            string des = pm.BuscaDescripcionMaquinaComponente(Convert.ToInt32(cod));
            e.NewValues["CodPieza"] = id;
            e.NewValues["Descripcion"] = des;
        }
    }
}