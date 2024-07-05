using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;

namespace CVT_MermasRecepcion.Trazabilidad
{
    public partial class RegistrosCalidad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                int id = Convert.ToInt32(e.KeyValue);
                string Crystal = GvDatos.GetRowValuesByKeyValue(e.KeyValue, "Reporte").ToString();
                ReportDocument Info = new ReportDocument();
                Info.Load(Server.MapPath(Crystal));
                Info.SetDatabaseLogon("sa", "cvt.vdp22$");
                Info.SetParameterValue(0, id);
                ExportOptions op = new ExportOptions();
                Response.Buffer = false;
                Response.Clear();
                // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
                Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
            }
        }

        protected void btn_Buscar_Click(object sender, EventArgs e)
        {
            GvDatos.DataBind();
        }
    }
}