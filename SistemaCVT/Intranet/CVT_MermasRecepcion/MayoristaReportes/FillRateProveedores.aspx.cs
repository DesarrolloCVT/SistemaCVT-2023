using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.MayoristaReportes
{
    public partial class FillRateProveedores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btVerInforme_Click(object sender, EventArgs e)
        {
            int oc = txtOC.Text.Equals("") ? 0 : Convert.ToInt32(txtOC.Text);
            string prov = cboProveedor.Value == null ? "Todos" : Convert.ToString(cboProveedor.Value);
            int ItGr = cboItemGroup.Value == "" ? 0 : Convert.ToInt32(cboItemGroup.Value);

            ReportDocument Info = new ReportDocument();
            Info.Load(Server.MapPath("~/FillRateProveedores.rpt"));
            Info.SetDatabaseLogon("sa", "cvt.vdp22$");
            Info.SetParameterValue(0, dteInicio.Value);
            Info.SetParameterValue(1, dteTermino.Value);
            Info.SetParameterValue(2, oc);
            Info.SetParameterValue(3,prov);
            Info.SetParameterValue(4, ItGr);
            Info.SetParameterValue(5, cboTipoInforme.Value);
            ExportOptions op = new ExportOptions();
            Response.Buffer = false;
            Response.Clear();
            // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
            Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
        }

        protected void btLimpiar_Click(object sender, EventArgs e)
        {
            cboProveedor.SelectedIndex = -1;
            cboItemGroup.SelectedIndex = -1;
            txtOC.Text = string.Empty;
               

        }
    }
}