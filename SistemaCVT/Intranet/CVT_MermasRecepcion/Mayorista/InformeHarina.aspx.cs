using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using DBMermasRecepcion;
using System;
using System.Data;

namespace CVT_MermasRecepcion.Mayorista
{
    public partial class InformeHarina : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                cargaGrilla();

            }
        }

        private void cargaGrilla()
        {

            MMetroClass inv = new MMetroClass();
            DataTable dt = inv.SP_InformeHarina(dteInicio.Date, dteTermino.Date);
            GvDatos.DataSource = dt;
            GvDatos.DataBind();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            cargaGrilla();
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Informe Harina";
            }
        }

        protected void btnVerPdf_Click(object sender, EventArgs e)
        {
            DateTime fechaini = Convert.ToDateTime(dteInicio.Value);
            DateTime fechater = Convert.ToDateTime(dteTermino.Value);
            ReportDocument Info = new ReportDocument();
            Info.Load(Server.MapPath("~/RPT_ExistenciasHarinaTrigo.rpt"));
            Info.SetDatabaseLogon("sa", "cvt.vdp22$");
            Info.SetParameterValue(0, fechaini);
            Info.SetParameterValue(1, fechater);
            ExportOptions op = new ExportOptions();
            Response.Buffer = false;
            Response.Clear();
            // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
            Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
        }
    }
}