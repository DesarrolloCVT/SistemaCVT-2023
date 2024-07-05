using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Calidad.Inspecciones
{
    public partial class RegistroSaturacionPatrones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GvDatos.DataBind();
        }

        //protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        //{
        //    //GvDatos.AddNewRow();
        //    popSaturacionPatrones.ShowOnPageLoad = true;
        //    dtefechareg.Date = DateTime.Now;
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
            Info.Load(Server.MapPath("~/R.OP.15.08.01.rpt"));
            Info.SetDatabaseLogon("sa", "cvt.vdp22$");
            Info.SetParameterValue(0, fecha);
            ExportOptions op = new ExportOptions();
            Response.Buffer = false;
            Response.Clear();
            // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
            Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            CalidadClass ca = new CalidadClass();
            CVT_RegistroSaturacionPatrones rsp = new CVT_RegistroSaturacionPatrones();

            int ano = dtefechareg.Date.Year;
            int dia = dtefechareg.Date.Day;
            int mes = dtefechareg.Date.Month;
            DateTime fmon = new DateTime(ano, mes, dia, 0, 0, 0);

            rsp.IdUsuario = Convert.ToInt32(Session["IDCVTUsuario"]);
            rsp.ItemCode = Convert.ToString(cboProducto.Value);
            rsp.FechaRegistro = fmon;
            rsp.HoraRegistro = TimeSpan.Parse(txtHora.Text);
            rsp.PasadasSeguidas = Convert.ToInt32(txtCantVesPasada.Text);
            rsp.FE25mm = Convert.ToInt16(cboFE25mm.Value);
            rsp.NOFE30mm = Convert.ToInt16(cboNOFE30mm.Value);
            rsp.Acero25mm = Convert.ToInt16(cboAcero.Value);
            rsp.EnciendeBaliza = Convert.ToInt16(cboEnciendeBaliza.Value);
            rsp.SuenaBaliza = Convert.ToInt16(cboSuenaBaliza.Value);
            rsp.BrazoRechazo = Convert.ToInt16(cboFuncBrazo.Value);
            rsp.Observaciones = txtObservacion.Text;
            rsp.Fecha_ingresoRegistro = DateTime.Now;

            bool rest = ca.InsertaSaturacionPatron(rsp);
            if (rest == true)
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 150, "Crea Registro");

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registro Guardado');", true);
                GvDatos.DataBind();
                popSaturacionPatrones.ShowOnPageLoad = false;
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
            dtefechareg.Date = DateTime.Now;
            cboProducto.SelectedIndex = -1;
            txtHora.Text = string.Empty;
            txtCantVesPasada.Text = string.Empty;
            cboFE25mm.SelectedIndex = 0;
            cboNOFE30mm.SelectedIndex = 0;
            cboAcero.SelectedIndex = 0;
            cboEnciendeBaliza.SelectedIndex = 0;
            cboSuenaBaliza.SelectedIndex = 0;
            cboFuncBrazo.SelectedIndex = 0;
            txtObservacion.Text = string.Empty;

        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (e.Item.Name.Equals("Nuevo"))
            {
                popSaturacionPatrones.ShowOnPageLoad = true;
                dtefechareg.Date = DateTime.Now;
            }
        }

        protected void GvDatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 150, "Elimina Registro");

            UsuarioClass us = new UsuarioClass();

            var veri = us.idUsuarioVerificador(Convert.ToInt32(Session["IDCVTUsuario"]));

            if (veri == "False")
            {
                e.Cancel = true;
            }
        }

        protected void GvDatos_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 150, "Actualiza Registro");
        }

        protected void GvDatos_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
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