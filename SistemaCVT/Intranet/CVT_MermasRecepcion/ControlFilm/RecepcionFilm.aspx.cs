using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.ControlFilm
{
    public partial class RecepcionFilm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dteInicio.Date = DateTime.Now.AddDays(-9);
                dteTermino.Date = DateTime.Now.AddDays(1);
            }
        }
        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                Session["RecepcionId"] = e.KeyValue;
                Response.Redirect("~/ControlFilm/RecepcionFilmDetalle.aspx");
            }
            if (e.CommandArgs.CommandName == "cmdAnula")
            {
                int RecepId = Convert.ToInt32(e.KeyValue);
                ControlFilmClass rfc = new ControlFilmClass();
                if (rfc.PalletConfirmadosRecepcionFilm(RecepId) == 0)
                {
                    rfc.EliminaBobinaRecepcion(RecepId);
                    rfc.AnulaRecepcionFilm(RecepId);
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Recepcion Anulada');", true);
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
                ControlFilmClass rfc = new ControlFilmClass();

                if (rfc.CantPalletRecepcionFilm(RecepId) != 0)
                {
                    if (rfc.PalletNoConfirmadosRecepcionFilm(RecepId) == 0)
                    {

                        string TipoDocSap = Convert.ToString(GvDatos.GetRowValuesByKeyValue(e.KeyValue, "DocumentoSAP"));/* == null ? null : Convert.ToString(GvDatos.GetRowValuesByKeyValue(e.KeyValue, "DocumentoSAP"));*/
                        //string TipoDocSap = "OC";

                        if (TipoDocSap != "")
                        {
                            int NumDocSap = Convert.ToInt32(GvDatos.GetRowValuesByKeyValue(e.KeyValue, "NumeroDocSAp")) == null ? 0 : Convert.ToInt32(GvDatos.GetRowValuesByKeyValue(e.KeyValue, "NumeroDocSAp"));

                            //string Proveedor = GvDatos.GetRowValuesByKeyValue(e.KeyValue, "Business_Partner_Provider").ToString();

                            SAPClass vSAP = new SAPClass();
                            SAPFilmClass vSapFilm = new SAPFilmClass();
                            #region Ajuste
                            //if (TipoDocSap == 59)
                            //{
                            //    if (vSAP.ObtieneDocNumRecepcionAjusteSAP(RecepId) == 0)
                            //    {
                            //        string ret = vSAP.CreaEntradaRecepcion(RecepId, Session["CIDUsuario"].ToString());
                            //        if (ret == "0")
                            //        {
                            //            rfc.CierraRecepcionFilm(RecepId);
                            //        }
                            //        else
                            //        {
                            //            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + ret + "');", true);
                            //        }
                            //    }
                            //    else
                            //    {
                            //        rfc.CierraRecepcionFilm(RecepId);
                            //    }
                            //}
                            #endregion
                            if (TipoDocSap == "OC")
                            {
                                if (vSAP.ObtieneDocNumRecepcionSAP(RecepId) == 0)
                                {

                                    string ret = vSapFilm.CreaEntradaOCRecepcionFilm(RecepId, Session["CIDUsuario"].ToString());
                                    if (ret == "0")
                                    {
                                        rfc.CierraRecepcionFilm(RecepId);
                                    }
                                    else
                                    {
                                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + ret + "');", true);
                                    }

                                }
                                else
                                {
                                    rfc.CierraRecepcionFilm(RecepId);
                                }
                            }
                            if (TipoDocSap == "FAC")
                            {
                                if (vSAP.ObtieneDocNumRecepcionSAP(RecepId) == 0)
                                {
                                    //if (vWMS.LoteSugeridoRecepcion(RecepId) == 0)
                                    //{
                                    if (vSapFilm.ValidaExcesoRecepcionFilm(NumDocSap, RecepId) == 0)
                                    {
                                        string ret = vSapFilm.CreaEntradaFRRecepcionFilm(RecepId, Session["CIDUsuario"].ToString());
                                        if (ret == "0")
                                        {
                                            rfc.CierraRecepcionFilm(RecepId);
                                        }
                                        else
                                        {
                                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + ret + "');", true);
                                        }
                                    }
                                    else
                                    {
                                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Recepcion con exceso de mercaderia superior al 3% permitido, verifique cantidades e informe para analisis');", true);
                                    }
                                    //}
                                    //else
                                    //{
                                    //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Recepcion con Lote diferente a sigla u orden de compra');", true);
                                    //}
                                }
                                else
                                {
                                    rfc.CierraRecepcionFilm(RecepId);
                                }
                            }
                        }
                        else
                        {
                            rfc.CierraRecepcionFilm(RecepId);
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
            }
        }

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["Estado"] = 1;
            e.NewValues["UsuarioRecep"] = Session["IDCVTUsuario"];
            e.NewValues["Bodega_Recep"] = 4;
            e.NewValues["FechaRecep"] = DateTime.Now;
        }

        protected void GvDatos_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {

            if (e.RowType != DevExpress.Web.GridViewRowType.Data) return;
            int Estado = (int)e.GetValue("Estado");
            if (Estado != 1)
            {
                System.Web.UI.WebControls.ImageButton imgAnula = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Anula") as System.Web.UI.WebControls.ImageButton;
                System.Web.UI.WebControls.ImageButton imgConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Confirma") as System.Web.UI.WebControls.ImageButton;
                imgAnula.Visible = false;
                imgConfirma.Visible = false;
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            GvDatos.DataBind();
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Recepciones Film";
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
    }
}