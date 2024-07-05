using DBMermasRecepcion;
using System;

namespace CVT_MermasRecepcion.Produccion
{
    public partial class InformeOF : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 38, "Ingreso");
            }
        }

        protected void btn_Generar_Click(object sender, EventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 38, "Boton");
            Session["LoteOF"] = "CVT000" + cbo_of.Value.ToString();
            Session["OF"] = cbo_of.Value.ToString();
            WMSClass vWMS = new WMSClass();
            SAPClass vSAP = new SAPClass();
            lbl_lote.Text = "Lote:" + Session["LoteOF"].ToString();
            lbl_bultos.Text = "Pallets:" + vWMS.ObtieneCantidadBultosLote(Session["LoteOF"].ToString()).ToString();
            //lbl_cantidad.Text = "En Stock:" + vWMS.ObtieneEnvasesStockLote(Session["LoteOF"].ToString()).ToString();
            //lbl_producido.Text = "Producido:" + vWMS.ObtieneEnvasesProducidosLote(Session["LoteOF"].ToString()).ToString();
            lbl_codproducto.Text = vSAP.ObtieneCodProductoOF(Convert.ToInt32(cbo_of.Value));
            lbl_producto.Text = "Producto:" + vSAP.ObtieneProductoOF(Convert.ToInt32(cbo_of.Value));
            // txt_cantidad.Text = vWMS.ObtienePaletizadoProducto(vSAP.ObtieneCodProductoOF(Convert.ToInt32(cbo_of.Value))).ToString();
            GvDetalle.DataBind();
            GvLineas.DataBind();
        }
    }
}