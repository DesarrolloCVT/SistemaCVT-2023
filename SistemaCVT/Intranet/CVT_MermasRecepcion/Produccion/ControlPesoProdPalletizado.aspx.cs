using CVT_MermasRecepcion.ProduccionReporteDev;
using DBMermasRecepcion;
using DevExpress.XtraPrinting;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Produccion
{
    public partial class ControlPesoProdPalletizado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["FechaRegistro"] = DateTime.Now;
            e.NewValues["Id_Etiquetadora"] = Convert.ToInt32(Session["IDCVTUsuario"]);
            e.NewValues["Estado"] = "Creado";
        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                Session["ControlID"] = e.KeyValue;
                Response.Redirect("~/Produccion/ControlPesoProdPalletizadoDetalle.aspx");
            }
            if (e.CommandArgs.CommandName == "cmdVerificado")
            {
                popVerificar.ShowOnPageLoad = true;
                Session["Id_Inspeccion"] = Convert.ToInt32(e.KeyValue);

            }
            if (e.CommandArgs.CommandName == "cmdpdf")
            {
                using (MemoryStream ms = new MemoryStream())
                {
                    RptContPesoProdPalletizado cn = new RptContPesoProdPalletizado();
                    cn.Parameters["v_IdReg"].Value = Convert.ToInt32(e.KeyValue);

                    cn.CreateDocument();
                    PdfExportOptions opts = new PdfExportOptions();
                    opts.ShowPrintDialogOnOpen = true;
                    cn.ExportToPdf(ms, opts);
                    ms.Seek(0, SeekOrigin.Begin);
                    byte[] report = ms.ToArray();
                    Page.Response.ContentType = "application/pdf";
                    Page.Response.Clear();
                    Page.Response.OutputStream.Write(report, 0, report.Length);
                    //Page.Response.End();

                }

            }
        }

        protected void GvDatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            UsuarioClass us = new UsuarioClass();

            var veri = us.idUsuarioVerificador(Convert.ToInt32(Session["IDCVTUsuario"]));

            if (veri == "False")
            {
              
                e.Cancel = true;

            }
        }

        protected void GvDatos_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            UsuarioClass us = new UsuarioClass();

            var veri = us.idUsuarioVerificador(Convert.ToInt32(Session["IDCVTUsuario"]));

            if (veri == "False")
            {             
                GvDatos.SettingsPopup.EditForm.ShowFooter = true;
                GvDatos.SettingsText.PopupEditFormFooterText = "solo usuarios verificadores pueden editar";
               
                e.Cancel = true;
             

            }
        }

        protected void btnVerificar_Click(object sender, EventArgs e)
        {
            LogClass lg = new LogClass();
            //encriptar la clave que ingresa el usuario para ser comparada en la bd
            string pass = lg.Encrypt(txtContrasena.Text, true);

            UsuarioClass us = new UsuarioClass();
            int idUser = us.TraeIdUsuarioVerificador(txtUsuario.Text, pass);


            if (idUser == 0)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Usuario no permitido para verificar');", true);
            }
            else
            {

                CalidadClass Cal = new CalidadClass();
                //string verif = Convert.ToString(Session["NombreUsuario"]);

                int idIsn = Convert.ToInt32(Session["Id_Inspeccion"]);
                bool res = Cal.ActualizaVerificacionContPesoPalletizado(idIsn, idUser);

                if (res == true)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Verificado');", true);
                    GvDatos.DataBind();
                    txtContrasena.Text = string.Empty;
                    txtUsuario.Text = string.Empty;
                    popVerificar.ShowOnPageLoad = false;

                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al Verificar Contactar con Administrador');", true);
                    txtContrasena.Text = string.Empty;
                    txtUsuario.Text = string.Empty;
                    popVerificar.ShowOnPageLoad = true;
                }


            }
        }

        protected void GvDatos_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType == DevExpress.Web.GridViewRowType.Data)
            {
                string Estado = (string)e.GetValue("Estado");
                //int idPerf = Convert.ToInt32(Session["PerfilId"]);

                if (Estado.Equals("Creado"))
                {
                    System.Web.UI.WebControls.ImageButton imgValidacion = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Verificado") as System.Web.UI.WebControls.ImageButton;
                    System.Web.UI.WebControls.ImageButton imgPdf = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "detallePdf") as System.Web.UI.WebControls.ImageButton;
                    imgValidacion.Visible = true;
                    imgPdf.Visible = true;

                }
                else if (Estado.Equals("Verificado"))
                {
                    System.Web.UI.WebControls.ImageButton imgValidacion = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Verificado") as System.Web.UI.WebControls.ImageButton;
                    System.Web.UI.WebControls.ImageButton imgPdf = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "detallePdf") as System.Web.UI.WebControls.ImageButton;
                    imgValidacion.Visible = false;
                    imgPdf.Visible = true;
                }
            }
        }
    }
}