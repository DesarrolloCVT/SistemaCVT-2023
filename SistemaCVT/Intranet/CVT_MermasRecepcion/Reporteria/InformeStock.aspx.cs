using DBMermasRecepcion;
using System;
using System.Data;

namespace CVT_MermasRecepcion.Reporteria
{
    public partial class InformeStock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {


                GvDatosInfStock.DataSource = Session["datosInfStock"];
                GvDatosInfStock.DataBind();
            }
        }

        protected void btn_Generar_Click(object sender, EventArgs e)
        {


            string codproducto = cbo_producto.Value != null ? cbo_producto.Value.ToString() : "";
            string lote = txt_lote.Text;
            int sitioid = Convert.ToInt32(cbo_bodega.Value);
            WMSClass vSMM = new WMSClass();
            DataTable dt = new DataTable();
            dt = vSMM.SP_InformeStock(sitioid, codproducto, lote);
            GvDatosInfStock.DataSource = dt;
            Session["datosInfStock"] = dt;
            GvDatosInfStock.DataBind();
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatosInfStock.SettingsExport.FileName = "Informe Stock " + DateTime.Now.ToShortDateString();
            }
        }
    }
}