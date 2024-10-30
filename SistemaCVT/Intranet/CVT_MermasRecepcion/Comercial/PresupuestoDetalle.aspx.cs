using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Comercial
{
    public partial class PresupuestoDetalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                ComercialClass vComercial = new ComercialClass();
                if (cbo_Tipo.Value == "0")
                {
                    vComercial.SP_CargaProductoPresupuesto(Convert.ToInt32(Session["PresupuestoID"]), cbo_Cliente.Value.ToString(), cbo_Cliente.Text, Convert.ToInt32(cbo_Tipo.Value));
                    gv_presupuestoDet.DataSource = LqDsPresupuestoDetalle;
                }
                else
                {
                    vComercial.SP_CargaProductoPresupuesto(Convert.ToInt32(Session["PresupuestoID"]), cbo_Canal.Value.ToString(), cbo_Canal.Text, Convert.ToInt32(cbo_Tipo.Value));
                    gv_presupuestoDet.DataSource = LqDsPresupuestoDetalleCanal;
                }

                gv_presupuestoDet.DataBind();
            }
        }

        protected void btn_Buscar_Click(object sender, EventArgs e)
        {
            ComercialClass vComercial = new ComercialClass();
            if (cbo_Tipo.Value == "0")
            {
                vComercial.SP_CargaProductoPresupuesto(Convert.ToInt32(Session["PresupuestoID"]), cbo_Cliente.Value.ToString(), cbo_Cliente.Text,Convert.ToInt32(cbo_Tipo.Value));
                gv_presupuestoDet.DataSource = LqDsPresupuestoDetalle;
            }
            else
            {
                vComercial.SP_CargaProductoPresupuesto(Convert.ToInt32(Session["PresupuestoID"]), cbo_Canal.Value.ToString(), cbo_Canal.Text, Convert.ToInt32(cbo_Tipo.Value));
                gv_presupuestoDet.DataSource = LqDsPresupuestoDetalleCanal;
            }
            
            gv_presupuestoDet.DataBind();

        }
    }
}