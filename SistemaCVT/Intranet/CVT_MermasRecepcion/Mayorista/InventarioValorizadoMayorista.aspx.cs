using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using DBMermasRecepcion;
using System;
using System.Data;

namespace CVT_MermasRecepcion.Mayorista
{
    public partial class InventarioValorizadoMayorista : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargaGrilla();
            if (IsPostBack)
            {
                CargaGrilla();
            }


        }

        protected void Inventario_Click(object sender, EventArgs e)
        {
            ReportDocument Info = new ReportDocument();
            Info.Load(Server.MapPath("~/Inventario Valorizado MAYORISTA.rpt"));
            Info.SetDatabaseLogon("sa", "cvt.vdp22$");
           // Info.SetParameterValue(0, 0);
            ExportOptions op = new ExportOptions();

            Response.Buffer = false;
            Response.Clear();
            Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
            // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
            //Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Inventario\Inventario-" + DateTime.Now.ToShortDateString().Replace(@"/", "") + ".pdf");
            //Session["PdfInventario"] = @"C:\Inventario\Inventario-" + DateTime.Now.ToShortDateString().Replace("/", "") + ".pdf";
        }

        protected void InventarioValorizado_Click(object sender, EventArgs e)
        {
            ReportDocument Info = new ReportDocument();
            Info.Load(Server.MapPath("~/Inventario_Comprometidos_MAYORISTA.rpt"));
            Info.SetDatabaseLogon("sa", "cvt.vdp22$");
            //Info.SetParameterValue(0, 1);
            ExportOptions op = new ExportOptions();

            Response.Buffer = false;
            Response.Clear();
            // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
            Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
            //Info.PrintToPrinter(1, false, 1, 1);
        }

        protected void InventarioValorizadoSUNI_Click(object sender, EventArgs e)
        {
            ReportDocument Info = new ReportDocument();
            Info.Load(Server.MapPath("~/Inventario Valorizado MAYORISTA SUNI.rpt"));
            Info.SetDatabaseLogon("sa", "cvt.vdp22$");
            Info.SetParameterValue(0, 1);
            ExportOptions op = new ExportOptions();

            Response.Buffer = false;
            Response.Clear();
            // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
            Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
            //Info.PrintToPrinter(1, false, 1, 1);
        }

        protected void InventarioSUNI_Click(object sender, EventArgs e)
        {
            ReportDocument Info = new ReportDocument();
            Info.Load(Server.MapPath("~/Inventario Valorizado MAYORISTA SUNI.rpt"));
            Info.SetDatabaseLogon("sa", "cvt.vdp22$");
            Info.SetParameterValue(0, 0);
            ExportOptions op = new ExportOptions();

            Response.Buffer = false;
            Response.Clear();
            // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
            Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
            //Info.PrintToPrinter(1, false, 1, 1);
        }

        private void CargaGrilla()
        {
            MMetroClass mme = new MMetroClass();
            DataTable dt = new DataTable();
            dt = mme.SP_InventarioValorizadoGrilla();
            GvDatos.DataSource = dt;
            GvDatos.DataBind();
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {

            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "inventario : " + DateTime.Now;
            }
        }
    }
}