using DevExpress.XtraReports.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.MayoristaReportes
{
    public partial class SMMImpresionEtiquetaFacturaOrden : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            EtiquetaFactura repor = new EtiquetaFactura();
            repor.Parameters["v_NFactura"].Visible = false;        
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            EtiquetaFactura repor = new EtiquetaFactura();

            repor.Parameters["v_NFactura"].Value = Convert.ToInt32(txtNFactura.Text);          
            ASPxWebDocumentViewer1.OpenReport(new CachedReportSourceWeb(repor));

            repor.Parameters["v_NFactura"].Visible = false;           
        }
    }
}