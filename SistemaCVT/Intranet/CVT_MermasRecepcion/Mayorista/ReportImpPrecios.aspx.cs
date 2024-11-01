﻿using CVT_MermasRecepcion.MayoristaReportes;
using DevExpress.XtraPrinting;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Mayorista
{
    public partial class ReportImpPrecios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (MemoryStream ms = new MemoryStream())
            {
                EtiquetaPrecios r = new EtiquetaPrecios();
                r.Parameters["v_CodProd"].Value = Convert.ToString(Session["CodProdPrecio"]);

                //ASPxWebDocumentViewer1.OpenReport(new CachedReportSourceWeb(repor));

                //repor.Parameters["v_Pasillo1"].Visible = false;
                //repor.Parameters["v_Pasillo2"].Visible = false;
                //repor.Parameters["v_Bodega"].Visible = false;

                r.CreateDocument();
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