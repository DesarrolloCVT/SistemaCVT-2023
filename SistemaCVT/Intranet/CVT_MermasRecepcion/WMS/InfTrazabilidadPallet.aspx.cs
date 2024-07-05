using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.WMS
{
    public partial class InfTrazabilidadPallet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            GvBusqueda.DataBind();
            GvDatos.DataBind();
            GvReserva.DataBind();
        }

        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {
            ReportDocument Info = new ReportDocument();
            Info.Load(Server.MapPath("~/CVT_TRAZABILIDAD.rpt"));
            Info.SetDatabaseLogon("sa", "cvt.vdp22$");
            Info.SetParameterValue(0, txt_pallet.Text);
            Response.Buffer = false;
            Response.Clear();

            // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");

            Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
        }
    }
}