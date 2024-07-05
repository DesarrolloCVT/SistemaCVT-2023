using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.MayoristaOP
{
    public partial class SMMExpedicionRapida : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dteDesde.Date = DateTime.Now.AddDays(-2);
                dteHasta.Date = DateTime.Now.AddDays(1);
            }
        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                Session["Expedition_Id"] = e.KeyValue;
                Response.Redirect("~/MayoristaOP/SMMExpRapidaDetalle.aspx");
            }
            if (e.CommandArgs.CommandName == "cmdConfirma")
            {
                CVTWMSMetroClass vWms = new CVTWMSMetroClass();
                int idExp = Convert.ToInt32(e.KeyValue);
                int MotExp = vWms.ObtieneMotivoExpedicionSMM(idExp);

                if (MotExp == 00)
                {
                    //int cConfir = vWms.TraeCantidadIncluidos(idExp);
                    bool ac = vWms.ActualizaEstadoExpedicionRapidaSMM(idExp, 2);
                    bool db = vWms.DardeBajaPalletExpedicionRapidaSMM(idExp);
                    if (ac == true && db == true)
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Expedicion Confirmada');", true);

                    }
                }
                else
                {
                    SAPSMM sp = new SAPSMM();
                    string res = sp.CreaSalidaExpedicionRapida(idExp, Session["CIDUsuario"].ToString());
                    if (res == "0")
                    {
                        //int cConfir = vWms.TraeCantidadIncluidos(idExp);
                        bool ac = vWms.ActualizaEstadoExpedicionRapidaSMM(idExp, 2);
                        bool db = vWms.DardeBajaPalletExpedicionRapidaSMM(idExp);

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
        }

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["IdUsuario"] = Session["IDCVTUsuario"];
            e.NewValues["Expedition_Status"] = 1;
            e.NewValues["Expedition_DateIn"] = DateTime.Now;

            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 244, "Crea Registro");
        }

        protected void GvDatos_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != DevExpress.Web.GridViewRowType.Data) return;
            int Estado = (int)e.GetValue("Expedition_Status");
            if (Estado != 1)
            {
                //System.Web.UI.WebControls.ImageButton imgAnula = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Anula") as System.Web.UI.WebControls.ImageButton;
                System.Web.UI.WebControls.ImageButton imgConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Confirma") as System.Web.UI.WebControls.ImageButton;
                //imgAnula.Visible = false;
                imgConfirma.Visible = false;
            }
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Expedicion Rapida";
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            GvDatos.DataBind();
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
            int Estado = Convert.ToInt32(grid.GetRowValues(visibleindex, "Expedition_Status").ToString());
            if (Estado != 1)
            {
                ret = false;
            }
            return ret;
        }

        protected void GvDatos_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 244, "Actualiza Registro");
        }
    }
}