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
    public partial class Respuesta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblFolio.Text = Session["Folio"].ToString();
            GvAdjunto.Visible = false;
        }

        protected void Atras_Click(object sender, ImageClickEventArgs e)
        {
            int idResp = Convert.ToInt32(Session["IdRespuesta"]);
            TicketClass vTicket = new TicketClass();

            string RespTick=vTicket.TraeRespTicketNull(idResp);
           
            if(RespTick.Equals("-1"))
            {
                vTicket.eliminaRespuestasNull(idResp);
                Response.Redirect("~/Contacto.aspx");
            }
            else {
                Response.Redirect("~/Contacto.aspx");
      
            }
          
           
        }

        protected void btnEnviarRespuesta_Click(object sender, EventArgs e)
        {
            TicketClass vTic = new TicketClass();           
            int idTick = Convert.ToInt32(lblFolio.Text);
            int idResp = Convert.ToInt32(Session["IdRespuesta"]);
            TicketClass vTicket = new TicketClass();

          
            //envia mail con la respuesta
            MailMessage vMail = new MailMessage();
            SmtpClient vSmtp = new SmtpClient();



            if (chckCerrarTicket.Checked)
            {
                vTicket.ActualizaRespuestaTicket(idResp, txtRespuesta.Text,2);
                DataTable dt = vTicket.SP_TraeMails(idTick);

                foreach (DataRow t in dt.Rows)
                {
                    vMail.To.Add(t["MailUsuario"].ToString());
                }

                //vMail.To.Add("juancarojorquera@gmail.com");


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
                vMail.Body = "TICKET N°" + idTick + Environment.NewLine + "Ticket Cerrado , Fecha Respuesta: " + DateTime.Now + Environment.NewLine + Environment.NewLine + Environment.NewLine + txtRespuesta.Text;
                vMail.Body = vMail.Body + Environment.NewLine + Environment.NewLine + Environment.NewLine + Environment.NewLine + Environment.NewLine + "Cuenta de mail no monitoreada, favor no responder" + Environment.NewLine + Environment.NewLine; ;

                //int id = Convert.ToInt32(Session["ticketID"]);
                List<CVT_Ticket_AdjuntoRespuesta> dte = vTic.ObtieneRutasRespuesta(idResp);

                foreach (var t in dte)
                {
                    string rutaEl = @"\\BIGEL\\Ticket\\Respuestas\\" + t.Nombre;
                    vMail.Attachments.Add(new Attachment(rutaEl));
                }

                System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                vSmtp.Send(vMail);
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Respuesta enviada');", true);
                txtRespuesta.Text = string.Empty;

                vTic.ActualizaEstadoTicketInRespuesta(Convert.ToInt32(lblFolio.Text), 3, DateTime.Now);
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Respuesta Enviada, Ticket Cerrado   N° de Ticket: " + idTick + " ');", true);
                ASPxLabel1.Visible = false;
                lblFolio.Visible = false;
                txtRespuesta.Visible = false;
                Label1.Visible = false;
                chckCerrarTicket.Visible = false;
                btnEnviarRespuesta.Visible = false;
                divUpload.Visible = false;

            }
            else
            {
                vTicket.ActualizaRespuestaTicket(idResp, txtRespuesta.Text, 1);
                DataTable dt = vTicket.SP_TraeMailsRespuesta(idTick);

                foreach (DataRow t in dt.Rows)
                {
                    vMail.To.Add(t["MailUsuario"].ToString());
                }

                //vMail.To.Add("juancarojorquera@gmail.com");

          
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
                vMail.Body = "RESPUESTA AL TICKET N°" + idTick + Environment.NewLine + "Fecha Respuesta: " + DateTime.Now + Environment.NewLine + Environment.NewLine + Environment.NewLine +txtRespuesta.Text;
                vMail.Body = vMail.Body; /*+ ".  " + txtDescripcion.Text;*/ /*+Environment.NewLine + Environment.NewLine + Environment.NewLine + Environment.NewLine + Environment.NewLine + "Respuesta generada automaticamente por sistema intranet CVT, Cuenta de mail no monitoreada, favor no responder" + Environment.NewLine + Environment.NewLine;*/
               
                List<CVT_Ticket_AdjuntoRespuesta> dte = vTic.ObtieneRutasRespuesta(idResp);

                foreach (var t in dte)
                {
                    string rutaEl = @"\\BIGEL\\Ticket\\Respuestas\\" + t.Nombre;
                    vMail.Attachments.Add(new Attachment(rutaEl));
                }
                System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                vSmtp.Send(vMail);
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Respuesta enviada');", true);
                txtRespuesta.Text = string.Empty;
            }

            vSmtp.Dispose();
            
        }

        protected void FileUpload1_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            try
            {
                string name = Session["Folio"].ToString() + "_" + Session["IdRespuesta"].ToString()+"_" + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + e.UploadedFile.FileName;
                e.UploadedFile.SaveAs(@"\\BIGEL\\Ticket\\Respuestas\\" + name);
                string ruta = @"\\BIGEL\\Ticket\\Respuestas\\" + name;

                string nombre1 = Path.GetFileName(ruta).ToString();
                string Ext1 = Path.GetExtension(ruta).ToString();

                CVT_Ticket_AdjuntoRespuesta vRuta = new CVT_Ticket_AdjuntoRespuesta();
                TicketClass vTic = new TicketClass();
                vRuta.Id_Ticket = Convert.ToInt32(Session["Folio"]);
                vRuta.Ruta = ruta;
                vRuta.Nombre = nombre1;
                vRuta.Extencion = Ext1;
                vRuta.Id_RespTiquet= Convert.ToInt32(Session["IdRespuesta"]);
                vTic.InsertaRegistroRutaRespuesta(vRuta);
                GvAdjunto.DataBind();

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('ARCHIVO REGISTRADO');", true);
            }

            catch
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('ERROR AL SUBIR EL ARCHIVO');", true);
            }
        }

        protected void btnSubir_Click(object sender, EventArgs e)
        {
            GvAdjunto.Visible = true;
            GvAdjunto.DataBind();
        }

        protected void GvAdjunto_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            TicketClass vTic = new TicketClass();
            int val = Convert.ToInt32(e.Values["Id_AdjTicketResp"]);
            string nom = vTic.BuscaNombreArchivoRespuesta(val);
            string rutaEl = @"\\BIGEL\\Ticket\\Respuestas\\" + nom;
            File.Delete(rutaEl);
        }
    }
}