using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Informatica
{
    public partial class MantencionInformatica : System.Web.UI.Page
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
                Session["ID_MantInfEnc"] = e.KeyValue;
                Response.Redirect("~/Informatica/InforDetalleMantencion.aspx");
            }
            if (e.CommandArgs.CommandName == "cmdRepu")
            {
                Session["ID_MantInfEnc"] = e.KeyValue;
                Response.Redirect("~/Informatica/InforRepuestosMantencion.aspx");
            }
            if (e.CommandArgs.CommandName == "cmdDetallePdf")
            {
                int id = Convert.ToInt32(e.KeyValue);
                ReportDocument Info = new ReportDocument();
                Info.Load(Server.MapPath("~/FormularioMantencionInformatica.rpt"));
                Info.SetDatabaseLogon("sa", "cvt.vdp22$");
                Info.SetParameterValue(0, id);
                ExportOptions op = new ExportOptions();
                Response.Buffer = false;
                Response.Clear();
                // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
                Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");



            }
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Mantencion Informatica";
            }
        }

        protected void GvDatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 201, "Elimina Registro");
        }

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 201, "Crea Registro");
        }

        protected void GvDatos_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 201, "Actualiza Registro");
        }
    }
}