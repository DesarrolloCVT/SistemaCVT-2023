using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Mayorista
{
    public partial class TicketEnvase : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGenerar_Click(object sender, EventArgs e)
        {
            int Cajas = txtCajas.Text.Equals(string.Empty) ? 0 : Convert.ToInt32(txtCajas.Text);
            int Envases = txtEnvases.Text.Equals(string.Empty) ? 0 : Convert.ToInt32(txtEnvases.Text);

            ReportDocument Info2 = new ReportDocument();
            Info2.Load(Server.MapPath("~/ComprobanteEnvases.rpt"));
            Info2.SetDatabaseLogon("sa", "cvt");
            Info2.SetParameterValue(0, Envases);
            Info2.SetParameterValue(1, Cajas);
            ExportOptions op = new ExportOptions();
            Response.Buffer = false;
            Response.Clear();
            // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
            Info2.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
        }
    }
}