using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Calidad
{
    public partial class RegistroVerificacionBolsasDetalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GvDatosDetalle.DataBind();
        }

        protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        {
            //GvDatosDetalle.AddNewRow();
            popVerificacionBolsas.ShowOnPageLoad = true;
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            CalidadClass ca = new CalidadClass();
            CVT_RegistroVerificacionBolsasDetalle rvb = new CVT_RegistroVerificacionBolsasDetalle();

            rvb.Id_VerificacionBolsas = Convert.ToInt32(Session["Id_VerificacionBolsas"]);
            rvb.Hora = TimeSpan.Parse(DateTime.Now.Hour.ToString() + ":" + DateTime.Now.Minute.ToString());
            rvb.Fecha_elaboracion = Convert.ToInt16(cboFechElab.Value);
            rvb.Fecha_vencimiento = Convert.ToInt16(cboFechVenc.Value);
            rvb.Lote_Correcto = Convert.ToInt16(cboLoteCorrecto.Value);
            rvb.HoraEnvasado_Correcto = Convert.ToInt16(cboHoraEnv.Value);
            rvb.Turno_Correcto = Convert.ToInt16(cboTurnoCorrecto.Value);
            rvb.Linea_Correcta = Convert.ToInt16(cboLineaCorrecta.Value);
            rvb.Origen_indicadoInjeckt = Convert.ToInt16(cboOrigenInjeck.Value);
            rvb.Sello_horizontal = Convert.ToInt16(cboSelloHorizontal.Value);
            rvb.Sello_vertical = Convert.ToInt16(cboSelloVertical.Value);
            rvb.Fecha_ElaboracionLote = Convert.ToInt16(cboFechElabEnfardadora.Value);
            rvb.CodigoBarraEAN13 = Convert.ToInt16(cboCodBarra13.Value);
            rvb.CodigoBarraDUN14 = Convert.ToInt16(cboCodBarraDUN14.Value);
            rvb.SelloVerti_Contenedora = Convert.ToInt16(cboSelloVertContenedora.Value);
            rvb.SelloHoriz_Contenedora = Convert.ToInt16(cboSelloHorizContenedora.Value);
            rvb.Observacion = txtObservacion.Text;

            bool resul = ca.InsertaVerificacionBolsaDetalle(rvb);

            if (resul == true)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registro Guardado');", true);
                GvDatosDetalle.DataBind();
                popVerificacionBolsas.ShowOnPageLoad = false;

                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 135, "Crea Registro verif.bol.det");
                limpiar();

            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al Registrar Contactar con Administrador');", true);
                limpiar();
            }
        }

        protected void limpiar()
        {
            txtHora.Text = string.Empty;
            cboFechElab.SelectedIndex = 1;
            cboFechVenc.SelectedIndex = 1;
            cboLoteCorrecto.SelectedIndex = 1;
            cboHoraEnv.SelectedIndex = 1;
            cboTurnoCorrecto.SelectedIndex = 1;
            cboLineaCorrecta.SelectedIndex = 1;
            cboOrigenInjeck.SelectedIndex = 1;
            cboSelloHorizontal.SelectedIndex = 1;
            cboSelloVertical.SelectedIndex = 1;
            cboFechElabEnfardadora.SelectedIndex = 1;
            cboCodBarra13.SelectedIndex = 1;
            cboCodBarraDUN14.SelectedIndex = 1;
            cboSelloHorizContenedora.SelectedIndex = 1;
            cboSelloVertContenedora.SelectedIndex = 1;

        }

        protected void Atras_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/Calidad/RegistroVerificacionBolsas.aspx");
        }

        protected void GvDatosDetalle_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 135, "Elimina Registro verif.bol.det");

            UsuarioClass us = new UsuarioClass();

            var veri = us.idUsuarioVerificador(Convert.ToInt32(Session["IDCVTUsuario"]));

            if (veri == "False")
            {
                e.Cancel = true;
            }
        }

        protected void GvDatosDetalle_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 135, "Actualiza Registro verif.bol.det");

           
        }

        protected void GvDatosDetalle_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            UsuarioClass us = new UsuarioClass();

            var veri = us.idUsuarioVerificador(Convert.ToInt32(Session["IDCVTUsuario"]));

            if (veri == "False")
            {
                GvDatosDetalle.SettingsPopup.EditForm.ShowFooter = true;
                GvDatosDetalle.SettingsText.PopupEditFormFooterText = "solo usuarios verificadores pueden editar";
                GvDatosDetalle.StylesPopup.EditForm.Footer.ForeColor = System.Drawing.Color.Red;

                e.Cancel = true;

            }
        }
    }
}