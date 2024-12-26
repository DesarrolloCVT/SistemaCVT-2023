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
                Info.Load(Server.MapPath("~/Fleje6x4_CodProd.rpt"));
                Info.SetDatabaseLogon("sa", "cvt.vdp22$");
                Info.SetParameterValue(0, codprod);
                ExportOptions op = new ExportOptions();
                Response.Buffer = false;
                Response.Clear();
                // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
                Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
            }
            
        }

        protected void btn_Imprimir_Click(object sender, EventArgs e)
        {
            string codprod = cbo_Catgoria.Value.ToString()+cbo_Subcategoria.Value.ToString();
            ReportDocument Info = new ReportDocument();
            Info.Load(Server.MapPath("~/Fleje6x4_Categoria.rpt"));
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