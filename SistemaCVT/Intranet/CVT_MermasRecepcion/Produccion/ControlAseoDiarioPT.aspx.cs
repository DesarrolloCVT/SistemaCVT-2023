using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Produccion
{
    public partial class ControlAseoDiarioPT : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GvDatos.DataBind();

            ProduccionClass pc = new ProduccionClass();
            int Est = pc.ObtieneEstadoControlEnv(Convert.ToInt32(Session["IdControlEnvPT"]));

            int dOf = pc.ObtieneOF(Convert.ToInt32(Session["IdControlEnvPT"]));

            lblti.InnerText = "Aseo Diario Envasado  OF N°: " + dOf.ToString();
            //if (Est == 1)
            //{
            //    cmdNew.Visible = true;               

            //}
            //else
            //{
            //    cmdNew.Visible = false;              
            //}
        }

        protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        {
            //GvDatos.AddNewRow();
            popAseoDiarioPT.ShowOnPageLoad = true;
            dteFechVerificacion.Date = DateTime.Now;
        }

        protected void Atras_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/Produccion/ControlEnvPT.aspx");
        }

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["ID_ControlEnvPT"] = Convert.ToInt32(Session["IdControlEnvPT"]);
            e.NewValues["FechaRegistro"] = DateTime.Now;
            e.NewValues["Id_Usuario"] = Convert.ToInt32(Session["IDCVTUsuario"]);
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            ProduccionClass pc = new ProduccionClass();
            CVT_ControlEnvasadoPT_AseoDiario cad = new CVT_ControlEnvasadoPT_AseoDiario();

            cad.ID_ControlEnvPT = Convert.ToInt32(Session["IdControlEnvPT"]);
            cad.BarridoPisoSala = Convert.ToInt16(cboBarridoPisoSala.Value);
            cad.SoplarMaquina = Convert.ToInt16(cboSoplarMaquina.Value);
            cad.SacosDeBarrido = Convert.ToInt16(cboSacosdeBarrido.Value);
            cad.PesadosAmarrados = Convert.ToInt16(cboPesadosAmarrados.Value);
            cad.SacosReenvasado = Convert.ToInt16(cboSacosReenvasados.Value);
            cad.FechaVerificacion = Convert.ToDateTime(dteFechVerificacion.Value);
            cad.Verificador = Convert.ToInt32(cboVerificador.Value);
            cad.Observaciones = MeObservaciones.Text;
            cad.Id_Usuario = Convert.ToInt32(Session["IDCVTUsuario"]);
            cad.FechaRegistro = DateTime.Now;

            bool ins = pc.InsertaControlAseoDiarioPT(cad);
            if (ins == true)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registro Guardado');", true);
                GvDatos.DataBind();
                limpiar();

                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 177, "Crea Registro Aseo Diario");
                popAseoDiarioPT.ShowOnPageLoad = false;
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al Registrar Contactar con Administrador');", true);
                limpiar();

            }

        }

        protected void limpiar()
        {
            cboBarridoPisoSala.SelectedIndex = 0;
            cboSoplarMaquina.SelectedIndex = 0;
            cboSacosdeBarrido.SelectedIndex = 0;
            cboPesadosAmarrados.SelectedIndex = 0;
            cboSacosReenvasados.SelectedIndex = 0;
            dteFechVerificacion.Date = DateTime.Now;
            cboVerificador.SelectedIndex = -1;
            MeObservaciones.Text = string.Empty;


        }

        protected void GvDatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 177, "Elimina Registro Aseo Diario");

            UsuarioClass us = new UsuarioClass();

            var veri = us.idUsuarioVerificador(Convert.ToInt32(Session["IDCVTUsuario"]));

            if (veri == "False")
            {
                e.Cancel = true;
            }
        }

        protected void GvDatos_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 177, "Edita Registro Aseo Diario");

            UsuarioClass us = new UsuarioClass();

            var veri = us.idUsuarioVerificador(Convert.ToInt32(Session["IDCVTUsuario"]));

            if (veri == "False")
            {
                GvDatos.SettingsPopup.EditForm.ShowFooter = true;
                GvDatos.SettingsText.PopupEditFormFooterText = "solo usuarios verificadores pueden editar";
                GvDatos.StylesPopup.EditForm.Footer.ForeColor = System.Drawing.Color.Red;
                e.Cancel = true;
            }
        }

        private bool EvaluaEstadoPlan(DevExpress.Web.ASPxGridView grid, int visibleindex)
        {
            bool ret = true;

            ProduccionClass pc = new ProduccionClass();
            int Estado = pc.ObtieneEstadoControlEnv(Convert.ToInt32(Session["IdControlEnvPT"]));
            if (Estado != 1)
            {
                ret = false;
            }
            return ret;
        }

        protected void GvDatos_CommandButtonInitialize(object sender, DevExpress.Web.ASPxGridViewCommandButtonEventArgs e)
        {
            //    if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Edit)
            //    {
            //        e.Visible = EvaluaEstadoPlan((DevExpress.Web.ASPxGridView)sender, e.VisibleIndex);
            //    }
            //    if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Delete)
            //    {
            //        e.Visible = EvaluaEstadoPlan((DevExpress.Web.ASPxGridView)sender, e.VisibleIndex);
            //    }
        }
    }
}