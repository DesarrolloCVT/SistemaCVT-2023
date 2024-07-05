using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.MayoristaOP
{
    public partial class SMMOrdenVentas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ASPxRoundPanel2.Collapsed = true;
        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {

            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                Session["IdOrden"] = e.KeyValue;
                Response.Redirect("~/MayoristaOP/SMMOrdenVentasDetalle.aspx");
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            CVTWMSMetroClass mt = new CVTWMSMetroClass();
            SMM_Orden_de_Ventas or = new SMM_Orden_de_Ventas();

            or.Cliente = CboCliente.Value.ToString();
            or.FechaEntrega = dteFechaEntrega.Date;
            or.Dir_Despacho = cboDirDespacho.Value.ToString();
            or.Dir_Facturacion = cboDirFac.Value.ToString();
            mt.AgregaOrdenVenta(or);
            PopNuevo.ShowOnPageLoad = false;
            GvDatos.DataBind();

            CboCliente.SelectedIndex = -1;
            cboDirDespacho.SelectedIndex = -1;
            cboDirFac.SelectedIndex = -1;
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (e.Item.Name.Equals("Nuevo"))
            {
                PopNuevo.ShowOnPageLoad = true;

            }
        }

        protected void btnGuardarCliente_Click(object sender, EventArgs e)
        {
            CVTWMSMetroClass mt = new CVTWMSMetroClass();
            SMM_Clientes_Orden_Venta or = new SMM_Clientes_Orden_Venta();

            string rev = mt.VerificaClinte(txtRutCli.Text.ToString());

            if (rev.Equals(""))
            {               

                or.RutCliente ='C'+txtRutCli.Text;
                or.NombreCliente = txtNomCli.Text;
                or.RazonSocial = txtRazon.Text;
                or.Giro = txtGiro.Text;
                or.DirecFact = txtDirFacturacion.Text;
                or.DirecDesp = txtDirDespacho.Text;
                or.Telefono = txtTelefono.Text;
                or.Correo = txtCorreo.Text;
                or.Estado = 1;

                bool ret = mt.RegistraCliente(or);

                if (ret == true)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registrado');", true);

                    txtRutCli.Text = string.Empty;
                    txtRazon.Text = string.Empty;
                    txtGiro.Text = string.Empty;
                    txtDirFacturacion.Text = string.Empty;
                    txtDirDespacho.Text = string.Empty;
                    txtTelefono.Text = string.Empty;
                    txtCorreo.Text = string.Empty;

                }
                else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al Registrar');", true); }
            }
            else {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Cliente ya se encuentra Registrado');", true);
            }
        }
    }
}