using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Calidad.Inspecciones
{
    public partial class MonitoreoDetectorMetalesUno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GvDatos.DataBind();
        }

        //protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        //{
        //    //GvDatos.AddNewRow();
        //    popMonitoreoDetectorMetales1.ShowOnPageLoad = true;
        //    dteFechaMoni.Date = DateTime.Now;
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
            Info.Load(Server.MapPath("~/R.HACCP.12.01.rpt"));
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
            CVT_MonitoreoDetectorMetalesUno md = new CVT_MonitoreoDetectorMetalesUno();

            int ano = dteFechaMoni.Date.Year;
            int dia = dteFechaMoni.Date.Day;
            int mes = dteFechaMoni.Date.Month;
            DateTime fmon = new DateTime(ano, mes, dia, 0, 0, 0);

            md.Producto = txtProducto.Text;
            md.HoraMonitoreo = TimeSpan.Parse(txtHora.Text);
            md.FE15mm = Convert.ToInt16(cboFE15mm.Value);
            md.NoFE25mm = Convert.ToInt16(cboFE25mm.Value);
            md.AceroInox25mm = Convert.ToInt16(cboAcero25mm.Value);
            md.EnciendeBaliza = Convert.ToInt16(cboBaliza.Value);
            md.SuenaBaliza = Convert.ToInt16(cboSuenaBaliza.Value);
            md.Brazo_de_rechazo = Convert.ToInt16(cboBrazoRechazo.Value);
            md.IdUsuario = Convert.ToInt32(Session["IDCVTUsuario"]);
            md.FechaMonitoreo = fmon;
            md.Observacion = txtObservacion.Text;
            md.Fecha_ingresoRegistro = DateTime.Now;
            md.Id_EncargadaCalidad = 63;

            bool rest = ca.InsertaMonitoreoDectMetales1(md);
            if (rest == true)
            {

                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 146, "Crea Registro");

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registro Guardado');", true);
                GvDatos.DataBind();
                popMonitoreoDetectorMetales1.ShowOnPageLoad = false;
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
            txtProducto.Text = string.Empty;
            txtHora.Text = string.Empty;
            cboFE15mm.SelectedIndex = 0;
            cboFE25mm.SelectedIndex = 0;
            cboAcero25mm.SelectedIndex = 0;
            cboBaliza.SelectedIndex = 0;
            cboSuenaBaliza.SelectedIndex = 0;
            cboBrazoRechazo.SelectedIndex = 0;
            dteFechaMoni.Date = DateTime.Now;
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (e.Item.Name.Equals("Nuevo"))
            {
                popMonitoreoDetectorMetales1.ShowOnPageLoad = true;
                dteFechaMoni.Date = DateTime.Now;
            }
        }

        protected void GvDatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 146, "Elimina Registro");

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
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 146, "Actualiza Registro");

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