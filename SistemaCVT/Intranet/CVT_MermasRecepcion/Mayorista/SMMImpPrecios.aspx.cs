using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using CVT_MermasRecepcion.MayoristaReportes;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Mayorista
{
    public partial class SMMImpPrecios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Gvdat_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdEtiqueta")
            {
                string codprod = Convert.ToString(e.KeyValue);
                ReportDocument Info = new ReportDocument();
                Info.Load(Server.MapPath("~/EtiquetaPreciosMayorista.rpt"));
                Info.SetDatabaseLogon("sa", "cvt.vdp22$");
                Info.SetParameterValue(0, codprod);
                ExportOptions op = new ExportOptions();
                Response.Buffer = false;
                Response.Clear();
                // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
                Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
            }
            if (e.CommandArgs.CommandName == "cmdEtiquetaGrande")
            {
                string codpo = Convert.ToString(e.KeyValue);
                ReportDocument Info1 = new ReportDocument();
                Info1.Load(Server.MapPath("~/EtiquetaPreciosMayorista10x3.rpt"));
                Info1.SetDatabaseLogon("sa", "cvt");
                Info1.SetParameterValue(0, codpo);
                ExportOptions op = new ExportOptions();
                Response.Buffer = false;
                Response.Clear();
                // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
                Info1.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
            }
            if (e.CommandArgs.CommandName == "cmdEtiquetaPeque")
            {
                Session["CodProdPrecio"] = Convert.ToString(e.KeyValue);

                //string javaScript = "printReport()";
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", javaScript, true);


                using (MemoryStream ms = new MemoryStream())
                {
                    EtiquetaPrecios r = new EtiquetaPrecios();
                    r.Parameters["v_CodProd"].Value = Convert.ToString(Session["CodProdPrecio"]);
              

                    r.CreateDocument();
                    DevExpress.XtraPrinting.PdfExportOptions opts = new DevExpress.XtraPrinting.PdfExportOptions();
                    opts.ShowPrintDialogOnOpen = true;
                 
                    r.ExportToPdf(ms, opts);
                    ms.Seek(0, SeekOrigin.Begin);
                    byte[] report = ms.ToArray();
                    Page.Response.ContentType = "application/pdf";
                    Page.Response.Clear();
                    Page.Response.OutputStream.Write(report, 0, report.Length);                
               
                    //Page.Response.End();
                }

                //ReportDocument Info2 = new ReportDocument();
                //Info2.Load(Server.MapPath("~/EtiquetaPreciosMayorista6x4.rpt"));
                //Info2.SetDatabaseLogon("sa", "cvt");
                //Info2.SetParameterValue(0, cod);
                //ExportOptions op = new ExportOptions();
                //Response.Buffer = false;
                //Response.Clear();
                //// Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
                //Info2.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
            }
            if(e.CommandArgs.CommandName== "cmdOferta")
            {
                string cod = Convert.ToString(e.KeyValue);
                ReportDocument Info2 = new ReportDocument();
                Info2.Load(Server.MapPath("~/EtiquetaPreciosMayoristaOfertas.rpt"));
                Info2.SetDatabaseLogon("sa", "cvt");
                Info2.SetParameterValue(0, cod);
                ExportOptions op = new ExportOptions();
                Response.Buffer = false;
                Response.Clear();
                // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
                Info2.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
            }
        }
    }
}