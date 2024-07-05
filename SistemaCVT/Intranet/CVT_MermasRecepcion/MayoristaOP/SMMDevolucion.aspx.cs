using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.MayoristaOP
{
    public partial class SMMDevolucion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

   
            CargaDatos();
         
        }

        private void CargaDatos()
        {         

            
        }

        //protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        //{

        //    if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
        //    {
        //        GvDatos.SettingsExport.FileName = "Recepciones";
        //    }
        //    if (e.Item.Name.Equals("Nuevo"))
        //    {
        //        PopNuevo.ShowOnPageLoad = true;

        //    }
        //}

        //protected void btnFiltrar_Click(object sender, EventArgs e)
        //{
        //    GvDatos.DataBind();
        //}

        //protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        //{
        //    if (e.CommandArgs.CommandName == "cmdDetalle")
        //    {
        //        Session["RecepcionId"] = e.KeyValue;
        //        Response.Redirect("~/MayoristaOP/SMMDevolucion_Detalle.aspx");
        //    }
        //    if (e.CommandArgs.CommandName == "cmdAnula")
        //    {
        //        int RecepId = Convert.ToInt32(e.KeyValue);
        //        CVTWMSMetroClass vWMS = new CVTWMSMetroClass();
        //        if (vWMS.PalletConfirmadosRecepcionSMM(RecepId) == 0)
        //        {
        //            vWMS.EliminaBultoRecepcionSMM(RecepId);
        //            vWMS.AnulaRecepcionSMM(RecepId);
        //        }
        //        else
        //        {
        //            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Recepcion con bultos confirmados, NO se puede anular');", true);
        //        }
        //        GvDatos.DataBind();
        //    }
        //    if (e.CommandArgs.CommandName == "cmdConfirma")
        //    {
        //        int RecepId = Convert.ToInt32(e.KeyValue);
        //        CVTWMSMetroClass vWMS = new CVTWMSMetroClass();
        //        if (vWMS.CantPalletRecepcionSMM(RecepId) != 0)
        //        {
        //            if (vWMS.PalletNoConfirmadosRecepcionSMM(RecepId) == 0)
        //            {
        //                int TipoRecep = (int)GvDatos.GetRowValuesByKeyValue(e.KeyValue, "Reception_Type");
        //                SAPSMM vSAP = new SAPSMM();
        //                if (TipoRecep == 4)
        //                {
        //                    int TipoDocSap = Convert.ToInt32(GvDatos.GetRowValuesByKeyValue(e.KeyValue, "TipoDocSAP")) == null ? 0 : Convert.ToInt32(GvDatos.GetRowValuesByKeyValue(e.KeyValue, "TipoDocSAP"));

        //                    if (TipoDocSap != 0)
        //                    {
        //                        // Ingreso Devolucion
        //                        if (TipoDocSap == 16)
        //                        {

        //                            if (vSAP.ObtieneDocNumDevolucionSAP(RecepId) == 0)
        //                            {

        //                                string ret = vSAP.CreaDevolucion(RecepId, Session["CIDUsuario"].ToString());
        //                                if (ret == "0")
        //                                {
        //                                    vWMS.CierraRecepcionSMM(RecepId);
        //                                }
        //                                else
        //                                {
        //                                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + ret + "');", true);
        //                                }

        //                            }
        //                            else
        //                            {
        //                                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('error al cerrar recepcion por favor comunicarse con administrador');", true); //vWMS.CierraRecepcionSMM(RecepId);
        //                            }

        //                        }
        //                    }
        //                    else
        //                    {
        //                        // Sin Sincronizacion
        //                        //  vWMS.CierraRecepcionSMM(RecepId);
        //                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('error al cerrar recepcion por favor comunicarse con administrador');", true); //vWMS.CierraRecepcionSMM(RecepId);
        //                    }
        //                }                     

        //            }
        //            else
        //            {
        //                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Recepcion con bultos por confirmar');", true);
        //            }
        //        }
        //        else
        //        {
        //            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Recepcion no contiene bultos');", true);
        //        }
        //        GvDatos.DataBind();
        //    }
        //}

        //protected void GvDatos_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        //{
        //    LogClass vLog = new LogClass();
        //    vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 239, "Actualiza Registro");
        //}

        //protected void GvDatos_CommandButtonInitialize(object sender, DevExpress.Web.ASPxGridViewCommandButtonEventArgs e)
        //{
        //    if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Edit)
        //    {
        //        e.Visible = EvaluaEstadoPlan((DevExpress.Web.ASPxGridView)sender, e.VisibleIndex);
        //    }
        //}
        //private bool EvaluaEstadoPlan(DevExpress.Web.ASPxGridView grid, int visibleindex)
        //{
        //    bool ret = true;
        //    int Estado = Convert.ToInt32(grid.GetRowValues(visibleindex, "Reception_Status").ToString());
        //    if (Estado != 1)
        //    {
        //        ret = false;
        //    }
        //    return ret;
        //}


        //protected void GvDatos_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        //{
        //    if (e.RowType != DevExpress.Web.GridViewRowType.Data) return;
        //    int Estado = (int)e.GetValue("Reception_Status");
        //    if (Estado != 1)
        //    {
        //        System.Web.UI.WebControls.ImageButton imgAnula = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Anula") as System.Web.UI.WebControls.ImageButton;
        //        System.Web.UI.WebControls.ImageButton imgConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Confirma") as System.Web.UI.WebControls.ImageButton;
        //        imgAnula.Visible = false;
        //        imgConfirma.Visible = false;
        //    }
        //}

        //protected void btnGuardar_Click(object sender, EventArgs e)
        //{
        //    CVTWMSMetroClass wmsMetro = new CVTWMSMetroClass();
        //    SMM_Reception rc = new SMM_Reception();

        //    int? t1 = null;
        //    int? t2 = null;


        //    rc.Site_Id = Convert.ToInt32(cboBodega.Value);
        //    rc.CardCode = Convert.ToString(cboProveedor.Value);
        //    rc.IdUsuario = Convert.ToInt32(Session["IDCVTUsuario"]);
        //    rc.DocType = Convert.ToString(cboTipoDoc.Value);
        //    rc.Reception_DocNumber = Convert.ToInt32(txtNumDocumento.Text);
        //    rc.Reception_DateIn = DateTime.Now;
        //    rc.Reception_Note = txtComentarios.Text == string.Empty ? null : txtComentarios.Text;
        //    rc.Reception_Status = 1;
        //    rc.Reception_Type = Convert.ToInt32(cboTipoRecepcion.Value);
        //    rc.TipoDocSAP = Convert.ToInt32(cboTipDocSAP.Value) == 0 ? t2 : Convert.ToInt32(cboTipDocSAP.Value);
        //    rc.NumDocSAP = txtNumDocSAP.Text == string.Empty ? t1 : Convert.ToInt32(txtNumDocSAP.Text);
        //    bool resp = wmsMetro.InsertaNuevaRecepcion(rc);

        //    if (resp != false)
        //    {

        //        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('REGISTRADO');", true);
        //        GvDatos.DataBind();
        //        limpiar();


        //        LogClass vLog = new LogClass();
        //        vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 239, "Crea Registro");

        //        PopNuevo.ShowOnPageLoad = false;
        //    }
        //    else
        //    {

        //        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('NO SE PUEDE REGISTRAR');", true);
        //        limpiar();
        //    }
        //}

        //private void limpiar()
        //{

        //    cboBodega.SelectedIndex = -1;
        //    cboProveedor.SelectedIndex = -1;
        //    cboTipoDoc.SelectedIndex = -1;
        //    txtNumDocumento.Text = string.Empty;
        //    txtComentarios.Text = string.Empty;
        //    cboTipoRecepcion.SelectedIndex = -1;
        //    cboTipDocSAP.SelectedIndex = -1;
        //    txtNumDocSAP.Text = string.Empty;

        //}
    }
}