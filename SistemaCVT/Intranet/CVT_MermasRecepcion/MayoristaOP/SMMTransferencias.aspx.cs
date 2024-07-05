using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Mail;
using System.Web.UI;

namespace CVT_MermasRecepcion.MayoristaOP
{
    public partial class SMMTransferencias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)            {
                dteInicio.Date = DateTime.Now.AddDays(-2);
                dteTermino.Date = DateTime.Now.AddDays(1);
            }
        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                Session["TransferId"] = e.KeyValue;
                Response.Redirect("~/MayoristaOP/SMMTransferenciasDetalle.aspx");
            }
            if (e.CommandArgs.CommandName == "cmdNull")
            {

                CVTWMSMetroClass vWMS = new CVTWMSMetroClass();
                int TransferId = Convert.ToInt32(e.KeyValue);
                int CantDet = vWMS.CuentaDetalleTransferenciaSMM(TransferId);

                if (CantDet > 0)
                {
                    vWMS.ActualizaEstadoTransferSMM(TransferId, 5);
                    List<SMM_Transfer_Detail> dt = vWMS.ObtieneDetalleTransferenciaSMM(TransferId);
                    foreach (var t in dt)
                    {
                        vWMS.EliminaBultoTransferenciaSMM(TransferId, t.Package_Id);
                    }
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Transferencia Anulada Correctamente');", true);
                    GvDatos.DataBind();
                }
                else
                {
                    vWMS.ActualizaEstadoTransferSMM(TransferId, 5);
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Transferencia Anulada Correctamente');", true);
                }

            }
            if (e.CommandArgs.CommandName == "cmdEnvia")
            {
                int idTransf = Convert.ToInt32(e.KeyValue);

                CVTWMSMetroClass mc = new CVTWMSMetroClass();
                UsuarioClass us = new UsuarioClass();
                List<SMM_Transfer> lt = mc.ObtieneDatosCabTransfer(idTransf);

                int idUser1 = Convert.ToInt32(Session["IDCVTUsuario"]);
                string BodDestino = "";
                string BodUsuario = "";
                int idUser = 0;
                foreach (var t in lt)
                {
                    BodDestino = mc.ObtieneNombreSitio(t.Site_Id_Destiny);
                    BodUsuario = us.TraeBodegaUsuario(Convert.ToInt32(t.IdUsuario));
                    idUser = t.IdUsuario;
                }

                if (BodDestino.Equals(BodUsuario))
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Transferencia no puede ser enviada verificar Bodegas');", true);
                }
                else if ((BodUsuario == string.Empty || BodUsuario != BodDestino || BodUsuario==null) && idUser == idUser1)
                {

                    int CantDet = mc.CuentaDetalleTransferenciaSMM(idTransf);
                    if (CantDet > 0)
                    {

                        bool res = mc.CambiaEstadoTransferencia(idTransf, 3);

                        if (res == true)
                        {
                            List<SMM_MAIL_USUARIOS_MAYORISTA> li = mc.TraeMailUsuarios();
                            MailMessage vMail = new MailMessage();

                            foreach (var t in li)
                            {
                                vMail.To.Add(t.MailUsuario);
                            }

                            string MlBody = "TRANSFERENCIA ENVIADA FOLIO N°" + idTransf + "  , con fecha :" + DateTime.Now + " por : " + Session["NombreUsuario"].ToString() + " , favor verificar y confirmar.";



                            //vMail.To.Add("juancarojorquera@gmail.com");

                            SmtpClient vSmtp = new SmtpClient();
                            vSmtp.Host = "smtp-mail.outlook.com";
                            vSmtp.Port = 587;
                            vSmtp.EnableSsl = true;
                            vSmtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                            vSmtp.UseDefaultCredentials = false;
                            string mailfrom = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["MailLog"]);
                            string mailpass = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["PassMailLog"]);
                            vSmtp.Credentials = new NetworkCredential(mailfrom, mailpass);
                            vMail.From = new MailAddress(mailfrom);
                            vMail.Subject = "TRANSFERENCIA ENVIADA";
                            vMail.Body = MlBody + Environment.NewLine + Environment.NewLine + Environment.NewLine + Environment.NewLine +
                                                 Environment.NewLine + Environment.NewLine + Environment.NewLine + Environment.NewLine
                                               + Environment.NewLine + Environment.NewLine + "Correo generado automaticamente por sistema intranet CVT, Cuenta de mail no monitoreada, favor no responder.";
                            System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                            vSmtp.Send(vMail);

                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Transferencia Enviada');", true);
                            GvDatos.DataBind();

                            //correo


                        }
                    }
                    else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Transferencia no contiene Bultos');", true); }

                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('No puede enviar tranferencia que no ha creado');", true);
                }


            }
            if (e.CommandArgs.CommandName == "cmdConfirma")
            {
                UsuarioClass user = new UsuarioClass();
                CVTWMSMetroClass vWMS = new CVTWMSMetroClass();
                int TransferId = Convert.ToInt32(e.KeyValue);


                //try
                //{

                SAPSMM vSAP = new SAPSMM();
                ControlClass vControl = new ControlClass();

                int CantDet = vWMS.CuentaDetalleTransferenciaSMM(TransferId);

                int PallSin = vWMS.TraePalletSinConfirmar(TransferId);

                UsuarioClass us = new UsuarioClass();
                List<SMM_Transfer> lt = vWMS.ObtieneDatosCabTransfer(TransferId);

                int idUser1 = Convert.ToInt32(Session["IDCVTUsuario"]);
                string BodDestino = "";
                string BodUsuario = "";
                int idUser = 0;
                int idSoli = 0;
                foreach (var t in lt)
                {
                    BodDestino = vWMS.ObtieneNombreSitio(t.Site_Id_Destiny);
                    BodUsuario = us.TraeBodegaUsuario(Convert.ToInt32(Session["IDCVTUsuario"]));
                    idUser = t.IdUsuario;
                    idSoli = Convert.ToInt32(t.FolioSolicitud);
                }
                if (PallSin == 0)
                {
                    if (idUser1 != idUser)
                    {
                        if (BodDestino.Equals(BodUsuario) || BodUsuario == null || BodUsuario==string.Empty)
                        {
                            if (CantDet > 0)
                            {
                                List<SMM_Transfer> tr = vWMS.ObtieneInfoTransferencia(TransferId);
                                foreach (var en in tr)
                                {
                                    string borigen = vWMS.ObtieneNombreSitio(en.Site_Id);
                                    string bdestino = vWMS.ObtieneNombreSitio(en.Site_Id_Destiny);

                                    if (bdestino.Equals("01"))
                                    {
                                        if (vSAP.ObtieneDocNumTransferenciaSAP(TransferId) == 0)
                                        {
                                            string errors = vSAP.CreaTransferencia(TransferId, borigen, bdestino, Session["CIDUsuario"].ToString());
                                            if (errors == "0")
                                            {
                                                int? LayoutDestino = 0;
                                                LayoutDestino = vControl.ObtieneSMMUbicacionDefecto(en.Site_Id_Destiny);

                                                int staffid = Convert.ToInt32(Session["IDCVTUsuario"].ToString());


                                                List<VW_STOCK_FECHA_TRANSFERENCIA> lt1 = vWMS.ObtieneDetosStockTransferencia(TransferId);
                                                foreach (var t in lt1)
                                                {
                                                    if (vWMS.VerificaStockEnTabla(t.Site_Id_Destiny, t.ItemCode, Convert.ToDateTime(t.Package_ProductionDate)) != string.Empty)
                                                    {
                                                        bool rest = vWMS.ActualizaTablaStock(t.Site_Id_Destiny, t.ItemCode, Convert.ToDateTime(t.Package_ProductionDate), Convert.ToDecimal(t.Cantidad));

                                                        if (rest == true)
                                                        {
                                                            vWMS.CierreTransferenciaPROCSMM(TransferId, LayoutDestino, staffid);
                                                            vWMS.ActualizaEstadoTransferSMM(en.Transfer_Id, 4);
                                                            vWMS.DardeBajaPalletTransferenciaSMM(TransferId);
                                                            vWMS.actualizaEstadoSolicitud(Convert.ToInt32(idSoli), 3);
                                                        }
                                                    }
                                                    else
                                                    {

                                                        SMM_StockFecha st = new SMM_StockFecha();

                                                        st.Bodega = t.Site_Id_Destiny;
                                                        st.Producto = t.ItemCode;
                                                        st.FechaProduccion = Convert.ToDateTime(t.Package_ProductionDate);
                                                        st.Cantidad = t.Cantidad;

                                                        bool rest = vWMS.InsertaStockTabla(st);

                                                        if (rest == true)
                                                        {
                                                            vWMS.CierreTransferenciaPROCSMM(TransferId, LayoutDestino, staffid);
                                                            vWMS.ActualizaEstadoTransferSMM(en.Transfer_Id, 4);
                                                            vWMS.DardeBajaPalletTransferenciaSMM(TransferId);
                                                            vWMS.actualizaEstadoSolicitud(Convert.ToInt32(idSoli), 3);
                                                        }

                                                    }
                                                }

                                            }
                                            else
                                            {
                                                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + errors + "');", true);
                                            }
                                        }
                                        else
                                        {

                                            int? LayoutDestino = 0;
                                            LayoutDestino = vControl.ObtieneSMMUbicacionDefecto(en.Site_Id_Destiny);
                                            int staffid = Convert.ToInt32(Session["IDCVTUsuario"].ToString());

                                            vWMS.CierreTransferenciaPROCSMM(TransferId, LayoutDestino, staffid);
                                            vWMS.ActualizaEstadoTransferSMM(en.Transfer_Id, 4);
                                            vWMS.DardeBajaPalletTransferenciaSMM(TransferId);
                                            vWMS.actualizaEstadoSolicitud(Convert.ToInt32(idSoli), 3);
                                        }
                                    }
                                    else if (borigen.Equals("01"))
                                    {
                                        if (vSAP.ObtieneDocNumTransferenciaSAP(TransferId) == 0)
                                        {
                                            string errors = vSAP.CreaTransferencia(TransferId, borigen, bdestino, Session["CIDUsuario"].ToString());
                                            if (errors == "0")
                                            {
                                                int? LayoutDestino = 0;
                                                LayoutDestino = vControl.ObtieneSMMUbicacionDefecto(en.Site_Id_Destiny);

                                                int staffid = Convert.ToInt32(Session["IDCVTUsuario"].ToString());



                                                List<VW_STOCK_FECHA_TRANSFERENCIA> lt1 = vWMS.ObtieneDetosStockTransferencia(TransferId);
                                                foreach (var t in lt1)
                                                {
                                                    if (vWMS.VerificaStockEnTabla(t.Site_Id_Destiny, t.ItemCode, Convert.ToDateTime(t.Package_ProductionDate)) != string.Empty)
                                                    {
                                                        bool rest = vWMS.ActualizaRestaTablaStock(t.Site_Id_Destiny, t.ItemCode, Convert.ToDateTime(t.Package_ProductionDate), Convert.ToDecimal(t.Cantidad));

                                                        if (rest == true)
                                                        {
                                                            vWMS.CierreTransferenciaPROCSMM(TransferId, LayoutDestino, staffid);
                                                            vWMS.ActualizaEstadoTransferSMM(en.Transfer_Id, 4);
                                                            vWMS.actualizaEstadoSolicitud(Convert.ToInt32(idSoli), 3);
                                                        }
                                                    }
                                                    //else
                                                    //{
                                                    //    SMM_StockFecha st = new SMM_StockFecha();
                                                    //    st.Bodega = t.Site_Id_Destiny;
                                                    //    st.Producto = t.ItemCode;
                                                    //    st.FechaProduccion = Convert.ToDateTime(t.Package_ProductionDate);
                                                    //    st.Cantidad = t.Cantidad;
                                                    //    vWMS.InsertaStockTabla(st);
                                                    //}
                                                }

                                            }
                                            else
                                            {

                                                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + errors + "');", true);
                                            }
                                        }
                                        else
                                        {
                                            List<SMM_Transfer_Detail> dt = vWMS.ObtieneDetalleTransferenciaSMM(TransferId);
                                            foreach (var t in dt)
                                            {
                                                int? LayoutDestino = 0;
                                                //LayoutDestino = vControl.ObtieneSMMUbicacionDefecto(en.Site_Id_Destiny);

                                                if (en.Site_Id_Destiny == 1 && en.Site_Id == 19 && en.Transfer_Entidad == 7)
                                                {
                                                    LayoutDestino = en.Transfer_Folio_Entidad;
                                                }
                                                else
                                                {
                                                    LayoutDestino = vControl.ObtieneSMMUbicacionDefecto(en.Site_Id_Destiny);
                                                }

                                                int staffid = Convert.ToInt32(Session["IDCVTUsuario"]);



                                                List<VW_STOCK_FECHA_TRANSFERENCIA> lt1 = vWMS.ObtieneDetosStockTransferencia(TransferId);
                                                foreach (var l in lt1)
                                                {
                                                    if (vWMS.VerificaStockEnTabla(l.Site_Id_Destiny, l.ItemCode, Convert.ToDateTime(l.Package_ProductionDate)) != string.Empty)
                                                    {
                                                        bool rest = vWMS.ActualizaRestaTablaStock(l.Site_Id_Destiny, l.ItemCode, Convert.ToDateTime(l.Package_ProductionDate), Convert.ToDecimal(t.Package_Quantity));

                                                        if (rest == true)
                                                        {
                                                            vWMS.CierreTransferenciaPROCSMM(TransferId, LayoutDestino, staffid);
                                                            vWMS.actualizaEstadoSolicitud(Convert.ToInt32(idSoli), 3);
                                                        }
                                                    }
                                                    //else
                                                    //{

                                                    //    SMM_StockFecha st = new SMM_StockFecha();

                                                    //    st.Bodega = l.Site_Id_Destiny;
                                                    //    st.Producto = l.ItemCode;
                                                    //    st.FechaProduccion = Convert.ToDateTime(l.Package_ProductionDate);
                                                    //    st.Cantidad = l.Cantidad;

                                                    //    vWMS.InsertaStockTabla(st);

                                                    //}
                                                }
                                            }
                                            vWMS.ActualizaEstadoTransferSMM(en.Transfer_Id, 4);

                                        }
                                    }
                                    else
                                    {
                                        if (vSAP.ObtieneDocNumTransferenciaSAP(TransferId) == 0)
                                        {
                                            string errors = vSAP.CreaTransferencia
                                                (TransferId, borigen, bdestino, Session["CIDUsuario"].ToString());
                                            if (errors == "0")
                                            {
                                                int? LayoutDestino = 0;
                                                LayoutDestino = vControl.ObtieneSMMUbicacionDefecto(en.Site_Id_Destiny);

                                                int staffid = Convert.ToInt32(Session["IDCVTUsuario"].ToString());
                                                vWMS.CierreTransferenciaPROCSMM(TransferId, LayoutDestino, staffid);

                                                vWMS.ActualizaEstadoTransferSMM(en.Transfer_Id, 4);
                                                vWMS.actualizaEstadoSolicitud(Convert.ToInt32(idSoli), 3);

                                            }
                                            else
                                            {

                                                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + errors + "');", true);
                                            }
                                        }
                                        else
                                        {
                                            List<SMM_Transfer_Detail> dt = vWMS.ObtieneDetalleTransferenciaSMM(TransferId);
                                            foreach (var t in dt)
                                            {
                                                int? LayoutDestino = 0;
                                                //LayoutDestino = vControl.ObtieneSMMUbicacionDefecto(en.Site_Id_Destiny);

                                                if (en.Site_Id_Destiny == 1 && en.Site_Id == 19 && en.Transfer_Entidad == 7)
                                                {
                                                    LayoutDestino = en.Transfer_Folio_Entidad;
                                                }
                                                else
                                                {
                                                    LayoutDestino = vControl.ObtieneSMMUbicacionDefecto(en.Site_Id_Destiny);
                                                }

                                                int staffid = Convert.ToInt32(Session["IDCVTUsuario"]);
                                                vWMS.CierreTransferenciaPROCSMM(TransferId, LayoutDestino, staffid);
                                                vWMS.actualizaEstadoSolicitud(Convert.ToInt32(idSoli), 3);
                                            }
                                            vWMS.ActualizaEstadoTransferSMM(en.Transfer_Id, 4);

                                        }
                                    }
                                }
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Transferencia no contiene Bultos');", true);
                            }
                            GvDatos.DataBind();

                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('No puedes confirmar transferencias que no sean de tu bodega');", true);
                        }

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Has creado la transferencia no puedes confirmarla');", true);
                    }
                }
                else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Tiene palets sin confirmar favor regularizar ');", true); }

            }
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            GvDatos.DataBind();
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
                imgConfirma.Visible = false;
                System.Web.UI.WebControls.ImageButton imgEnvia = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Envia") as System.Web.UI.WebControls.ImageButton;
                imgEnvia.Visible = true;

            }
            if (Estado == 3)
            {
                System.Web.UI.WebControls.ImageButton imgEnvia = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Envia") as System.Web.UI.WebControls.ImageButton;
                imgEnvia.Visible = false;
                System.Web.UI.WebControls.ImageButton imgAnula = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Anula") as System.Web.UI.WebControls.ImageButton;
                imgAnula.Visible = true;
                System.Web.UI.WebControls.ImageButton imgConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Confirma") as System.Web.UI.WebControls.ImageButton;
                imgConfirma.Visible = true;

            }
            if (Estado == 4)
            {
                System.Web.UI.WebControls.ImageButton imgEnvia = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Envia") as System.Web.UI.WebControls.ImageButton;
                imgEnvia.Visible = false;
                System.Web.UI.WebControls.ImageButton imgConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Confirma") as System.Web.UI.WebControls.ImageButton;
                System.Web.UI.WebControls.ImageButton imgAnula = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Anula") as System.Web.UI.WebControls.ImageButton;
                imgAnula.Visible = false;
                imgConfirma.Visible = false;

            }
            if (Estado == 5)
            {
                System.Web.UI.WebControls.ImageButton imgEnvia = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Envia") as System.Web.UI.WebControls.ImageButton;
                imgEnvia.Visible = false;
                System.Web.UI.WebControls.ImageButton imgConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Confirma") as System.Web.UI.WebControls.ImageButton;
                System.Web.UI.WebControls.ImageButton imgAnula = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Anula") as System.Web.UI.WebControls.ImageButton;
                imgAnula.Visible = false;
                imgConfirma.Visible = false;
            }
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Transferencias";

            }
        }

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 241, "Crea Registro");

            e.NewValues["IdUsuario"] = Session["IDCVTUsuario"];
            e.NewValues["Date"] = DateTime.Now;
            e.NewValues["Status"] = 1;
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
            int Estado = Convert.ToInt32(grid.GetRowValues(visibleindex, "Status").ToString());
            if (Estado != 1)
            {
                ret = false;
            }
            return ret;
        }

        protected void GvDatos_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 241, "Actualiza Registro");
        }
      
    }
}