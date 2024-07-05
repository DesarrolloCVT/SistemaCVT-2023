using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;

namespace CVT_MermasRecepcion.WMS
{
    public partial class ImpresionUbicaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_imprimir_Click(object sender, EventArgs e)
        {
            ReportDocument Info = new ReportDocument();
            Info.Load(Server.MapPath("~/EtiquetaUbicacion.rpt"));
            Info.SetDatabaseLogon("sa", "cvt.vdp22$");
            Info.SetParameterValue(0, txt_nUbicacion.Text);
            Response.Buffer = false;
            Response.Clear();

            // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");

            Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
        }
    }
}