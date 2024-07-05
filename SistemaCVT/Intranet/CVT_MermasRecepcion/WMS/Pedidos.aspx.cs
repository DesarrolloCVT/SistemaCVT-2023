using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Web.UI;

namespace CVT_MermasRecepcion.WMS
{
    public partial class Pedidos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cb_fdesde.Date = DateTime.Now.AddDays(-9);
                cb_fhasta.Date = DateTime.Now.AddDays(1);
            }
         
        }

        protected void btn_filtrar_Click(object sender, EventArgs e)
        {
            GvDatos.DataBind();
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

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                Session["OrderId"] = e.KeyValue;
                Response.Redirect("~/WMS/PedidosDetalle.aspx");
            }
            if (e.CommandArgs.CommandName == "cmdAgregaHora")
            {
                Session["Orden"] = e.KeyValue;
                PopAgHora.ShowOnPageLoad = true;

                WMSClass wmsc = new WMSClass();
                List<Order> dt = wmsc.ObtieneHorayGruero(Convert.ToInt32(Session["Orden"]));

                foreach (var n in dt)
                {
                    txtHoraInicioArmado.Text = Convert.ToString(n.Order_U_HoraInicio_Armado);
                    txtHoraInicioCarga.Text = Convert.ToString(n.Order_U_HoraInicio_Carga);
                    txtHoraTerArmado.Text = Convert.ToString(n.Order_U_HoraTermino_Armado);
                    txtHoraTerminoCarga.Text = Convert.ToString(n.Order_U_HoraTermino_Carga);

                    txtMinutosInicioArmado.Text = Convert.ToString(n.Order_U_MinInicio_Armado);
                    txtMinInicioCarga.Text = Convert.ToString(n.Order_U_MinInicio_Carga);
                    txtMinTerArmado.Text = Convert.ToString(n.Order_U_MinTermino_Armado);
                    txtminTerCarga.Text = Convert.ToString(n.Order_U_MinTermini_Carga);
                    int idGr = Convert.ToInt32(n.Order_U_GrueroAsig);


                    string grueroAsi = wmsc.obtenerNombreGrueroOrden(idGr);
                    cboGruero.Text = grueroAsi;
                }

            }
            if (e.CommandArgs.CommandName == "cmdAnula")
            {
                WMSClass vWMS = new WMSClass();
                int OrderId = Convert.ToInt32(e.KeyValue);
                int CantDet = vWMS.CuentaDetallePedido(OrderId);
                if (CantDet > 0)
                {
                    vWMS.CambiaEstadoPedido(OrderId, 6);
                    List<OrderDetail> dt = vWMS.ObtieneDetallePedido(OrderId);
                    foreach (var t in dt)
                    {
                        vWMS.EliminaBultoPedido(OrderId, t.Package_Id);
                    }
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Pedido Anulada Correctamente');", true);
                }
                else
                {
                    vWMS.CambiaEstadoPedido(OrderId, 6);
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Pedido Anulada Correctamente');", true);
                }

            }
            if (e.CommandArgs.CommandName == "cmdConfirma")
            {
                WMSClass vWMS = new WMSClass();
                ControlClass vControl = new ControlClass();
                int OrderId = Convert.ToInt32(e.KeyValue);
                int CantDet = vWMS.CuentaDetallePedido(OrderId);
                int staffid = vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString());
                if (CantDet > 0)
                {
                    SAPClass vSAP = new SAPClass();
                    string msj = "0";
                    if (vWMS.PedidoAsociadoSAP(OrderId) == 1)
                    {
                        if (vSAP.ExisteEntregaPedido(OrderId) == 0)
                        {
                            msj = vSAP.CreaEntrega(OrderId, Session["CIDUsuario"].ToString());
                            if (msj == "0")
                            {
                                #region Baja por codigo
                                //List<Order> tr = vWMS.ObtieneInfoPedido(OrderId);
                                //foreach (var en in tr)
                                //{
                                //    int numerosap = en.Order_U_NumDocSAP == null ? 0 : (int)en.Order_U_NumDocSAP;
                                //    vWMS.ActualizaSectorPedido(OrderId, vWMS.ObtieneSectorPF(en.Site_Id));
                                //    int expid = vWMS.CreaExpedicion(en.Site_Id, OrderId, staffid, numerosap);
                                //    List<OrderDetail> dt = vWMS.ObtieneDetallePedido(OrderId);
                                //    foreach (var t in dt)
                                //    {
                                //        List<Package> pk = vWMS.ObtieneInfoPallet(t.Package_Id);
                                //        foreach (var p in pk)
                                //        {
                                //            int reserveid = vWMS.ObtieneReservaPedidoId(t.Package_Id, OrderId);
                                //            int tareaid = vWMS.AgregaTareaPedido(en.Site_Id, 7, p.ArticleProvider_Id, (int)p.Layout_Id, p.Layout_Id, t.Package_Id, p.Package_Quantity, p.Package_Lot, 5, staffid, staffid, reserveid, OrderId);
                                //            vWMS.ActualizaReserve(reserveid, 3);
                                //            vWMS.AgregaDetalleExpedicion(expid, p.Package_Quantity, t.Package_Id, p.Package_SSCC, en.Site_Id, staffid);

                                //            vWMS.AddMovement(en.Site_Id, 2, p.Package_Quantity, 8, staffid, 0, 0, 0, p.Package_Id);
                                //            #region Agrega PickingList
                                //            PickingList NPL = new PickingList();
                                //            NPL.Company_Id = p.Company_Id;
                                //            NPL.Site_Id = en.Site_Id;
                                //            NPL.PickingList_Date = DateTime.Now;
                                //            NPL.Order_Type = 3;
                                //            NPL.Order_Id = OrderId;
                                //            NPL.PickingList_ProductCode = vWMS.ObtieneCodProduct(p.ArticleProvider_Id);
                                //            NPL.ArticleProvider_Id = p.ArticleProvider_Id;
                                //            NPL.MeasurementUnit_Id = 1;
                                //            NPL.PickingList_Quantity = p.Package_Quantity;
                                //            NPL.Package_Id_Origin = p.Package_Id;
                                //            NPL.Package_SSCC_Origin = p.Package_SSCC;
                                //            NPL.Package_Id_Destiny = p.Package_Id;
                                //            NPL.Package_SSCC_Destiny = p.Package_SSCC;
                                //            NPL.PickingList_Level = 1;
                                //            NPL.Staff_Id = staffid;
                                //            #endregion
                                //            vWMS.ActualizaRestaCantidadPackage(p.Package_Id, p.Package_Quantity);
                                //            vWMS.CreaPickingListPedido(NPL);
                                //        }
                                //    }
                                //    bool sync = false;
                                //    if (numerosap != 0)

                                //    {
                                //        sync = false;
                                //    }
                                //    vWMS.ActualizaEstadoExpedicion(expid, 2, sync);
                                //    vWMS.CambiaEstadoPedido(OrderId, 3);
                                //}
                                #endregion
                                #region baja por SP
                                vWMS.CierrePedidoSP(OrderId, staffid);
                                #endregion
                                GvDatos.DataBind();
                            }
                            else
                            {
                                GvDatos.DataBind();
                                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + msj + "');", true);
                            }
                        }
                        else
                        {

                            #region baja por SP
                            vWMS.CierrePedidoSP(OrderId, staffid);
                            #endregion
                            GvDatos.DataBind();
                        }
                    }
                    
                    else
                    {

                    #region baja por SP
                    vWMS.CierrePedidoSP(OrderId, staffid);
                        #endregion
                        GvDatos.DataBind();
                    }
                GvDatos.DataBind();

                    #region Cierra pedido Manual
                    //List<Order> tr = vWMS.ObtieneInfoPedido(OrderId);
                    //foreach (var en in tr)
                    //{
                    //    int numerosap = en.Order_U_NumDocSAP == null ? 0 : (int)en.Order_U_NumDocSAP;
                    //    vWMS.ActualizaSectorPedido(OrderId, vWMS.ObtieneSectorPF(en.Site_Id));
                    //    int expid = vWMS.CreaExpedicion(en.Site_Id, OrderId, staffid, numerosap);
                    //    List<OrderDetail> dt = vWMS.ObtieneDetallePedido(OrderId);
                    //    foreach (var t in dt)
                    //    {
                    //        List<Package> pk = vWMS.ObtieneInfoPallet(t.Package_Id);
                    //        foreach (var p in pk)
                    //        {
                    //            int reserveid = vWMS.ObtieneReservaPedidoId(t.Package_Id, OrderId);
                    //            int tareaid = vWMS.AgregaTareaPedido(en.Site_Id, 7, p.ArticleProvider_Id, (int)p.Layout_Id, p.Layout_Id, t.Package_Id, p.Package_Quantity, p.Package_Lot, 5, staffid, staffid, reserveid, OrderId);
                    //            vWMS.ActualizaReserve(reserveid, 3);
                    //            vWMS.AgregaDetalleExpedicion(expid, p.Package_Quantity, t.Package_Id, p.Package_SSCC, en.Site_Id, staffid);

                    //            vWMS.AddMovement(en.Site_Id, 2, p.Package_Quantity, 8, staffid, 0, 0, 0, p.Package_Id);
                    //            #region Agrega PickingList
                    //            PickingList NPL = new PickingList();
                    //            NPL.Company_Id = p.Company_Id;
                    //            NPL.Site_Id = en.Site_Id;
                    //            NPL.PickingList_Date = DateTime.Now;
                    //            NPL.Order_Type = 3;
                    //            NPL.Order_Id = OrderId;
                    //            NPL.PickingList_ProductCode = vWMS.ObtieneCodProduct(p.ArticleProvider_Id);
                    //            NPL.ArticleProvider_Id = p.ArticleProvider_Id;
                    //            NPL.MeasurementUnit_Id = 1;
                    //            NPL.PickingList_Quantity = p.Package_Quantity;
                    //            NPL.Package_Id_Origin = p.Package_Id;
                    //            NPL.Package_SSCC_Origin = p.Package_SSCC;
                    //            NPL.Package_Id_Destiny = p.Package_Id;
                    //            NPL.Package_SSCC_Destiny = p.Package_SSCC;
                    //            NPL.PickingList_Level = 1;
                    //            NPL.Staff_Id = staffid;
                    //            #endregion
                    //            vWMS.ActualizaRestaCantidadPackage(p.Package_Id, p.Package_Quantity);
                    //            vWMS.CreaPickingListPedido(NPL);
                    //        }
                    //    }
                    //    bool sync = false;
                    //    if (numerosap != 0)
                    //        sync = false;
                    //    vWMS.ActualizaEstadoExpedicion(expid, 2, sync);
                    //    vWMS.CambiaEstadoPedido(OrderId, 3);
                    //}
                    #endregion
                }
                else
                {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Pedido no contiene Bultos');", true);
                }               
            }
        }

    protected void btnSalir_Click(object sender, EventArgs e)
        {
            PopAgHora.ShowOnPageLoad = false;
            limpiar();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 33, "Actualiza Registro");

            string HIniArmado = (txtHoraInicioArmado.Text) == "" ? null : txtHoraInicioArmado.Text;
            string HIniCarga = (txtHoraInicioCarga.Text) == "" ? null : txtHoraInicioCarga.Text;
            string mIniArmado = (txtMinutosInicioArmado.Text) == "" ? null : txtMinutosInicioArmado.Text;
            string mInicarga = (txtMinInicioCarga.Text) == "" ? null : txtMinInicioCarga.Text;


            string HTerArmado = (txtHoraTerArmado.Text) == "" ? null : txtHoraTerArmado.Text;
            string HTerCarga = (txtHoraTerminoCarga.Text) == "" ? null : txtHoraTerminoCarga.Text;
            string miTerArmado = (txtMinTerArmado.Text) == "" ? null : txtMinTerArmado.Text;
            string miTerCarga = (txtminTerCarga.Text) == "" ? null : txtminTerCarga.Text;

            int idOrden = Convert.ToInt32(Session["Orden"]);
            int idGruero = Convert.ToInt32(cboGruero.Value);

            string ArmadorPedido = cbo_ArmadoPedido.Value.ToString();

            WMSClass wms = new WMSClass();

            wms.SP_actualizaHoraYGrueroEncargadoPedido(Convert.ToInt32(HIniArmado), Convert.ToInt32(HIniCarga), Convert.ToInt32(HTerArmado),
                                                       Convert.ToInt32(HTerCarga), Convert.ToInt32(mIniArmado), Convert.ToInt32(mInicarga),
                                                        Convert.ToInt32(miTerArmado), Convert.ToInt32(miTerCarga), idGruero, idOrden, ArmadorPedido);

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Datos Actualizados');", true);
            PopAgHora.ShowOnPageLoad = false;

        }

        protected void limpiar()
        {
            txtHoraInicioArmado.Text = string.Empty;
            txtHoraInicioCarga.Text = string.Empty;
            txtMinutosInicioArmado.Text = string.Empty;
            txtMinInicioCarga.Text = string.Empty;

            txtHoraTerArmado.Text = string.Empty;
            txtHoraTerminoCarga.Text = string.Empty;
            txtMinTerArmado.Text = string.Empty;
            txtminTerCarga.Text = string.Empty;
            cboGruero.SelectedIndex = -1;
            cbo_ArmadoPedido.SelectedIndex = -1;
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            limpiar();
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Pedidos";
            }
        }
    }
}