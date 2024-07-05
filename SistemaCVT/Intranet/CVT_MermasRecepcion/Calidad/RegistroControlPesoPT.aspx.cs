using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using DBMermasRecepcion;
using System;

namespace CVT_MermasRecepcion.Calidad
{
    public partial class RegistroControlPesoPT : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           // GvDatos.DataBind();
        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //	DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //	this.ASPxGridViewExporter1.FileName = "Control Peso Producto Terminado";
        //	this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        //}

        //protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        //{
        //	GvDatos.AddNewRow();
        //}

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 134, "Crea Registro");

            e.NewValues["IdEncargadoCalidad"] = 63;
        }

        protected void btnGenerainforme_Click(object sender, EventArgs e)
        {

            string fecha = dteFecha.Date.ToString("yyyy/MM/dd").Replace('/', '-');




            //string fecha = ano + '-' + mes + '-' + dia;
            ReportDocument Info = new ReportDocument();
            Info.Load(Server.MapPath("~/R.OP.14.02.rpt"));
            Info.SetDatabaseLogon("sa", "cvt.vdp22$");
            Info.SetParameterValue(0, fecha);
            ExportOptions op = new ExportOptions();
            Response.Buffer = false;
            Response.Clear();
            // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
            Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Control Peso Producto Terminado";
            }
        }

        protected void GvDatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 134, "Elimina Registro");

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
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 134, "Actualiza Registro");

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