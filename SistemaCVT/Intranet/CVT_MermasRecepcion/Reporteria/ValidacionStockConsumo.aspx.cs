using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;

namespace CVT_MermasRecepcion.Reporteria
{
    public partial class ValidacionStockConsumo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_generar_Click(object sender, EventArgs e)
        {
            ReportDocument Info = new ReportDocument();
            Info.Load(Server.MapPath("~/CVT_VistaStockMpParaConsumosxOF.rpt"));
            Info.SetDatabaseLogon("sa", "cvt.vdp22$");
            Info.SetParameterValue(0, Convert.ToInt32(txt_of.Text));
            Response.Buffer = false;
            Response.Clear();

            // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");

            Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
        }
    }
}