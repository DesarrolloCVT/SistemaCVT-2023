using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using DBMermasRecepcion;
using System;
using System.Data;

namespace CVT_MermasRecepcion.RRHH
{
    public partial class ReporteTorniquete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                try
                {
                    string fi = cbofinicio0.Date.Year.ToString() + "/" + cbofinicio0.Date.Month.ToString() + "/" + cbofinicio0.Date.Day.ToString() + " 00:00:00";
                    string ft = cboftermino0.Date.Year.ToString() + "/" + cboftermino0.Date.Month.ToString() + "/" + cboftermino0.Date.Day.ToString() + " 23:59:59";
                    int Empresa = Convert.ToInt32(cbo_empresa.Value);
                    string area = cbo_area.Value == null || cbo_area.Value == string.Empty ? "--" : cbo_area.Value.ToString();
                    string rut = cbo_rutnombre.Value == null || cbo_rutnombre.Value == string.Empty ? "--" : cbo_rutnombre.Value.ToString();
                    TorniqueteClass vTorniquete = new TorniqueteClass();
                    DataTable dt = new DataTable();
                    dt = vTorniquete.ObtieneInformeTorniquete(Empresa, cbofinicio0.Date, cboftermino0.Date, area, rut);
                    GvDatos.DataSource = dt;
                    //GvDatos.DataSource = LqDsInformeValorizado;
                    GvDatos.DataBind();
                }
                catch
                {
                }
            }

        }

        protected void btn_procesar_Click(object sender, EventArgs e)
        {
            try
            {
                string fi = cbofinicio.Date.Year.ToString() + "/" + cbofinicio.Date.Month.ToString() + "/" + cbofinicio.Date.Day.ToString() + " 00:00:00";
                string ft = cboftermino.Date.Year.ToString() + "/" + cboftermino.Date.Month.ToString() + "/" + cboftermino.Date.Day.ToString() + " 23:59:59";
                ReportDocument Info = new ReportDocument();
                Info.Load(Server.MapPath("~/Reporte_Torniquete.rpt"));
                Info.SetDatabaseLogon("sa", "cvt.vdp22$");
                Info.SetParameterValue(0, fi);
                Info.SetParameterValue(1, ft);
                ExportOptions op = new ExportOptions();
                Response.Buffer = false;
                Response.Clear();
                // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
                Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
            }
            catch
            {
            }
        }

        protected void btn_procesar0_Click(object sender, EventArgs e)
        {
            try
            {
                string fi = cbofinicio0.Date.Year.ToString() + "/" + cbofinicio0.Date.Month.ToString() + "/" + cbofinicio0.Date.Day.ToString() + " 00:00:00";
                string ft = cboftermino0.Date.Year.ToString() + "/" + cboftermino0.Date.Month.ToString() + "/" + cboftermino0.Date.Day.ToString() + " 23:59:59";
                int deptosup = Convert.ToInt32(cbo_empresa.Value);
                int area = cbo_area.Value == null ? 0 : Convert.ToInt32(cbo_area.Value);
                int rut = cbo_rutnombre.Value == null ? 0 : Convert.ToInt32(cbo_rutnombre.Value);
                ReportDocument Info = new ReportDocument();
                Info.Load(Server.MapPath("~/Reporte_Torniquete2.rpt"));
                Info.SetDatabaseLogon("sa", "cvt.vdp22$");
                Info.SetParameterValue(0, fi);
                Info.SetParameterValue(1, ft);
                Info.SetParameterValue(2, deptosup);
                Info.SetParameterValue(3, area);
                Info.SetParameterValue(4, rut);
                ExportOptions op = new ExportOptions();
                Response.Buffer = false;
                Response.Clear();
                // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
                Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
            }
            catch
            {
            }
        }

        protected void btn_procesar1_Click(object sender, EventArgs e)
        {
            string fi = cbofinicio0.Date.Year.ToString() + "/" + cbofinicio0.Date.Month.ToString() + "/" + cbofinicio0.Date.Day.ToString() + " 00:00:00";
            string ft = cboftermino0.Date.Year.ToString() + "/" + cboftermino0.Date.Month.ToString() + "/" + cboftermino0.Date.Day.ToString() + " 23:59:59";
            int Empresa = Convert.ToInt32(cbo_empresa.Value);
            string area = cbo_area.Value == null || cbo_area.Value == string.Empty ? "--" : cbo_area.Value.ToString();
            string rut = cbo_rutnombre.Value == null || cbo_rutnombre.Value == string.Empty ? "--" : cbo_rutnombre.Value.ToString();
            TorniqueteClass vTorniquete = new TorniqueteClass();
            DataTable dt = new DataTable();
            dt = vTorniquete.ObtieneInformeTorniquete(Empresa, cbofinicio0.Date, cboftermino0.Date, area, rut);
            GvDatos.DataSource = dt;
            //GvDatos.DataSource = LqDsInformeValorizado;
            GvDatos.DataBind();
        }

        protected void GvDatos_PageIndexChanged(object sender, EventArgs e)
        {
            string fi = cbofinicio0.Date.Year.ToString() + "/" + cbofinicio0.Date.Month.ToString() + "/" + cbofinicio0.Date.Day.ToString() + " 00:00:00";
            string ft = cboftermino0.Date.Year.ToString() + "/" + cboftermino0.Date.Month.ToString() + "/" + cboftermino0.Date.Day.ToString() + " 23:59:59";
            int Empresa = Convert.ToInt32(cbo_empresa.Value);
            string area = cbo_area.Value == null || cbo_area.Value == string.Empty ? "--" : cbo_area.Value.ToString();
            string rut = cbo_rutnombre.Value == null || cbo_rutnombre.Value == string.Empty ? "--" : cbo_rutnombre.Value.ToString();
            TorniqueteClass vTorniquete = new TorniqueteClass();
            DataTable dt = new DataTable();
            dt = vTorniquete.ObtieneInformeTorniquete(Empresa, cbofinicio0.Date, cboftermino0.Date, area, rut);
            GvDatos.DataSource = dt;
            //GvDatos.DataSource = LqDsInformeValorizado;
            GvDatos.DataBind();
        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //    this.ASPxGridViewExporter1.FileName = "Informe Torniquete "+cbofinicio0.Date.ToShortDateString()+ " - " + cboftermino0.Date.ToShortDateString();
        //    Options.SheetName = this.ASPxGridViewExporter1.FileName;
        //    this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        //}

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Informe Torniquete " + cbofinicio0.Date.ToShortDateString() + " - " + cboftermino0.Date.ToShortDateString();
            }
        }
    }
}