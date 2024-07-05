using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.MayoristaOP
{
    public partial class SMMOrdenVentasDetalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Cargados();     
        }

        protected void cmdVolver_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/MayoristaOP/SMMOrdenVentas.aspx");
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "orden de Ventas";
            }
            if (e.Item.Name.Equals("Nuevo"))
            {
                PopNuevo.ShowOnPageLoad = true;

            }
        }

        private void Cargados()
        {
            CVTWMSMetroClass mme = new CVTWMSMetroClass();
            DataTable dt = mme.SP_OrdenTotales(Convert.ToInt32(Session["IdOrden"]));
            foreach (DataRow t in dt.Rows)
            {
               txtSubtotal.Text= t["Subtotal"].ToString();
                txtImpto.Text = t["Impto"].ToString();
                txtTotal.Text = t["Total"].ToString();
            }
        }


            protected void btnGuardar_Click(object sender, EventArgs e)
        {

            string codProd = Convert.ToString(cboProducto.Value);

            SAPSMM sp = new SAPSMM();
            CVTWMSMetroClass mt = new CVTWMSMetroClass();

            List<VW_SMM_PRODUCTOS_ORDEN_DE_VENTAS> ls = sp.ListaProductosOrdenVenta(codProd);

            foreach (var t in ls)
            {
                SMM_Orden_de_Ventas_Detalle or = new SMM_Orden_de_Ventas_Detalle();

                or.IdOrdenVentas = Convert.ToInt32(Session["IdOrden"]);
                or.CodProducto = codProd;
                or.Upc = t.UnxCaja;
                or.Familia = t.Familia;
                or.PrecioVenta = t.Precio;
              // //or.Margen = t.Margen;
                or.Stock = t.Stock;
                or.Contribucion = t.Contribucion;
                or.Cantidad = Convert.ToInt32(txtCantidad.Text);
                or.Porc_Descuento =txtPorcDesc.Text.Equals(string.Empty)?0:Convert.ToInt32(txtPorcDesc.Text);
                or.PrecioPromedio = t.CostoPromedio;
                mt.AgregaProdOrdenVenta(or);
                PopNuevo.ShowOnPageLoad = false;
                GvDatos.DataBind();            
                cboProducto.SelectedIndex = -1;
                txtCantidad.Text = string.Empty;
                txtPorcDesc.Text = string.Empty;
            }
        }      
    }
}