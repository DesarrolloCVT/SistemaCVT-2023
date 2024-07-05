using DBMermasRecepcion;
using System;
using System.Data;
using System.Web.UI;

namespace CVT_MermasRecepcion.Inventario
{
    public partial class AuditoriaLotesWMS : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                GvDatos.DataSource = Session["Datos"];

            }
        }

        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {
            DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
            this.ASPxGridViewExporter1.FileName = "Auditoria Lotes WMS";
            this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            WMSClass vWMS = new WMSClass();
            DataTable dt = new DataTable();

            string coPro = cbo_producto.Value.ToString();
            string lote = txt_lote.Text;
            dt = vWMS.SP_TrazabilidadProdLote(coPro, lote);
            GvDatos.DataSource = dt;
            Session["Datos"] = dt;
            GvDatos.DataBind();

        }
    }
}