using CVT_MermasRecepcion.MayoristaReportes;
using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.MayoristaOP
{
    public partial class SMMImpEtiqSala : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdImpEtiqueta")
            {
               


                using (MemoryStream ms = new MemoryStream())
                {
                    SMMEtiquetaSala r = new SMMEtiquetaSala();
                    r.Parameters["v_IdRegSl"].Value =Convert.ToInt32(e.KeyValue);


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
                int codreg =Convert.ToInt32(e.KeyValue);
                CVTWMSMetroClass rs = new CVTWMSMetroClass();

                rs.ActualizaEstadoEtiquetaSala(codreg);

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
        }
    }
}