using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Calidad.Inspecciones
{
    public partial class PatronTestigo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GvDatos.DataBind();
        }

        //protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        //{
        //    //GvDatos.AddNewRow();
        //    PopPatronTestigo.ShowOnPageLoad = true;
        //    dteFechaReg.Date = DateTime.Now;
        //}

        //protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        //{
        //    e.NewValues["IdUsuario"] = Session["IDCVTUsuario"];
        //    e.NewValues["Fecha_ingresoRegistro"] = DateTime.Now;
        //}

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {

        }

        protected void btnGenerainforme_Click(object sender, EventArgs e)
        {
            DateTime fecha = Convert.ToDateTime(dteFecha.Value);
            ReportDocument Info = new ReportDocument();
            Info.Load(Server.MapPath("~/R.OP.15.09.rpt"));
            Info.SetDatabaseLogon("sa", "cvt.vdp22$");
            Info.SetParameterValue(0, fecha);
            ExportOptions op = new ExportOptions();
            Response.Buffer = false;
            Response.Clear();
            // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
            Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            CalidadClass ca = new CalidadClass();
            CVT_RegistroPatronTestigo pt = new CVT_RegistroPatronTestigo();

            int ano = dteFechaReg.Date.Year;
            int dia = dteFechaReg.Date.Day;
            int mes = dteFechaReg.Date.Month;
            DateTime fmon = new DateTime(ano, mes, dia, 0, 0, 0);

            pt.FechaRegistro = fmon;
            pt.Hora = TimeSpan.Parse(txtHora.Text);
            pt.ItemCode = Convert.ToString(cboProducto.Value);
            pt.Patron = txtPatron.Text;
            pt.PatronDetectado = Convert.ToInt16(cboPatDetectado.Value);
            pt.EnciendeBaliza = Convert.ToInt16(cboEnciendeBaliza.Value);
            pt.SuenaBaliza = Convert.ToInt16(cboSuenaBaliza.Value);
            pt.BrazodeRechazo = Convert.ToInt16(cboBrazo.Value);
            pt.IdUsuario = Convert.ToInt32(Session["IDCVTUsuario"]);
            pt.Observacion = txtObservacion.Text;
            pt.Fecha_ingresoRegistro = DateTime.Now;

            bool result = ca.InsertaPatronTestigo(pt);
            if (result == true)
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 148, "Crea Registro");

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registro Guardado');", true);
                GvDatos.DataBind();
                PopPatronTestigo.ShowOnPageLoad = false;
                limpiar();

            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al Registrar Contactar con Administrador');", true);
                limpiar();
            }
        }

        protected void limpiar()
        {
            dteFechaReg.Date = DateTime.Now;
            txtHora.Text = string.Empty;
            cboProducto.SelectedIndex = -1;
            txtPatron.Text = string.Empty;
            cboPatDetectado.SelectedIndex = 0;
            cboEnciendeBaliza.SelectedIndex = 0;
            cboSuenaBaliza.SelectedIndex = 0;
            cboBrazo.SelectedIndex = 0;
            txtObservacion.Text = string.Empty;


        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (e.Item.Name.Equals("Nuevo"))
            {
                PopPatronTestigo.ShowOnPageLoad = true;
                dteFechaReg.Date = DateTime.Now;
            }
        }

        protected void GvDatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 148, "Elimina Registro");

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
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 148, "Actualiza Registro");

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