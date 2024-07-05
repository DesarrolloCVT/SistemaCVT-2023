using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Web.UI;

namespace CVT_MermasRecepcion.MayoristaOP
{
    public partial class SMMRecepcion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dteInicio.Date = DateTime.Now.AddDays(-9);
                dteTermino.Date = DateTime.Now.AddDays(1);
            }
        }

        protected void GvDatos_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != DevExpress.Web.GridViewRowType.Data) return;
            int Estado = (int)e.GetValue("Reception_Status");
            if (Estado != 1)
            {
                System.Web.UI.WebControls.ImageButton imgAnula = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Anula") as System.Web.UI.WebControls.ImageButton;
                System.Web.UI.WebControls.ImageButton imgConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Confirma") as System.Web.UI.WebControls.ImageButton;
                imgAnula.Visible = false;
                imgConfirma.Visible = false;
            }
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            GvDatos.DataBind();
            //GvDatos.AddNewRow();
        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                Session["RecepcionId"] = e.KeyValue;
                Response.Redirect("~/MayoristaOP/SMMRecepcionDetalle.aspx");
            }
            if (e.CommandArgs.CommandName == "cmdAnula")
            {
                int RecepId = Convert.ToInt32(e.KeyValue);
                CVTWMSMetroClass vWMS = new CVTWMSMetroClass();
                if (vWMS.PalletConfirmadosRecepcionSMM(RecepId) == 0)
                {
                    vWMS.EliminaBultoRecepcionSMM(RecepId);
                    vWMS.AnulaRecepcionSMM(RecepId);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Recepcion con bultos confirmados, NO se puede anular');", true);
                }
                GvDatos.DataBind();
            }
            if (e.CommandArgs.CommandName == "cmdConfirma")
            {
                int RecepId = Convert.ToInt32(e.KeyValue);
                CVTWMSMetroClass vWMS = new CVTWMSMetroClass();
                if (vWMS.CantPalletRecepcionSMM(RecepId) != 0)
                {
                    if (vWMS.PalletNoConfirmadosRecepcionSMM(RecepId) == 0)
                    {
                        int TipoRecep = (int)GvDatos.GetRowValuesByKeyValue(e.KeyValue, "Reception_Type");
                        int bodega = (int)GvDatos.GetRowValuesByKeyValue(e.KeyValue, "Site_Id");

                        SAPSMM vSAP = new SAPSMM();
                        if (TipoRecep == 1)
                        {
                            int TipoDocSap = Convert.ToInt32(GvDatos.GetRowValuesByKeyValue(e.KeyValue, "TipoDocSAP")) == null ? 0 : Convert.ToInt32(GvDatos.GetRowValuesByKeyValue(e.KeyValue, "TipoDocSAP"));

                            if (TipoDocSap != 0)    
                            {

                                //Ingreso Por OC
                                if (TipoDocSap == 1)
                                {
                                    if (vSAP.ObtieneDocNumRecepcionSAP(RecepId) == 0)
                                    {

                                        string ret = vSAP.CreaEntradaRecepcionOC(RecepId, Session["CIDUsuario"].ToString());
                                        if (ret == "0")
                                        {                                      
                                            if (bodega == 1)
                                            {
                                                List<VW_STOCK_FECHA_RECEPCION> lt = vWMS.ObtieneDetosStockRecepcion(RecepId);
                                                foreach (var t in lt)
                                                {
                                                    if (vWMS.VerificaStockEnTabla(t.Site_Id, t.ItemCode, Convert.ToDateTime(t.Package_ProductionDate)) != string.Empty)
                                                    {
                                                        bool rest= vWMS.ActualizaTablaStock(t.Site_Id, t.ItemCode, Convert.ToDateTime(t.Package_ProductionDate), Convert.ToDecimal(t.Cantidad));

                                                        if (rest == true)
                                                        {
                                                            vWMS.CierraRecepcionSMM(RecepId);
                                                        }
                                                    }
                                                    else
                                                    {
                                                        SMM_StockFecha st = new SMM_StockFecha();

                                                        st.Bodega = t.Site_Id;
                                                        st.Producto = t.ItemCode;
                                                        st.FechaProduccion = Convert.ToDateTime(t.Package_ProductionDate);
                                                        st.Cantidad = t.Cantidad;

                                                        bool rest1=vWMS.InsertaStockTabla(st);

                                                        if (rest1 == true)
                                                        {
                                                            vWMS.CierraRecepcionSMM(RecepId);
                                                        }
                                                    }
                                                }
                                            }

                                            vWMS.CierraRecepcionSMM(RecepId);

                                        }
                                        else
                                        {
                                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + ret + "');", true);
                                        }
                                    }
                                    else
                                    {
                                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('error al cerrar recepcion por favor comunicarse con administrador');", true); //vWMS.CierraRecepcionSMM(RecepId);
                                    }
                                }
                                //Ingreso por Ajuste
                                if (TipoDocSap == 2)
                                {

                                    if (vSAP.ObtieneDocNumAjusteSAP(RecepId) == 0)
                                    {

                                        string ret = vSAP.CreaEntradaRecepcionAjuste(RecepId, Session["CIDUsuario"].ToString());
                                        if (ret == "0")
                                        {
                                            vWMS.CierraRecepcionSMM(RecepId);
                                        }
                                        else
                                        {
                                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + ret + "');", true);
                                        }

                                    }
                                    else
                                    {
                                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('error al cerrar recepcion por favor comunicarse con administrador');", true); //vWMS.CierraRecepcionSMM(RecepId);
                                    }

                                }
                                // Ingreso Devolucion
                                if (TipoDocSap == 3)
                                {

                                    if (vSAP.ObtieneDocNumDevolucionSAP(RecepId) == 0)
                                    {

                                        string ret = vSAP.CreaDevolucion(RecepId, Session["CIDUsuario"].ToString());
                                        if (ret == "0")
                                        {
                                            vWMS.CierraRecepcionSMM(RecepId);
                                        }
                                        else
                                        {
                                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + ret + "');", true);
                                        }

                                    }
                                    else
                                    {
                                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('error al cerrar recepcion por favor comunicarse con administrador');", true); //vWMS.CierraRecepcionSMM(RecepId);
                                    }

                                }
                            }
                            else
                            {
                                // Sin Sincronizacion
                                //  vWMS.CierraRecepcionSMM(RecepId);
                                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('error al cerrar recepcion por favor comunicarse con administrador');", true); //vWMS.CierraRecepcionSMM(RecepId);
                            }
                        }
                        if (TipoRecep == 2)
                        {
                            //Transferencia Desde Sala de Venta
                            if (vSAP.ObtieneDocNumTransferenciaSAP(RecepId) == 0)
                            {

                                string ret =  vSAP.CreaTransferenciaRecepcion(RecepId, Session["CIDUsuario"].ToString());
                                if (ret == "0")
                                {

                                vWMS.CierraRecepcionSMM(RecepId);
                                //List<VW_STOCK_FECHA_RECEPCION> lt1 = vWMS.ObtieneDetosStockRecepcion(RecepId);
                                //    foreach (var t in lt1)
                                //    {
                                //        if (vWMS.VerificaStockEnTabla(t.Site_Id, t.ItemCode, Convert.ToDateTime(t.Package_ProductionDate)) != string.Empty)
                                //        {
                                //            bool rest=vWMS.ActualizaRestaTablaStock(t.Site_Id, t.ItemCode, Convert.ToDateTime(t.Package_ProductionDate), Convert.ToDecimal(t.Cantidad));

                                //            if (rest == true)
                                //            {
                                //                vWMS.CierraRecepcionSMM(RecepId);
                                //            }
                                //        }
                                        
                                    //}
                                }
                                else
                                {
                                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + ret + "');", true);
                                }

                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('error al cerrar recepcion por favor comunicarse con administrador');", true); //vWMS.CierraRecepcionSMM(RecepId);
                            }
                        }
                        else if(TipoRecep==3)
                        {
                            //Recepcion por Produccion
                            vWMS.CierraRecepcionSMM(RecepId);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Recepcion con bultos por confirmar');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Recepcion no contiene bultos');", true);
                }
                GvDatos.DataBind();
            }
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Recepciones";
            }
            if (e.Item.Name.Equals("Nuevo"))
            {
                PopNuevo.ShowOnPageLoad = true;

            }

        }
        //protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        //{
        //    e.NewValues["IdUsuario"] = Session["IDCVTUsuario"];
        //    e.NewValues["Reception_DateIn"] = DateTime.Now;
        //    e.NewValues["Reception_Status"] = 1;
        //}

        protected void cboTipoRecepcion_SelectedIndexChanged(object sender, EventArgs e)
        {
            int tipRecep = Convert.ToInt32(cboTipoRecepcion.Value);

            if (tipRecep == 1)
            {
                lqsProveedor2.WhereParameters.Clear();
                lqsProveedor2.Where = "CardType='S'";
                cboProveedor.Enabled = true;
            }
            else if (tipRecep == 2)
            {

                cboProveedor.Enabled = false;
                lqsProveedor2.WhereParameters.Clear();
                txtNumDocumento.ValidationSettings.RequiredField.IsRequired = false;
                cboTipDocSAP.ValidationSettings.RequiredField.IsRequired = true;
            }
            else
            {
                cboProveedor.Enabled = false;
                lqsProveedor2.WhereParameters.Clear();

            }


        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            CVTWMSMetroClass wmsMetro = new CVTWMSMetroClass();
            SMM_Reception rc = new SMM_Reception();

            int? t1 = null;
            int? t2 = null;


            rc.Site_Id = Convert.ToInt32(cboBodega.Value);
            rc.CardCode = Convert.ToString(cboProveedor.Value);
            rc.IdUsuario = Convert.ToInt32(Session["IDCVTUsuario"]);
            rc.DocType = Convert.ToString(cboTipoDoc.Value);
            rc.Reception_DocNumber = txtNumDocumento.Text.Equals(string.Empty) ? 0 : Convert.ToInt32(txtNumDocumento.Text);
            rc.Reception_DateIn = DateTime.Now;
            rc.Reception_Note = txtComentarios.Text == string.Empty ? null : txtComentarios.Text;
            rc.Reception_Status = 1;
            rc.Reception_Type = Convert.ToInt32(cboTipoRecepcion.Value);
            rc.TipoDocSAP = Convert.ToInt32(cboTipDocSAP.Value) == 0 ? t2 : Convert.ToInt32(cboTipDocSAP.Value);
            rc.NumDocSAP = txtNumDocSAP.Text == string.Empty ? t1 : Convert.ToInt32(txtNumDocSAP.Text);
            bool resp = wmsMetro.InsertaNuevaRecepcion(rc);

            if (resp != false)
            {

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('REGISTRADO');", true);
                GvDatos.DataBind();
                limpiar();


                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 239, "Crea Registro");

                PopNuevo.ShowOnPageLoad = false;
            }
            else
            {

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('NO SE PUEDE REGISTRAR');", true);
                limpiar();
            }
        }

        private void limpiar()
        {

            cboBodega.SelectedIndex = -1;
            cboProveedor.SelectedIndex = -1;
            cboTipoDoc.SelectedIndex = -1;
            txtNumDocumento.Text = string.Empty;
            txtComentarios.Text = string.Empty;
            cboTipoRecepcion.SelectedIndex = -1;
            cboTipDocSAP.SelectedIndex = -1;
            txtNumDocSAP.Text = string.Empty;

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

        private bool EvaluaEstadoPlan(DevExpress.Web.ASPxGridView grid, int visibleindex)
        {
            bool ret = true;
            int Estado = Convert.ToInt32(grid.GetRowValues(visibleindex, "Reception_Status").ToString());
            if (Estado != 1)
            {
                ret = false;
            }
            return ret;
        }

        protected void GvDatos_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 239, "Actualiza Registro");
        }
    }
}