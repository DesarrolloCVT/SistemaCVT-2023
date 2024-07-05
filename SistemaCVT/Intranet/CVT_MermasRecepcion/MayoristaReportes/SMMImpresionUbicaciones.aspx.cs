using DevExpress.XtraReports.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.MayoristaReportes
{
    public partial class SMMImpresionUbicaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UbicacionesSMM repor = new UbicacionesSMM();
            repor.Parameters["v_Pasillo1"].Visible = false;
            repor.Parameters["v_Pasillo2"].Visible = false;
            repor.Parameters["v_Bodega"].Visible = false;
        }

        protected void btnGenerar_Click(object sender, EventArgs e)
        {
            UbicacionesSMM repor = new UbicacionesSMM();

            repor.Parameters["v_Pasillo1"].Value = Convert.ToInt32(txtPasilloIni.Text);
            repor.Parameters["v_Pasillo2"].Value = Convert.ToInt32(txtPasilloTer.Text); ;
            repor.Parameters["v_Bodega"].Value = cboBodega.Value.ToString();
            ASPxWebDocumentViewer1.OpenReport(new CachedReportSourceWeb(repor));

            repor.Parameters["v_Pasillo1"].Visible = false;
            repor.Parameters["v_Pasillo2"].Visible = false;
            repor.Parameters["v_Bodega"].Visible = false;
        }
    }
}