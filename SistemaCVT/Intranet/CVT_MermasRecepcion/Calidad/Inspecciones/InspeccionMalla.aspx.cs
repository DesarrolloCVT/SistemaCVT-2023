using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Calidad.Inspecciones
{
    public partial class InspeccionMalla : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        {
            GvDatos.AddNewRow();
        }

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 143, "Crea Registro");

            e.NewValues["IdUsuario"] = Session["IDCVTUsuario"];
            e.NewValues["Fecha_ingresoRegistro"] = DateTime.Now;
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {

        }

        protected void btnGenerainforme_Click(object sender, EventArgs e)
        {
            DateTime fecha = Convert.ToDateTime(dteFecha.Value);
            ReportDocument Info = new ReportDocument();
            Info.Load(Server.MapPath("~/R.OP.14.03.rpt"));
            Info.SetDatabaseLogon("sa", "cvt.vdp22$");
            Info.SetParameterValue(0, fecha);
            ExportOptions op = new ExportOptions();
            Response.Buffer = false;
            Response.Clear();
            // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
            Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
        }

        protected void GvDatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 143, "Elimina Registro");

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
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 143, "Actualiza Registro");

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