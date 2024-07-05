using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Web.UI;

namespace CVT_MermasRecepcion.MayoristaOP
{
    public partial class SMMExpRapidaDetalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblFolio.Text = Session["Expedition_Id"].ToString();
            CVTWMSMetroClass vWMS = new CVTWMSMetroClass();
            List<SMM_Expedition> dt = vWMS.ObtieneDatosDeExpedicionRapidaSMM(Convert.ToInt32(Session["Expedition_Id"]));
            foreach (var t in dt)
            {
                string nota = "";
                lblObs.Text = t.Expedition_Note == null ? nota : t.Expedition_Note.ToString();
                //lblNDoc.Text = t.Expedition_DocNumber.ToString();
                Session["Site"] = t.Site_Id;
                lblNombreBodega.Text = vWMS.ObtieneNombreSitio(t.Site_Id);
                if (t.Expedition_Status == 2)
                {
                    Label3.Visible = false;
                    txtIdProd.Visible = false;
                }
            }
            txtIdProd.Focus();
        }

        protected void Atras_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/MayoristaOP/SMMExpedicionRapida.aspx");
        }

        protected void txtIdProd_TextChanged(object sender, EventArgs e)
        {
            CVTWMSMetroClass vWMS = new CVTWMSMetroClass();
            SMM_ExpeditionDetail vExpd = new SMM_ExpeditionDetail();
            List<SMM_Package> dt = vWMS.ObtieneDatosDelBultoSMM(Convert.ToInt32(txtIdProd.Text));
            int idSite = Convert.ToInt32(Session["Site"]);

            //int vResQt;

            foreach (var t in dt)
            {
                int Layoutid = Convert.ToInt32(t.Layout_Id);
                int Site = vWMS.ObtieneSiteLayoutSMM(Layoutid);
                if (Site != idSite)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('bulto no existe en la bodega  " + lblNombreBodega.Text + "');", true);
                    txtIdProd.Text = string.Empty;
                    txtIdProd.Focus();

                }
                else if (t.Package_ReserveQuantity > 0)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('El bulto ID: " + txtIdProd.Text + " contiene pallets en reserva');", true);
                }
                else /*if (t.Package_Status == 3)*/
                {
                    //int? gross = null;
                    //int? net = null;
                    //int? tare = null;

                    vExpd.Site_Id = idSite;
                    vExpd.Expedition_Id = Convert.ToInt32(lblFolio.Text);
                    vExpd.Package_Id = t.Package_Id;
                    vExpd.IdUsuario = Convert.ToInt32(Session["IDCVTUsuario"]);
                    vExpd.Package_SSCC =txtIdProd.Text.Trim();
                    vExpd.ExpeditionDetail_Quantity = t.Package_Quantity;
                    vExpd.ExpeditionDetail_ConfirmedDate = DateTime.Now;
                    vWMS.InsertaRegistroDetalleExpRapidaSMM(vExpd);
                    GvDatos.DataBind();
                    txtIdProd.Text = string.Empty;
                    txtIdProd.Focus();
                }
                //else
                //{
                //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('El bulto ID: " + txtIdProd.Text + " No posee  posición ');", true);
                //}
            }

        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdEliminar")
            {
                string idBultoElim = Convert.ToString(e.KeyValue);
                CVTWMSMetroClass vWMS = new CVTWMSMetroClass();
                vWMS.EliminaBultoExpedicionRapidaSMM(idBultoElim);
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('El bulto ID: " + idBultoElim + " se a quitado');", true);
                GvDatos.DataBind();

                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 244, "Elimina bulto SmmExpRap.");
            }
        }

        protected void GvDatos_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            CVTWMSMetroClass vWMS = new CVTWMSMetroClass();
            List<SMM_Expedition> dt = vWMS.ObtieneDatosDeExpedicionRapidaSMM(Convert.ToInt32(Session["Expedition_Id"]));
            foreach (var t in dt)
            {
                if (e.RowType != DevExpress.Web.GridViewRowType.Data) return;
                if (t.Expedition_Status == 2)
                {

                    //System.Web.UI.WebControls.ImageButton imgAnula = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Anula") as System.Web.UI.WebControls.ImageButton;
                    System.Web.UI.WebControls.ImageButton imgElimina = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Eliminar") as System.Web.UI.WebControls.ImageButton;
                    //imgAnula.Visible = false;
                    imgElimina.Visible = false;
                }
            }
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Detalle Exp.Rapida SMM " + lblFolio.Text;
            }
        }
    }
}