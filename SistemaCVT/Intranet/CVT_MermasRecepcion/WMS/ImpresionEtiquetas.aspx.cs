using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using DBMermasRecepcion;
using System;

namespace CVT_MermasRecepcion.WMS
{
    public partial class ImpresionEtiquetas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_imprimir_Click(object sender, EventArgs e)
        {
            WMSClass vWMS = new WMSClass();
            LogClass vLog = new LogClass();
            int usuario = vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString());
            ReportDocument Info = new ReportDocument();
            Info.Load(Server.MapPath("/EtiquetaPallet_Vertical.rpt"));
            Info.SetDatabaseLogon("sa", "cvt.vdp22$");
            if (Convert.ToInt32(rb_tipo.Value) == 1)
            {
                Info.SetParameterValue(0, txt_npallet.Text);
                Info.SetParameterValue(1, 0);
                Info.SetParameterValue(2, 1);
                vLog.InsertaRegistroImpresion(usuario, Convert.ToInt32(txt_npallet.Text), 1);
            }
            if (Convert.ToInt32(rb_tipo.Value) == 2)
            {
                Info.SetParameterValue(0, "0");
                Info.SetParameterValue(1, Convert.ToInt32(txt_npallet.Text));
                Info.SetParameterValue(2, 1);
                vLog.InsertaRegistroImpresion(usuario, Convert.ToInt32(txt_npallet.Text), 2);
            }
            if (Convert.ToInt32(rb_tipo.Value) == 3)
            {
                Info.SetParameterValue(0, "0");
                Info.SetParameterValue(1, Convert.ToInt32(txt_npallet.Text));
                Info.SetParameterValue(2, 2);
                vLog.InsertaRegistroImpresion(usuario, Convert.ToInt32(txt_npallet.Text), 3);


                //int ntranf = Convert.ToInt32(txt_npallet.Text);
                //ReportDocument Info1 = new ReportDocument();
                //Info1.Load(Server.MapPath("~/EtiquetaPallet_Transferencias.rpt"));
                //Info1.SetDatabaseLogon("sa", "cvt");
                //Info1.SetParameterValue(0, ntranf);
                //ExportOptions op = new ExportOptions();
                //Response.Buffer = false;
                //Response.Clear();
                //// Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
                //Info1.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
            }
            if (Convert.ToInt32(rb_tipo.Value) == 4)
            {
                Info.SetParameterValue(0, "0");
                Info.SetParameterValue(1, Convert.ToInt32(txt_npallet.Text));
                Info.SetParameterValue(2, 3);
                vLog.InsertaRegistroImpresion(usuario, Convert.ToInt32(txt_npallet.Text), 4);
            }


            Response.Buffer = false;
            Response.Clear();

            Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");

        }
    }
}