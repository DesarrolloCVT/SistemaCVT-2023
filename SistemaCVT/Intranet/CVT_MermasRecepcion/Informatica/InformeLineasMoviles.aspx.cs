using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;

namespace CVT_MermasRecepcion.Informatica
{
    public partial class InformeLineasMoviles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnVer_Click(object sender, EventArgs e)
        {

            ReportDocument Info = new ReportDocument();
            Info.Load(Server.MapPath("~/InformeLineasMoviles.rpt"));
            Info.SetDatabaseLogon("sa", "cvt.vdp22$");
            // Info.SetParameterValue(0, id);
            ExportOptions op = new ExportOptions();
            Response.Buffer = false;
            Response.Clear();
            // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
            Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "InformeLineasMoviles.pdf");
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Detalle Lineas Moviles";
            }
        }
    }
}