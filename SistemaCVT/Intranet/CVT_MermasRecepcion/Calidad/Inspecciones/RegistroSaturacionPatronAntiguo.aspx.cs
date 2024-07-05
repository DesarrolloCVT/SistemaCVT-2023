using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Calidad.Inspecciones
{
    public partial class RegistroSaturacionPatronAntiguo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GvDatos.DataBind();
        }

        //protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        //{
        //    //GvDatos.AddNewRow();
        //    popSaturacionPatronesAntiguo.ShowOnPageLoad = true;
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
            Info.Load(Server.MapPath("~/R.OP.15.08.rpt"));
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
            CVT_RegistroSaturacionPatronesAntiguo rsa = new CVT_RegistroSaturacionPatronesAntiguo();

            int ano = dtefechareg.Date.Year;
            int dia = dtefechareg.Date.Day;
            int mes = dtefechareg.Date.Month;
            DateTime fmon = new DateTime(ano, mes, dia, 0, 0, 0);

            rsa.IdUsuario = Convert.ToInt32(Session["IDCVTUsuario"]);
            rsa.ItemCode = Convert.ToString(cboProducto.Value);
            rsa.FechaRegistro = fmon;
            rsa.HoraRegistro = TimeSpan.Parse(txtHora.Text);
            rsa.Pasadas = Convert.ToInt32(txtCantVesPasada.Text);
            rsa.FE15mm = Convert.ToInt16(cboFE15mm.Value);
            rsa.NoFE25mm = Convert.ToInt16(cboNOFE25mm.Value);
            rsa.DetectaAcero = Convert.ToInt16(cboAcero.Value);
            rsa.Enciendebaliza = Convert.ToInt16(cboEnciendeBaliza.Value);
            rsa.SuenaBaliza = Convert.ToInt16(cboSuenaBaliza.Value);
            rsa.FuncionaBrazo = Convert.ToInt16(cboFuncBrazo.Value);
            rsa.Observacion = txtObservacion.Text;
            rsa.Fecha_ingresoRegistro = DateTime.Now;

            bool rest = ca.InsertaSaturacionPatronAntiguo(rsa);
            if (rest == true)
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 149, "Crea Registro");

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registro Guardado');", true);
                GvDatos.DataBind();
                popSaturacionPatronesAntiguo.ShowOnPageLoad = false;
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
            cboFE15mm.SelectedIndex = 0;
            cboNOFE25mm.SelectedIndex = 0;
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
                popSaturacionPatronesAntiguo.ShowOnPageLoad = true;
                dtefechareg.Date = DateTime.Now;
            }
        }

        protected void GvDatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 149, "Elimina Registro");

            
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
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 149, "Actualiza Registro");

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