using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Calidad
{
    public partial class CreacionFumigacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGenerar_Click(object sender, EventArgs e)
        {

            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 219, "Crea Registro");

            string prov = txtProveedor.Text.ToUpper();
            string produc = txtProdTratar.Text.ToUpper();
            string lote = txtLote.Text.ToUpper();
            int kilos = Convert.ToInt32(txtKilos.Text);
            int horas = Convert.ToInt32(txtTiempoExpo.Text);
            int concentracion = Convert.ToInt32(txtConcentracion.Text);
            DateTime fini = dteInicio.Date;
            DateTime fter = dteTermno.Date;


            if (!System.IO.File.Exists(@"\\BIGEL\\certificados fumigacion\\" + lote + ".pdf"))

            {

                ReportDocument Info = new ReportDocument();
                Info.Load(Server.MapPath("~/CertificadoFumigacion.rpt"));
                Info.SetDatabaseLogon("sa", "cvt.vdp22$");
                Info.SetParameterValue(0, prov);
                Info.SetParameterValue(1, produc);
                Info.SetParameterValue(2, lote);
                Info.SetParameterValue(3, kilos);
                Info.SetParameterValue(4, horas);
                Info.SetParameterValue(5, concentracion);
                Info.SetParameterValue(6, fini);
                Info.SetParameterValue(7, fter);
                ExportOptions op = new ExportOptions();
                Response.Buffer = false;
                Response.Clear();
                Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"\\BIGEL\\certificados fumigacion\\" + lote + ".pdf");
                Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "CertificadoFumigacion.pdf");

            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Certificado Lote: " + lote + "  ya se encuentra creado');", true);
            }





        }
    }
}