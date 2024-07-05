using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBMermasRecepcion;

namespace CVT_MermasRecepcion.Merma
{
    public partial class OFEspecial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cbo_Producto_SelectedIndexChanged(object sender, EventArgs e)
        {
            SAPClass cSAP = new SAPClass();
            string CodUnidad= cSAP.ObtieneCodigoUnidad(cbo_Producto.Value.ToString());
            lbl_Unidad.Text = CodUnidad;
            lbl_NUnidad.Text = cSAP.ObtieneNombreUnidad(CodUnidad);
            lbl_cantunid.Text=cSAP.ObtieneCantidadUnidades(cbo_Producto.Value.ToString()).ToString();
        }
    }
}