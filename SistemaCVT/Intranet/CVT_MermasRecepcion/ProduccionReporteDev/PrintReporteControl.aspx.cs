using DevExpress.XtraPrinting;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.ProduccionReporteDev
{
    public partial class PrintReporteControl : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //using (MemoryStream ms = new MemoryStream())
            //{
            //    RptContPesoProdPalletizado cn = new RptContPesoProdPalletizado();
            //    cn.Parameters["v_idReg"].Value = Convert.ToInt32(Session["Id_ContPesPall"]);


               
            //        cn.CreateDocument();
               



            //    PdfExportOptions opts = new PdfExportOptions();
            //    opts.ShowPrintDialogOnOpen = true;
            //    cn.ExportToPdf(ms, opts);
            //    ms.Seek(0, SeekOrigin.Begin);
            //    byte[] report = ms.ToArray();
            //    Page.Response.ContentType = "application/pdf";
            //    Page.Response.Clear();
            //    Page.Response.OutputStream.Write(report, 0, report.Length);
            //    //Page.Response.End();

            //}

        }
    }
}