using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;

namespace CVT_MermasRecepcion.Mayorista
{
    public partial class ImprecionPrecios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GvDatos.DataBind();
        }

        //protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        //{
        //    if (e.CommandArgs.CommandName == "cmdEtiqueta")
        //    {
        //        string codprod = Convert.ToString(e.KeyValue);
        //        ReportDocument Info = new ReportDocument();
        //        Info.Load(Server.MapPath("~/EtiquetaPreciosMayorista.rpt"));
        //        Info.SetDatabaseLogon("sa", "cvt.vdp22$");
        //        Info.SetParameterValue(0, codprod);
        //        ExportOptions op = new ExportOptions();
        //        Response.Buffer = false;
        //        Response.Clear();
        //        // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
        //        Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
        //    }
        //    if (e.CommandArgs.CommandName == "cmdEtiquetaGrande")
        //    {
        //        string codprod = Convert.ToString(e.KeyValue);
        //        ReportDocument Info = new ReportDocument();
        //        Info.Load(Server.MapPath("~/EtiquetaPreciosMayorista10x3.rpt"));
        //        Info.SetDatabaseLogon("sa", "cvt.vdp22$");
        //        Info.SetParameterValue(0, codprod);
        //        ExportOptions op = new ExportOptions();
        //        Response.Buffer = false;
        //        Response.Clear();
        //        // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
        //        Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
        //    }
        //    if (e.CommandArgs.CommandName == "cmdEtiquetaPeque")
        //    {
        //        string codprod = Convert.ToString(e.KeyValue);
        //        ReportDocument Info = new ReportDocument();
        //        Info.Load(Server.MapPath("~/EtiquetaPreciosMayorista6x4.rpt"));
        //        Info.SetDatabaseLogon("sa", "cvt.vdp22$");
        //        Info.SetParameterValue(0, codprod);
        //        ExportOptions op = new ExportOptions();
        //        Response.Buffer = false;
        //        Response.Clear();
        //        // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
        //        Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
        //    }

        //}

        protected void GvDatos_RowCommand1(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
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
                string codprod = Convert.ToString(e.KeyValue);
                ReportDocument Info = new ReportDocument();
                Info.Load(Server.MapPath("~/EtiquetaPreciosMayorista10x3.rpt"));
                Info.SetDatabaseLogon("sa", "cvt.vdp22$");
                Info.SetParameterValue(0, codprod);
                ExportOptions op = new ExportOptions();
                Response.Buffer = false;
                Response.Clear();
                // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
                Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
            }
            if (e.CommandArgs.CommandName == "cmdEtiquetaPeque")
            {
                string codprod = Convert.ToString(e.KeyValue);
                ReportDocument Info = new ReportDocument();
                Info.Load(Server.MapPath("~/EtiquetaPreciosMayorista6x4.rpt"));
                Info.SetDatabaseLogon("sa", "cvt.vdp22$");
                Info.SetParameterValue(0, codprod);
                ExportOptions op = new ExportOptions();
                Response.Buffer = false;
                Response.Clear();
                // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
                Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
            }

        }
    }
}