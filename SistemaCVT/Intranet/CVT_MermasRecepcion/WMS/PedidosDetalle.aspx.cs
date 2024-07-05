using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Web.UI;

namespace CVT_MermasRecepcion.WMS
{
    public partial class PedidosDetalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                try
                {
                    string lote = txt_lote.Text;
                    int producto = cb_producto.Value == null ? 0 : Convert.ToInt32(cb_producto.Value);
                    int posicion = txt_ubicacion.Text == string.Empty ? 0 : Convert.ToInt32(txt_ubicacion.Text);
                    int npallet = txt_npallet.Text == string.Empty ? 0 : Convert.ToInt32(txt_npallet.Text);
                    WMSClass vWMS = new WMSClass();
                    List<CVT_VW_FiltroTransferencia> dt = new List<CVT_VW_FiltroTransferencia>();
                    dt = vWMS.ObtieneFiltroPedido(Convert.ToInt32(Session["OrderId"]), producto, npallet, lote, posicion);
                    GvFiltros.DataSource = dt;
                    GvFiltros.DataBind();
                    GvConsolidado.DataBind();
                }
                catch
                {
                }
            }
            else
            {
                lbl_Encabezado.Text = "Pedido N°:" + Session["OrderId"];
            }

            WMSClass vvWms = new WMSClass();

            int sts = vvWms.TraeEstadoPedido(Convert.ToInt32(Session["OrderId"]));

            if (sts != 1)
            {
                btnGuardarPall.Enabled = false;

            }



        }

        protected void btn_Filtrar_Click(object sender, EventArgs e)
        {

            string lote = txt_lote.Text;
            int producto = cb_producto.Value == null ? 0 : Convert.ToInt32(cb_producto.Value);
            int posicion = txt_ubicacion.Text == string.Empty ? 0 : Convert.ToInt32(txt_ubicacion.Text);
            int npallet = txt_npallet.Text == string.Empty ? 0 : Convert.ToInt32(txt_npallet.Text);
            WMSClass vWMS = new WMSClass();
            List<CVT_VW_FiltroTransferencia> dt = new List<CVT_VW_FiltroTransferencia>();
            dt = vWMS.ObtieneFiltroPedido(Convert.ToInt32(Session["OrderId"]), producto, npallet, lote, posicion);
            GvFiltros.DataSource = dt;
            GvFiltros.DataBind();
            GvConsolidado.DataBind();
        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //    this.ASPxGridViewExporter1.FileName = "Detalle Pedido";
        //    Options.SheetName = this.ASPxGridViewExporter1.FileName;
        //    this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        //}

        protected void btn_limpiarproducto_Click(object sender, EventArgs e)
        {

        }

        protected void btn_agregar_Click(object sender, EventArgs e)
        {
            try
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 33, "Crea Registro Ped.Detalle");

                WMSClass vWMS = new WMSClass();
                string[] param = new string[4];
                param[0] = "Site_Id";
                param[1] = "Package_Id";
                param[2] = "Layout_Id";
                param[3] = "Package_SSCC";

                var list = GvFiltros.GetSelectedFieldValues(param);

                int Countbloq = 0;
                string MnsBloque = "";

                foreach (object[] a in list)
                {
                    BloqueoProductoClass bpc = new BloqueoProductoClass();
                    int tipoBloque = vWMS.EvaluaTipoBloqueo(Convert.ToInt32(a[1]));
                    string NomBloqueo = bpc.TraeNombreTipoBloqueo(tipoBloque);
                    string CodClientBloq = vWMS.TraeCodClientBloq(Convert.ToInt32(a[1]));

                    if (tipoBloque < 6 && tipoBloque > 0)
                    {
                        Countbloq++;
                        MnsBloque = MnsBloque + "   " + "Pallet N° " + Convert.ToString(a[3]) + "  Bloqueado por : " + NomBloqueo + "  No se puede agregar al Pedido  ";
                    }
                    else if (tipoBloque == 6)
                    {
                        string CodCliPed = vWMS.ObtieneCodClientPedido(Convert.ToInt32(Session["OrderId"]));

                        if (CodClientBloq.Equals(CodCliPed))
                        {
                            Countbloq++;
                            MnsBloque = MnsBloque + "   " + "Pallet N° " + Convert.ToString(a[3]) + "  Bloqueado por : " + NomBloqueo + "  No se puede agregar al Pedido  ";
                        }
                        else
                        {
                            vWMS.AgregaBultoPedido(Convert.ToInt32(Session["OrderId"]), Convert.ToInt32(a[0]), Convert.ToInt32(a[1]), Convert.ToInt32(a[2]), Session["CIDUsuario"].ToString());
                        }
                    }
                    else { vWMS.AgregaBultoPedido(Convert.ToInt32(Session["OrderId"]), Convert.ToInt32(a[0]), Convert.ToInt32(a[1]), Convert.ToInt32(a[2]), Session["CIDUsuario"].ToString()); }

                }

                if (Countbloq > 0)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert(' " + MnsBloque + " ');", true);
                }

                btn_Filtrar_Click(sender, EventArgs.Empty);
                GvDetalle.DataBind();
                GvConsolidado.DataBind();
            }
            catch
            {
            }
        }

        protected void GvDetalle_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != DevExpress.Web.GridViewRowType.Data) return;
            WMSClass vWMS = new WMSClass();
            int estadot = vWMS.ObtieneEstadoPedido(Convert.ToInt32(Session["OrderId"]));
            if (estadot != 1)
            {
                System.Web.UI.WebControls.ImageButton imgAnula = GvDetalle.FindRowCellTemplateControl(e.VisibleIndex, null, "Eliminar") as System.Web.UI.WebControls.ImageButton;
                imgAnula.Visible = false;
            }
        }

        protected void GvDetalle_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdEliminar")
            {
                WMSClass vWMS = new WMSClass();
                string[] ids = new string[2];
                ids = e.KeyValue.ToString().Split('|');
                vWMS.EliminaBultoPedido(Convert.ToInt32(ids[0]), Convert.ToInt32(ids[1]));
                GvDetalle.DataBind();
                GvConsolidado.DataBind();
            }
        }

        protected void btn_refrescar_Click(object sender, EventArgs e)
        {
            SAPClass vSAP = new SAPClass();
            WMSClass vWMS = new WMSClass();
            List<Order> dt = new List<Order>();
            dt = vWMS.ObtieneInfoPedido(Convert.ToInt32(Session["OrderId"]));
            int docnum = 0;
            int siteid = 0;
            foreach (var d in dt)
            {
                docnum = (int)d.Order_U_NumDocSAP;
                siteid = d.Site_Id;
            }
            vSAP.ActualizaPedidoWMS(docnum, siteid);
            GvConsolidado.DataBind();
            GvDetalle.DataBind();

        }

        protected void GvDetalle_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDetalle.SettingsExport.FileName = "Detalle Pedido";
            }
        }

        protected void btnGuardarPall_Click(object sender, EventArgs e)
        {
            WMSClass wms = new WMSClass();

            wms.insertaCantPalletPedido(Convert.ToInt32(Session["OrderId"]), Convert.ToInt32(txtCantPallBlancos.Text), Convert.ToInt32(txtCantPallChep.Text), Convert.ToInt32(txtCantBlanChep.Text));


        }
    }
}