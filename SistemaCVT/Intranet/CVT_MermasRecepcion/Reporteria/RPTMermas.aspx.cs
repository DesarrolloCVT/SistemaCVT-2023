using DBMermasRecepcion;
using System;
using System.Data;
using System.Web.UI;

namespace CVT_MermasRecepcion.Reporteria
{
    public partial class RPTMermas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GvDatos.DataSource = Session["_DT"];
            if (!IsPostBack)
            {
                //DateTime fi = new DateTime(DateTime.Now.Year, DateTime.Now.Month, 1);
                //cb_fini.Date = fi;
                //DateTime ft = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);
                //cb_ffin.Date = ft;
            }

        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            try
            {
                string proveedor = cb_proveedor.Value == null ? "" : cb_proveedor.Value.ToString();
                int Grupo = cb_gproducto.Value == null ? 0 : Convert.ToInt32(cb_gproducto.Value);
                string producto = cb_producto.Value == null ? "" : cb_producto.Value.ToString();
                int indfecha = ch_frecep.Checked == true ? 1 : 0;
                string guia = txt_guia.Text;
                string factura = txt_factura.Text;
                int oc = txt_oc.Text == string.Empty ? 0 : Convert.ToInt32(txt_oc.Text);
                DateTime fi = cb_fini.Date.ToShortDateString() == "01/01/0001" ? new DateTime(1900, 1, 1) : cb_fini.Date;
                DateTime ft = cb_ffin.Date.ToShortDateString() == "01/01/0001" ? new DateTime(1900, 1, 1) : cb_ffin.Date;
                int recsap = txt_recsap.Text == string.Empty ? 0 : Convert.ToInt32(txt_recsap.Text);
                int recwms = txt_recwms.Text == string.Empty ? 0 : Convert.ToInt32(txt_recwms.Text);
                string lote = txt_lote.Text;
                if (proveedor == "" && Grupo == 0 && producto == "" && indfecha == 0 && guia == "" && factura == "" && oc == 0 && recsap == 0 && recwms == 0 && lote == "")
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Debe Ingresar al Menos un Criterio de Busqueda');", true);
                }
                else
                {
                    MermasClass vMerma = new MermasClass();
                    DataTable dt = new DataTable();
                    dt = vMerma.InformeMermas(oc, proveedor, producto, lote, Grupo, recwms, recsap, indfecha, fi, ft, factura, guia);
                    Session["_DT"] = dt;
                    GvDatos.DataSource = Session["_DT"];
                    GvDatos.DataBind();
                }
            }
            catch
            {
            }
        }

        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {
            DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
            this.GridExporter.FileName = "Informe Mermas";
            Options.SheetName = this.GridExporter.FileName;
            this.GridExporter.WriteXlsToResponse(Options);
        }


    }
}