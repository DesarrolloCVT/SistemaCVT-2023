using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.PRiesgo
{
    public partial class ControlFosfina : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            GvDatos.DataBind();

        }

        protected void btnInforme_Click(object sender, EventArgs e)
        {
            //int id = Convert.ToInt32(e.KeyValue);
            ReportDocument Info = new ReportDocument();
            Info.Load(Server.MapPath("~/R.SSO.025.00-ControlFosfina.rpt"));
            Info.SetDatabaseLogon("sa", "cvt.vdp22$");
            Info.SetParameterValue(0, fInicio.Date);
            Info.SetParameterValue(1, fTermino.Date);
            ExportOptions op = new ExportOptions();
            Response.Buffer = false;
            Response.Clear();
            // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
            Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
        }
    }
}