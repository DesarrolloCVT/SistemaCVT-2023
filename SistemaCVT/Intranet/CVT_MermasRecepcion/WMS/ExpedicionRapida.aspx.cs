using DBMermasRecepcion;
using DevExpress.XtraPrinting;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.WMS
{
    public partial class ExpedicionRapida : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dteDesde.Date = DateTime.Now.AddDays(-2);
                dteHasta.Date = DateTime.Now.AddDays(1);
            }
        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    GvDatos.ExportXlsxToResponse("Expedicion Rapida", new XlsxExportOptionsEx { ExportType = ExportType.Default });
        //}

        protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        {
            GvDatos.AddNewRow();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            GvDatos.DataBind();
        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                Session["Expedition_Id"] = e.KeyValue;
                Response.Redirect("~/WMS/DetalleExpRapida.aspx");
            }
            if (e.CommandArgs.CommandName == "cmdConfirma")
            {
                WMSClass vWms = new WMSClass();
                int idExp = Convert.ToInt32(e.KeyValue);
                int MotExp = vWms.ObtieneMotivoExpedicion(idExp);

                if (MotExp == 00)
                {
                    int cConfir = vWms.TraeCantidadIncluidos(idExp);
                    bool ac = vWms.ActualizaEstadoExpedicionRapida(idExp, 2, false, cConfir);
                    bool db = vWms.DardeBajaPalletExpedicionRapida(idExp);
                    if (ac == true && db == true)
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Expedicion Confirmada');", true);

                    }
                }
                else
                {
                    SAPClass sp = new SAPClass();
                    string res = sp.CreaSalidaExpedicionRapida(idExp, Session["CIDUsuario"].ToString());
                    if (res == "0")
                    {
                        int cConfir = vWms.TraeCantidadIncluidos(idExp);
                        bool ac = vWms.ActualizaEstadoExpedicionRapida(idExp, 2, false, cConfir);
                        bool db = vWms.DardeBajaPalletExpedicionRapida(idExp);

                        if (ac == true && db == true)
                        {
                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Expedicion Confirmada');", true);

                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + res + "');", true);
                    }


                }
            }
            if (e.CommandArgs.CommandName == "cmdEliminar")
            {

                int val = Convert.ToInt32(e.KeyValue);
                WMSClass wms = new WMSClass();
                int verif = wms.VerificaExisBultosDetExpedicion(val);
                if (verif == 0)
                {
                    bool res = wms.eliminaExpedicionRapida(val);
                    if (res == true)
                    {
                        LogClass vLog = new LogClass();
                        vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 161, "Elimina Registro");

                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Expedicion Eliminada');", true);
                        GvDatos.DataBind();
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al Eliminar Expedicion');", true);
                        GvDatos.DataBind();
                    }

                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Expedicion no se puede Eliminar contiene Bultos,Favor Eliminar Bultos Primero');", true);
                }

                //TicketClass vtic = new TicketClass();
                //vtic.eliminaRespuestas(val);

            }
        }


        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {


            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 161, "Crea Registro");

            int? gross = null;
            int? net = null;
            int? tare = null;
            WMSClass vWms = new WMSClass();
            e.NewValues["Company_Id"] = 1;
            e.NewValues["Business_Partner_Id"] = "19";
            e.NewValues["AccessControl_Id"] = 0;
            e.NewValues["Staff_Id"] = vWms.ObtieneIdStaff(Session["CIDUsuario"].ToString());
            e.NewValues["Sector_Id"] = vWms.ObtieneSectorPF(Convert.ToInt32(e.NewValues["Site_Id"]));
            e.NewValues["WorkType_Id"] = 1;
            e.NewValues["ClientDestiny_Id"] = 0;
            e.NewValues["Expedition_GrossWeight"] = gross;
            e.NewValues["Expedition_NetWeight"] = net;
            e.NewValues["Expedition_Tare"] = tare;
            e.NewValues["Expedition_Status"] = 1;
            e.NewValues["Expedition_DateIn"] = DateTime.Now;
            e.NewValues["Expedition_Type"] = 5;
            e.NewValues["Expedition_SendState"] = 1;
            e.NewValues["Expedition_Sync"] = 0;
            e.NewValues["INV_0010_SyncStat"] = "S";
            e.NewValues["INV_0010_UpdFrom"] = "D";
        }

        protected void GvDatos_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != DevExpress.Web.GridViewRowType.Data) return;
            int Estado = (int)e.GetValue("Expedition_Status");
            if (Estado != 1)
            {
                //System.Web.UI.WebControls.ImageButton imgAnula = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Anula") as System.Web.UI.WebControls.ImageButton;
                System.Web.UI.WebControls.ImageButton imgConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Confirma") as System.Web.UI.WebControls.ImageButton;
                System.Web.UI.WebControls.ImageButton imgElimina = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "eliminar") as System.Web.UI.WebControls.ImageButton;
                //imgAnula.Visible = false;
                imgConfirma.Visible = false;
                imgElimina.Visible = false;
            }
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Expedicion Rapida";
            }
        }
    }
}