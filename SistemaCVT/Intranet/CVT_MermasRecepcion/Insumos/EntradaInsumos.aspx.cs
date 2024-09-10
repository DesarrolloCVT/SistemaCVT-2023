using System;
using DBMermasRecepcion;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Insumos
{
    public partial class EntradaInsumos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_BuscarOC_Click(object sender, EventArgs e)
        {
            GvDatosOCSAP.DataBind();
        }

        protected void btn_recepcionar_Click(object sender, EventArgs e)
        {
            InventarioClass vInsumos = new InventarioClass();
            Session["EntradaInsumosID"]=vInsumos.CreaPreEntradaOC(Convert.ToInt32(txt_docnumOC.Text), cbo_Bodega.Value.ToString(), Session["CIDUsuario"].ToString()); 
            GvRecepOCEnc.DataBind();
            GvRecepOC.DataBind();
        }

        protected void btn_Grabar_Click(object sender, EventArgs e)
        {
            SAPClass vSAP = new SAPClass();
            string error=string.Empty;
            error=vSAP.CreaEntradaOCInsumos(Convert.ToInt32(Session["EntradaInsumosID"]), Session["CIDUsuario"].ToString());
            if (error == "0")
            {
                txt_docnumOC.Text=string.Empty;
                GvDatosOCSAP.DataBind();
                Session["EntradaInsumosID"] = 0;
                GvRecepOCEnc.DataBind();
                GvRecepOC.DataBind();
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Sincronizado correctamente');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('"+error+"');", true);
            }

        }
    }
}