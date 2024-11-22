using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBMermasRecepcion;

namespace CVT_MermasRecepcion.Insumos
{
    public partial class SalidaInsumos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_crear_Click(object sender, EventArgs e)
        {
            InventarioClass vInsumos = new InventarioClass();
            Session["SalidaInsumosID"] = vInsumos.CreaPreSalidaInsumo(cbo_responsable.Text.ToString(), cbo_bodega.Value.ToString(), Session["CIDUsuario"].ToString());
            GvConsumoEncabezado.DataBind();
        }

        protected void btn_agregar_Click(object sender, EventArgs e)
        {
            InventarioClass vInsumos = new InventarioClass();
            string Item = cbo_item.Value == null ? "": cbo_item.Value.ToString();
            vInsumos.AgregaDetalleSalidaInsumo(Convert.ToInt32(Session["SalidaInsumosID"]), cbo_articulo.Value.ToString(), cbo_ccosto.Value.ToString(), Item, Convert.ToDecimal(txt_cantidad.Text));
            GvConsumoInsumo.DataBind();
        }

        protected void btn_Sincronizar_Click(object sender, EventArgs e)
        {
            SAPClass vSAP = new SAPClass();
            string error = string.Empty;
            error = vSAP.CreaSalidaInsumos(Convert.ToInt32(Session["SalidaInsumosID"]), Session["CIDUsuario"].ToString());
            if (error == "0")
            {
                
                
                Session["SalidaInsumosID"] = 0;
                GvConsumoEncabezado.DataBind();
                GvConsumoInsumo.DataBind();
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Sincronizado correctamente');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + error + "');", true);
            }
        }
    }
}