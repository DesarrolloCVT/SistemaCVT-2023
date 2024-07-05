using DBMermasRecepcion;
using DevExpress.XtraPrinting;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Mayorista
{
    public partial class PrecioCompra : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblProd.Visible = false;
            cboProducto.Visible = false;
            lblProNoReg.Visible = false;
            txtProdNoReg.Visible = false;

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            MMetroClass mcls = new MMetroClass();
            MMetro_UltimoPrecioCompra upc = new MMetro_UltimoPrecioCompra();
            MMetro_LogUltimoPrecioCompra log = new MMetro_LogUltimoPrecioCompra();

            if (Convert.ToInt32(rbtProd.Value) == 1)
            {

                upc.ItemCode = Convert.ToString(cboProducto.Value);
                upc.UltimoPrecioCompra = Convert.ToInt32(txtPrecio.Text);
                upc.Competencia = txtCompetencia.Text;
                upc.Porcentaje = txtPorcentaje.Text == string.Empty ? 0 : Convert.ToDecimal(txtPorcentaje.Text);
                upc.FechaUltimoRegistro = DateTime.Now;
                upc.Proveedor = txtProveedor.Text;
                bool inserta = mcls.InsertaNuevoPrecioCompra(upc);
                int idregistro = upc.id_RegistroPrecio;


                if (inserta == true)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('SE HAN REGISTRADO LOS DATOS');", true);
                    log.id_RegistroPrecio = idregistro;
                    log.Precio = Convert.ToInt32(txtPrecio.Text);
                    log.FechaRegistro = DateTime.Now;
                    log.Producto = Convert.ToString(cboProducto.Value);
                    mcls.InsertaNuevoLogPrecioCompra(log);

                    cboProducto.SelectedIndex = -1;
                    txtPrecio.Text = string.Empty;
                    txtPorcentaje.Text = string.Empty;
                    txtCompetencia.Text = string.Empty;
                    GvDatos.DataBind();
                    GvDatosHistorial.DataBind();
                    popNuevo.ShowOnPageLoad = false;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al registrar Contactar con Administrador');", true);
                    cboProducto.SelectedIndex = -1;
                    txtPrecio.Text = string.Empty;
                    txtPorcentaje.Text = string.Empty;
                    txtCompetencia.Text = string.Empty;
                    GvDatos.DataBind();
                    GvDatosHistorial.DataBind();
                    popNuevo.ShowOnPageLoad = false;
                }
            }
            if (Convert.ToInt32(rbtProd.Value) == 2)
            {
                upc.UltimoPrecioCompra = Convert.ToInt32(txtPrecio.Text);
                upc.ProductoNoRegistrado = txtProdNoReg.Text;
                upc.Competencia = txtCompetencia.Text;
                upc.Porcentaje = txtPorcentaje.Text == string.Empty ? 0 : Convert.ToDecimal(txtPorcentaje.Text);
                upc.FechaUltimoRegistro = DateTime.Now;
                upc.Proveedor = txtProveedor.Text;
                bool inserta = mcls.InsertaNuevoPrecioCompra(upc);
                int id_Reg = upc.id_RegistroPrecio;
                if (inserta == true)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('SE HAN REGISTRADO LOS DATOS');", true);
                    log.id_RegistroPrecio = id_Reg;
                    log.Precio = Convert.ToInt32(txtPrecio.Text);
                    log.Producto = txtProdNoReg.Text;
                    log.FechaRegistro = DateTime.Now;
                    mcls.InsertaNuevoLogPrecioCompra(log);

                    cboProducto.SelectedIndex = -1;
                    txtPrecio.Text = string.Empty;
                    txtPorcentaje.Text = string.Empty;
                    txtProdNoReg.Text = string.Empty;
                    txtCompetencia.Text = string.Empty;
                    GvDatos.DataBind();
                    GvDatosHistorial.DataBind();
                    popNuevo.ShowOnPageLoad = false;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al registrar Contactar con Administrador');", true);
                    cboProducto.SelectedIndex = -1;
                    txtPrecio.Text = string.Empty;
                    txtPorcentaje.Text = string.Empty;
                    txtProdNoReg.Text = string.Empty;
                    txtCompetencia.Text = string.Empty;
                    GvDatos.DataBind();
                    GvDatosHistorial.DataBind();
                    popNuevo.ShowOnPageLoad = false;
                }
            }




        }

        protected void GvDatos_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            int codProd = Convert.ToInt32(e.Keys["id_RegistroPrecio"]);
            int precio = Convert.ToInt32(e.NewValues["UltimoPrecioCompra"]);
            MMetroClass mcls = new MMetroClass();
            MMetro_LogUltimoPrecioCompra log = new MMetro_LogUltimoPrecioCompra();
            string prod = mcls.ObtieneProductoPrecioCompra(codProd);

            if (prod != null)
            {
                log.id_RegistroPrecio = codProd;
                log.Producto = prod;
                log.Precio = precio;
                log.FechaRegistro = DateTime.Now;
                mcls.InsertaNuevoLogPrecioCompra(log);
                GvDatos.DataBind();

            }
            if (prod == null)
            {
                string ProdNoReg = mcls.ObtieneProductoPrecioCompraNoregistrado(codProd);
                log.id_RegistroPrecio = codProd;
                log.Producto = ProdNoReg;
                log.Precio = precio;
                log.FechaRegistro = DateTime.Now;
                mcls.InsertaNuevoLogPrecioCompra(log);
                GvDatos.DataBind();
            }


            //terminar update con id re registro 
        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            Session["id_RegistroPrecio"] = e.KeyValue;
            popLog.ShowOnPageLoad = true;
            GvDatosHistorial.DataBind();

        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {

            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Ultimo Precio Compra";
            }
            if (e.Item.Name.Equals("Nuevo"))
            {
                popNuevo.ShowOnPageLoad = true;
            }
        }

        protected void GvDatosHistorial_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatosHistorial.SettingsExport.FileName = "Ultimo Precio Compra Historial";
            }
        }

        protected void rbtProd_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt32(rbtProd.Value) == 1)
            {
                lblProd.Visible = true;
                cboProducto.Visible = true;

                lblProNoReg.Visible = false;
                txtProdNoReg.Visible = false;
            }
            if (Convert.ToInt32(rbtProd.Value) == 2)
            {

                lblProd.Visible = false;
                cboProducto.Visible = false;

                lblProNoReg.Visible = true;
                txtProdNoReg.Visible = true;
            }


        }
    }
}