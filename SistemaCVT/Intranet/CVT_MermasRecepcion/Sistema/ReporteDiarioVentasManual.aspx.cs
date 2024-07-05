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

namespace CVT_MermasRecepcion.Sistema
{
    public partial class ReporteDiarioVentasManual : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            SAPClass sp = new SAPClass();
            DataTable dt = new DataTable();
            dt = sp.ObtieneMensaje();
      

            string t0 = dt.Rows[0].ItemArray[0].ToString();
            string t1 = dt.Rows[1].ItemArray[0].ToString();
            string t2 = dt.Rows[2].ItemArray[0].ToString();
            string t3 = dt.Rows[3].ItemArray[0].ToString();
            string t4 = dt.Rows[4].ItemArray[0].ToString();
            string t5 = dt.Rows[5].ItemArray[0].ToString();
            string t6 = dt.Rows[6].ItemArray[0].ToString();
            string t7 = dt.Rows[7].ItemArray[0].ToString();
            string t8 = dt.Rows[8].ItemArray[0].ToString();
     
            MailMessage vMail = new MailMessage();
            MailingClass vMailing = new MailingClass();
            List<string> ls = new List<string>();

            ls.Add("ebc@cvtrading.cl");
            ls.Add("ebruzzone@cvtrading.cl");
            ls.Add("fbruzzone@cvtrading.cl");
            ls.Add("rbruzzone@cvtrading.cl");
            ls.Add("vvicencio@cvtrading.cl");
            ls.Add("jabatte@cvtrading.cl");
            ls.Add("ctobar@cvtrading.cl");
            ls.Add("bvega@cvtrading.cl");
            ls.Add("prios@cvtrading.cl");
            ls.Add("xgonzalez@cvtrading.cl");
            ls.Add("fbb@cvtrading.cl");
            ls.Add("mrivero@cvtrading.cl");
            ls.Add("dvilches@cvtrading.cl");

            foreach (var d in ls)
            {
                vMail.To.Add(d);
            }

            //vMail.To.Add("jcaro@cvtrading.cl");


            string mailfrom = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["MailLog"]);
            string mailpass = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["PassMailLog"]);

            SmtpClient vSmtp = new SmtpClient();//new SmtpClient("cvtrading-cl.mail.protection.outlook.com");
            vSmtp.UseDefaultCredentials = false;
            vSmtp.Credentials = new NetworkCredential(mailfrom, mailpass, "cvtrading.cl");
            vSmtp.Port = 587;
            vSmtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            vSmtp.EnableSsl = true;
            vSmtp.Host = "smtp-mail.outlook.com";              


            vMail.From = new MailAddress(mailfrom);
            vMail.Subject ="Informe Ventas: " + DateTime.Now.ToShortDateString();
            vMail.Body = t0 + Environment.NewLine + t1 + Environment.NewLine + t2 + Environment.NewLine + t3 + Environment.NewLine +
                         t4 + Environment.NewLine + t5 + Environment.NewLine + t6 + Environment.NewLine + t7 + Environment.NewLine+t8;

            System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;         

            vSmtp.Send(vMail);

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Reporte Enviado');", true);


        }
    }
}