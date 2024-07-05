using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Logistica
{
    public partial class OrdenDeCargaPorPedido : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGenerar_Click(object sender, EventArgs e)
        {
            DateTime fech = Convert.ToDateTime(dteDespacho.Value);
            int numdoc = Convert.ToInt32(txtNotaVenta.Text);
            ReportDocument Info = new ReportDocument();
            Info.Load(Server.MapPath("~/OrdenCarga.rpt"));
            Info.SetDatabaseLogon("sa", "cvt.vdp22$");
            Info.SetParameterValue(0, numdoc);
            Info.SetParameterValue(1, fech);
            ExportOptions op = new ExportOptions();
            Response.Buffer = false;
            Response.Clear();
            // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
            Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
        }

        protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/Logistica/SeleccionPedidos.aspx");
        }
    }
}