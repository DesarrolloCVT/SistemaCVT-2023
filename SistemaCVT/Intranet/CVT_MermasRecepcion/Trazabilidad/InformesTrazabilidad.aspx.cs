using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;

namespace CVT_MermasRecepcion.Trazabilidad
{
    public partial class InformesTrazabilidad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_InfConsumiblesxOF_Click(object sender, EventArgs e)
        {
            int OF = Convert.ToInt32(txt_OFConsumiblesxOF.Text);
            

            ReportDocument Info = new ReportDocument();
            Info.Load(Server.MapPath("~/ConsumiblesPorOF.rpt"));
            Info.SetDatabaseLogon("sa", "cvt.vdp22$");
            Info.SetParameterValue(0, OF);
            ExportOptions op = new ExportOptions();
            Response.Buffer = false;
            Response.Clear();
            // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
            Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
        }
    }
}