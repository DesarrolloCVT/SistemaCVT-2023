using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Web.UI;

namespace CVT_MermasRecepcion.Produccion
{
    public partial class DetalleControlEnvasadoPT : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dv2Mot.Visible = false;
            dv1Datos.Visible = false;
            Div1.Visible = false;
            Div2.Visible = false;

            ProduccionClass pc = new ProduccionClass();
            int Est = pc.ObtieneEstadoControlEnv(Convert.ToInt32(Session["IdControlEnvPT"]));

            int dOf = pc.ObtieneOF(Convert.ToInt32(Session["IdControlEnvPT"]));

            lblti.InnerText = "Detalle Control Envasado  OF N°: " + dOf.ToString();
            if (Est == 1)
            {
                btnAgregarFilmImp.Enabled = true;
                btnAgregarFimlEnf.Enabled = true;

            }
            else
            {
                btnAgregarFilmImp.Enabled = false;
                btnAgregarFimlEnf.Enabled = false;
            }

        }

        #region agrega Film
        protected void btnAgregarFilmImp_Click(object sender, EventArgs e)
        {
            ProduccionClass Pcla = new ProduccionClass();
            CVT_ControlEnvasadoPT_Detalle CenDet = new CVT_ControlEnvasadoPT_Detalle();

            ControlFilmClass cfc = new ControlFilmClass();

            string idProv = "";
            //decimal Cntidad = Convert.ToDecimal(Session["Cant"]);
            if (cboTipoFilmImp.SelectedIndex == 1)
            {
                CenDet.ID_ControlEnvPT = Convert.ToInt32(Session["IdControlEnvPT"]);
                CenDet.Tipo = cboTipoFilmImp.Value.ToString();
                CenDet.Proveedor = cboProveedorFilmImp.Value.ToString(); ;
                CenDet.Lote = lblLote.Text + lotImp.Text;
                CenDet.Cantidad = Convert.ToDecimal(txtCantidadFilmImp.Text);
                CenDet.TipoRegistro = 1;
                CenDet.Id_Usuario = Convert.ToInt32(Session["IDCVTUsuario"]);
                CenDet.FechaRegistro = DateTime.Now;
                CenDet.MotivoMerma = Convert.ToInt32(cboMotivoMermaFilmImp.Value);
                CenDet.OrigenMerma = cboOrigenMerma.Value.ToString();

                bool ret = Pcla.InsertaControlEnvDetalle(CenDet);
                if (ret == true)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registro Guardado');", true);

                    limpiar();
                    txtNBobina.Text = string.Empty;
                    dv1Datos.Visible = false;

                    LogClass vLog = new LogClass();
                    vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 177, "Crea Registro film impreso");
                    GvDatosFilm.DataBind();

                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al Registrar , favor revisar o informar al administrador');", true);
                }
            }
            else
            {
                ProduccionClass pro = new ProduccionClass();
                int bob = pro.ObtieneNumBobinaDet(Convert.ToInt32(txtNBobina.Text));

                if (bob == 0)
                {

                    List<VW_DATOS_BOBINAS_FILM_PROD> lt = cfc.ObtieneDatosDeBobinaPROD(Convert.ToInt32(txtNBobina.Text));
                    foreach (var t in lt)
                    {
                        idProv = t.CardCode;
                    }

                    CenDet.ID_ControlEnvPT = Convert.ToInt32(Session["IdControlEnvPT"]);
                    CenDet.Tipo = cboTipoFilmImp.Value.ToString();
                    CenDet.Proveedor = idProv;
                    CenDet.Lote = txtLoteFilmImp.Text;
                    CenDet.Cantidad = Convert.ToDecimal(txtCantidadFilmImp.Text);
                    CenDet.TipoRegistro = 1;
                    CenDet.Id_Usuario = Convert.ToInt32(Session["IDCVTUsuario"]);
                    CenDet.FechaRegistro = DateTime.Now;
                    CenDet.NBobina = Convert.ToInt32(txtNBobina.Text);

                    bool ret = Pcla.InsertaControlEnvDetalle(CenDet);
                    if (ret == true)
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registro Guardado');", true);

                        cfc.ActualizaReservaControlProd(Convert.ToInt32(txtNBobina.Text), Convert.ToDecimal(txtCantidadFilmImp.Text));
                        limpiar();
                        txtNBobina.Text = string.Empty;
                        dv2Mot.Visible = false;
                        LogClass vLog = new LogClass();
                        vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 177, "Crea Registro film impreso");
                        GvDatosFilm.DataBind();

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al Registrar , favor revisar o informar al administrador');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al Registrar ,Bobina ya registrada');", true);
                }

            }



        }

        protected void btnAgregarFimlEnf_Click(object sender, EventArgs e)
        {
            ProduccionClass Pcla = new ProduccionClass();
            CVT_ControlEnvasadoPT_Detalle CenDet = new CVT_ControlEnvasadoPT_Detalle();

            ControlFilmClass cfc = new ControlFilmClass();

            string idProv = "";
            //decimal Cntidad = Convert.ToDecimal(Session["Cant2"]);
            if (cboTipoFilmEnf.SelectedIndex == 1)
            {


                CenDet.ID_ControlEnvPT = Convert.ToInt32(Session["IdControlEnvPT"]);
                CenDet.Tipo = cboTipoFilmEnf.Value.ToString();
                CenDet.Proveedor = cboProveeFilmEnf.Value.ToString();
                CenDet.Lote = lblLote2.Text + lotEnf.Text;
                CenDet.Cantidad = Convert.ToDecimal(txtCantFilEnf.Text);
                CenDet.TipoRegistro = 2;
                CenDet.Id_Usuario = Convert.ToInt32(Session["IDCVTUsuario"]);
                CenDet.FechaRegistro = DateTime.Now;
                CenDet.MotivoMerma = Convert.ToInt32(cboMotivoMermaEnf.Value);
                CenDet.OrigenMerma = cboOrigenMermaEnf.Value.ToString();

                bool ret = Pcla.InsertaControlEnvDetalle(CenDet);
                if (ret == true)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registro Guardado');", true);
                    limpiar2();
                    txtNbobinaEnf.Text = string.Empty;

                    LogClass vLog = new LogClass();
                    vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 177, "Crea Registro film impreso");
                    GvDatosEnf.DataBind();

                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al Registrar , favor revisar o informar al administrador');", true);
                }

            }
            else
            {
                List<VW_DATOS_BOBINAS_FILM_PROD> lt = cfc.ObtieneDatosDeBobinaPROD(Convert.ToInt32(txtNbobinaEnf.Text));
                ProduccionClass pro = new ProduccionClass();
              
                int bob = pro.ObtieneNumBobinaDet(Convert.ToInt32(txtNbobinaEnf.Text));

                if (bob == 0)
                {

                    foreach (var t in lt)
                    {
                        idProv = t.CardCode;
                    }

                    CenDet.ID_ControlEnvPT = Convert.ToInt32(Session["IdControlEnvPT"]);
                    CenDet.Tipo = cboTipoFilmEnf.Value.ToString();
                    CenDet.Proveedor = idProv;
                    CenDet.Lote = txtLoteFilmEnf.Text;
                    CenDet.Cantidad = Convert.ToDecimal(txtCantFilEnf.Text);
                    CenDet.TipoRegistro = 2;
                    CenDet.Id_Usuario = Convert.ToInt32(Session["IDCVTUsuario"]);
                    CenDet.FechaRegistro = DateTime.Now;
                    CenDet.NBobina = Convert.ToInt32(txtNbobinaEnf.Text);

                    bool ret = Pcla.InsertaControlEnvDetalle(CenDet);
                    if (ret == true)
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registro Guardado');", true);

                        cfc.ActualizaReservaControlProd(Convert.ToInt32(txtNbobinaEnf.Text), Convert.ToDecimal(txtCantFilEnf.Text));
                        limpiar2();
                        txtNbobinaEnf.Text = string.Empty;

                        LogClass vLog = new LogClass();
                        vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 177, "Crea Registro film impreso");
                        GvDatosEnf.DataBind();

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al Registrar , favor revisar o informar al administrador');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al Registrar , Bobina ya se encuentra registrada');", true);
                }

            }


        }

        #endregion 

        protected void txtNBobina_TextChanged(object sender, EventArgs e)
        {
            ControlFilmClass cfc = new ControlFilmClass();
            SAPClass sp = new SAPClass();
            dv1Datos.Visible = true;

            ProduccionClass pro = new ProduccionClass();

            if (txtNBobina.Text == "")
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error : ingrese numero de Bobina');", true);

            }
            else
            {

                int bob = pro.ObtieneNumBobinaDet(Convert.ToInt32(txtNBobina.Text));
                if (bob == 0)
                {
                    List<VW_DATOS_BOBINAS_FILM_PROD> lt = cfc.ObtieneDatosDeBobinaPROD(Convert.ToInt32(txtNBobina.Text));

                    if (lt.Count != 0)
                    {
                        foreach (var t in lt)
                        {
                            string idProv = cfc.ObtieneProveedorRecepFilm(Convert.ToInt32(t.FolioRecep_Film));
                            string nomProve = sp.ObtieneNombreProveedorFilm(idProv);

                            txtProveedor.Text = t.CardName;
                            txtLoteFilmImp.Text = t.LoteInterno;
                            txtCantidadFilmImp.Text = t.PesoNeto.ToString();
                            cboTipoFilmImp.Enabled = true;
                            Session["Cant"] = t.PesoNeto;
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error : Bobina se encuentra con reserva , o no se encuentra en su bodega, Favor regularizar');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error : Bobina ya se encuentra Registrada');", true);
                }

            }
        }
        protected void txtNbobinaEnf_TextChanged(object sender, EventArgs e)
        {
            ControlFilmClass cfc = new ControlFilmClass();
            SAPClass sp = new SAPClass();
            Div2.Visible = true;

            ProduccionClass pro = new ProduccionClass();



            if (txtNbobinaEnf.Text == "")
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error : ingrese numero de Bobina');", true);

            }
            else
            {

                int bob = pro.ObtieneNumBobinaDet(Convert.ToInt32(txtNbobinaEnf.Text));
                if (bob == 0)
                {
                    List<VW_DATOS_BOBINAS_FILM_PROD> lt = cfc.ObtieneDatosDeBobinaPROD(Convert.ToInt32(txtNbobinaEnf.Text));

                    if (lt.Count != 0)
                    {
                        foreach (var t in lt)
                        {
                            string idProv = cfc.ObtieneProveedorRecepFilm(Convert.ToInt32(t.FolioRecep_Film));
                            string nomProve = sp.ObtieneNombreProveedorFilm(idProv);

                            txtProveedorEnf.Text = t.CardName;
                            txtLoteFilmEnf.Text = t.LoteInterno;
                            txtCantFilEnf.Text = t.PesoNeto.ToString();
                            cboTipoFilmEnf.Enabled = true;
                            Session["Cant2"] = t.PesoNeto;
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error : Bobina se encuentra con reserva , o no se encuentra en su bodega, Favor regularizar');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error : Bobina ya se encuentra Registrada');", true);
                }

            }
        }

        protected void cboTipoFilmImp_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboTipoFilmImp.SelectedIndex == 1)
            {
                txtCantidadFilmImp.ReadOnly = false;
                txtCantidadFilmImp.Border.BorderColor = System.Drawing.Color.Red;
                dv2Mot.Visible = true;

                txtProveedor.Text = string.Empty;
                txtLoteFilmImp.Text = string.Empty;
                txtCantidadFilmImp.Text = string.Empty;
                cboMotivoMermaFilmImp.SelectedIndex = -1;
                cboOrigenMerma.SelectedIndex = -1;

            }
            else
            {
                txtCantidadFilmImp.ReadOnly = true;
                txtCantidadFilmImp.Border.BorderColor = System.Drawing.Color.Blue;
                dv1Datos.Visible = true;

                txtProveedor.Text = string.Empty;
                txtLoteFilmImp.Text = string.Empty;
                txtCantidadFilmImp.Text = string.Empty;
                cboMotivoMermaFilmImp.SelectedIndex = -1;
                cboOrigenMerma.SelectedIndex = -1;

            }
        }
        protected void cboTipoFilmEnf_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboTipoFilmEnf.SelectedIndex == 1)
            {
                txtCantFilEnf.ReadOnly = false;
                txtCantFilEnf.Border.BorderColor = System.Drawing.Color.Red;
                Div1.Visible = true;

                txtProveedorEnf.Text = string.Empty;
                txtLoteFilmEnf.Text = string.Empty;
                txtCantFilEnf.Text = string.Empty;
                cboMotivoMermaEnf.SelectedIndex = -1;
                cboOrigenMermaEnf.SelectedIndex = -1;

            }
            else
            {
                txtCantFilEnf.ReadOnly = true;
                txtCantFilEnf.Border.BorderColor = System.Drawing.Color.Blue;
                Div2.Visible = true;

                txtProveedorEnf.Text = string.Empty;
                txtLoteFilmEnf.Text = string.Empty;
                txtCantFilEnf.Text = string.Empty;
                cboMotivoMermaEnf.SelectedIndex = -1;
                cboOrigenMermaEnf.SelectedIndex = -1;
            }
        }


        #region limpieza y export


        protected void limpiar()
        {

            txtProveedor.Text = string.Empty;
            txtLoteFilmImp.Text = string.Empty;
            txtCantidadFilmImp.Text = string.Empty;
            cboTipoFilmImp.SelectedIndex = -1;
            cboMotivoMermaFilmImp.SelectedIndex = -1;
            cboOrigenMerma.SelectedIndex = -1;
            txtCantidadFilmImp.ReadOnly = true;
            txtCantidadFilmImp.Border.BorderColor = System.Drawing.Color.Blue;


        }
        protected void limpiar2()
        {
            cboTipoFilmEnf.SelectedIndex = -1;
            txtProveedorEnf.Text = string.Empty;
            txtLoteFilmEnf.Text = string.Empty;
            txtCantFilEnf.Text = string.Empty;
            cboTipoFilmEnf.SelectedIndex = -1;
            cboMotivoMermaEnf.SelectedIndex = -1;
            cboOrigenMerma.SelectedIndex = -1;
            txtCantFilEnf.ReadOnly = true;
            txtCantFilEnf.Border.BorderColor = System.Drawing.Color.Blue;
        }
        protected void Atras_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/Produccion/ControlEnvPT.aspx");
        }

        protected void GvDatosFilm_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 177, "Elimina Registro film impreso");

            ControlFilmClass cfc = new ControlFilmClass();
            int bob = Convert.ToInt32(e.Values["NBobina"]);

            UsuarioClass us = new UsuarioClass();

            var veri = us.idUsuarioVerificador(Convert.ToInt32(Session["IDCVTUsuario"]));

            if (veri == "False")
            {
                e.Cancel = true;
            }else
            if (bob != 0)
            {
                cfc.ActualizaReservaControlProd(bob, 0);
            }
        }

        protected void GvDatosFilm_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 177, "Actualiza Registro film impreso");

            UsuarioClass us = new UsuarioClass();

            var veri = us.idUsuarioVerificador(Convert.ToInt32(Session["IDCVTUsuario"]));

            if (veri == "False")
            {
                GvDatosFilm.SettingsPopup.EditForm.ShowFooter = true;
                GvDatosFilm.SettingsText.PopupEditFormFooterText = "solo usuarios verificadores pueden editar";
                GvDatosFilm.StylesPopup.EditForm.Footer.ForeColor = System.Drawing.Color.Red;
                e.Cancel = true;
            }
        }

        protected void GvDatosEnf_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 177, "Elimina Registro film Enfar.");

            ControlFilmClass cfc = new ControlFilmClass();
            int bob = Convert.ToInt32(e.Values["NBobina"]);

            UsuarioClass us = new UsuarioClass();

            var veri = us.idUsuarioVerificador(Convert.ToInt32(Session["IDCVTUsuario"]));

            if (veri == "False")
            {
                e.Cancel = true;
            }else
            if (bob != 0)
            {
                cfc.ActualizaReservaControlProd(bob, 0);
            }
        }

        protected void GvDatosEnf_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 177, "Elimina Registro film Enfar.");

            UsuarioClass us = new UsuarioClass();

            var veri = us.idUsuarioVerificador(Convert.ToInt32(Session["IDCVTUsuario"]));

            if (veri == "False")
            {
                GvDatosEnf.SettingsPopup.EditForm.ShowFooter = true;
                GvDatosEnf.SettingsText.PopupEditFormFooterText = "solo usuarios verificadores pueden editar";
                GvDatosEnf.StylesPopup.EditForm.Footer.ForeColor = System.Drawing.Color.Red;
                e.Cancel = true;
            }
        }



        #endregion

        protected void cboProveedorFilmImp_SelectedIndexChanged(object sender, EventArgs e)
        {
            ProduccionClass Pcla = new ProduccionClass();
            dv2Mot.Visible = true;

            string sigla = Pcla.ObtieneSiglaProveedor(cboProveedorFilmImp.Value.ToString());

            lblLote.Text = sigla + "000";
        }

        protected void cboProveeFilmEnf_SelectedIndexChanged(object sender, EventArgs e)
        {
            ProduccionClass Pcla = new ProduccionClass();
            Div1.Visible = true;

            string sigla = Pcla.ObtieneSiglaProveedor(cboProveeFilmEnf.Value.ToString());

            lblLote2.Text = sigla + "000";
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

        protected void GvDatosFilm_CommandButtonInitialize(object sender, DevExpress.Web.ASPxGridViewCommandButtonEventArgs e)
        {

            if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Edit)
            {
                e.Visible = EvaluaEstadoPlan((DevExpress.Web.ASPxGridView)sender, e.VisibleIndex);
            }
            if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Delete)
            {
                e.Visible = EvaluaEstadoPlan((DevExpress.Web.ASPxGridView)sender, e.VisibleIndex);
            }
        }

        protected void GvDatosEnf_CommandButtonInitialize(object sender, DevExpress.Web.ASPxGridViewCommandButtonEventArgs e)
        {

            if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Edit)
            {
                e.Visible = EvaluaEstadoPlan((DevExpress.Web.ASPxGridView)sender, e.VisibleIndex);
            }
            if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Delete)
            {
                e.Visible = EvaluaEstadoPlan((DevExpress.Web.ASPxGridView)sender, e.VisibleIndex);
            }
        }
    }
}