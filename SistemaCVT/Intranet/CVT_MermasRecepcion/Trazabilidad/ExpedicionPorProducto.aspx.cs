using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;

namespace CVT_MermasRecepcion.Trazabilidad
{
    public partial class ExpedicionPorProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Buscar_Click(object sender, EventArgs e)
        {
            int nExp = Convert.ToInt32(txtNExpedicion.Text);
            string codpro = txtCodProducto.Text;
            string lote = txtLote.Text;

            ReportDocument Info = new ReportDocument();
            Info.Load(Server.MapPath("~/Detalle Pallets en Expedición x Producto.rpt"));
            Info.SetDatabaseLogon("sa", "cvt.vdp22$");
            Info.SetParameterValue(0, nExp);
            Info.SetParameterValue(1, codpro);
            Info.SetParameterValue(2, lote);
            ExportOptions op = new ExportOptions();
            Response.Buffer = false;
            Response.Clear();
            // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
            Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
        }
    }
}