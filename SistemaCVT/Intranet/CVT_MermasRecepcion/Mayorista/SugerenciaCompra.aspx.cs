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

namespace CVT_MermasRecepcion.Mayorista
{
    public partial class SugerenciaCompra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargaDatos();
        }

        protected void btnInforme_Click(object sender, EventArgs e)
        {
            //string codprod = Convert.ToString(e.KeyValue);
            ReportDocument Info = new ReportDocument();
            Info.Load(Server.MapPath("~/SMMSugerenciaCompras.rpt"));
            Info.SetDatabaseLogon("sa", "cvt.vdp22$");
            Info.SetParameterValue(0, 1);
            ExportOptions op = new ExportOptions();
            Response.Buffer = false;
            Response.Clear();
            // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
            Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
        }

        private void CargaDatos()
        {
            MMetroClass mMetro = new MMetroClass();
            DataTable dt = new DataTable();
            dt = mMetro.SP_SugerenciaPrecios();
            GvDatos.DataSource = dt;
            GvDatos.DataBind();

            Session["datos"] = dt;
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Sugerencia Compras -" + DateTime.Now;
            }
        }
    }
}