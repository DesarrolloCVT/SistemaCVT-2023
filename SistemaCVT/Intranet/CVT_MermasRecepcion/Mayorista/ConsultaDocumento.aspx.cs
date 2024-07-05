using DBMermasRecepcion;
using DevExpress.Export;
using DevExpress.XtraPrinting;
using System;
using System.Data;
using System.Web.UI;

namespace CVT_MermasRecepcion.Mayorista
{
    public partial class ConsultaDocumento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack)
            {
                cargaGrid();
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            cargaGrid();

        }

        private void cargaGrid()
        {
            MMetroClass VLogis = new MMetroClass();
            DataTable dt = new DataTable();
            dt = VLogis.SP_ConsultaDocumento(Convert.ToInt32(rbtTipoDoc.Value), Convert.ToInt32(txtNumdoc.Text));
            GvDatos.DataSource = dt;
            GvDatos.DataBind();
        }

        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {
            string tip = "";
            switch (Convert.ToInt32(rbtTipoDoc.Value))
            {
                case 1:
                    tip = "Consulta Documentos OC COMPRA";
                    break;
                case 2:
                    tip = "Consulta Documentos FACT COMPRA";
                    break;
                case 3:
                    tip = "Consulta Documentos BOLETA VENTA";
                    break;
                case 4:
                    tip = "Consulta Documentos FACTURA VENTA";
                    break;
                default:
                    tip = "Consulta Documentos";
                    break;
            }
            GvDatos.ExportXlsxToResponse(tip, new XlsxExportOptionsEx { ExportType = ExportType.Default });
        }
    }
}