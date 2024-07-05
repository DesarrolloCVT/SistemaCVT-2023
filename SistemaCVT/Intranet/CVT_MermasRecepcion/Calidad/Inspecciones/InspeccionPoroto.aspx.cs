using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Calidad.Inspecciones
{
    public partial class InspeccionPorotoHallado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        {
            GvDatos.AddNewRow();
        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                Session["Id_IspeccionPT_Poroto"] = e.KeyValue;
                Response.Redirect("~/Calidad/Inspecciones/InspeccionPorotoDetalle.aspx");
            }
            if (e.CommandArgs.CommandName == "cmdDetallePdf")
            {
                int id = Convert.ToInt32(e.KeyValue);
                ReportDocument Info = new ReportDocument();
                Info.Load(Server.MapPath("~/R.HACCP.07.rpt"));
                Info.SetDatabaseLogon("sa", "cvt.vdp22$");
                Info.SetParameterValue(0, id);
                ExportOptions op = new ExportOptions();
                Response.Buffer = false;
                Response.Clear();
                // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
                Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
            }
            if (e.CommandArgs.CommandName == "cmdVerificado")
            {
                popVerificar.ShowOnPageLoad = true;
                Session["Inspeccion"] = Convert.ToInt32(e.KeyValue);


            }
        }

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 144, "Crea Registro");

            e.NewValues["IdUsuario"] = Session["IDCVTUsuario"];
            e.NewValues["Fecha_ingresoRegistro"] = DateTime.Now;
            e.NewValues["Estado"] = "Creado";
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

                int idIsn = Convert.ToInt32(Session["Inspeccion"]);
                bool res = Cal.ActualizaEstadoInspeccionPoroto(idIsn, "Verificado", idUser);

                if (res == true)
                {
                    LogClass vLog = new LogClass();
                    vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 144, "Verifica Registro");

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

        protected void GvDatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 144, "Elimina Registro");

            UsuarioClass us = new UsuarioClass();

            var veri = us.idUsuarioVerificador(Convert.ToInt32(Session["IDCVTUsuario"]));

            if (veri == "False")
            {
                e.Cancel = true;
            }
        }

        protected void GvDatos_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 144, "Actualiza Registro");
            UsuarioClass us = new UsuarioClass();

            var veri = us.idUsuarioVerificador(Convert.ToInt32(Session["IDCVTUsuario"]));

            if (veri == "False")
            {
                GvDatos.SettingsPopup.EditForm.ShowFooter = true;
                GvDatos.SettingsText.PopupEditFormFooterText = "solo usuarios verificadores pueden editar";
                GvDatos.StylesPopup.EditForm.Footer.ForeColor = System.Drawing.Color.Red;

                e.Cancel = true;


            }
        }

        
    }
}