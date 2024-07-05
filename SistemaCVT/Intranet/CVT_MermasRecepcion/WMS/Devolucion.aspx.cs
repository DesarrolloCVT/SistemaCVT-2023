using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.WMS
{
    public partial class Devolucion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cb_fdesde.Date = DateTime.Now.AddDays(-9);
                cb_fhasta.Date = DateTime.Now.AddDays(1);
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

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                Session["RecepcionId"] = e.KeyValue;
                Response.Redirect("~/WMS/DevolucionDetalle.aspx");
            }
            if (e.CommandArgs.CommandName == "cmdAnula")
            {
                int RecepId = Convert.ToInt32(e.KeyValue);
                WMSClass vWMS = new WMSClass();
                if (vWMS.PalletConfirmadosRecepcion(RecepId) == 0)
                {
                    vWMS.EliminaBultoRecepcion(RecepId);
                    vWMS.AnulaRecepcion(RecepId);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Recepcion con bultos confirmados, NO se puede anular');", true);
                }
            }
            if (e.CommandArgs.CommandName == "cmdConfirma")
            {
                int RecepId = Convert.ToInt32(e.KeyValue);
                WMSClass vWMS = new WMSClass();
                if (vWMS.CantPalletRecepcion(RecepId) != 0)
                {
                    if (vWMS.PalletNoConfirmadosRecepcion(RecepId) == 0)
                    {
                        int TipoRecep = (int)GvDatos.GetRowValuesByKeyValue(e.KeyValue, "Reception_Type");
                        int TipoDocSap = Convert.ToInt32(GvDatos.GetRowValuesByKeyValue(e.KeyValue, "Reception_U_TipoDocSAP")) == null ? 0 : Convert.ToInt32(GvDatos.GetRowValuesByKeyValue(e.KeyValue, "Reception_U_TipoDocSAP"));
                        if (TipoDocSap != 0)
                        {
                            string Proveedor = GvDatos.GetRowValuesByKeyValue(e.KeyValue, "Business_Partner_Provider").ToString();
                            int NumDocSap = Convert.ToInt32(GvDatos.GetRowValuesByKeyValue(e.KeyValue, "Reception_U_NumDocSAP")) == null ? 0 : Convert.ToInt32(GvDatos.GetRowValuesByKeyValue(e.KeyValue, "Reception_U_NumDocSAP"));
                            SAPClass vSAP = new SAPClass();
                            if (TipoDocSap == 13)
                            {
                                if (vSAP.ObtieneDocNumDevolucionSAP(RecepId) == 0)
                                {
                                    string ret = vSAP.CreaDevolucion(RecepId, Session["CIDUsuario"].ToString());
                                    if (ret == "0")
                                    {
                                        vWMS.CierraRecepcion(RecepId);
                                    }
                                    else
                                    {
                                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + ret + "');", true);
                                    }
                                }
                                else
                                {
                                    vWMS.CierraRecepcion(RecepId);
                                }
                            }
                            if (TipoDocSap == 15)
                            {
                                if (vSAP.ObtieneDocNumDevolucionSAP(RecepId) == 0)
                                {
                                    string ret = vSAP.CreaDevolucion(RecepId, Session["CIDUsuario"].ToString());
                                    if (ret == "0")
                                    {
                                        vWMS.CierraRecepcion(RecepId);
                                    }
                                    else
                                    {
                                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + ret + "');", true);
                                    }
                                }
                                else
                                {
                                    vWMS.CierraRecepcion(RecepId);
                                }
                            }



                        }
                        else
                        {
                            vWMS.CierraRecepcion(RecepId);
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

        protected void GvDatos_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {

        }

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {

            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 86, "Crea Registro");

            e.NewValues["Company_Id"] = 1;
            e.NewValues["Business_Partner_Owner"] = "19";
            WMSClass vWms = new WMSClass();
            e.NewValues["Sector_Id"] = vWms.ObtieneSectorPF(Convert.ToInt32(e.NewValues["Site_Id"]));
            e.NewValues["Staff_Id"] = vWms.ObtieneIdStaff(Session["CIDUsuario"].ToString());
            e.NewValues["Reception_DateIn"] = DateTime.Now;
            e.NewValues["Reception_Status"] = 1;
            e.NewValues["Reception_Destination"] = 1;
            e.NewValues["Reception_CrossDocking"] = 0;
            e.NewValues["INV_0010_SyncStat"] = "S";
            e.NewValues["INV_0010_UpdFrom"] = "D";

        }

        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {

        }

        //protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        //{
        //    GvDatos.AddNewRow();
        //}

        protected void btn_filtrar_Click(object sender, EventArgs e)
        {
            GvDatos.DataBind();
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Devoluciones";
            }
        }

        protected void GvDatos_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 86, "Actualiza Registro");
        }
    }
}