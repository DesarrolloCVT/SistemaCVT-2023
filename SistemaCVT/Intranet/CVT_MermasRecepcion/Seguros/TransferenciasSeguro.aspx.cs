
using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Web.UI;

namespace CVT_MermasRecepcion.Seguros
{
    public partial class TransferenciasSeguros : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                cb_fdesde.Date = DateTime.Now.AddDays(-2);
                cb_fhasta.Date = DateTime.Now.AddDays(1);
            }

        }

        protected void btn_filtrar_Click(object sender, EventArgs e)
        {
            GvDatos.DataBind();
        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                Session["TransferId"] = e.KeyValue;
                Response.Redirect("~/Seguros/TransferenciasSeguroDetalle.aspx");
            }
            if (e.CommandArgs.CommandName == "cmdAnula")
            {
                WMSClass vWMS = new WMSClass();
                int TransferId = Convert.ToInt32(e.KeyValue);
                int CantDet = vWMS.CuentaDetalleTransferencia(TransferId);
                if (CantDet > 0)
                {
                    vWMS.CambiaEstadoTransferencia(TransferId, 5);
                    List<Transfer_Detail> dt = vWMS.ObtieneDetalleTransferencia(TransferId);
                    foreach (var t in dt)
                    {
                        vWMS.EliminaBultoTransferencia(TransferId, t.Package_Id);
                    }
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Transferencia Anulada Correctamente');", true);
                }
                else
                {
                    vWMS.CambiaEstadoTransferencia(TransferId, 5);
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Transferencia Anulada Correctamente');", true);
                }


            }
            if (e.CommandArgs.CommandName == "cmdConfirma")
            {
                UsuarioClass user = new UsuarioClass();
                WMSClass vWMS = new WMSClass();
                int PreUsuario = vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString());
                try
                {
                    SAPClass vSAP = new SAPClass();
                    //WMSClass vWMS = new WMSClass();
                    ControlClass vControl = new ControlClass();
                    int TransferId = Convert.ToInt32(e.KeyValue);
                    int CantDet = vWMS.CuentaDetalleTransferencia(TransferId);
                    if (CantDet > 0)
                    {

                        List<Transfer> tr = vWMS.ObtieneInfoTransferencia(TransferId);
                        foreach (var en in tr)
                        {
                            string borigen = vWMS.ObtieneNombreCortoSitio(en.Site_Id);
                            string bdestino = vWMS.ObtieneNombreCortoSitio(en.Site_Id_Destiny);
                            if (vSAP.ObtieneDocNumTransferenciaSAP(TransferId) == 0)
                            {
                                string errors = vSAP.CreaTransferencia(TransferId, borigen, bdestino, Session["CIDUsuario"].ToString());
                                if (errors == "0")
                                {
                                    int? LayoutDestino = 0;
                                    if (en.Site_Id_Destiny == 1 && en.Site_Id == 19 && en.Transfer_U_Entidad == 7)
                                    {
                                        LayoutDestino = en.Transfer_U_Folio_Entidad;
                                    }
                                    else
                                    {
                                        LayoutDestino = vControl.ObtieneUbicacionDefecto(en.Site_Id_Destiny, 1);
                                    }
                                    int staffid = vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString());
                                    vWMS.CierreTransferenciaPROC(TransferId, LayoutDestino, staffid);

                                    vWMS.ActualizaFechaUsuarioTransferencia(en.Transfer_Id, PreUsuario);
                                    vWMS.ActualizaEstadoTransfer(en.Transfer_Id, 4,"S");
                                }
                                else
                                {
                                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + errors + "');", true);
                                }
                            }
                            else
                            {
                                List<Transfer_Detail> dt = vWMS.ObtieneDetalleTransferencia(TransferId);
                                foreach (var t in dt)
                                {
                                    int? LayoutDestino = 0;
                                    if (en.Site_Id_Destiny == 1 && en.Site_Id == 19 && en.Transfer_U_Entidad == 7)
                                    {
                                        LayoutDestino = en.Transfer_U_Folio_Entidad;
                                    }
                                    else
                                    {
                                        LayoutDestino = vControl.ObtieneUbicacionDefecto(en.Site_Id_Destiny, 1);
                                    }
                                    int staffid = vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString());
                                    vWMS.CierreTransferenciaPROC(TransferId, LayoutDestino, staffid);
                                }

                                vWMS.ActualizaFechaUsuarioTransferencia(en.Transfer_Id, PreUsuario);
                                vWMS.ActualizaEstadoTransfer(en.Transfer_Id, 4,"S");
                            }
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Transferencia no contiene Bultos');", true);
                    }
                }
                catch
                {
                }

                GvDatos.DataBind();
            }

            #region PreConfirma
            //if (e.CommandArgs.CommandName=="cmdPreConfirma")
            //{
            //    WMSClass vWMS = new WMSClass();
            //    int TransferIdCon = Convert.ToInt32(e.KeyValue);
            //    int UserCreador = vWMS.ObtieneIdStaffTransfer(TransferIdCon);
            //    int PreUsuario= vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString());

            //    int idSitio= vWMS.ObtieneSitioDestino(TransferIdCon);
            //    if (idSitio == 5) {
            //        try
            //        {
            //            SAPClass vSAP = new SAPClass();
            //            //WMSClass vWMS = new WMSClass();
            //            ControlClass vControl = new ControlClass();
            //            int TransferId = Convert.ToInt32(e.KeyValue);
            //            int CantDet = vWMS.CuentaDetalleTransferencia(TransferId);
            //            if (CantDet > 0)
            //            {

            //                List<Transfer> tr = vWMS.ObtieneInfoTransferencia(TransferId);
            //                foreach (var en in tr)
            //                {
            //                    string borigen = vWMS.ObtieneNombreCortoSitio(en.Site_Id);
            //                    string bdestino = vWMS.ObtieneNombreCortoSitio(en.Site_Id_Destiny);
            //                    if (vSAP.ObtieneDocNumTransferenciaSAP(TransferId) == 0)
            //                    {
            //                        string errors = vSAP.CreaTransferencia(TransferId, borigen, bdestino, Session["CIDUsuario"].ToString());
            //                        if (errors == "0")
            //                        {
            //                            //List<Transfer_Detail> dt = vWMS.ObtieneDetalleTransferencia(TransferId);
            //                            //foreach (var t in dt)
            //                            //{
            //                            //List<Package> pk = vWMS.ObtieneInfoPallet(t.Package_Id);
            //                            //foreach (var p in pk)
            //                            //{
            //                            int? LayoutDestino = 0;
            //                            if (en.Site_Id_Destiny == 1 && en.Site_Id == 19 && en.Transfer_U_Entidad == 7)
            //                            {
            //                                LayoutDestino = en.Transfer_U_Folio_Entidad;

            //                                if (LayoutDestino == 0 || LayoutDestino == null)
            //                                {
            //                                    LayoutDestino = vControl.ObtieneUbicacionDefecto(en.Site_Id_Destiny, 1);
            //                                }
            //                            }
            //                            else
            //                            {
            //                                LayoutDestino = vControl.ObtieneUbicacionDefecto(en.Site_Id_Destiny, 1);
            //                            }
            //                            //int? packageid = p.Package_Id;
            //                            //int reserveid = vWMS.ObtieneReservaId(t.Package_Id, t.Transfer_Id);
            //                            int staffid = vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString());
            //                            vWMS.CierreTransferenciaPROC(TransferId, LayoutDestino, staffid);
            //                            //int tareaid = vWMS.AgregaTareaTransferencia(en.Site_Id, 7, p.ArticleProvider_Id, (int)t.Layout_Id_Actual, LayoutDestino, packageid, p.Package_Quantity, p.Package_Lot, 5, staffid, staffid, reserveid);
            //                            //vWMS.ActualizaReserve(reserveid, 3);
            //                            //vWMS.AddLocation(t.Package_Id, (int)LayoutDestino, staffid);
            //                            //vWMS.ActualizaLayoutReservePackage(t.Package_Id, (int)LayoutDestino);
            //                            //vWMS.ActualizaEstadoyTareaTransferDetail(t.Transfer_Id, t.Package_Id, 3, tareaid);
            //                            //}
            //                            //}
            //                            vWMS.ActualizaFechaUsuarioTransferencia(en.Transfer_Id, PreUsuario);
            //                            vWMS.ActualizaEstadoTransfer(en.Transfer_Id, 4);
            //                            //try
            //                            //{
            //                            //    LogClass vLog = new LogClass();
            //                            //    vLog.InsertaLogSync(13, 67, TransferId, 0, 'S', "Sincronizado", 2);
            //                            //}
            //                            //catch
            //                            //{ }
            //                        }
            //                        else
            //                        {
            //                            //try
            //                            //{
            //                            //    LogClass vLog = new LogClass();
            //                            //    vLog.InsertaLogSync(13, 67, TransferId, 0, 'E', errors, 2);
            //                            //}
            //                            //catch
            //                            //{
            //                            //}
            //                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + errors + "');", true);
            //                        }
            //                    }
            //                    else
            //                    {
            //                        List<Transfer_Detail> dt = vWMS.ObtieneDetalleTransferencia(TransferId);
            //                        foreach (var t in dt)
            //                        {
            //                            //List<Package> pk = vWMS.ObtieneInfoPallet(t.Package_Id);
            //                            //foreach (var p in pk)
            //                            //{
            //                            int? LayoutDestino = 0;
            //                            if (en.Site_Id_Destiny == 1 && en.Site_Id == 19 && en.Transfer_U_Entidad == 7)
            //                            {
            //                                LayoutDestino = en.Transfer_U_Folio_Entidad;
            //                            }
            //                            else
            //                            {
            //                                LayoutDestino = vControl.ObtieneUbicacionDefecto(en.Site_Id_Destiny, 1);
            //                            }
            //                            //int? packageid = p.Package_Id;
            //                            //int reserveid = vWMS.ObtieneReservaId(t.Package_Id, t.Transfer_Id);
            //                            int staffid = vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString());
            //                            vWMS.CierreTransferenciaPROC(TransferId, LayoutDestino, staffid);
            //                            //int tareaid = vWMS.AgregaTareaTransferencia(en.Site_Id, 7, p.ArticleProvider_Id, (int)t.Layout_Id_Actual, LayoutDestino, packageid, p.Package_Quantity, p.Package_Lot, 5, staffid, staffid, reserveid);
            //                            //vWMS.ActualizaReserve(reserveid, 3);
            //                            //vWMS.AddLocation(t.Package_Id, (int)LayoutDestino, staffid);
            //                            //vWMS.ActualizaLayoutReservePackage(t.Package_Id, (int)LayoutDestino);
            //                            //vWMS.ActualizaEstadoyTareaTransferDetail(t.Transfer_Id, t.Package_Id, 3, tareaid);
            //                            //}
            //                        }

            //                        vWMS.ActualizaFechaUsuarioTransferencia(en.Transfer_Id, PreUsuario);
            //                        vWMS.ActualizaEstadoTransfer(en.Transfer_Id, 4);
            //                        //try
            //                        //{
            //                        //    LogClass vLog = new LogClass();
            //                        //    vLog.InsertaLogSync(13, 67, TransferId, 0, 'S', "Sincronizado", 2);
            //                        //}
            //                        //catch
            //                        //{ }
            //                    }
            //                }
            //            }
            //            else
            //            {
            //                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Transferencia no contiene Bultos');", true);
            //            }
            //        }
            //        catch
            //        {
            //        }
            //    }
            //    else if (UserCreador == PreUsuario)
            //    {
            //        vWMS.ActualizaEstadoTransfer(TransferIdCon, 3);
            //    }
            //    else {
            //        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Transferencia no puede ser Enviada Por : " + Session["NombreUsuario"].ToString() + "');", true);
            //    }


            //}
            #endregion
        }

        protected void GvDatos_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != DevExpress.Web.GridViewRowType.Data) return;
            int Estado = (int)e.GetValue("Status");
            if (Estado == 1)
            {
                System.Web.UI.WebControls.ImageButton imgAnula = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Anula") as System.Web.UI.WebControls.ImageButton;
                imgAnula.Visible = true;
                System.Web.UI.WebControls.ImageButton imgConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Confirma") as System.Web.UI.WebControls.ImageButton;
                imgConfirma.Visible = true;
                System.Web.UI.WebControls.ImageButton imgExpedicion = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "GeneraExpedicion") as System.Web.UI.WebControls.ImageButton;
                imgExpedicion.Visible = false;



            }
            if (Estado == 3)
            {
                System.Web.UI.WebControls.ImageButton imgConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Confirma") as System.Web.UI.WebControls.ImageButton;
                System.Web.UI.WebControls.ImageButton imgAnula = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Anula") as System.Web.UI.WebControls.ImageButton;
                imgAnula.Visible = true;
                imgConfirma.Visible = true;
                System.Web.UI.WebControls.ImageButton imgExpedicion = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "GeneraExpedicion") as System.Web.UI.WebControls.ImageButton;
                imgExpedicion.Visible = true;
            }
            if (Estado == 4)
            {
                System.Web.UI.WebControls.ImageButton imgConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Confirma") as System.Web.UI.WebControls.ImageButton;
                System.Web.UI.WebControls.ImageButton imgAnula = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Anula") as System.Web.UI.WebControls.ImageButton;
                imgAnula.Visible = false;
                imgConfirma.Visible = false;
                System.Web.UI.WebControls.ImageButton imgExpedicion = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "GeneraExpedicion") as System.Web.UI.WebControls.ImageButton;
                imgExpedicion.Visible = true;
            }
            if (Estado == 5)
            {
                System.Web.UI.WebControls.ImageButton imgConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Confirma") as System.Web.UI.WebControls.ImageButton;
                System.Web.UI.WebControls.ImageButton imgAnula = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Anula") as System.Web.UI.WebControls.ImageButton;
                imgAnula.Visible = false;
                imgConfirma.Visible = false;
                System.Web.UI.WebControls.ImageButton imgExpedicion = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "GeneraExpedicion") as System.Web.UI.WebControls.ImageButton;
                imgExpedicion.Visible = false;
            }

        }

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            WMSClass vWMS = new WMSClass();
            int idbod = Convert.ToInt32(e.NewValues["Site_Id_Destiny"]);

            if (idbod == 20)
            {
                e.NewValues["Company_Id"] = 1;
                e.NewValues["Staff_Id"] = vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString());
                e.NewValues["Date"] = DateTime.Now;
                e.NewValues["Status"] = 1;
                e.NewValues["Type_Id"] = 1;
            }
            else
            {
                e.Cancel = true;
            }

        }

        protected void GvDatos_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            GvDatos.DataBind();
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Transferencias  " + cb_fdesde.Text + " / " + cb_fhasta.Text;

            }
        }
    }
}