using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Web.UI;

namespace CVT_MermasRecepcion.WMS
{
    public partial class TransferenciasDetalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                WMSClass vWMS = new WMSClass();
                List<Transfer> dt = vWMS.ObtieneInfoTransferencia(Convert.ToInt32(Session["TransferId"]));

                foreach (var t in dt)
                {
                    string so = vWMS.ObtieneNombreCortoSitio(t.Site_Id);
                    string sd = vWMS.ObtieneNombreCortoSitio(t.Site_Id_Destiny);
                    lbl_Encabezado.Text = "Detalle Transferencia N:" + t.Transfer_Id.ToString() + " Origen:" + so + " Destino:" + sd;
                }
                int estadot = vWMS.ObtieneEstadoTransferencia(Convert.ToInt32(Session["TransferId"]));
                int idUserCreador = vWMS.ObtieneIdStaffTransfer(Convert.ToInt32(Session["TransferId"]));
                int idUserStaff = vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString());


                if ((estadot == 3 || estadot == 1) && (idUserCreador == idUserStaff))
                {
                    btn_Agregar.Enabled = true;
                    btn_Filtrar.Enabled = true;
                    btn_Quitar_Todos.Enabled = true;


                }
                else /*(estadot == 4 || estadot == 5)*/
                {
                    btn_Agregar.Enabled = false;
                    btn_Filtrar.Enabled = false;
                    btn_Quitar_Todos.Enabled = false;
                }
            }

        }

        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {
            DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
            this.ASPxGridViewExporter1.FileName = "Detalle Transferencia";
            Options.SheetName = this.ASPxGridViewExporter1.FileName;
            this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        }

        protected void btn_Filtrar_Click(object sender, EventArgs e)
        {
            string lote = txt_lote.Text;
            int producto = cb_producto.Value == null ? 0 : Convert.ToInt32(cb_producto.Value);
            int posicion = txt_ubicacion.Text == string.Empty ? 0 : Convert.ToInt32(txt_ubicacion.Text);
            int npallet = txt_npallet.Text == string.Empty ? 0 : Convert.ToInt32(txt_npallet.Text);

            WMSClass vWMS = new WMSClass();
            List<CVT_VW_FiltroTransferencia> dt = new List<CVT_VW_FiltroTransferencia>();
            dt = vWMS.ObtieneFiltroTransferencia(Convert.ToInt32(Session["TransferId"]), producto, npallet, lote, posicion);
            GvFiltro.DataSource = dt;
            GvFiltro.DataBind();

        }

        protected void btn_limpiarproducto_Click(object sender, EventArgs e)
        {
            cb_producto.SelectedIndex = -1;
        }

        protected void btn_Agregar_Click(object sender, EventArgs e)
        {
            WMSClass vWMS = new WMSClass();
            string[] param = new string[4];
            param[0] = "Site_Id";
            param[1] = "Package_Id";
            param[2] = "Layout_Id";
            param[3] = "Package_SSCC";

            var list = GvFiltro.GetSelectedFieldValues(param);
            int Countbloq = 0;
            string MnsBloque = "";
            foreach (object[] a in list)
            {
                BloqueoProductoClass bpc =new BloqueoProductoClass();
                int tipoBloque = vWMS.EvaluaTipoBloqueo(Convert.ToInt32(a[1]));
                string NomBloqueo = bpc.TraeNombreTipoBloqueo(tipoBloque);
              
                if (tipoBloque == 1 || tipoBloque == 2)
                {
                    Countbloq++;
                    MnsBloque = MnsBloque + "   " + "Pallet N° " + Convert.ToString(a[3]) + "  Bloqueado por : " + NomBloqueo + "  No se puede agregar a la transferencia   ";

                    //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Pallet "+Convert.ToString(a[3])+"  Bloqueado por : " + NomBloqueo + " No se puede agregar a la transferencia ');", true);
                }
                else
                {
                    vWMS.AgregaBultoTransferencia(Convert.ToInt32(Session["TransferId"]), Convert.ToInt32(a[0]), Convert.ToInt32(a[1]), Convert.ToInt32(a[2]), Session["CIDUsuario"].ToString());
                }

            }

            if(Countbloq>0)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert(' " + MnsBloque + " ');", true);
            }
            btn_Filtrar_Click(sender, EventArgs.Empty);
            GvDetalle.DataBind();
        }

        protected void GvDetalle_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != DevExpress.Web.GridViewRowType.Data) return;
            WMSClass vWMS = new WMSClass();

            int estadot = vWMS.ObtieneEstadoTransferencia(Convert.ToInt32(Session["TransferId"]));
            int idUserCreador = vWMS.ObtieneIdStaffTransfer(Convert.ToInt32(Session["TransferId"]));
            int idUserStaff = vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString());

            if (estadot == 1 || estadot == 3 && (idUserCreador == idUserStaff))
            {
                System.Web.UI.WebControls.ImageButton imgAnula = GvDetalle.FindRowCellTemplateControl(e.VisibleIndex, null, "Eliminar") as System.Web.UI.WebControls.ImageButton;
                imgAnula.Visible = true;
            }
            else
            {
                System.Web.UI.WebControls.ImageButton imgAnula = GvDetalle.FindRowCellTemplateControl(e.VisibleIndex, null, "Eliminar") as System.Web.UI.WebControls.ImageButton;
                imgAnula.Visible = false;
            }
            if (estadot == 1 || estadot == 3 && (idUserCreador != idUserStaff))
            {
                System.Web.UI.WebControls.ImageButton imgRechazar = GvDetalle.FindRowCellTemplateControl(e.VisibleIndex, null, "Rechazar") as System.Web.UI.WebControls.ImageButton;
                imgRechazar.Visible = true;
            }
            else
            {
                System.Web.UI.WebControls.ImageButton imgRechazar = GvDetalle.FindRowCellTemplateControl(e.VisibleIndex, null, "Rechazar") as System.Web.UI.WebControls.ImageButton;
                imgRechazar.Visible = false;
            }
        }

        protected void GvDetalle_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdEliminar")
            {
                WMSClass vWMS = new WMSClass();
                string[] ids = new string[2];
                ids = e.KeyValue.ToString().Split('|');
                vWMS.EliminaBultoTransferencia(Convert.ToInt32(ids[0]), Convert.ToInt32(ids[1]));
                GvDetalle.DataBind();
            }
            if (e.CommandArgs.CommandName == "cmdRechazar")
            {
                string[] ids = new string[2];
                ids = e.KeyValue.ToString().Split('|');
                Session["IdsRechazoTransfer"] = ids[0];
                Session["IdsRechazoPackage"] = ids[1];
                popup_motrechazo.ShowOnPageLoad = true;
            }
        }

        protected void btn_Quitar_Todos_Click(object sender, EventArgs e)
        {
            WMSClass vWMS = new WMSClass();
            int TransferId = Convert.ToInt32(Session["TransferId"]);
            List<Transfer_Detail> dt = vWMS.ObtieneDetalleTransferencia(TransferId);
            foreach (var t in dt)
            {
                vWMS.EliminaBultoTransferencia(TransferId, t.Package_Id);
            }
            GvDetalle.DataBind();
        }

        protected void cmdVolver_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Transferencias.aspx");
        }

        protected void btn_rechazo_Click(object sender, EventArgs e)
        {
            try
            {
                int Transferrechazo = 0;
                WMSClass cWms = new WMSClass();
                Transferrechazo = cWms.TraeNumeroTransferenciaRechazo(Convert.ToInt32(Session["IdsRechazoTransfer"]));
                cWms.ActualizaIDtransferenciPalletRechazado(Transferrechazo, Convert.ToInt32(Session["IdsRechazoPackage"]), Convert.ToInt32(Session["IdsRechazoTransfer"]));
                cWms.RegistraPalletRechazado(Convert.ToInt32(Session["IdsRechazoTransfer"]), Convert.ToInt32(Session["IdsRechazoPackage"]), cbo_MotivoRechazo.Value.ToString());
                GvDetalle.DataBind();
                popup_motrechazo.ShowOnPageLoad = false;
            }
            catch (Exception ex) 
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert(' " + ex.Message.ToString() + " ');", true);
            }
        }
    }
}