
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Mail;
using System.Web.Http;


namespace TestApiEnvioAuto.Controllers
{
    [RoutePrefix("api/Envio")]
    public class EnvioCorreoController : ApiController
    {
        [HttpGet]
        [Route("EnviaC")]
        public void EnviaCorreoReporteDiarioVentas()
        {
            CVT_LogErrorInformes lg = new CVT_LogErrorInformes();
            UtilidadCVTClass ut = new UtilidadCVTClass();
            try
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
                //List<string> ls = new List<string>();

                //ls.Add("ebc@cvtrading.cl");
                //ls.Add("ebruzzone@cvtrading.cl");
                //ls.Add("fbruzzone@cvtrading.cl");
                //ls.Add("rbruzzone@cvtrading.cl");
                //ls.Add("vvicencio@cvtrading.cl");
                //ls.Add("jabatte@cvtrading.cl");
                //ls.Add("ctobar@cvtrading.cl");
                //ls.Add("wparedes@cvtrading.cl");
                //ls.Add("prios@cvtrading.cl");
                //ls.Add("xgonzalez@cvtrading.cl");
                //ls.Add("fbb@cvtrading.cl");
                //ls.Add("mrivero@cvtrading.cl");
                //ls.Add("dvilches@cvtrading.cl");
                MailingClass vMailing = new MailingClass();
                List<CVT_MailingInformes> ls = vMailing.ObtieneMailInforme("InformeVentas");

                foreach (var d in ls)
                {
                    vMail.To.Add(d.Mail);
                }



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
                vMail.Subject = "Informe Ventas: " + DateTime.Now.ToShortDateString();
                vMail.Body = t0 + Environment.NewLine + t1 + Environment.NewLine + t2 + Environment.NewLine + t3 + Environment.NewLine +
                             t4 + Environment.NewLine + t5 + Environment.NewLine + t6 + Environment.NewLine + t7 + Environment.NewLine + t8;

                System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                vSmtp.Send(vMail);
                vSmtp.Dispose();
                vMail.Dispose();

                lg.TipoInforme = "Informe de ventas";
                lg.DescripcionErr = "Envio Correcto";
                lg.FechaError = DateTime.Now;

                ut.InsertaLogErrInforme(lg);
            }
            catch (Exception ex)
            {
              
                lg.TipoInforme = "Informe de ventas";
                lg.DescripcionErr = ex.Message;
                lg.FechaError = DateTime.Now;

                ut.InsertaLogErrInforme(lg);
            }

        }

        [HttpGet]
        [Route("EnviaInvBmas")]
        public void EnviaCorreoInventarioBmas()
        {
            CVT_LogErrorInformes lg = new CVT_LogErrorInformes();
            UtilidadCVTClass ut = new UtilidadCVTClass();
            try
            {


                #region CreaPdfinventario

                ReportDocument Info = new ReportDocument();
                var mappedPath = System.Web.Hosting.HostingEnvironment.MapPath("~/Inventario_Comprometidos_MAYORISTA.rpt");
                Info.Load(mappedPath);
                Info.SetDatabaseLogon("sa", "cvt.vdp22$");

                ExportOptions op = new ExportOptions();

                Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Inventario\InventarioMayorista-" + DateTime.Now.ToShortDateString().Replace("/", "") + ".pdf");
                var File1 = @"C:\Inventario\InventarioMayorista-" + DateTime.Now.ToShortDateString().Replace("/", "") + ".pdf";
                Info.Dispose();
                Info.Close();

                ///envio inventario valorizado
                ///
                ReportDocument Info2 = new ReportDocument();
                var mappedPath2 = System.Web.Hosting.HostingEnvironment.MapPath("~/Inventario Valorizado MAYORISTA.rpt");
                Info2.Load(mappedPath2);
                Info2.SetDatabaseLogon("sa", "cvt.vdp22$");
                ExportOptions op2 = new ExportOptions();

                Info2.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Inventario\InventarioValorizadoMayorista-" + DateTime.Now.ToShortDateString().Replace("/", "") + ".pdf");
                var file2 = @"C:\Inventario\InventarioValorizadoMayorista-" + DateTime.Now.ToShortDateString().Replace("/", "") + ".pdf";
                Info2.Dispose();
                Info2.Close();

                #endregion


                SmtpClient vSmtp = new SmtpClient();
                vSmtp.Host = "smtp-mail.outlook.com";
                vSmtp.Port = 587;
                vSmtp.EnableSsl = true;
                vSmtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                vSmtp.UseDefaultCredentials = false;
                string mailfrom = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["MailLog"]);
                string mailpass = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["PassMailLog"]);
                vSmtp.Credentials = new NetworkCredential(mailfrom, mailpass);


                #region envioInventario
                MailingClass vMailing = new MailingClass();
                MailMessage vMail1 = new MailMessage();
                List<CVT_MailingInformes> dt1 = vMailing.ObtieneMailInforme("Inventario-Mayorista");

                foreach (var d in dt1)
                {
                    vMail1.To.Add(d.Mail);
                }


                vMail1.From = new MailAddress(mailfrom);
                vMail1.Subject = "Reporte Inventario B+";
                vMail1.Body = "Se adjunta Reporte Inventario Mayorista a la fecha " + DateTime.Now.ToShortDateString() + Environment.NewLine + Environment.NewLine + "Cuenta de mail no monitoreada, favor no responder" + Environment.NewLine + Environment.NewLine;

                //vMail1.Body = vMail1.Body + txt_infoadicional.Text;
                vMail1.Attachments.Add(new Attachment(File1.ToString()));
                System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                vSmtp.Send(vMail1);

                #endregion

                #region envio inventario Valorizado

                MailMessage vMail2 = new MailMessage();
                List<CVT_MailingInformes> dt2 = vMailing.ObtieneMailInforme("Mayorista-Valorizado");

                foreach (var d in dt2)
                {
                    vMail2.To.Add(d.Mail);
                }
                //vMail2.To.Add("juancarojorquera@gmail.com");

                //vSmtp.Host = "smtp-mail.outlook.com";
                //vSmtp.Port = 587;
                //vSmtp.EnableSsl = true;
                //vSmtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                //vSmtp.UseDefaultCredentials = false;
                //vSmtp.Credentials = new NetworkCredential(mailfrom, mailpass);
                vMail2.From = new MailAddress(mailfrom);
                vMail2.Subject = "Reporte Inventario B+";
                vMail2.Body = "Se adjunta Reporte Inventario Mayorista a la fecha " + DateTime.Now.ToShortDateString() + Environment.NewLine + Environment.NewLine + "Cuenta de mail no monitoreada, favor no responder" + Environment.NewLine + Environment.NewLine;
                //vMail1.Body = vMail1.Body + txt_infoadicional.Text;
                vMail2.Attachments.Add(new Attachment(file2.ToString()));
                System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                vSmtp.Send(vMail2);

                #endregion

                Info.Close();
                Info.Dispose();
                Info2.Close();
                Info2.Dispose();
                vSmtp.Dispose();
                vMail1.Dispose();
                vMail2.Dispose();


                lg.TipoInforme = "Informe de ventas";
                lg.DescripcionErr = "Envio Correcto";
                lg.FechaError = DateTime.Now;

                ut.InsertaLogErrInforme(lg);
            }
            catch (Exception ex)
            {

                lg.TipoInforme = "Informe de ventas";
                lg.DescripcionErr = ex.Message;
                lg.FechaError = DateTime.Now;

                ut.InsertaLogErrInforme(lg);
            }

        }



        [HttpGet]
        [Route("EnvioInvCVTrading")]
        public void EnviaCorreoInventarioCVTrading()
        {
            CVT_LogErrorInformes lg = new CVT_LogErrorInformes();
            UtilidadCVTClass ut = new UtilidadCVTClass();
            try
            {


                #region CreaPdfinventario

                ReportDocument Info = new ReportDocument();
                var mappedPath = System.Web.Hosting.HostingEnvironment.MapPath("~/InventarioComprometidos.rpt");
                Info.Load(mappedPath);
                Info.SetDatabaseLogon("sa", "cvt.vdp22$");
                ExportOptions op = new ExportOptions();

                Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Inventario\Inventario-" + DateTime.Now.ToShortDateString().Replace("/", "") + ".pdf");
                var File1 = @"C:\Inventario\Inventario-" + DateTime.Now.ToShortDateString().Replace("/", "") + ".pdf";
                Info.Dispose();
                Info.Close();

                ///envio inventario valorizado
                ///
                ReportDocument Info2 = new ReportDocument();
                var mappedPath2 = System.Web.Hosting.HostingEnvironment.MapPath("~/InformeInventario.rpt");
                Info2.Load(mappedPath2);
                Info2.SetParameterValue(0, 1);
                Info2.SetDatabaseLogon("sa", "cvt.vdp22$");
                ExportOptions op2 = new ExportOptions();

                Info2.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Inventario\InventarioV-" + DateTime.Now.ToShortDateString().Replace(@"/", "") + ".pdf");
                var file2 = @"C:\Inventario\InventarioV-" + DateTime.Now.ToShortDateString().Replace("/", "") + ".pdf";
                Info2.Dispose();
                Info2.Close();

                #endregion


                SmtpClient vSmtp = new SmtpClient();
                vSmtp.Host = "smtp-mail.outlook.com";
                vSmtp.Port = 587;
                vSmtp.EnableSsl = true;
                vSmtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                vSmtp.UseDefaultCredentials = false;
                string mailfrom = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["MailLog"]);
                string mailpass = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["PassMailLog"]);
                vSmtp.Credentials = new NetworkCredential(mailfrom, mailpass);


                #region envioInventario
                MailingClass vMailing = new MailingClass();
                MailMessage vMail1 = new MailMessage();
                List<CVT_MailingInformes> dt1 = vMailing.ObtieneMailInforme("Inventario");

                foreach (var d in dt1)
                {
                    vMail1.To.Add(d.Mail);
                }

                

                vMail1.From = new MailAddress(mailfrom);
                vMail1.Subject = "Reporte Inventario";
                vMail1.Body = "Se adjunta Reporte Inventario a la fecha " + DateTime.Now.ToShortDateString() + Environment.NewLine + Environment.NewLine + "Cuenta de mail no monitoreada, favor no responder" + Environment.NewLine + Environment.NewLine;
                vMail1.Attachments.Add(new Attachment(File1.ToString()));
                System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                vSmtp.Send(vMail1);

                #endregion

                #region envio inventario Valorizado

                MailMessage vMail2 = new MailMessage();
                List<CVT_MailingInformes> dt2 = vMailing.ObtieneMailInforme("Inventario-Valorizado");

                foreach (var d in dt2)
                {
                    vMail2.To.Add(d.Mail);
                }
                //vMail2.To.Add("juancarojorquera@gmail.com");

                vMail2.From = new MailAddress(mailfrom);
                vMail2.Subject = "Reporte Inventario";
                vMail2.Body = "Se adjunta Reporte Inventario a la fecha " + DateTime.Now.ToShortDateString() + Environment.NewLine + Environment.NewLine + "Cuenta de mail no monitoreada, favor no responder" + Environment.NewLine + Environment.NewLine;
                vMail2.Attachments.Add(new Attachment(file2.ToString()));
                System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                vSmtp.Send(vMail2);

                #endregion

                Info.Close();
                Info.Dispose();
                Info2.Close();
                Info2.Dispose();
                vSmtp.Dispose();
                vMail1.Dispose();
                vMail2.Dispose();

                lg.TipoInforme = "Informe de ventas";
                lg.DescripcionErr = "Envio Correcto";
                lg.FechaError = DateTime.Now;

                ut.InsertaLogErrInforme(lg);

            }
            catch (Exception ex)
            {

                lg.TipoInforme = "Informe de ventas";
                lg.DescripcionErr = ex.Message;
                lg.FechaError = DateTime.Now;

                ut.InsertaLogErrInforme(lg);
            }

        }


        [HttpGet]
        [Route("EnvioVidaUtilCVTrading")]
        public void EnviaCorreoBajaVidaUtilCVTrading()
        {
            CVT_LogErrorInformes lg = new CVT_LogErrorInformes();
            UtilidadCVTClass ut = new UtilidadCVTClass();
            try
            {


                #region CreaPdfVidaUtil

                ReportDocument Info = new ReportDocument();
                var mappedPath = System.Web.Hosting.HostingEnvironment.MapPath("~/InformeVidaUtilCVT.rpt");
                Info.Load(mappedPath);
                Info.SetDatabaseLogon("sa", "cvt.vdp22$");
                ExportOptions op = new ExportOptions();

                Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Inventario\VidaUtil-" + DateTime.Now.ToShortDateString().Replace("/", "") + ".pdf");
                var File1 = @"C:\Inventario\VidaUtil-" + DateTime.Now.ToShortDateString().Replace("/", "") + ".pdf";
                Info.Dispose();
                Info.Close();

               
                #endregion


                SmtpClient vSmtp = new SmtpClient();
                vSmtp.Host = "smtp-mail.outlook.com";
                vSmtp.Port = 587;
                vSmtp.EnableSsl = true;
                vSmtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                vSmtp.UseDefaultCredentials = false;
                string mailfrom = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["MailLog"]);
                string mailpass = Convert.ToString(System.Configuration.ConfigurationManager.AppSettings["PassMailLog"]);
                vSmtp.Credentials = new NetworkCredential(mailfrom, mailpass);


                #region envioRptVidaUtil
                MailingClass vMailing = new MailingClass();
                MailMessage vMail1 = new MailMessage();
                List<CVT_MailingInformes> dt1 = vMailing.ObtieneMailInforme("VidaUtil");

                foreach (var d in dt1)
                {
                    vMail1.To.Add(d.Mail);
                }

                

                vMail1.From = new MailAddress(mailfrom);
                vMail1.Subject = "Reporte con productos con baja Vida Util";
                vMail1.Body = "Se adjunta Reporte vida util a la fecha " + DateTime.Now.ToShortDateString() + Environment.NewLine + Environment.NewLine + "Cuenta de mail no monitoreada, favor no responder" + Environment.NewLine + Environment.NewLine;
                vMail1.Attachments.Add(new Attachment(File1.ToString()));
                System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                vSmtp.Send(vMail1);

                #endregion

               

                Info.Close();
                Info.Dispose();
                vSmtp.Dispose();
                vMail1.Dispose();

                lg.TipoInforme = "Informe Vida Util";
                lg.DescripcionErr = "Envio Correcto";
                lg.FechaError = DateTime.Now;

                ut.InsertaLogErrInforme(lg);

            }
            catch (Exception ex)
            {

                lg.TipoInforme = "Informe Vida Util";
                lg.DescripcionErr = ex.Message;
                lg.FechaError = DateTime.Now;

                ut.InsertaLogErrInforme(lg);
            }

        }

    }


}