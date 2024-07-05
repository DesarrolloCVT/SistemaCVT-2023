using DevExpress.XtraPrinting;
using System;
using System.Collections.Generic;
using System.Drawing.Printing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion
{
    public partial class TestListaImpresion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //var ls = System.Drawing.Printing.PrinterSettings.InstalledPrinters;

            //foreach(var t in ls)
            //{
            //    cboList.Items.Add(t.ToString());
            //}          

            divRemoto.Visible = false;

        }
        void PrintingSystem_StartPrint(object sender, PrintDocumentEventArgs e)
        {
            // Set the number of document copies to print.
            e.PrintDocument.PrinterSettings.Copies = Convert.ToInt16(txtCantCopias.Text);
           
        }
        protected void btn_imprimir_Click(object sender, EventArgs e)
        {
            EtiquetaQr1 r= new EtiquetaQr1();
            string Imp = cboList.Value.ToString();
            try
            {
                if (Convert.ToInt32(rb_tipo.Value) == 1)
                {
                    using (MemoryStream ms = new MemoryStream())
                    {
                        r.Parameters["Num_Pallet"].Value = Convert.ToInt32(txt_npallet.Text);
                        r.Parameters["Num_Recep"].Value = 0;
                        r.Parameters["Num_Ubicacion"].Value = 1;

                        r.CreateDocument();
                        DevExpress.XtraPrinting.PdfExportOptions opts = new DevExpress.XtraPrinting.PdfExportOptions();
                        r.PrintingSystem.StartPrint += PrintingSystem_StartPrint;
                        //DevExpress.XtraReports.UI.ReportPrintTool printTool = new DevExpress.XtraReports.UI.ReportPrintTool(r);

                        //printTool.PrinterSettings.Copies= Convert.ToInt16(txtCantCopias.Text);
                        //printTool.Print(cboList.Text);
                        opts.ShowPrintDialogOnOpen = true;
                        r.Print(Imp);
                        //r.ShowPrintStatusDialog=true;
                        //printTool.Dispose();
                        r.Dispose();
                    }
                }
                if (Convert.ToInt32(rb_tipo.Value) == 2)
                {
                    using (MemoryStream ms = new MemoryStream())
                    {
                        r.Parameters["Num_Pallet"].Value = 0;
                        r.Parameters["Num_Recep"].Value = Convert.ToInt32(txt_npallet.Text);
                        r.Parameters["Num_Ubicacion"].Value = 1;

                        r.CreateDocument();
                        DevExpress.XtraPrinting.PdfExportOptions opts = new DevExpress.XtraPrinting.PdfExportOptions();
                        opts.ShowPrintDialogOnOpen = false;
                        r.PrintingSystem.StartPrint += PrintingSystem_StartPrint;
                        r.Print(Imp);

                        r.Dispose();

                    }
                }
                if (Convert.ToInt32(rb_tipo.Value) == 3)
                {
                    using (MemoryStream ms = new MemoryStream())
                    {
                        r.Parameters["Num_Pallet"].Value = 0;
                        r.Parameters["Num_Recep"].Value = Convert.ToInt32(txt_npallet.Text);
                        r.Parameters["Num_Ubicacion"].Value = 2;
                        r.CreateDocument();
                        DevExpress.XtraPrinting.PdfExportOptions opts = new DevExpress.XtraPrinting.PdfExportOptions();
                        opts.ShowPrintDialogOnOpen = false;
                        r.PrintingSystem.StartPrint += PrintingSystem_StartPrint;
                        r.Print(Imp);

                        r.Dispose();
                    }
                }
                if (Convert.ToInt32(rb_tipo.Value) == 4)
                {
                    using (MemoryStream ms = new MemoryStream())
                    {
                        r.Parameters["Num_Pallet"].Value = 0;
                        r.Parameters["Num_Recep"].Value = Convert.ToInt32(txt_npallet.Text);
                        r.Parameters["Num_Ubicacion"].Value = 3;

                        r.CreateDocument();
                        DevExpress.XtraPrinting.PdfExportOptions opts = new DevExpress.XtraPrinting.PdfExportOptions();
                        opts.ShowPrintDialogOnOpen = false;
                        r.PrintingSystem.StartPrint += PrintingSystem_StartPrint;
                        r.Print(Imp);
                        r.Dispose();
                    }

                }

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('impresion completa favor verificar');", true);
                divRemoto.Visible = false;
                cboList.SelectedIndex = -1;
                txtCantCopias.Text ="1";
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error: " + ex.ToString() + " ');", true) ;
            }
           
        }

        protected void btnRemoto_Click(object sender, EventArgs e)
        {
            divRemoto.Visible = true;
        }

        protected void btnLocal_Click(object sender, EventArgs e)
        {
            EtiquetaQr1 r = new EtiquetaQr1();
            //report.ShowPrintStatusDialog = false;           

            if (Convert.ToInt32(rb_tipo.Value) == 1)
            {
                using (MemoryStream ms = new MemoryStream())
                {

                    r.Parameters["Num_Pallet"].Value = Convert.ToInt32(txt_npallet.Text);
                    r.Parameters["Num_Recep"].Value = 0;
                    r.Parameters["Num_Ubicacion"].Value = 1;

                    r.CreateDocument();
                    DevExpress.XtraPrinting.PdfExportOptions opts = new DevExpress.XtraPrinting.PdfExportOptions();
                    opts.ShowPrintDialogOnOpen = true;

                    r.ExportToPdf(ms, opts);
                    ms.Seek(0, SeekOrigin.Begin);
                    byte[] report = ms.ToArray();
                    Page.Response.ContentType = "application/pdf";
                    Page.Response.Clear();
                    Page.Response.OutputStream.Write(report, 0, report.Length);
                }
            }
            if (Convert.ToInt32(rb_tipo.Value) == 2)
            {
                using (MemoryStream ms = new MemoryStream())
                {

                    r.Parameters["Num_Pallet"].Value = 0;
                    r.Parameters["Num_Recep"].Value = Convert.ToInt32(txt_npallet.Text);
                    r.Parameters["Num_Ubicacion"].Value = 1;

                    r.CreateDocument();
                    DevExpress.XtraPrinting.PdfExportOptions opts = new DevExpress.XtraPrinting.PdfExportOptions();
                    opts.ShowPrintDialogOnOpen = true;

                    r.ExportToPdf(ms, opts);
                    ms.Seek(0, SeekOrigin.Begin);
                    byte[] report = ms.ToArray();
                    Page.Response.ContentType = "application/pdf";
                    Page.Response.Clear();
                    Page.Response.OutputStream.Write(report, 0, report.Length);
                }
            }
            if (Convert.ToInt32(rb_tipo.Value) == 3)
            {
                using (MemoryStream ms = new MemoryStream())
                {

                    r.Parameters["Num_Pallet"].Value = 0;
                    r.Parameters["Num_Recep"].Value = Convert.ToInt32(txt_npallet.Text);
                    r.Parameters["Num_Ubicacion"].Value = 2;

                    r.CreateDocument();
                    DevExpress.XtraPrinting.PdfExportOptions opts = new DevExpress.XtraPrinting.PdfExportOptions();
                    opts.ShowPrintDialogOnOpen = true;

                    r.ExportToPdf(ms, opts);
                    ms.Seek(0, SeekOrigin.Begin);
                    byte[] report = ms.ToArray();
                    Page.Response.ContentType = "application/pdf";
                    Page.Response.Clear();
                    Page.Response.OutputStream.Write(report, 0, report.Length);
                }

            }
            if (Convert.ToInt32(rb_tipo.Value) == 4)
            {
                using (MemoryStream ms = new MemoryStream())
                {

                    r.Parameters["Num_Pallet"].Value = 0;
                    r.Parameters["Num_Recep"].Value = Convert.ToInt32(txt_npallet.Text);
                    r.Parameters["Num_Ubicacion"].Value = 3;

                    r.CreateDocument();
                    DevExpress.XtraPrinting.PdfExportOptions opts = new DevExpress.XtraPrinting.PdfExportOptions();
                    opts.ShowPrintDialogOnOpen = true;

                    r.ExportToPdf(ms, opts);
                    ms.Seek(0, SeekOrigin.Begin);
                    byte[] report = ms.ToArray();
                    Page.Response.ContentType = "application/pdf";
                    Page.Response.Clear();
                    Page.Response.OutputStream.Write(report, 0, report.Length);
                }

            }
        }
    }
}