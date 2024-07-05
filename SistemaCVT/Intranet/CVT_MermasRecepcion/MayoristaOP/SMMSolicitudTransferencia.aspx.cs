using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.MayoristaOP
{
    public partial class SMMSolicitudTransferencia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GvDatos.DataBind(); 
            }
        }

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["FechaSolicitud"] = DateTime.Now;
            e.NewValues["idUsuario"] = Session["IDCVTUsuario"];
            e.NewValues["Estado"] = 1;
          
        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                Session["solicitudID"] = e.KeyValue;
                Response.Redirect("~/MayoristaOP/SMMSolicitudTransferenciaDetalle.aspx");
            }
            if (e.CommandArgs.CommandName == "cmdEnvia")
            {

                Session["soli"] = e.KeyValue;

                string soli = Session["soli"].ToString();

                //envia mail 
                MailMessage vMail = new MailMessage();

                CVTWMSMetroClass cl = new CVTWMSMetroClass();
                List<SMM_MAIL_USUARIOS_MAYORISTA> lt = cl.TraeMailUsuarios();
                List<VW_LISTADO_PRODUCTOS_SOLICITUD> lt1 = cl.ListaSolicitud(Convert.ToInt32(soli));
                List<SMM_Solicitud_Transferencia> lt2 = cl.ListaSolicitudTransferencia(Convert.ToInt32(soli));


                foreach (var t in lt)
                {
                    vMail.To.Add(t.MailUsuario);
                }

                int bodOrigen = 0;
                int bodDestino = 0;
                string comentario = "";

                foreach (var l in lt2)
                {
                    bodOrigen =Convert.ToInt32(l.BodegaOrigen);
                    bodDestino = Convert.ToInt32(l.BodegaDestino);
                    comentario = l.Comentarios.ToString();
                }

                if (bodOrigen != bodDestino)
                {
                    string MlBody = "TIENES UNA SOLICITUD DE TRANSFERENCIA FOLIO N°" + soli + Environment.NewLine + Environment.NewLine +comentario + Environment.NewLine + Environment.NewLine +
                                    "Desde : " +"0"+bodOrigen+"  Hacia : "+"0"+bodDestino+Environment.NewLine + Environment.NewLine + "Productos Solicitados:" + Environment.NewLine + Environment.NewLine;

                    foreach (var t in lt1)
                    {
                        MlBody += t.ItemCode + "   -   " + t.ItemName + "   - Cantidad Solicitada : " + t.Cantidad + "." + Environment.NewLine;
                    };



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
                    vMail.Subject = "SOLICITUD DE TRANSFERENCIA";
                    //vMail.Body = "TIENES UNA SOLICITUD DE TRANSFERENCIA N°" + soli + Environment.NewLine + "Con fecha : " + DateTime.Now + Environment.NewLine + Environment.NewLine + Environment.NewLine + Utilidades.StripHTML(Utilidades.DataTableToString(dt).Replace(";"," - ")) ;
                    vMail.Body = MlBody + Environment.NewLine +"recuerda registrar tu numero de solicitud."+ Environment.NewLine + Environment.NewLine + Environment.NewLine +
                                         Environment.NewLine + Environment.NewLine + Environment.NewLine + Environment.NewLine
                                       + Environment.NewLine + Environment.NewLine + "Correo generado automaticamente por sistema intranet CVT, Cuenta de mail no monitoreada, favor no responder.";
                    System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                    vSmtp.Send(vMail);


                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Solicitud enviada');", true);
                    cl.actualizaEstadoSolicitud(Convert.ToInt32(soli), 2);
                    GvDatos.DataBind();
                }
                else {

                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Bodegas son identicas favor verificar');", true);
                }


               
            }
        }

        protected void GvDatos_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
              if (e.RowType != DevExpress.Web.GridViewRowType.Data) return;
                int Estado = (int)e.GetValue("Estado");
                if (Estado != 1)
                {
                    System.Web.UI.WebControls.ImageButton imgEnvia = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "envia") as System.Web.UI.WebControls.ImageButton;
                    //System.Web.UI.WebControls.ImageButton imgConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Confirma") as System.Web.UI.WebControls.ImageButton;
                    //imgAnula.Visible = false;
                    imgEnvia.Visible = false;              
                }
           
        }
    }
}