using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Produccion
{
    public partial class MonitoreoPuestaEnMarchaMaquinaPT : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GvEncabezado.DataBind();
            GvDatosLinea.DataBind();
            GvMonitoreo.DataBind();
            GvDatosEnvasadora.DataBind();
            GvCintaImp.DataBind();

            ProduccionClass pc = new ProduccionClass();
            int Est = pc.ObtieneEstadoControlEnv(Convert.ToInt32(Session["IdControlEnvPT"]));

            int dOf = pc.ObtieneOF(Convert.ToInt32(Session["IdControlEnvPT"]));

            lblti.InnerText = "Detalle Control Envasado  OF N°: " + dOf.ToString();
            //if (Est == 1)
            //{
            //    cmdNew.Visible = true;
            //    ImageButton2.Visible = true;
            //    ImageButton1.Visible = true;
            //    ImageButton3.Visible = true;


            //}
            //else
            //{
            //    cmdNew.Visible = false;
            //    ImageButton2.Visible = false;
            //    ImageButton1.Visible = false;
            //    ImageButton3.Visible = false;
            //}
        }

        protected void Atras_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/Produccion/ControlEnvPT.aspx");
        }

        protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        {
            //GvEncabezado.AddNewRow();
            popPuestaEnMarcha.ShowOnPageLoad = true;
        }

        protected void cmdNew_Click1(object sender, ImageClickEventArgs e)
        {
            //GvDatosLinea.AddNewRow();
            PopLinea.ShowOnPageLoad = true;
        }

        protected void cmdNew_Click2(object sender, ImageClickEventArgs e)
        {
            GvMonitoreo.AddNewRow();
        }

        protected void GvMonitoreo_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["ID_ControlEnvPT"] = Convert.ToInt32(Session["IdControlEnvPT"]);
            e.NewValues["FechaRegistro"] = DateTime.Now;
            e.NewValues["Id_Usuario"] = Convert.ToInt32(Session["IDCVTUsuario"]);
        }

        protected void cmdNew_Click3(object sender, ImageClickEventArgs e)
        {

            popEnvFard.ShowOnPageLoad = true;
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            ProduccionClass pc = new ProduccionClass();
            CVT_ControlEnvasadoPT_PuestaEnMarchaMaquina cpe = new CVT_ControlEnvasadoPT_PuestaEnMarchaMaquina();

            cpe.Operador1 = Convert.ToInt32(cboOperador.Value);
            cpe.Operador2 = Convert.ToInt32(cboOperador2.Value);
            cpe.LineaOperativa = Convert.ToString(cboLinea.Value);
            cpe.TTO1 = Convert.ToString(cboCintaTTO1.Value);
            cpe.TTO1LimPiezaCabezal = Convert.ToString(cboTTO1limCabezal.Value);
            cpe.TTO2 = Convert.ToString(cboCintaTTO2.Value);
            cpe.TTO2LimPiezaCabezal = Convert.ToString(cboTTO2LimpCabezal.Value);
            cpe.TermoEnfardadora = Convert.ToString(cbotermo.Value);
            cpe.TermoEnfardadoraLimpiezaCab = Convert.ToString(cbotermoLimcabezal.Value);
            cpe.ID_ControlEnvPT = Convert.ToInt32(Session["IdControlEnvPT"]);
            cpe.Id_Usuario = Convert.ToInt32(Session["IDCVTUsuario"]);
            cpe.FechaRegistro = DateTime.Now;

            bool resp = pc.InsertaMonitoreoPuestaEnMarcha(cpe);
            if (resp == true)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registro Guardado');", true);
                GvEncabezado.DataBind();
                limpiarEN();
                popPuestaEnMarcha.ShowOnPageLoad = false;
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al Registrar Contactar con Administrador');", true);
                limpiarEN();

            }
        }

        protected void limpiarEN()
        {
            cboOperador.SelectedIndex = -1;
            cboOperador2.SelectedIndex = -1;
            cboLinea.SelectedIndex = -1;
            cboCintaTTO1.SelectedIndex = 0;
            cboTTO1limCabezal.SelectedIndex = 0;
            cboCintaTTO2.SelectedIndex = 0;
            cboTTO2LimpCabezal.SelectedIndex = 0;
            cbotermo.SelectedIndex = 0;
            cbotermoLimcabezal.SelectedIndex = 0;
        }

        protected void btnGuardar2_Click(object sender, EventArgs e)
        {
            ProduccionClass pc = new ProduccionClass();
            CVT_ContorlEnvasadoPT_PuestaEnMarchaLinea pnl = new CVT_ContorlEnvasadoPT_PuestaEnMarchaLinea();

            pnl.TieneFilmAMano = Convert.ToInt16(cboFilmMano.Value);
            pnl.CambioTeflones = Convert.ToInt16(cboCambioTeflones.Value);
            pnl.CambioNicrones = Convert.ToInt16(cboCambioNicrones.Value);
            pnl.ParadaEmergencia = Convert.ToInt16(cboParadaEmergencia.Value);
            pnl.ProteccionesFuncionando = Convert.ToInt16(cboProteccionesFuncionando.Value);
            pnl.FijacionesdeBigote = Convert.ToInt16(cboFijacionesBigote.Value);
            pnl.FijacionesConoAlimentador1 = Convert.ToInt16(cboConoAlimentador1.Value);
            pnl.FijacionesConoAlimentador2 = Convert.ToInt16(cboConoAlimentador2.Value);
            pnl.FijacionCopaTubo1 = Convert.ToInt16(cboCopaTubo1.Value);
            pnl.FijacionCopaTubo2 = Convert.ToInt16(cboCopatubo2.Value);
            pnl.ID_ControlEnvPT = Convert.ToInt32(Session["IdControlEnvPT"]);
            pnl.Id_Usuario = Convert.ToInt32(Session["IDCVTUsuario"]);
            pnl.FechaRegistro = DateTime.Now;

            bool resul = pc.InsertaPuestaEnMarchaLinea(pnl);
            if (resul == true)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registro Guardado');", true);
                GvDatosLinea.DataBind();
                limpiarLI();
                PopLinea.ShowOnPageLoad = false;
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al Registrar Contactar con Administrador');", true);
                limpiarLI();

            }
        }

        protected void limpiarLI()
        {
            cboFilmMano.SelectedIndex = 0;
            cboCambioTeflones.SelectedIndex = 0;
            cboCambioNicrones.SelectedIndex = 0;
            cboParadaEmergencia.SelectedIndex = 0;
            cboProteccionesFuncionando.SelectedIndex = 0;
            cboFijacionesBigote.SelectedIndex = 0;
            cboConoAlimentador1.SelectedIndex = 0;
            cboConoAlimentador2.SelectedIndex = 0;
            cboCopaTubo1.SelectedIndex = 0;
            cboCopatubo2.SelectedIndex = 0;
        }

        protected void btnGuardar3_Click(object sender, EventArgs e)
        {
            ProduccionClass pc = new ProduccionClass();
            CVT_ControlEnvasadoPT_PuestaEnMarchaEnvasadora cpe = new CVT_ControlEnvasadoPT_PuestaEnMarchaEnvasadora();

            cpe.LimpiezaCorreasTraccionadoras = Convert.ToInt16(cboCorrTrac.Value);
            cpe.LimpiezaHombrosFormadores = Convert.ToInt16(cboHomTraccion.Value);
            cpe.LimpiezaRodillosTraccionadores = Convert.ToInt16(cborrodillosTracc.Value);
            cpe.LimpiezaMordazas = Convert.ToInt16(cboMordazas.Value);
            //cpe.EstadoVasosDosificadores = Convert.ToInt16(cboVasosDosificadores.Value);
            cpe.LimpiezaCintaTransportadora = 0; /*Convert.ToInt16(cboCintaTransportadora.Value);*/
            //cpe.EstadoGomaApoyoVertHor = Convert.ToInt16(cboEstadoGoma.Value);
            cpe.EstadoConexionComponentesNeumaticos = 0;/* Convert.ToInt16(cboEstadoConexion.Value);*/
            cpe.Equipo_Monitoreo = Convert.ToString(cboEquipoMon.Value);
            cpe.ID_ControlEnvPT = Convert.ToInt32(Session["IdControlEnvPT"]);
            cpe.Id_Usuario = Convert.ToInt32(Session["IDCVTUsuario"]);
            cpe.FechaRegistro = DateTime.Now;

            bool resp = pc.InsertaPuestaEnMarchaEnvasadora(cpe);

            if (resp == true)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registro Guardado');", true);
                GvDatosEnvasadora.DataBind();
                limpiarENV();
                popEnvFard.ShowOnPageLoad = false;
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al Registrar Contactar con Administrador');", true);
                limpiarLI();

            }

        }

        protected void limpiarENV()
        {
            cboCorrTrac.SelectedIndex = 0;
            cboHomTraccion.SelectedIndex = 0;
            cborrodillosTracc.SelectedIndex = 0;
            cboMordazas.SelectedIndex = 0;
            //cboVasosDosificadores.SelectedIndex = 0;
            //cboCintaTransportadora.SelectedIndex = 0;
            //cboEstadoGoma.SelectedIndex = 0;
            //cboEstadoConexion.SelectedIndex = 0;
            cboEquipoMon.SelectedIndex = -1;
        }

        protected void cboEquipoMon_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboEquipoMon.Value.Equals("Envasadora"))
            {

                cboCorrTrac.SelectedIndex = 0;
                cboHomTraccion.SelectedIndex = 0;
                cborrodillosTracc.SelectedIndex = 0;
                cboMordazas.SelectedIndex = 0;
                //cboVasosDosificadores.SelectedIndex = 0;
                ////cboCintaTransportadora.SelectedIndex = 0;
                //cboEstadoGoma.SelectedIndex = 0;
                //cboEstadoConexion.SelectedIndex = 2;
            }
            else
            {
                cboCorrTrac.SelectedIndex = 0;
                cboHomTraccion.SelectedIndex = 0;
                cborrodillosTracc.SelectedIndex = 0;
                cboMordazas.SelectedIndex = 0;
                //cboVasosDosificadores.SelectedIndex = 2;
                //cboCintaTransportadora.SelectedIndex = 2;
                //cboEstadoGoma.SelectedIndex = 2;
                //cboEstadoConexion.SelectedIndex = 0;
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

        protected void GvEncabezado_CommandButtonInitialize(object sender, DevExpress.Web.ASPxGridViewCommandButtonEventArgs e)
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

        protected void GvMonitoreo_CommandButtonInitialize(object sender, DevExpress.Web.ASPxGridViewCommandButtonEventArgs e)
        {
            //if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Edit)
            //{
            //    e.Visible = EvaluaEstadoPlan((DevExpress.Web.ASPxGridView)sender, e.VisibleIndex);
            //}
            //if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Delete)
            //{
            //    e.Visible = EvaluaEstadoPlan((DevExpress.Web.ASPxGridView)sender, e.VisibleIndex);
            //}
        }

        protected void GvDatosLinea_CommandButtonInitialize(object sender, DevExpress.Web.ASPxGridViewCommandButtonEventArgs e)
        {
            //if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Edit)
            //{
            //    e.Visible = EvaluaEstadoPlan((DevExpress.Web.ASPxGridView)sender, e.VisibleIndex);
            //}
            //if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Delete)
            //{
            //    e.Visible = EvaluaEstadoPlan((DevExpress.Web.ASPxGridView)sender, e.VisibleIndex);
            //}
        }

        protected void GvDatosEnvasadora_CommandButtonInitialize(object sender, DevExpress.Web.ASPxGridViewCommandButtonEventArgs e)
        {
            //if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Edit)
            //{
            //    e.Visible = EvaluaEstadoPlan((DevExpress.Web.ASPxGridView)sender, e.VisibleIndex);
            //}
            //if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Delete)
            //{
            //    e.Visible = EvaluaEstadoPlan((DevExpress.Web.ASPxGridView)sender, e.VisibleIndex);
            //}
        }

        protected void btnCintaImp_Click(object sender, ImageClickEventArgs e)
        {
            PopCintaImpre.ShowOnPageLoad = true;
        }

        protected void btnGuardarCintImp_Click(object sender, EventArgs e)
        {
            ProduccionClass pc = new ProduccionClass();
            CVT_ControlEnvasadoPT_UsoCintaImpresion CCn = new CVT_ControlEnvasadoPT_UsoCintaImpresion();

            CCn.Cantidad = Convert.ToInt32(txtCantCintaImp.Text);
            CCn.Lote = txtLoteCintImp.Text;
            CCn.ID_ControlEnvPT = Convert.ToInt32(Session["IdControlEnvPT"]);
            CCn.Id_Usuario = Convert.ToInt32(Session["IDCVTUsuario"]);
            CCn.FechaRegistro = DateTime.Now;

            bool resul = pc.InsertaCintaImpresion(CCn);
            if (resul == true)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registro Guardado');", true);
                GvCintaImp.DataBind();
                txtCantCintaImp.Text = string.Empty;
                txtLoteCintImp.Text = string.Empty;
                PopCintaImpre.ShowOnPageLoad = false;
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al Registrar Contactar con Administrador');", true);
                txtCantCintaImp.Text = string.Empty;
                txtLoteCintImp.Text = string.Empty;

            }
        }

        protected void GvEncabezado_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            UsuarioClass us = new UsuarioClass();

            var veri = us.idUsuarioVerificador(Convert.ToInt32(Session["IDCVTUsuario"]));

            if (veri == "False")
            {
                e.Cancel = true;
            }
        }

        protected void GvEncabezado_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            UsuarioClass us = new UsuarioClass();

            var veri = us.idUsuarioVerificador(Convert.ToInt32(Session["IDCVTUsuario"]));

            if (veri == "False")
            {
                GvEncabezado.SettingsPopup.EditForm.ShowFooter = true;
                GvEncabezado.SettingsText.PopupEditFormFooterText = "solo usuarios verificadores pueden editar";
                GvEncabezado.StylesPopup.EditForm.Footer.ForeColor = System.Drawing.Color.Red;
                e.Cancel = true;
            }
        }

        protected void GvMonitoreo_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            UsuarioClass us = new UsuarioClass();

            var veri = us.idUsuarioVerificador(Convert.ToInt32(Session["IDCVTUsuario"]));

            if (veri == "False")
            {
                e.Cancel = true;
            }
        }

        protected void GvMonitoreo_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            UsuarioClass us = new UsuarioClass();

            var veri = us.idUsuarioVerificador(Convert.ToInt32(Session["IDCVTUsuario"]));

            if (veri == "False")
            {
                GvMonitoreo.SettingsPopup.EditForm.ShowFooter = true;
                GvMonitoreo.SettingsText.PopupEditFormFooterText = "solo usuarios verificadores pueden editar";
                GvMonitoreo.StylesPopup.EditForm.Footer.ForeColor = System.Drawing.Color.Red;
                e.Cancel = true;
            }
        }

        protected void GvDatosLinea_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            UsuarioClass us = new UsuarioClass();

            var veri = us.idUsuarioVerificador(Convert.ToInt32(Session["IDCVTUsuario"]));

            if (veri == "False")
            {
                e.Cancel = true;
            }
        }

        protected void GvDatosLinea_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            UsuarioClass us = new UsuarioClass();

            var veri = us.idUsuarioVerificador(Convert.ToInt32(Session["IDCVTUsuario"]));

            if (veri == "False")
            {
                GvDatosLinea.SettingsPopup.EditForm.ShowFooter = true;
                GvDatosLinea.SettingsText.PopupEditFormFooterText = "solo usuarios verificadores pueden editar";
                GvDatosLinea.StylesPopup.EditForm.Footer.ForeColor = System.Drawing.Color.Red;
                e.Cancel = true;
            }
        }

        protected void GvDatosEnvasadora_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            UsuarioClass us = new UsuarioClass();

            var veri = us.idUsuarioVerificador(Convert.ToInt32(Session["IDCVTUsuario"]));

            if (veri == "False")
            {
                e.Cancel = true;
            }
        }

        protected void GvDatosEnvasadora_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            UsuarioClass us = new UsuarioClass();

            var veri = us.idUsuarioVerificador(Convert.ToInt32(Session["IDCVTUsuario"]));

            if (veri == "False")
            {
                GvDatosEnvasadora.SettingsPopup.EditForm.ShowFooter = true;
                GvDatosEnvasadora.SettingsText.PopupEditFormFooterText = "solo usuarios verificadores pueden editar";
                GvDatosEnvasadora.StylesPopup.EditForm.Footer.ForeColor = System.Drawing.Color.Red;
                e.Cancel = true;
            }
        }

        protected void GvCintaImp_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            UsuarioClass us = new UsuarioClass();

            var veri = us.idUsuarioVerificador(Convert.ToInt32(Session["IDCVTUsuario"]));

            if (veri == "False")
            {
                e.Cancel = true;
            }
        }

        protected void GvCintaImp_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            UsuarioClass us = new UsuarioClass();

            var veri = us.idUsuarioVerificador(Convert.ToInt32(Session["IDCVTUsuario"]));

            if (veri == "False")
            {
                GvCintaImp.SettingsPopup.EditForm.ShowFooter = true;
                GvCintaImp.SettingsText.PopupEditFormFooterText = "solo usuarios verificadores pueden editar";
                GvCintaImp.StylesPopup.EditForm.Footer.ForeColor = System.Drawing.Color.Red;
                e.Cancel = true;
            }
        }
    }
}