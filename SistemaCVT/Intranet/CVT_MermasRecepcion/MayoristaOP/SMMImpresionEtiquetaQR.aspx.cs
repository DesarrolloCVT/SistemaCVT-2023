using CVT_MermasRecepcion.MayoristaReportes;
using DevExpress.XtraReports.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.MayoristaOP
{
    public partial class SMMImpresionEtiquetaQR : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SMMEtiquetaQR report = new SMMEtiquetaQR();
            report.Parameters["v_NumPallet"].Visible = false;
            report.Parameters["v_NumRecep"].Visible = false;
            report.Parameters["v_Origen"].Visible = false;
        }

        protected void btn_imprimir_Click(object sender, EventArgs e)
        {
            SMMEtiquetaQR report = new SMMEtiquetaQR();
            //report.ShowPrintStatusDialog = false;           

            if (Convert.ToInt32(rb_tipo.Value) == 1)
            {
                report.Parameters["v_NumPallet"].Value = Convert.ToInt32(txtNumero.Text);
                report.Parameters["v_NumRecep"].Value = 0;
                report.Parameters["v_Origen"].Value = 1;
                ASPxWebDocumentViewer1.OpenReport(new CachedReportSourceWeb(report));

                report.Parameters["v_NumPallet"].Visible = false;
                report.Parameters["v_NumRecep"].Visible = false;
                report.Parameters["v_Origen"].Visible = false;
            }
            if (Convert.ToInt32(rb_tipo.Value) == 2)
            {
                report.Parameters["v_NumPallet"].Value = 0;
                report.Parameters["v_NumRecep"].Value = Convert.ToInt32(txtNumero.Text);
                report.Parameters["v_Origen"].Value = 1;
                ASPxWebDocumentViewer1.OpenReport(new CachedReportSourceWeb(report));

                report.Parameters["v_NumPallet"].Visible = false;
                report.Parameters["v_NumRecep"].Visible = false;
                report.Parameters["v_Origen"].Visible = false;
            }
            if (Convert.ToInt32(rb_tipo.Value) == 3)
            {
                report.Parameters["v_NumPallet"].Value = 0;
                report.Parameters["v_NumRecep"].Value = Convert.ToInt32(txtNumero.Text);
                report.Parameters["v_Origen"].Value = 2;
                ASPxWebDocumentViewer1.OpenReport(new CachedReportSourceWeb(report));

                report.Parameters["v_NumPallet"].Visible = false;
                report.Parameters["Num_Recep"].Visible = false;
                report.Parameters["v_Origen"].Visible = false;

            }
            if (Convert.ToInt32(rb_tipo.Value) == 4)
            {
                report.Parameters["v_NumPallet"].Value = 0;
                report.Parameters["v_NumRecep"].Value = Convert.ToInt32(txtNumero.Text);
                report.Parameters["v_Origen"].Value = 3;
                ASPxWebDocumentViewer1.OpenReport(new CachedReportSourceWeb(report));

                report.Parameters["v_NumPallet"].Visible = false;
                report.Parameters["v_NumRecep"].Visible = false;
                report.Parameters["v_Origen"].Visible = false;

            }
        }
    }
}