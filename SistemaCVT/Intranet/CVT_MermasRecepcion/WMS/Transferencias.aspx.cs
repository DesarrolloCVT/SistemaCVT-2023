
using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Mail;
using System.Web.UI;

namespace CVT_MermasRecepcion.Transferencias
{
    public partial class Transferencias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                cb_fdesde.Date = DateTime.Now.AddDays(-2);
                cb_fhasta.Date = DateTime.Now.AddDays(1);
                //WMSClass Vwms = new WMSClass();
                //int idstaf = Vwms.ObtieneIdStaff(Session["CIDUsuario"].ToString());
                ////LqDsTransferencias.WhereParameters.Clear();
                //LqDsTransferencias.WhereParameters.Add("IdStaff", DbType.Int32, idstaf.ToString());
                //LqDsTransferencias.Where = "Staff_Id==@IdStaff";
            }

        }

        //protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        //{
        //    GvDatos.AddNewRow();
        //}

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{

        //}

        protected void btn_filtrar_Click(object sender, EventArgs e)
        {
            GvDatos.DataBind();
        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                Session["TransferId"] = e.KeyValue;
                Response.Redirect("~/WMS/TransferenciasDetalle.aspx");
            }
            if (e.CommandArgs.CommandName == "cmdAnula")
            {
                WMSClass vWMS = new WMSClass();
                int TransferId = Convert.ToInt32(e.KeyValue);
                int CantDet = vWMS.CuentaDetalleTransferencia(TransferId);

                int UserCreador = vWMS.ObtieneIdStaffTransfer(TransferId);
                int PreUsuario = vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString());

                if (UserCreador == PreUsuario || Convert.ToInt32(Session["PerfilId"]) == 1)
                {
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
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Transferencia no puede ser Anulada Por : " + Session["NombreUsuario"].ToString() + "');", true);
                }

                GvDatos.DataBind();
            }
            if (e.CommandArgs.CommandName == "cmdConfirma")
            {
                UsuarioClass user = new UsuarioClass();
                WMSClass vWMS = new WMSClass();
                int TransferIdCread = Convert.ToInt32(e.KeyValue);
             
                int UserCreador = vWMS.ObtieneIdStaffTransfer(TransferIdCread);
                int PreUsuario = vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString());
             


                string bodegaCreado = vWMS.ObtieneSiteTransferencia(TransferIdCread);

                string bodegaCreadoDestino = vWMS.ObtieneSiteDestinoTransferencia(TransferIdCread);
              
                string bodegaUser = user.TraeBodegaUsuario(Convert.ToInt32(Session["IDCVTUsuario"]));
           

                if (UserCreador != PreUsuario)
                {
                    if (bodegaCreadoDestino == bodegaUser || bodegaUser == null || bodegaUser == string.Empty)
                    {
                        int TransferEntidad = vWMS.TraeTransferEntidad(TransferIdCread);
                        int FolioEnt = vWMS.TraeTransferFolioEnt(TransferIdCread);
                        int UbicaVal = vWMS.VerificaFolioEntidad(FolioEnt);

                        if (bodegaCreado == "CV105" && bodegaCreadoDestino == "CV100" && TransferEntidad == 7)
                        {
                            if (FolioEnt != 0)
                            {
                                if (UbicaVal != 0)
                                {
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
                                                        //List<Transfer_Detail> dt = vWMS.ObtieneDetalleTransferencia(TransferId);
                                                        //foreach (var t in dt)
                                                        //{
                                                        //List<Package> pk = vWMS.ObtieneInfoPallet(t.Package_Id);
                                                        //foreach (var p in pk)
                                                        //{
                                                        int? LayoutDestino = 0;
                                                        if (en.Site_Id_Destiny == 1 && en.Site_Id == 19 && en.Transfer_U_Entidad == 7)
                                                        {
                                                            LayoutDestino = en.Transfer_U_Folio_Entidad;
                                                        }
                                                        else
                                                        {
                                                            LayoutDestino = vControl.ObtieneUbicacionDefecto(en.Site_Id_Destiny, 1);
                                                        }
                                                        //int? packageid = p.Package_Id;
                                                        //int reserveid = vWMS.ObtieneReservaId(t.Package_Id, t.Transfer_Id);
                                                        int staffid = vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString());
                                                        vWMS.CierreTransferenciaPROC(TransferId, LayoutDestino, staffid);
                                                        //int tareaid = vWMS.AgregaTareaTransferencia(en.Site_Id, 7, p.ArticleProvider_Id, (int)t.Layout_Id_Actual, LayoutDestino, packageid, p.Package_Quantity, p.Package_Lot, 5, staffid, staffid, reserveid);
                                                        //vWMS.ActualizaReserve(reserveid, 3);
                                                        //vWMS.AddLocation(t.Package_Id, (int)LayoutDestino, staffid);
                                                        //vWMS.ActualizaLayoutReservePackage(t.Package_Id, (int)LayoutDestino);
                                                        //vWMS.ActualizaEstadoyTareaTransferDetail(t.Transfer_Id, t.Package_Id, 3, tareaid);
                                                        //}
                                                        //}
                                                        vWMS.ActualizaFechaUsuarioTransferencia(en.Transfer_Id, PreUsuario);
                                                        vWMS.ActualizaEstadoTransfer(en.Transfer_Id, 4,"S");
                                                        GvDatos.DataBind();
                                                        //try
                                                        //{
                                                        //    LogClass vLog = new LogClass();
                                                        //    vLog.InsertaLogSync(13, 67, TransferId, 0, 'S', "Sincronizado", 2);
                                                        //}
                                                        //catch
                                                        //{ }
                                                    }
                                                    else
                                                    {
                                                        //try
                                                        //{
                                                        //    LogClass vLog = new LogClass();
                                                        //    vLog.InsertaLogSync(13, 67, TransferId, 0, 'E', errors, 2);
                                                        //}
                                                        //catch
                                                        //{
                                                        //}
                                                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + errors + "');", true);
                                                    }
                                                }
                                                else
                                                {
                                                    List<Transfer_Detail> dt = vWMS.ObtieneDetalleTransferencia(TransferId);
                                                    foreach (var t in dt)
                                                    {
                                                        //List<Package> pk = vWMS.ObtieneInfoPallet(t.Package_Id);
                                                        //foreach (var p in pk)
                                                        //{
                                                        int? LayoutDestino = 0;
                                                        if (en.Site_Id_Destiny == 1 && en.Site_Id == 19 && en.Transfer_U_Entidad == 7)
                                                        {
                                                            LayoutDestino = en.Transfer_U_Folio_Entidad;
                                                        }
                                                        else
                                                        {
                                                            LayoutDestino = vControl.ObtieneUbicacionDefecto(en.Site_Id_Destiny, 1);
                                                        }
                                                        //int? packageid = p.Package_Id;
                                                        //int reserveid = vWMS.ObtieneReservaId(t.Package_Id, t.Transfer_Id);
                                                        int staffid = vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString());
                                                        vWMS.CierreTransferenciaPROC(TransferId, LayoutDestino, staffid);
                                                        //int tareaid = vWMS.AgregaTareaTransferencia(en.Site_Id, 7, p.ArticleProvider_Id, (int)t.Layout_Id_Actual, LayoutDestino, packageid, p.Package_Quantity, p.Package_Lot, 5, staffid, staffid, reserveid);
                                                        //vWMS.ActualizaReserve(reserveid, 3);
                                                        //vWMS.AddLocation(t.Package_Id, (int)LayoutDestino, staffid);
                                                        //vWMS.ActualizaLayoutReservePackage(t.Package_Id, (int)LayoutDestino);
                                                        //vWMS.ActualizaEstadoyTareaTransferDetail(t.Transfer_Id, t.Package_Id, 3, tareaid);
                                                        //}
                                                    }

                                                    vWMS.ActualizaFechaUsuarioTransferencia(en.Transfer_Id, PreUsuario);
                                                    vWMS.ActualizaEstadoTransfer(en.Transfer_Id, 4,"S");
                                                    GvDatos.DataBind();
                                                    //try
                                                    //{
                                                    //    LogClass vLog = new LogClass();
                                                    //    vLog.InsertaLogSync(13, 67, TransferId, 0, 'S', "Sincronizado", 2);
                                                    //}
                                                    //catch
                                                    //{ }
                                                }
                                            }
                                        }
                                        else
                                        {
                                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Transferencia no contiene Bultos');", true);
                                        }
                                    }
                                    catch (Exception ex)
                                    {

                                        string g = ex.Message;
                                    }
                                }
                                else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('ingrese ubicacion Valida Para Bodega CV100');", true); }
                            }
                            else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registre Folio Entidad');", true); }
                        }
                        else
                        {
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
                                                //List<Transfer_Detail> dt = vWMS.ObtieneDetalleTransferencia(TransferId);
                                                //foreach (var t in dt)
                                                //{
                                                //List<Package> pk = vWMS.ObtieneInfoPallet(t.Package_Id);
                                                //foreach (var p in pk)
                                                //{
                                                int? LayoutDestino = 0;
                                                if (en.Site_Id_Destiny == 1 && en.Site_Id == 19 && en.Transfer_U_Entidad == 7)
                                                {
                                                    LayoutDestino = en.Transfer_U_Folio_Entidad;
                                                }
                                                else
                                                {
                                                    LayoutDestino = vControl.ObtieneUbicacionDefecto(en.Site_Id_Destiny, 1);
                                                }
                                                //int? packageid = p.Package_Id;
                                                //int reserveid = vWMS.ObtieneReservaId(t.Package_Id, t.Transfer_Id);
                                                int staffid = vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString());
                                                vWMS.CierreTransferenciaPROC(TransferId, LayoutDestino, staffid);
                                                GvDatos.DataBind();
                                                //int tareaid = vWMS.AgregaTareaTransferencia(en.Site_Id, 7, p.ArticleProvider_Id, (int)t.Layout_Id_Actual, LayoutDestino, packageid, p.Package_Quantity, p.Package_Lot, 5, staffid, staffid, reserveid);
                                                //vWMS.ActualizaReserve(reserveid, 3);
                                                //vWMS.AddLocation(t.Package_Id, (int)LayoutDestino, staffid);
                                                //vWMS.ActualizaLayoutReservePackage(t.Package_Id, (int)LayoutDestino);
                                                //vWMS.ActualizaEstadoyTareaTransferDetail(t.Transfer_Id, t.Package_Id, 3, tareaid);
                                                //}
                                                //}
                                                vWMS.ActualizaFechaUsuarioTransferencia(en.Transfer_Id, PreUsuario);
                                                vWMS.ActualizaEstadoTransfer(en.Transfer_Id, 4,"S");
                                                //try
                                                //{
                                                //    LogClass vLog = new LogClass();
                                                //    vLog.InsertaLogSync(13, 67, TransferId, 0, 'S', "Sincronizado", 2);
                                                //}
                                                //catch
                                                //{ }
                                            }
                                            else
                                            {
                                                //try
                                                //{
                                                //    LogClass vLog = new LogClass();
                                                //    vLog.InsertaLogSync(13, 67, TransferId, 0, 'E', errors, 2);
                                                //}
                                                //catch
                                                //{
                                                //}
                                                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + errors + "');", true);
                                            }
                                        }
                                        else
                                        {
                                            List<Transfer_Detail> dt = vWMS.ObtieneDetalleTransferencia(TransferId);
                                            foreach (var t in dt)
                                            {
                                                //List<Package> pk = vWMS.ObtieneInfoPallet(t.Package_Id);
                                                //foreach (var p in pk)
                                                //{
                                                int? LayoutDestino = 0;
                                                if (en.Site_Id_Destiny == 1 && en.Site_Id == 19 && en.Transfer_U_Entidad == 7)
                                                {
                                                    LayoutDestino = en.Transfer_U_Folio_Entidad;
                                                }
                                                else
                                                {
                                                    LayoutDestino = vControl.ObtieneUbicacionDefecto(en.Site_Id_Destiny, 1);
                                                }
                                                //int? packageid = p.Package_Id;
                                                //int reserveid = vWMS.ObtieneReservaId(t.Package_Id, t.Transfer_Id);
                                                int staffid = vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString());
                                                vWMS.CierreTransferenciaPROC(TransferId, LayoutDestino, staffid);
                                              
                                                //int tareaid = vWMS.AgregaTareaTransferencia(en.Site_Id, 7, p.ArticleProvider_Id, (int)t.Layout_Id_Actual, LayoutDestino, packageid, p.Package_Quantity, p.Package_Lot, 5, staffid, staffid, reserveid);
                                                //vWMS.ActualizaReserve(reserveid, 3);
                                                //vWMS.AddLocation(t.Package_Id, (int)LayoutDestino, staffid);
                                                //vWMS.ActualizaLayoutReservePackage(t.Package_Id, (int)LayoutDestino);
                                                //vWMS.ActualizaEstadoyTareaTransferDetail(t.Transfer_Id, t.Package_Id, 3, tareaid);
                                                //}
                                            }

                                            vWMS.ActualizaFechaUsuarioTransferencia(en.Transfer_Id, PreUsuario);
                                            vWMS.ActualizaEstadoTransfer(en.Transfer_Id, 4,"S");
                                            GvDatos.DataBind();
                                            //try
                                            //{
                                            //    LogClass vLog = new LogClass();
                                            //    vLog.InsertaLogSync(13, 67, TransferId, 0, 'S', "Sincronizado", 2);
                                            //}
                                            //catch
                                            //{ }
                                        }
                                    }
                                }
                                else
                                {
                                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Transferencia no contiene Bultos');", true);
                                }
                            }
                            catch (Exception ex)
                            {

                                string g = ex.Message;
                            }
                        }
                       
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Transferencia no puede ser Confirmada por : " + Session["NombreUsuario"].ToString() + ", En la Bodega " + bodegaCreado + " ');", true);
                    }

                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Transferencia no puede ser Confirmada por : " + Session["NombreUsuario"].ToString() + "');", true);
                }
                GvDatos.DataBind();
            }
            if (e.CommandArgs.CommandName == "cmdPreConfirma")
            {
                WMSClass vWMS = new WMSClass();
                int TransferIdCon = Convert.ToInt32(e.KeyValue);
                int UserCreador = vWMS.ObtieneIdStaffTransfer(TransferIdCon);
                int PreUsuario = vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString());

                int idSitio = vWMS.ObtieneSitioDestino(TransferIdCon);
                if (idSitio == 5)
                {
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
                                        //List<Transfer_Detail> dt = vWMS.ObtieneDetalleTransferencia(TransferId);
                                        //foreach (var t in dt)
                                        //{
                                        //List<Package> pk = vWMS.ObtieneInfoPallet(t.Package_Id);
                                        //foreach (var p in pk)
                                        //{
                                        int? LayoutDestino = 0;
                                        if (en.Site_Id_Destiny == 1 && en.Site_Id == 19 && en.Transfer_U_Entidad == 7)
                                        {
                                            LayoutDestino = en.Transfer_U_Folio_Entidad;

                                            if (LayoutDestino == 0 || LayoutDestino == null)
                                            {
                                                LayoutDestino = vControl.ObtieneUbicacionDefecto(en.Site_Id_Destiny, 1);
                                            }
                                        }
                                        else
                                        {
                                            LayoutDestino = vControl.ObtieneUbicacionDefecto(en.Site_Id_Destiny, 1);
                                        }
                                        //int? packageid = p.Package_Id;
                                        //int reserveid = vWMS.ObtieneReservaId(t.Package_Id, t.Transfer_Id);
                                        int staffid = vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString());
                                        vWMS.CierreTransferenciaPROC(TransferId, LayoutDestino, staffid);
                                        //int tareaid = vWMS.AgregaTareaTransferencia(en.Site_Id, 7, p.ArticleProvider_Id, (int)t.Layout_Id_Actual, LayoutDestino, packageid, p.Package_Quantity, p.Package_Lot, 5, staffid, staffid, reserveid);
                                        //vWMS.ActualizaReserve(reserveid, 3);
                                        //vWMS.AddLocation(t.Package_Id, (int)LayoutDestino, staffid);
                                        //vWMS.ActualizaLayoutReservePackage(t.Package_Id, (int)LayoutDestino);
                                        //vWMS.ActualizaEstadoyTareaTransferDetail(t.Transfer_Id, t.Package_Id, 3, tareaid);
                                        //}
                                        //}
                                        vWMS.ActualizaFechaUsuarioTransferencia(en.Transfer_Id, PreUsuario);
                                        vWMS.ActualizaEstadoTransfer(en.Transfer_Id, 4,"S");
                                        //try
                                        //{
                                        //    LogClass vLog = new LogClass();
                                        //    vLog.InsertaLogSync(13, 67, TransferId, 0, 'S', "Sincronizado", 2);
                                        //}
                                        //catch
                                        //{ }
                                    }
                                    else
                                    {
                                        //try
                                        //{
                                        //    LogClass vLog = new LogClass();
                                        //    vLog.InsertaLogSync(13, 67, TransferId, 0, 'E', errors, 2);
                                        //}
                                        //catch
                                        //{
                                        //}
                                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + errors + "');", true);
                                    }
                                }
                                else
                                {
                                    List<Transfer_Detail> dt = vWMS.ObtieneDetalleTransferencia(TransferId);
                                    foreach (var t in dt)
                                    {
                                        //List<Package> pk = vWMS.ObtieneInfoPallet(t.Package_Id);
                                        //foreach (var p in pk)
                                        //{
                                        int? LayoutDestino = 0;
                                        if (en.Site_Id_Destiny == 1 && en.Site_Id == 19 && en.Transfer_U_Entidad == 7)
                                        {
                                            LayoutDestino = en.Transfer_U_Folio_Entidad;
                                        }
                                        else
                                        {
                                            LayoutDestino = vControl.ObtieneUbicacionDefecto(en.Site_Id_Destiny, 1);
                                        }
                                        //int? packageid = p.Package_Id;
                                        //int reserveid = vWMS.ObtieneReservaId(t.Package_Id, t.Transfer_Id);
                                        int staffid = vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString());
                                        vWMS.CierreTransferenciaPROC(TransferId, LayoutDestino, staffid);
                                        //int tareaid = vWMS.AgregaTareaTransferencia(en.Site_Id, 7, p.ArticleProvider_Id, (int)t.Layout_Id_Actual, LayoutDestino, packageid, p.Package_Quantity, p.Package_Lot, 5, staffid, staffid, reserveid);
                                        //vWMS.ActualizaReserve(reserveid, 3);
                                        //vWMS.AddLocation(t.Package_Id, (int)LayoutDestino, staffid);
                                        //vWMS.ActualizaLayoutReservePackage(t.Package_Id, (int)LayoutDestino);
                                        //vWMS.ActualizaEstadoyTareaTransferDetail(t.Transfer_Id, t.Package_Id, 3, tareaid);
                                        //}
                                    }

                                    vWMS.ActualizaFechaUsuarioTransferencia(en.Transfer_Id, PreUsuario);
                                    vWMS.ActualizaEstadoTransfer(en.Transfer_Id, 4, "S");
                                    //try
                                    //{
                                    //    LogClass vLog = new LogClass();
                                    //    vLog.InsertaLogSync(13, 67, TransferId, 0, 'S', "Sincronizado", 2);
                                    //}
                                    //catch
                                    //{ }
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
                }
                else if (UserCreador == PreUsuario || Convert.ToInt32(Session["PerfilId"]) == 1)
                {
                    vWMS.ActualizaEstadoTransfer(TransferIdCon, 3,"U");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Transferencia no puede ser Enviada Por : " + Session["NombreUsuario"].ToString() + "');", true);
                }

                GvDatos.DataBind();
            }
            if (e.CommandArgs.CommandName == "cmdRechaza")
            {
                Session["idTransf"] = e.KeyValue;
                UsuarioClass user = new UsuarioClass();
                WMSClass vWMS = new WMSClass();
                int TransferIdCread = Convert.ToInt32(e.KeyValue);

                int UserCreador = vWMS.ObtieneIdStaffTransfer(TransferIdCread);
                int PreUsuario = vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString());
                string bodegaCreado = vWMS.ObtieneSiteTransferencia(TransferIdCread);

                string bodegaCreadoDestino = vWMS.ObtieneSiteDestinoTransferencia(TransferIdCread);

                string bodegaUser = user.TraeBodegaUsuario(Convert.ToInt32(Session["IDCVTUsuario"]));

                if (UserCreador != PreUsuario)
                {
                    if (bodegaCreadoDestino == bodegaUser || bodegaUser == null || bodegaUser == string.Empty)
                    {
                        txtMotRechazo.Text = string.Empty;
                        popRechaza.ShowOnPageLoad = true;
                        vWMS.ActualizaLimpiaReservePackage(Convert.ToInt32(e.KeyValue));
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Transferencia no puede ser Confirmada por : " + Session["NombreUsuario"].ToString() + ", En la Bodega " + bodegaCreado + " ');", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Transferencia no puede ser rechazada por : " + Session["NombreUsuario"].ToString() + "');", true);
                }
            }
        }

        protected void GvDatos_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != DevExpress.Web.GridViewRowType.Data) return;
            int Estado = (int)e.GetValue("Status");
            if (Estado == 1)
            {
                System.Web.UI.WebControls.ImageButton imgAnula = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Anula") as System.Web.UI.WebControls.ImageButton;
                imgAnula.Visible = true;
                System.Web.UI.WebControls.ImageButton imgPreConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "PreConfirma") as System.Web.UI.WebControls.ImageButton;
                imgPreConfirma.Visible = true;
                System.Web.UI.WebControls.ImageButton imgConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Confirma") as System.Web.UI.WebControls.ImageButton;
                imgConfirma.Visible = false;
                //System.Web.UI.WebControls.ImageButton imgRechaza = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Rechaza") as System.Web.UI.WebControls.ImageButton;
                //imgRechaza.Visible = false;

            }
            if (Estado == 3)
            {
                System.Web.UI.WebControls.ImageButton imgConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Confirma") as System.Web.UI.WebControls.ImageButton;
                System.Web.UI.WebControls.ImageButton imgAnula = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Anula") as System.Web.UI.WebControls.ImageButton;
                //System.Web.UI.WebControls.ImageButton imgRechaza = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Rechaza") as System.Web.UI.WebControls.ImageButton;
                //imgRechaza.Visible = true;
                imgAnula.Visible = true;
                imgConfirma.Visible = true;

                System.Web.UI.WebControls.ImageButton imgPreConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "PreConfirma") as System.Web.UI.WebControls.ImageButton;
                imgPreConfirma.Visible = false;
               
            }
            if (Estado == 4)
            {
                System.Web.UI.WebControls.ImageButton imgConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Confirma") as System.Web.UI.WebControls.ImageButton;
                System.Web.UI.WebControls.ImageButton imgAnula = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Anula") as System.Web.UI.WebControls.ImageButton;
                imgAnula.Visible = false;
                imgConfirma.Visible = false;
                System.Web.UI.WebControls.ImageButton imgPreConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "PreConfirma") as System.Web.UI.WebControls.ImageButton;
                imgPreConfirma.Visible = false;
                //System.Web.UI.WebControls.ImageButton imgRechaza = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Rechaza") as System.Web.UI.WebControls.ImageButton;
                //imgRechaza.Visible = false;
            }
            if (Estado == 5)
            {
                System.Web.UI.WebControls.ImageButton imgConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Confirma") as System.Web.UI.WebControls.ImageButton;
                System.Web.UI.WebControls.ImageButton imgAnula = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Anula") as System.Web.UI.WebControls.ImageButton;
                imgAnula.Visible = false;
                imgConfirma.Visible = false;
                System.Web.UI.WebControls.ImageButton imgPreConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "PreConfirma") as System.Web.UI.WebControls.ImageButton;
                imgPreConfirma.Visible = false;
                //System.Web.UI.WebControls.ImageButton imgRechaza = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Rechaza") as System.Web.UI.WebControls.ImageButton;
                //imgRechaza.Visible = false;
            }
            if (Estado == 6)
            {
                System.Web.UI.WebControls.ImageButton imgAnula = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Anula") as System.Web.UI.WebControls.ImageButton;
                imgAnula.Visible = true;
                System.Web.UI.WebControls.ImageButton imgPreConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "PreConfirma") as System.Web.UI.WebControls.ImageButton;
                imgPreConfirma.Visible = true;
                System.Web.UI.WebControls.ImageButton imgConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Confirma") as System.Web.UI.WebControls.ImageButton;
                imgConfirma.Visible = false;
                //System.Web.UI.WebControls.ImageButton imgRechaza = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Rechaza") as System.Web.UI.WebControls.ImageButton;
                //imgRechaza.Visible = false;
            }

        }

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            WMSClass vWMS = new WMSClass();
            UsuarioClass user = new UsuarioClass();


            int idbod = Convert.ToInt32(e.NewValues["Site_Id"]);

            string bodega = vWMS.ObtieneNombreCortoSitio(idbod);
            string bodegaUser = user.TraeBodegaUsuario(Convert.ToInt32(Session["IDCVTUsuario"]));

            if (bodega == bodegaUser || bodegaUser == null || bodegaUser == "")
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 22, "Crea Registro");

                e.NewValues["Company_Id"] = 1;
                e.NewValues["Staff_Id"] = vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString());
                e.NewValues["Date"] = DateTime.Now;
                e.NewValues["Status"] = 1;
                e.NewValues["Type_Id"] = 1;

            }
            else
            {
                GvDatos.Settings.ShowTitlePanel = true;
                GvDatos.SettingsText.Title = "No Puede Crear en esta bodega";
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
                GvDatos.SettingsExport.FileName = "Transferencias";

            }
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            WMSClass wms = new WMSClass();
            int idTrans = Convert.ToInt32(Session["idTransf"]);

            try
            {
                string Email =wms.TraeCorreoUsuarioRechazo(idTrans);// "jcaro@cvtrading.cl";//

                if (Email.Equals("-1"))
                {
                    try
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Destinatario no tiene correo registrado , tranferencia sera rechazada sin notificacion los pallets NO han sido liberados');", true);
                        WMSClass vWMS = new WMSClass();
                        int CantDet = vWMS.CuentaDetalleTransferencia(idTrans);

                        int UserCreador = vWMS.ObtieneIdStaffTransfer(idTrans);
                        int PreUsuario = vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString());
                        vWMS.CambiaEstadoTransferencia(idTrans, 6);

                        //if (UserCreador == PreUsuario || Convert.ToInt32(Session["PerfilId"]) == 1)
                        //{
                        //    if (CantDet > 0)
                        //    {
                        //        vWMS.CambiaEstadoTransferencia(idTrans, 6);
                        //        List<Transfer_Detail> dt = vWMS.ObtieneDetalleTransferencia(idTrans);
                        //        foreach (var t in dt)
                        //        {
                        //            vWMS.EliminaBultoTransferencia(idTrans, t.Package_Id);
                        //        }
                        //    }
                        //    else
                        //    {
                        //        vWMS.CambiaEstadoTransferencia(idTrans, 6);
                        //    }
                        //    popRechaza.ShowOnPageLoad = false;
                        //    txtMotRechazo.Text = string.Empty;
                        //}
                        //else
                        //{

                        //}
                    }
                    catch (Exception ex)
                    {

                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Transferencia no puede ser rechazada Por : " + ex.Message+ "');", true);
                        popRechaza.ShowOnPageLoad = false;
                        txtMotRechazo.Text = string.Empty;
                    }

                }
                else
                {
                    try
                    {
                        int CantDet = wms.CuentaDetalleTransferencia(idTrans);

                        int UserCreador = wms.ObtieneIdStaffTransfer(idTrans);
                        int PreUsuario = wms.ObtieneIdStaff(Session["CIDUsuario"].ToString());

                        //if (UserCreador == PreUsuario || Convert.ToInt32(Session["PerfilId"]) == 1)
                        //{
                        //    if (CantDet > 0)
                        //    {
                        //        wms.CambiaEstadoTransferencia(idTrans, 6);
                        //        List<Transfer_Detail> dt = wms.ObtieneDetalleTransferencia(idTrans);
                        //        foreach (var t in dt)
                        //        {
                        //            wms.EliminaBultoTransferencia(idTrans, t.Package_Id);
                        //        }
                        //    }
                        //    else
                        //    {
                        //        wms.CambiaEstadoTransferencia(idTrans, 6);
                        //    }
                        //}
                        //else
                        //{

                        //}

                        MailMessage vMail = new MailMessage();
                        vMail.To.Add(Email);

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
                        vMail.Subject = "Rechazo transferencia ";
                        vMail.Body = "Transferencia n° " +Convert.ToString(idTrans)+" se ha rechazado por el siguiente motivo "+ Environment.NewLine+ Environment.NewLine+
                                      txtMotRechazo.Text+ Environment.NewLine + Environment.NewLine+"Los pallets NO han sido liberados."+ Environment.NewLine
                                      + "Respuesta generada automaticamente por sistema intranet CVT, Cuenta de mail no monitoreada, favor no responder";

                        System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                        vSmtp.Send(vMail);
                        vSmtp.Dispose();
                        vMail.Dispose();
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Transferencia rechazada,se ha notificado');", true);

                        popRechaza.ShowOnPageLoad = false;
                        txtMotRechazo.Text = string.Empty;
                        wms.CambiaEstadoTransferencia(idTrans, 6);

                    }
                    catch (Exception ex)
                    {

                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Transferencia no puede ser rechazada Por : " + ex.Message + "');", true);
                    }

                    popRechaza.ShowOnPageLoad = false;
                    txtMotRechazo.Text = string.Empty;
                }

            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Transferencia no puede ser rechazada Por : " + ex.Message + "');", true);
            }

            GvDatos.DataBind();
        }
    }
}