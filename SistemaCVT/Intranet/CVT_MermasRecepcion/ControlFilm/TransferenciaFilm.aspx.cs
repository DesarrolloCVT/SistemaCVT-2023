using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Web.UI;

namespace CVT_MermasRecepcion.ControlFilm
{
    public partial class TransferenciaFilm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dteInicio.Date = DateTime.Now.AddDays(-9);
                dteTermino.Date = DateTime.Now.AddDays(1);
            }
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {

            if (e.Item.Name.Equals("Nuevo"))
            {
                PopNuevo.ShowOnPageLoad = true;
                dvDatoSol.Visible = false;
                tipDef.Visible = false;
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            GvDatos.DataBind();
        }

        protected void cboNumSolicitud_SelectedIndexChanged(object sender, EventArgs e)
        {
            ControlFilmClass cfc = new ControlFilmClass();
            UsuarioClass us = new UsuarioClass();

            if (cboNumSolicitud.SelectedIndex == -1)
            {
                dvDatoSol.Visible = false;
            }
            else
            {
                List<CVT_FILM_SOLICITUD_TRANSFERENCIA> dt = cfc.DatosSolicitudTransferencia(Convert.ToInt32(cboNumSolicitud.Value));

                //txtUsuario.Visible = true;
                //txtFechaSoli.Visible = true;
                dvDatoSol.Visible = true;
                foreach (var t in dt)
                {
                    txtOF.Text = t.NumeroOF.ToString();

                    string nomBodOrig = cfc.ObtieneNombreSitio(Convert.ToInt32(t.BodegaOrigen));
                    string nomBodDest = cfc.ObtieneNombreSitio(Convert.ToInt32(t.BodegaDestino));
                    string nomUser = us.TraeNomUsuario(Convert.ToInt32(t.IdUsuario));

                    decimal cntsoli = cfc.ObtieneCantSolicitada(t.Id_Solicitud);

                    cboBodOrigen.Value = nomBodOrig;
                    cboBodDestino.Value = nomBodDest;
                    txtUsuario.Text = nomUser;
                    txtFechaSoli.Text = t.FechaSolicitud.ToString();
                    txtCantSolicitada.Text = cntsoli.ToString();

                    //Session["idUserSol"] = t.IdUsuario;
                    //Session["FechSoli"] = t.FechaSolicitud;
                }
            }

        }

        protected void btnGuardar_Click1(object sender, EventArgs e)
        {
            int Bdestino = Convert.ToInt32(cboBodDestino.Value);
            int BOrigen = Convert.ToInt32(cboBodOrigen.Value);

            ControlFilmClass cfc = new ControlFilmClass();
            CVT_FILM_TRANSFERENCIA nuevo = new CVT_FILM_TRANSFERENCIA();

            if (cboNumSolicitud.Value != null)
            {
                nuevo.BodOrigen = BOrigen;
                nuevo.BodDestino = Bdestino;
                nuevo.FechaTransferencia = DateTime.Now;
                nuevo.UsuarioEnvia = Convert.ToInt32(Session["IDCVTUsuario"]);
                nuevo.Estado = 1;
                nuevo.EntidadMot = Convert.ToInt32(cboEntidad.Value);
                nuevo.NumeroOF = Convert.ToInt32(txtOF.Text);
                nuevo.NSolicitud = Convert.ToInt32(cboNumSolicitud.Value);
                nuevo.TipoDefecto = Convert.ToInt32(cboTipoDef.Value);

                bool res = cfc.InsertaTransfer(nuevo);
                cfc.ActualizaSolicitud(Convert.ToInt32(cboNumSolicitud.Value), 2);

                if (res == true)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registrado');", true);
                    limpiaDatos();
                    GvDatos.DataBind();
                    PopNuevo.ShowOnPageLoad = false;

                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al Registrar');", true);
                }
            }
            else
            {

                nuevo.BodOrigen = BOrigen;
                nuevo.BodDestino = Bdestino;
                nuevo.FechaTransferencia = DateTime.Now;
                nuevo.UsuarioEnvia = Convert.ToInt32(Session["IDCVTUsuario"]);
                nuevo.Estado = 1;
                nuevo.EntidadMot = Convert.ToInt32(cboEntidad.Value);
                nuevo.NumeroOF = Convert.ToInt32(txtOF.Text);
                nuevo.TipoDefecto = Convert.ToInt32(cboTipoDef.Value);

                bool res = cfc.InsertaTransfer(nuevo);
                cfc.ActualizaSolicitud(Convert.ToInt32(cboNumSolicitud.Value), 2);

                if (res == true)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registrado');", true);
                    limpiaDatos();
                    GvDatos.DataBind();
                    PopNuevo.ShowOnPageLoad = false;

                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al Registrar');", true);
                }
            }
        }

        private void limpiaDatos()
        {
            cboNumSolicitud.SelectedIndex = -1;
            txtOF.Text = string.Empty;
            cboBodOrigen.SelectedIndex = -1;
            cboBodDestino.SelectedIndex = -1;
            txtUsuario.Text = string.Empty;
            txtFechaSoli.Text = string.Empty;
            cboEntidad.SelectedIndex = -1;
            cboTipoDef.SelectedIndex = -1;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            limpiaDatos();
            PopNuevo.ShowOnPageLoad = false;
        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                Session["TransferId"] = e.KeyValue;
                Response.Redirect("~/ControlFilm/TransferenciaFilmDetalle.aspx");
            }
            if (e.CommandArgs.CommandName == "cmdAnula")
            {

                ControlFilmClass cfc = new ControlFilmClass();
                int TransferId = Convert.ToInt32(e.KeyValue);
                int CantDet = cfc.CuentaDetalleTransferenciaFilm(TransferId);

                int UserCreador = cfc.ObtieneIdUserTransfer(TransferId);
                int PreUsuario = Convert.ToInt32(Session["IDCVTUsuario"].ToString());

                int soli = cfc.ObtieneNsolicitudTransfer(TransferId);

                if (UserCreador == PreUsuario || Convert.ToInt32(Session["PerfilId"]) == 1)
                {
                    if (CantDet > 0)
                    {
                        cfc.CambiaEstadoTransferenciaFilm(TransferId, 4);
                        List<CVT_FILM_TRANSFERENCIA_DETALLE> dt = cfc.ObtieneDetalleTransferenciaFilm(TransferId);
                        foreach (var t in dt)
                        {
                            cfc.EliminaBultoTransferenciaFilm(TransferId, Convert.ToInt32(t.NBobina));
                            cfc.CambiaSoliTransf(TransferId);
                        }

                        cfc.ActualizaSolicitud(soli, 1);
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Transferencia Anulada Correctamente');", true);

                    }
                    else
                    {
                        cfc.ActualizaSolicitud(soli, 1);
                        cfc.CambiaEstadoTransferenciaFilm(TransferId, 4);
                        cfc.CambiaSoliTransf(TransferId);
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Transferencia Anulada Correctamente');", true);
                    }

                    GvDatos.DataBind();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Transferencia no puede ser Anulada Por : " + Session["NombreUsuario"].ToString() + "');", true);
                }


            }
            if (e.CommandArgs.CommandName == "cmdEnvia")
            {
                UsuarioClass user = new UsuarioClass();
                WMSClass vWMS = new WMSClass();

                ControlFilmClass cfc = new ControlFilmClass();

                int TransferId = Convert.ToInt32(e.KeyValue);

                int UserCreador = cfc.ObtieneIdUserTransfer(TransferId);
                int PreUsuario = Convert.ToInt32(Session["IDCVTUsuario"].ToString());
                int idBodegaDestino = cfc.TraeBodegaDestinoFilm(TransferId);

                string bodegaCreado = cfc.ObtieneBodegaTransferenciaFilm(TransferId);


                string bodegaCreadoDestino = cfc.ObtieneSBodegaDestinoTransferenciaFilm(TransferId);
                string bodegaUser = user.TraeBodegaUsuario(Convert.ToInt32(Session["IDCVTUsuario"]));

                try
                {
                    SAPClass vSAP = new SAPClass();
                    SAPFilmClass vSFilm = new SAPFilmClass();

                    ControlClass vControl = new ControlClass();
                    int IdTransfer = Convert.ToInt32(e.KeyValue);

                    int CantDet = cfc.CuentaDetalleTransferenciaFilm(IdTransfer);
                    if (CantDet > 0)
                    {
                        List<CVT_FILM_TRANSFERENCIA> tr = cfc.ObtieneInfoTransferenciaFilm(IdTransfer);
                        foreach (var en in tr)
                        {
                            string borigen = vWMS.ObtieneNombreCortoSitio(Convert.ToInt32(en.BodOrigen));
                            string bdestino = vWMS.ObtieneNombreCortoSitio(Convert.ToInt32(en.BodDestino));

                            if (vSFilm.ObtieneDocNumTransferenciaSAPFilm(TransferId) == 0)//Editar SAP
                            {
                                string errors = vSFilm.CreaTransferenciaFilm(TransferId, borigen, bdestino, Session["CIDUsuario"].ToString());//EDITAR SAP
                                if (errors == "0")
                                {
                                    int? LayoutDestino = 0;

                                    cfc.CierreTransferenciaPROCFilm(TransferId);

                                    cfc.ActualizaFechaUsuarioEstadoTransferenciaFilm(en.Id_TransferenciaFilm, PreUsuario);
                                    cfc.ActualizaBodegaBobinaTransferencia(TransferId, idBodegaDestino);

                                }
                                else
                                {
                                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + errors + "');", true);
                                }
                            }
                            else
                            {
                                List<CVT_FILM_TRANSFERENCIA_DETALLE> dt = cfc.ObtieneDetalleTransferenciaFilm(TransferId);
                                foreach (var t in dt)
                                {
                                    int? LayoutDestino = 0;
                                    //int staffid = vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString());
                                    cfc.CierreTransferenciaPROCFilm(TransferId);
                                }

                                cfc.ActualizaFechaUsuarioEstadoTransferenciaFilm(en.Id_TransferenciaFilm, PreUsuario);
                                cfc.ActualizaBodegaBobinaTransferencia(TransferId, idBodegaDestino);

                            }
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Transferencia no contiene Bultos');", true);
                    }
                }
                catch
                {
                }

                GvDatos.DataBind();
            }
        }

        protected void GvDatos_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != DevExpress.Web.GridViewRowType.Data) return;
            int Estado = (int)e.GetValue("Estado");
            if (Estado == 1)
            {
                System.Web.UI.WebControls.ImageButton imgAnula = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Anula") as System.Web.UI.WebControls.ImageButton;
                imgAnula.Visible = true;
                System.Web.UI.WebControls.ImageButton imgPreConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Envia") as System.Web.UI.WebControls.ImageButton;
                imgPreConfirma.Visible = true;

            }
            if (Estado == 2)
            {
                System.Web.UI.WebControls.ImageButton imgAnula = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Anula") as System.Web.UI.WebControls.ImageButton;
                imgAnula.Visible = true;
                System.Web.UI.WebControls.ImageButton imgPreConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Envia") as System.Web.UI.WebControls.ImageButton;
                imgPreConfirma.Visible = true;
            }
            if (Estado == 3)
            {

                System.Web.UI.WebControls.ImageButton imgAnula = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Anula") as System.Web.UI.WebControls.ImageButton;
                imgAnula.Visible = false;
                System.Web.UI.WebControls.ImageButton imgPreConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Envia") as System.Web.UI.WebControls.ImageButton;
                imgPreConfirma.Visible = false;
            }
            if (Estado == 4)
            {
                System.Web.UI.WebControls.ImageButton imgAnula = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Anula") as System.Web.UI.WebControls.ImageButton;
                imgAnula.Visible = false;
                System.Web.UI.WebControls.ImageButton imgPreConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Envia") as System.Web.UI.WebControls.ImageButton;
                imgPreConfirma.Visible = false;
            }
        }


        private bool EvaluaEstadoPlan(DevExpress.Web.ASPxGridView grid, int visibleindex)
        {
            bool ret = true;
            int Estado = Convert.ToInt32(grid.GetRowValues(visibleindex, "Estado").ToString());
            if (Estado != 1)
            {
                ret = false;
            }
            return ret;
        }

        protected void GvDatos_CommandButtonInitialize(object sender, DevExpress.Web.ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Edit)
            {
                e.Visible = EvaluaEstadoPlan((DevExpress.Web.ASPxGridView)sender, e.VisibleIndex);
            }
            //if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Delete)
            //{
            //    e.Visible = EvaluaEstadoPlan((DevExpress.Web.ASPxGridView)sender, e.VisibleIndex);
            //}
        }

        protected void cboEntidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt32(cboEntidad.Value) == 2)
            {
                tipDef.Visible = true;
            }
            else
            {
                tipDef.Visible = false;
            }
        }
    }
}