using DBMermasRecepcion;
using System;
using System.IO;
using System.Net;
using System.Web.UI;

namespace CVT_MermasRecepcion.WMS
{
    public partial class Recepcion : System.Web.UI.Page
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
                Response.Redirect("~/WMS/RecepcionDetalle.aspx");
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
                GvDatos.DataBind();
            }
            if (e.CommandArgs.CommandName == "cmdConfirma")
            {
                int RecepId = Convert.ToInt32(e.KeyValue);
                WMSClass vWMS = new WMSClass();
                if (vWMS.CantPalletRecepcion(RecepId) != 0)
                {
                    if (vWMS.PalletNoConfirmadosRecepcion(RecepId) == 0)
                    {
                        if (vWMS.PalletNoPosicionadosRecepcion(RecepId) == 0)
                        {
                            int TipoRecep = (int)GvDatos.GetRowValuesByKeyValue(e.KeyValue, "Reception_Type");
                            int TipoDocSap = Convert.ToInt32(GvDatos.GetRowValuesByKeyValue(e.KeyValue, "Reception_U_TipoDocSAP")) == null ? 0 : Convert.ToInt32(GvDatos.GetRowValuesByKeyValue(e.KeyValue, "Reception_U_TipoDocSAP"));
                            if (TipoDocSap != 0)
                            {
                                string Proveedor = GvDatos.GetRowValuesByKeyValue(e.KeyValue, "Business_Partner_Provider").ToString();
                                int NumDocSap = Convert.ToInt32(GvDatos.GetRowValuesByKeyValue(e.KeyValue, "Reception_U_NumDocSAP")) == null ? 0 : Convert.ToInt32(GvDatos.GetRowValuesByKeyValue(e.KeyValue, "Reception_U_NumDocSAP"));
                                SAPClass vSAP = new SAPClass();
                                if (TipoDocSap == 59)
                                {
                                    if (vSAP.ObtieneDocNumRecepcionAjusteSAP(RecepId) == 0)
                                    {
                                        string ret = vSAP.CreaEntradaRecepcion(RecepId, Session["CIDUsuario"].ToString());
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
                                if (TipoDocSap == 22)
                                {
                                    if (vSAP.ObtieneDocNumRecepcionSAP(RecepId) == 0)
                                    {
                                        if (vWMS.LoteSugeridoRecepcion(RecepId) == 0)
                                        {
                                            string ret = vSAP.CreaEntradaOCRecepcion(RecepId, Session["CIDUsuario"].ToString());
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
                                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Recepcion con Lote diferente a sigla u orden de compra');", true);
                                        }
                                    }
                                    else
                                    {
                                        vWMS.CierraRecepcion(RecepId);
                                    }
                                }
                                if (TipoDocSap == 18)
                                {
                                    if (vSAP.ObtieneDocNumRecepcionSAP(RecepId) == 0)
                                    {
                                        if (vWMS.LoteSugeridoRecepcion(RecepId) == 0)
                                        {
                                            if (vSAP.ValidaExcesoRecepcion(NumDocSap, RecepId) == 0)
                                            {
                                                string ret = vSAP.CreaEntradaFRRecepcion(RecepId, Session["CIDUsuario"].ToString());
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
                                                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Recepcion con exceso de mercaderia superior al 3% permitido, verifique cantidades e informe para analisis');", true);
                                            }
                                        }
                                        else
                                        {
                                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Recepcion con Lote diferente a sigla u orden de compra');", true);
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
                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Recepcion con bultos por Posicionar');", true);
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
                HttpWebRequest PrecioEntrega= WebRequest.Create("http://informesautomaticos.cvt.local/api/integracion/actprecioentrega") as HttpWebRequest;
                PrecioEntrega.Method = "GET";
                HttpWebResponse response = PrecioEntrega.GetResponse() as HttpWebResponse;
                StreamReader reader = new StreamReader(response.GetResponseStream());
                string resp = reader.ReadToEnd();
            }
        }

        protected void GvDatos_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {

        }

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 75, "Crea Registro");

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

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //    this.ASPxGridViewExporter1.FileName = "Recepciones";
        //    Options.SheetName = this.ASPxGridViewExporter1.FileName;
        //    this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        //}

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
                GvDatos.SettingsExport.FileName = "Recepciones";
            }
        }

        protected void GvDatos_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {

            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 75, "Actualiza Registro");
        }
    }
}