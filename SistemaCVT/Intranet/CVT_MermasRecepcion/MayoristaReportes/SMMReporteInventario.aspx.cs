using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.MayoristaReportes
{
    public partial class SMMReporteInventario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ASPxGridView1.DataBind();
            }
        }

        protected void btnDescargar_Click(object sender, EventArgs e)
        {
            ReportDocument Info = new ReportDocument();
         
            Info.Load(Server.MapPath("~/Inventario_Comprometidos_MAYORISTA.rpt"));
            Info.SetDatabaseLogon("sa", "cvt.vdp22$");
            //Info.SetParameterValue(0, true);
            ExportOptions op = new ExportOptions();

            Response.Buffer = false;
            Response.Clear();
            // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
            Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
            //Info.PrintToPrinter(1, false, 1, 1);
        }

        protected void btnInventario_Click(object sender, EventArgs e)
        {
            //LqDsMailing.WhereParameters.Add("Informe", "Inventario-Mayorista");
            //LqDsMailing.Where = "Informe==@Informe";

            Session["v_informe"]= "Inventario-Mayorista";
            ASPxGridView1.DataBind();

            lbl_informe.Text = "Inventario-Mayorista";
            ReportDocument Info = new ReportDocument();
            Info.Load(Server.MapPath("~/Inventario_Comprometidos_MAYORISTA.rpt"));
            Info.SetDatabaseLogon("sa", "cvt.vdp22$");
            //Info.SetParameterValue(0, true);
            ExportOptions op = new ExportOptions();

            Response.Buffer = false;
            Response.Clear();
            // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
            Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Inventario\InventarioMayorista-" + DateTime.Now.ToShortDateString().Replace("/", "") + ".pdf");
            Session["PdfInventario"] = @"C:\Inventario\InventarioMayorista-" + DateTime.Now.ToShortDateString().Replace("/", "") + ".pdf";
        }

        protected void btnInventarioValorizado_Click(object sender, EventArgs e)
        {
            //LqDsMailing.WhereParameters.Add("Informe1", "Mayorista-Valorizado");
            //LqDsMailing.Where = "Informe==@Informe1";

            Session["v_informe"] = "Mayorista-Valorizado";
            ASPxGridView1.DataBind();
            lbl_informe.Text = "Mayorista-Valorizado";
            ReportDocument Info = new ReportDocument();
            Info.Load(Server.MapPath("~/Inventario Valorizado MAYORISTA.rpt"));
            Info.SetDatabaseLogon("sa", "cvt.vdp22$");
            ExportOptions op = new ExportOptions();

            Response.Buffer = false;
            Response.Clear();
            
            Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Inventario\InventarioValorizadoMayorista-" + DateTime.Now.ToShortDateString().Replace(@"/", "") + ".pdf");
            Session["PdfInventario"] = @"C:\Inventario\InventarioValorizadoMayorista-" + DateTime.Now.ToShortDateString().Replace("/", "") + ".pdf";
        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {

            MailMessage vMail = new MailMessage();
            MailingClass vMailing = new MailingClass();
            List<CVT_MailingInformes> dt = vMailing.ObtieneMailInforme(lbl_informe.Text);
            foreach (var d in dt)
            {
                vMail.To.Add(d.Mail);
            }
            //vMail.To.Add("jcaro@cvtrading.cl");
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
            vMail.Subject = "Reporte Inventario B+";
            vMail.Body = "Se adjunta Reporte Inventario Mayorista a la fecha " + DateTime.Now.ToShortDateString() + Environment.NewLine + Environment.NewLine + "Cuenta de mail no monitoreada, favor no responder" + Environment.NewLine + Environment.NewLine;
            vMail.Body = vMail.Body + txt_infoadicional.Text;
            vMail.Attachments.Add(new Attachment(Session["PdfInventario"].ToString()));
            System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
            vSmtp.Send(vMail);

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Reporte Enviado');", true);
        }
    }
}