using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;

namespace CVT_MermasRecepcion.MayoristaOP
{
    public partial class SMMImpresionEtiquetas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_imprimir_Click(object sender, EventArgs e)
        {

            ReportDocument Info = new ReportDocument();
            Info.Load(Server.MapPath("/EtiquetaPallet_SMM.rpt"));
            Info.SetDatabaseLogon("sa", "cvt.vdp22$");
            if (Convert.ToInt32(rb_tipo.Value) == 1)
            {
                Info.SetParameterValue(0, txtNumero.Text);
                Info.SetParameterValue(1, 0);
                Info.SetParameterValue(2, 1);

            }
            if (Convert.ToInt32(rb_tipo.Value) == 2)
            {
                Info.SetParameterValue(0, "0");
                Info.SetParameterValue(1, Convert.ToInt32(txtNumero.Text));
                Info.SetParameterValue(2, 1);

            }
            if (Convert.ToInt32(rb_tipo.Value) == 3)
            {
                Info.SetParameterValue(0, "0");
                Info.SetParameterValue(1, Convert.ToInt32(txtNumero.Text));
                Info.SetParameterValue(2, 2);


            }
            if (Convert.ToInt32(rb_tipo.Value) == 4)
            {
                Info.SetParameterValue(0, "0");
                Info.SetParameterValue(1, Convert.ToInt32(txtNumero.Text));
                Info.SetParameterValue(2, 3);
            }

            Response.Buffer = false;
            Response.Clear();

            Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
        }
    }
}