using DBMermasRecepcion;
using DevExpress.XtraPrinting;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.MayoristaProduccion
{
    public partial class Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (MemoryStream ms = new MemoryStream())
            {
                TickPreventa r = new TickPreventa();
                r.Parameters["v_IdPrev"].Value = Convert.ToInt32(Session["IdPreventa"]);
               

                PreventaSMMClass mc = new PreventaSMMClass();

                string CodCli = mc.TraeCodClientPromo(Convert.ToInt32(Session["IdPreventa"]));


                if (CodCli.Equals(""))
                {
                    r.CreateDocument();
                }
                else {
                    TickDescuento d = new TickDescuento();
                    d.Parameters["v_IdCli"].Value = CodCli;
                    d.Parameters["v_IdPrev"].Value = Convert.ToInt32(Session["IdPreventa"]);
                    r.CreateDocument();
                    d.CreateDocument();                   

                    //ASPxWebDocumentViewer1.OpenReport(new CachedReportSourceWeb(repor));

                    //repor.Parameters["v_Pasillo1"].Visible = false;
                    //repor.Parameters["v_Pasillo2"].Visible = false;
                    //repor.Parameters["v_Bodega"].Visible = false;


                    r.ModifyDocument(x => {
                        x.AddPages(d.Pages);
                    });
                }

             

                PdfExportOptions opts = new PdfExportOptions();
                opts.ShowPrintDialogOnOpen = true;
                r.ExportToPdf(ms, opts);
                ms.Seek(0, SeekOrigin.Begin);
                byte[] report = ms.ToArray();
                Page.Response.ContentType = "application/pdf";
                Page.Response.Clear();
                Page.Response.OutputStream.Write(report, 0, report.Length);
                //Page.Response.End();

            }



        }
    }
}