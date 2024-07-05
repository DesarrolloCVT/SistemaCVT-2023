using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Produccion
{
    public partial class ControlPesoLineaPT : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GvDatos.DataBind();


            ProduccionClass pc = new ProduccionClass();
            int Est = pc.ObtieneEstadoControlEnv(Convert.ToInt32(Session["IdControlEnvPT"]));

            int dOf = pc.ObtieneOF(Convert.ToInt32(Session["IdControlEnvPT"]));

            lblti.InnerText = "Control Peso Envasado OF N°: " + dOf.ToString();
            //if (Est == 1)
            //{
            //    cmdNew.Visible = true;
            //    //cmdNew.Enabled = true;
            //}
            //else
            //{
            //    cmdNew.Visible = false;
            //    //btnAgregarFimlEnf.Enabled = false;
            //}
        }

        protected void Atras_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/Produccion/ControlEnvPT.aspx");
        }

        protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        {
            //GvDatos.AddNewRow();
            popControlPeso.ShowOnPageLoad = true;
            dteFechElab.Date = DateTime.Now;
        }

        //protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        //{
        //    e.NewValues["ID_ControlEnvPT"] = Convert.ToInt32(Session["IdControlEnvPT"]);
        //    e.NewValues["FechaRegistro"] = DateTime.Now;
        //    e.NewValues["Id_Usuario"]= Convert.ToInt32(Session["IDCVTUsuario"]);
        //}

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            ProduccionClass pc = new ProduccionClass();
            CVT_ControlEnvasadoPT_ControlPesoLinea cpl = new CVT_ControlEnvasadoPT_ControlPesoLinea();
            DateTime? fain = null;
            if (dteFechVenc.Value == null) { fain = null; }

            cpl.ID_ControlEnvPT = Convert.ToInt32(Session["IdControlEnvPT"]);
            cpl.Linea = Convert.ToInt32(cboLinea.Value);
            cpl.Hora = TimeSpan.Parse(DateTime.Now.Hour.ToString()+":"+DateTime.Now.Minute.ToString());
            cpl.Fecha_Elaboracion = Convert.ToDateTime(dteFechElab.Value);
            cpl.Fecha_Vencimiento = dteFechVenc.Value == null ? fain : Convert.ToDateTime(dteFechVenc.Value);
            cpl.SelloHorizontal = Convert.ToInt16(cboSelloHori.Value);
            cpl.SelloVertical = Convert.ToInt16(cboSelloVert.Value);
            cpl.OrigenInjet = Convert.ToInt16(cboOrigenTTO.Value);
            cpl.OrigenImpreso = Convert.ToInt16(cboOrigenImpreso.Value);
            cpl.HoraCorrecta = Convert.ToInt16(cboHoraCorreta.Value);
            cpl.LoteCorrecto = Convert.ToInt16(cboLoteCorrecto.Value);
            cpl.TurnoCorrecto = Convert.ToInt16(cboTurnoCorrecto.Value);
            cpl.Vaso1 = Convert.ToInt32(txtVaso1.Text);
            cpl.Vaso2 = Convert.ToInt32(txtVaso2.Text);
            cpl.Vaso3 = Convert.ToInt32(txtVaso3.Text);
            cpl.Vaso4 = Convert.ToInt32(txtVaso4.Text);
            cpl.Cod_Barra_Bolsa = Convert.ToInt16(cboCodBarraBolsa.Value);
            cpl.Cod_Barra_Contenedora = Convert.ToInt16(cboCodBarraContenedora.Value);
            cpl.FechaRegistro = DateTime.Now;
            cpl.Id_Usuario = Convert.ToInt32(Session["IDCVTUsuario"]);
            bool ins = pc.InsertaControlPesoLinea(cpl);

            if (ins == true)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registro Guardado');", true);
                GvDatos.DataBind();
                popControlPeso.ShowOnPageLoad = false;

                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 177, "Crea Registro Control Peso");
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
            cboLinea.SelectedIndex = -1;
            txtHora.Text = string.Empty;
            dteFechElab.Date = DateTime.Now;
            dteFechVenc.Value = null;
            cboSelloHori.SelectedIndex = 0;
            cboSelloVert.SelectedIndex = 0;
            cboOrigenTTO.SelectedIndex = 0;
            cboOrigenImpreso.SelectedIndex = 0;
            cboHoraCorreta.SelectedIndex = 0;
            cboLoteCorrecto.SelectedIndex = 0;
            cboTurnoCorrecto.SelectedIndex = 0;
            cboCodBarraBolsa.SelectedIndex = 0;
            cboCodBarraContenedora.SelectedIndex = 0;
            txtVaso1.Text = string.Empty;
            txtVaso2.Text = string.Empty;
            txtVaso3.Text = string.Empty;
            txtVaso4.Text = string.Empty;
        }

        protected void GvDatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 177, "Elimina Registro control Peso");

            UsuarioClass us = new UsuarioClass();

            var veri = us.idUsuarioVerificador(Convert.ToInt32(Session["IDCVTUsuario"]));

            if (veri == "False")
            {
                e.Cancel = true;
            }
        }

        protected void GvDatos_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 177, "Edita Registro control Peso");

           
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

        protected void GvDatos_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
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
    }
}