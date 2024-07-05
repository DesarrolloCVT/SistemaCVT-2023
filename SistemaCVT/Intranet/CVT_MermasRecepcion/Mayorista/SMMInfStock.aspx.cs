using System;
using DBMermasRecepcion;
using System.Data;

namespace CVT_MermasRecepcion.Mayorista
{
    public partial class SMMInfStock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string codproducto = cbo_producto.Value != null ? cbo_producto.Value.ToString() : "";
                string lote = txt_lote.Text;
                int sitioid = Convert.ToInt32(cbo_bodega.Value);
                SMMInventarioClass vSMM = new SMMInventarioClass();
                DataTable dt = new DataTable();
                dt = vSMM.SP_StockSMM(sitioid, codproducto, lote);
                GvDatos.DataSource = dt;
                GvDatos.DataBind();
                GvDatos.DataBind();
            }
        }

        protected void btn_Generar_Click(object sender, EventArgs e)
        {
            string codproducto = cbo_producto.Value != null ? cbo_producto.Value.ToString() : "";
            string lote = txt_lote.Text;
            int sitioid = Convert.ToInt32(cbo_bodega.Value);
            SMMInventarioClass vSMM = new SMMInventarioClass();
            DataTable dt = new DataTable();
            dt = vSMM.SP_StockSMM(sitioid, codproducto, lote);
            GvDatos.DataSource = dt;
            GvDatos.DataBind();
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "informe Stock" + DateTime.Now;
            }
        }
    }
}