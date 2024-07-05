using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.MayoristaReportes
{
    public partial class ConsolidadoPedidosFecha : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (IsPostBack) {
            //    GvDatos.DataSource = Session["Datos"];
            //}
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            //int oc = txtOC.Text.Equals("") ? 0 : Convert.ToInt32(txtOC.Text);
            //string prov = cboProveedor.Value == null ? "Todos" : Convert.ToString(cboProveedor.Value);
            //int ItGr = cboItemGroup.Value == "" ? 0 : Convert.ToInt32(cboItemGroup.Value);

            ReportDocument Info = new ReportDocument();
            Info.Load(Server.MapPath("~/ConsolidacionProductosSMM.rpt"));
            Info.SetDatabaseLogon("sa", "cvt.vdp22$");
            Info.SetParameterValue(0, dteFInicio.Value);
          //  Info.SetParameterValue(1, dteFInicio.Value);
            //Info.SetParameterValue(1, dteTermino.Value);
            //Info.SetParameterValue(2, oc);
            //Info.SetParameterValue(3, prov);
            //Info.SetParameterValue(4, ItGr);
            //Info.SetParameterValue(5, cboTipoInforme.Value);
            ExportOptions op = new ExportOptions();
            Response.Buffer = false;
            Response.Clear();
            // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
            Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
        }

        //protected void btnGrilla_Click(object sender, EventArgs e)
        //{
        //    MMetroClass mm = new MMetroClass();

        //    DataTable td = mm.SP_ConsolidadoPedidoGrilla(dteFInicio.Date);
        //    GvDatos.DataSource = td;
        //    Session["Datos"] = td;
        //    GvDatos.DataBind();
        // }
    }
}