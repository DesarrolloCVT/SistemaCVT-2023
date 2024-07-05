using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Net;
using System.Net.Mail;
using System.Web.UI;

namespace CVT_MermasRecepcion
{
    public partial class Contacto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GvAdjunto.Visible = false;
            GvDatos.DataSource = Session["opcion"];
            GvDatosHistorial.DataSource = Session["opcionHistorial"];

            if (!IsPostBack)
            {
                cargaDatos();
                GvDatosHistorial.DataSource = Session["opcionHistorial"];
                GvAdjunto.DataBind();
            }
            else { }
        }

        protected void cmdNuevo_Click(object sender, ImageClickEventArgs e)
        {
            popContacto.ShowOnPageLoad = true;
            TicketClass vTic = new TicketClass();
            int idtckaa = vTic.TraeCantidadRegistros();
            Session["ticketID"] = idtckaa + 1;

        }


        protected void btnSubir_Click(object sender, EventArgs e)
        {
            GvAdjunto.Visible = true;
            GvAdjunto.DataBind();


        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            try
            {
                TicketClass vTic = new TicketClass();
                DBMLCVTDESAINTDataContext dbm = new DBMLCVTDESAINTDataContext();
                int idTic = Convert.ToInt32(Session["ticketID"]);

                CVT_Ticket tick = new CVT_Ticket();

                tick.Id_Ticket = idTic;
                tick.FechaCreacion = DateTime.Now;
                tick.id_CategoriaTicket = Convert.ToInt32(cboCategoria.Value);
                tick.id_TipoProblema = Convert.ToInt32(cboTipoProblema.Value);
                tick.Id_Usuario = Convert.ToInt32(Session["IDCVTUsuario"]);
                tick.Estado = 1;
                tick.Descripcion = txtDescripcion.Text;
                tick.Id_Area = Convert.ToInt32(cboAreaSolicitada.Value);
                tick.Prioridad = Convert.ToInt32(cboPrioridad.Value);
              
                dbm.CVT_Ticket.InsertOnSubmit(tick);
                dbm.SubmitChanges();

                MailMessage vMail = new MailMessage();
                DataTable dt = vTic.SP_TraeMails(idTic);

                foreach (DataRow t in dt.Rows)
                {
                    vMail.To.Add(t["MailUsuario"].ToString());
                }
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
                vMail.Subject = "Ticket Creado n°" + idTic;
                vMail.Body = "El usuario " + Session["NombreUsuario"].ToString() + " a Creado un nuevo Ticket, Correspondiente a la categoria  " + cboCategoria.Text + ", de tipo: " + cboTipoProblema.Text + ", Prioridad: " + cboPrioridad.Text + ".  " + Environment.NewLine + txtDescripcion.Text;
                vMail.Body = vMail.Body + Environment.NewLine + Environment.NewLine + Environment.NewLine + Environment.NewLine + Environment.NewLine + "Respuesta generada automaticamente por sistema intranet CVT, Cuenta de mail no monitoreada, favor no responder" + Environment.NewLine + Environment.NewLine; ;

                int id = Convert.ToInt32(Session["ticketID"]);
                List<CVT_Tickets_ArchivoAdjunto> dte = vTic.ObtieneRutas(id);

                foreach (var t in dte)
                {
                    string rutaEl = @"\\BIGEL\\Ticket\\" + t.Nombre;
                    vMail.Attachments.Add(new Attachment(rutaEl));
                }
                System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                vSmtp.Send(vMail);

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Ticket Enviado, N° de Ticket: " + idTic + " ');", true);


                limpiar();

                popContacto.ShowOnPageLoad = false;
                cargaDatos();
                vSmtp.Dispose();
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error: " + ex.Message + " ');", true);
            }          
            

        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {

            TicketClass vTi = new TicketClass();

            int id = Convert.ToInt32(Session["ticketID"]);
            List<CVT_Tickets_ArchivoAdjunto> dt = vTi.ObtieneRutas(id);

            foreach (var t in dt)
            {
                string rutaEl = @"\\BIGEL\\Ticket\\" + t.Nombre;
                File.Delete(rutaEl);
                vTi.EliminaRuta(id);
            }

            popContacto.ShowOnPageLoad = false;
            limpiar();


        }

        protected void GvAdjunto_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            TicketClass vTic = new TicketClass();
            int val = Convert.ToInt32(e.Values["Id_AdjuntoTicket"]);
            string nom = vTic.BuscaNombreArchivo(val);
            string rutaEl = @"\\BIGEL\\Ticket\\" + nom;
            File.Delete(rutaEl);
        }

        private void limpiar()
        {
            cboCategoria.SelectedIndex = -1;
            cboTipoProblema.SelectedIndex = -1;
            txtDescripcion.Text = string.Empty;

        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            limpiar();
        }

        protected void cargaDatos()
        {
            int idPerf = Convert.ToInt32(Session["PerfilId"]);
            int idUser = Convert.ToInt32(Session["IDCVTUsuario"]);
            //if (idPerf != 1)
            //{
            TicketClass vTick = new TicketClass();
            DataTable dt = new DataTable();
            dt = vTick.SP_ListarTickets(idPerf, idUser);
            GvDatos.DataSource = dt;
            GvDatos.DataBind();
            Session["opcion"] = dt;

        }
        protected void FileUpload1_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            try
            {
                string name = Session["ticketID"].ToString()+"_"+DateTime.Now.Hour.ToString()+DateTime.Now.Minute.ToString()+DateTime.Now.Second.ToString()+e.UploadedFile.FileName;
                e.UploadedFile.SaveAs(@"\\BIGEL\\Ticket\\" + name);
                string ruta = @"\\BIGEL\\Ticket\\" + name;

                string nombre1 = Path.GetFileName(ruta).ToString();
                string Ext1 = Path.GetExtension(ruta).ToString();

                CVT_Tickets_ArchivoAdjunto vRuta = new CVT_Tickets_ArchivoAdjunto();
                TicketClass vTic = new TicketClass();
                vRuta.Id_Ticket = Convert.ToInt32(Session["ticketID"]);
                vRuta.Ruta = ruta;
                vRuta.Nombre = nombre1;
                vRuta.Extencion = Ext1;
                vTic.InsertaRegistroRutaArchivo(vRuta);
                GvAdjunto.DataBind();

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('ARCHIVO REGISTRADO');", true);
            }

            catch
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('ERROR AL SUBIR EL ARCHIVO');", true);
            }
        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdRespuesta")
            {
                TicketClass vTic = new TicketClass();
                int idUsuarioRespTick = vTic.IdUsuarioTomaRespTick(Convert.ToInt32(e.KeyValue));
                int idUsuarioCreaTick = vTic.IdUsuarioCreaTick(Convert.ToInt32(e.KeyValue));
                int IdUserActivo = Convert.ToInt32(Session["IDCVTUsuario"]);

                if (IdUserActivo == idUsuarioRespTick || IdUserActivo == idUsuarioCreaTick)
                {
                    CVT_Tickets_Respuesta tick = new CVT_Tickets_Respuesta();
                    DBMLCVTDESAINTDataContext dbm = new DBMLCVTDESAINTDataContext();

                    tick.Id_Ticket = Convert.ToInt32(e.KeyValue);
                    tick.Respuesta = "-1";
                    tick.FechaRespuesta = DateTime.Now;
                    tick.Id_Usuario = Convert.ToInt32(Session["IDCVTUsuario"]);

                    dbm.CVT_Tickets_Respuesta.InsertOnSubmit(tick);
                    dbm.SubmitChanges();

                    Session["IdRespuesta"] = tick.Id_RespuestaTicket;
                    Session["Folio"] = e.KeyValue;
                    Response.Redirect("/Respuesta.aspx");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('No puedes responder este ticket');", true);
                }

              
            }
            if (e.CommandArgs.CommandName == "cmdTomarTicket")
            {
                try
                {
                    TicketClass vTicket = new TicketClass();
                    int idUSR = vTicket.compruebaTicket(Convert.ToInt32(e.KeyValue));
                    if (idUSR != Convert.ToInt32(Session["IDCVTUsuario"]))
                    {
                        DBMLCVTDESAINTDataContext dbm = new DBMLCVTDESAINTDataContext();
                        int idTick = Convert.ToInt32(e.KeyValue);

                        CVT_Tickets_Respuesta tick = new CVT_Tickets_Respuesta();
                        vTicket.ActualizaEstadoTicket(idTick, 2, Convert.ToInt32(Session["IDCVTUsuario"]));
                        MailMessage vMail = new MailMessage();
                        DataTable dt = vTicket.SP_TraeMails(idTick);

                        foreach (DataRow t in dt.Rows)
                        {
                            vMail.To.Add(t["MailUsuario"].ToString());
                        }


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
                        vMail.Subject = "Respuesta a su ticket";
                        vMail.Body = "El Ticket N°: " + idTick + " ha sido tomado por el Usuario: " + Session["NombreUsuario"].ToString() + Environment.NewLine + Environment.NewLine + Environment.NewLine + Environment.NewLine + Environment.NewLine + "Respuesta generada automaticamente por sistema intranet CVT, Cuenta de mail no monitoreada, favor no responder" + Environment.NewLine + Environment.NewLine;
                        vMail.Body = vMail.Body; /*+ ".  " + txtDescripcion.Text;*/
                        System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                        vSmtp.Send(vMail);
                        cargaDatos();

                        tick.Id_Ticket = Convert.ToInt32(idTick);
                        tick.Respuesta = "Toma ticket el usuario " + Session["NombreUsuario"];
                        tick.FechaRespuesta = DateTime.Now;
                        tick.Id_Usuario = Convert.ToInt32(Session["IDCVTUsuario"]);
                        tick.RespuestaCierre = 1;
                        dbm.CVT_Tickets_Respuesta.InsertOnSubmit(tick);
                        dbm.SubmitChanges();

                        vSmtp.Dispose();

                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Has tomado el Ticket N°: " + idTick + "  Confirmacion se ha enviado de forma automatica');", true);
                    }
                    else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('No puedes tomar este ticket');", true); }
                   


                }
                catch (Exception)
                {

                    throw;
                }
               
                
            }
            if (e.CommandArgs.CommandName == "cmdHistorial")
            {
                popHistorial.ShowOnPageLoad = true;
                int idTicket = Convert.ToInt32(e.KeyValue);
                Session["IdHisAdjunto"] = e.KeyValue;
                TicketClass vTick = new TicketClass();
                DataTable dt = new DataTable();
                dt = vTick.SP_HistorialTicket(idTicket);
                GvDatosHistorial.DataSource = dt;
                GvDatosHistorial.DataBind();
                Session["opcionHistorial"] = dt;
                //Image1.ImageUrl = "data:image;base64," + Convert.ToBase64String(Image_Bit(@"\\BIGEL\\Ticket\\relacion de centros de costos.png"));
            }
            if (e.CommandArgs.CommandName == "cmdEliminar")
            {
                int val = Convert.ToInt32(e.KeyValue);
                TicketClass vtic = new TicketClass();
                vtic.eliminaRespuestas(val);
                vtic.eliminaTicket(val);
                vtic.eliminaTicket_archivoadjunto(val);
                cargaDatos();
            }
        }
        protected void GvDatos_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {

            if (e.RowType == DevExpress.Web.GridViewRowType.Data)
            {
                string Estado = (string)e.GetValue("Estado");
                int idPerf = Convert.ToInt32(Session["PerfilId"]);

                if (Estado.Equals("Abierto"))
                {
                    System.Web.UI.WebControls.ImageButton imgRespuesta = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "respuesta") as System.Web.UI.WebControls.ImageButton;
                    System.Web.UI.WebControls.ImageButton imgTomaTicket = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "TomarTicket") as System.Web.UI.WebControls.ImageButton;
                    imgRespuesta.Visible = false;
                    imgTomaTicket.Visible = true;

                }
                else if (Estado.Equals("En Proceso"))
                {

                    System.Web.UI.WebControls.ImageButton imgRespuesta = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "respuesta") as System.Web.UI.WebControls.ImageButton;
                    System.Web.UI.WebControls.ImageButton imgTomaTicket = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "TomarTicket") as System.Web.UI.WebControls.ImageButton;
                    imgRespuesta.Visible = true;
                    imgTomaTicket.Visible = false;


                }
                else if (Estado.Equals("Terminado"))
                {

                    System.Web.UI.WebControls.ImageButton imgRespuesta = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "respuesta") as System.Web.UI.WebControls.ImageButton;
                    System.Web.UI.WebControls.ImageButton imgTomaTicket = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "TomarTicket") as System.Web.UI.WebControls.ImageButton;
                    imgRespuesta.Visible = false;
                    imgTomaTicket.Visible = false;

                }
                else
                {
                    System.Web.UI.WebControls.ImageButton imgRespuesta = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "respuesta") as System.Web.UI.WebControls.ImageButton;
                    System.Web.UI.WebControls.ImageButton imgTomaTicket = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "TomarTicket") as System.Web.UI.WebControls.ImageButton;
                    imgRespuesta.Visible = false;
                    imgTomaTicket.Visible = false;
                }


            }
        }

        protected void btnVerHistorialAdjuntos_Click(object sender, EventArgs e)
        {
            pupArchivos.ShowOnPageLoad = true;
        }

        protected void GvDatosAdj_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdArchivosHistorial")
            {

                Response.Clear();
                Response.ContentType = @"application\octet-stream";
                System.IO.FileInfo file = new System.IO.FileInfo(e.KeyValue.ToString());
                Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
                Response.AddHeader("Content-Length", file.Length.ToString());

                Response.WriteFile(file.FullName);
                Response.Flush();
                Response.Close();

            }
        }


        //public Byte[] Image_Bit(string ruta)
        //{
        //    FileStream foto = new FileStream(ruta, FileMode.OpenOrCreate, FileAccess.ReadWrite);
        //    Byte[] arreglo = new Byte[foto.Length];
        //    BinaryReader reader = new BinaryReader(foto);
        //    arreglo = reader.ReadBytes(Convert.ToInt32(foto.Length));
        //    return arreglo;
        //}

    }
}