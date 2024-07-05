using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Mail;

namespace CVT_MermasRecepcion.WMS
{
    public partial class EditaRecepcion : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            WMSClass vWMS = new WMSClass();
            List<Reception> r = vWMS.ObtieneReceptionPorId(Convert.ToInt32(txt_recepcion.Text));
            if (r.Count != 0)
            {
                Session["_RecepcionID"] = Convert.ToInt32(txt_recepcion.Text);
                l1.Visible = true;
                l2.Visible = true;
                l3.Visible = true;
                cbo_proveedor.Visible = true;
                txt_docnum.Visible = true;
                txt_oc.Visible = true;
                btn_actualizar.Visible = true;
                GvDatos.Visible = true;
                lbl_error.Visible = false;
                foreach (var c in r)
                {
                    Session["_Proveedor"] = c.Business_Partner_Provider;
                    Session["_OC"] = Convert.ToInt32(c.Reception_U_NumDocSAP);
                    Session["_DocNum"] = c.Reception_DocNumber;
                    cbo_proveedor.Value = c.Business_Partner_Provider;
                    txt_oc.Text = c.Reception_U_NumDocSAP.ToString();
                    txt_docnum.Text = c.Reception_DocNumber.ToString();
                }
            }
            else
            {
                l1.Visible = false;
                l2.Visible = false;
                l3.Visible = false;
                cbo_proveedor.Visible = false;
                txt_docnum.Visible = false;
                txt_oc.Visible = false;
                btn_actualizar.Visible = false;
                GvDatos.Visible = false;
                lbl_error.Visible = true;
                lbl_error.Text = "Numero Recepcion No Existe o ya Sincronizada con SAP";
                lbl_error.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btn_actualizar_Click(object sender, EventArgs e)
        {
            try
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 4, "Actualiza Registro");

                WMSClass vWMS = new WMSClass();
                vWMS.ActualizaEncRecepcion(Convert.ToInt32(Session["_RecepcionID"]), cbo_proveedor.Value.ToString(), Convert.ToInt32(txt_oc.Text), Convert.ToInt32(txt_docnum.Text));
                LogClass vLOG = new LogClass();
                LOG_SistemaCVT vNuevo = new LOG_SistemaCVT()
                {
                    Entidad = "Recepcion",
                    Entidad_Id = Convert.ToInt32(Session["_RecepcionID"]),
                    Fecha = DateTime.Now,
                    Usuario_Id = Session["CIDUsuario"].ToString(),
                    Valor_Nuevo = "Proveedor:" + cbo_proveedor.Value.ToString() + ";OC:" + txt_oc.Text + ";NumDoc:" + txt_docnum.Text,
                    Valor_Antiguo = "Proveedor:" + Session["_Proveedor"] + ";OC:" + Session["_OC"] + ";NumDoc:" + Session["_DocNum"]
                };
                string vn = "Proveedor:" + cbo_proveedor.Value.ToString() + ";OC:" + txt_oc.Text + ";NumDoc:" + txt_docnum.Text;
                string va = "Proveedor:" + Session["_Proveedor"] + ";OC:" + Session["_OC"] + ";NumDoc:" + Session["_DocNum"];
                if (vn != va)
                {
                    string Body = "Se Notifica que el usuario " + Session["NombreUsuario"] + " a modificado la siguiente Recepcion=" + Convert.ToInt32(Session["_RecepcionID"]) + Environment.NewLine + Environment.NewLine;
                    Body = Body + "Valor Nuevo = Proveedor:" + cbo_proveedor.Value.ToString() + ";OC:" + txt_oc.Text + ";NumDoc:" + txt_docnum.Text + Environment.NewLine;
                    Body = Body + "Valor Antiguo = Proveedor:" + Session["_Proveedor"] + ";OC:" + Session["_OC"] + ";NumDoc:" + Session["_DocNum"] + Environment.NewLine + Environment.NewLine + Environment.NewLine;
                    Body = Body + "Mensaje generado automaticamente, favor no contestar, casilla no monitoreada" + Environment.NewLine + Environment.NewLine;
                    Body = Body + "CvTrading S.A.";
                    System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                    EnviaMail(Body);
                    vLOG.InsertaRegistroLogDesaint(vNuevo);
                }
            }
            catch
            {
            }
            GvDatos.DataBind();
        }

        protected void GvDatos_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            e.NewValues["Package_QuantityInitial"] = e.NewValues["Package_Quantity"];
            LogClass vLOG = new LogClass();


            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 4, "Actualiza Registro");
            LOG_SistemaCVT vNuevo = new LOG_SistemaCVT()
            {
                Entidad = "Package",
                Entidad_Id = Convert.ToInt32(e.Keys["Package_Id"]),
                Fecha = DateTime.Now,
                Usuario_Id = Session["CIDUsuario"].ToString(),
                Valor_Nuevo = "Producto_Id:" + e.NewValues["ArticleProvider_Id"] + ";Barcode:" + e.NewValues["Package_Barcode"] + ";Cantidad:" + e.NewValues["Package_Quantity"] + ";Lote:" + e.NewValues["Package_Lot"],
                Valor_Antiguo = "Producto_Id:" + e.OldValues["ArticleProvider_Id"] + ";Barcode:" + e.OldValues["Package_Barcode"] + ";Cantidad:" + e.OldValues["Package_Quantity"] + ";Lote:" + e.OldValues["Package_Lot"]
            };
            string vn = "Producto_Id:" + e.NewValues["ArticleProvider_Id"] + ";Barcode:" + e.NewValues["Package_Barcode"] + ";Cantidad:" + e.NewValues["Package_Quantity"] + ";Lote:" + e.NewValues["Package_Lot"];
            string va = "Producto_Id:" + e.OldValues["ArticleProvider_Id"] + ";Barcode:" + e.OldValues["Package_Barcode"] + ";Cantidad:" + e.OldValues["Package_Quantity"] + ";Lote:" + e.OldValues["Package_Lot"];
            if (vn != va)
            {
                string Body = "Se Notifica que el usuario " + Session["NombreUsuario"] + " a modificado el siguiente Package_Id=" + e.Keys["Package_Id"].ToString() + Environment.NewLine + Environment.NewLine;
                Body = Body + "Valor Nuevo = Producto_Id:" + e.NewValues["ArticleProvider_Id"] + ";Barcode:" + e.NewValues["Package_Barcode"] + ";Cantidad:" + e.NewValues["Package_Quantity"] + ";Lote:" + e.NewValues["Package_Lot"] + Environment.NewLine;
                Body = Body + "Valor Antiguo = Producto_Id:" + e.OldValues["ArticleProvider_Id"] + ";Barcode:" + e.OldValues["Package_Barcode"] + ";Cantidad:" + e.OldValues["Package_Quantity"] + ";Lote:" + e.OldValues["Package_Lot"] + Environment.NewLine + Environment.NewLine + Environment.NewLine + Environment.NewLine;
                Body = Body + "Mensaje generado automaticamente, favor no contestar, casilla no monitoreada" + Environment.NewLine + Environment.NewLine;
                Body = Body + "CvTrading S.A.";
                System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                EnviaMail(Body);
                vLOG.InsertaRegistroLogDesaint(vNuevo);
            }
            GvDatos.DataBind();
        }
        private void EnviaMail(string Body)
        {
            try
            {
                MailMessage vMail = new MailMessage();
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
                List<CVT_Usuarios> dt = new List<CVT_Usuarios>();
                UsuarioClass vUsu = new UsuarioClass();
                dt = vUsu.ObtieneUsuariosNotificaciones(1, Convert.ToInt32(Session["CIDUsuario"]));
                foreach (var r in dt)
                {
                    vMail.To.Add(r.MailUsuario);
                }
                vMail.Subject = "Notificacion Modifica Recepcion";
                vMail.Body = Body;
                System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls12;
                vSmtp.Send(vMail);
            }
            catch
            {
            }



        }

    }
}