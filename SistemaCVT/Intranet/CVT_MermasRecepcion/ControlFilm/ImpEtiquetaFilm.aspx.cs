using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;

namespace CVT_MermasRecepcion.ControlFilm
{
    public partial class ImpEtiquetaFilm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_imprimir_Click(object sender, EventArgs e)
        {
            int NBobina = Convert.ToInt32(txt_npallet.Text);

            ReportDocument Info = new ReportDocument();
            Info.Load(Server.MapPath("~/EtiquetaPallet_Film.rpt"));
            Info.SetDatabaseLogon("sa", "cvt.vdp22$");

            if (Convert.ToInt32(rb_tipo.Value) == 1)
            {
                Info.SetParameterValue(0, txt_npallet.Text);
                Info.SetParameterValue(1, 0);
                Info.SetParameterValue(2, 1);
            }
            if (Convert.ToInt32(rb_tipo.Value) == 2)
            {
                Info.SetParameterValue(0, "0");
                Info.SetParameterValue(1, Convert.ToInt32(txt_npallet.Text));
                Info.SetParameterValue(2, 1);
            }
            if (Convert.ToInt32(rb_tipo.Value) == 3)
            {
                Info.SetParameterValue(0, "0");
                Info.SetParameterValue(1, Convert.ToInt32(txt_npallet.Text));
                Info.SetParameterValue(2, 2);
            }
            //Info.SetParameterValue(0, NBobina);
            //ExportOptions op = new ExportOptions();
            Response.Buffer = false;
            Response.Clear();
            // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
            Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
        }
    }
}