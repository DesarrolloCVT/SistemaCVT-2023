using DBMermasRecepcion;
using System;

namespace CVT_MermasRecepcion.Inventario
{
    public partial class Toma_Inventario1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 63, "Ingreso");
            }
        }
        protected void btn_agregar_Click(object sender, EventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 63, "Boton");
            InventarioClass vInventario = new InventarioClass();
            if (vInventario.ValidaNPallet(Convert.ToInt32(txt_pallet.Text)) != 0)
            {
                if (vInventario.ValidaCodProducto(txt_producto.Text) != 0)
                {
                    if (vInventario.ValidaLote(txt_lote.Text) != 0)
                    {
                        if (vInventario.ValidaUbicacion(Convert.ToInt32(txt_ubicacion.Text)) != 0)
                        {


                            try
                            {
                                CVT_DetalleInventario vNuevo = new CVT_DetalleInventario();
                                vNuevo.Inventario_Id = 1;
                                vNuevo.NPallet = Convert.ToInt32(txt_pallet.Text);
                                vNuevo.CodProducto = txt_producto.Text;
                                vNuevo.Lote = txt_lote.Text;
                                vNuevo.Cantidad = Convert.ToInt32(txt_cantidad.Text);
                                vNuevo.Ubicacion = Convert.ToInt32(txt_ubicacion.Text);
                                vNuevo.Usuario = Session["CIDUsuario"].ToString();
                                vNuevo.FechaRegistro = DateTime.Now;
                                InventarioClass vInv = new InventarioClass();
                                vInv.InsertaRegistroInventario(vNuevo);
                                txt_pallet.Text = string.Empty;
                                txt_producto.Text = string.Empty;
                                txt_lote.Text = string.Empty;
                                txt_cantidad.Text = string.Empty;
                                txt_pallet.Focus();
                                lbl_error.Visible = false;
                            }
                            catch
                            {
                            }
                        }
                        else
                        {
                            txt_ubicacion.Focus();
                            lbl_error.Text = "Ubicacion no existe";
                            lbl_error.Visible = true;
                        }
                    }
                    else
                    {
                        txt_lote.Focus();
                        lbl_error.Text = "Lote no existe";
                        lbl_error.Visible = true;
                    }
                }
                else
                {
                    txt_producto.Focus();
                    lbl_error.Text = "Cod. Producto no existe";
                    lbl_error.Visible = true;
                }
            }
            else
            {
                txt_pallet.Focus();
                lbl_error.Text = "N Pallet no existe";
                lbl_error.Visible = true;
            }
        }



        protected void txt_pallet_TextChanged1(object sender, EventArgs e)
        {
            try
            {
                InventarioClass vInventario = new InventarioClass();
                if (vInventario.ValidaNPallet(Convert.ToInt32(txt_pallet.Text)) == 0)
                {
                    txt_pallet.Focus();
                    lbl_error.Text = "N Pallet no existe";
                    lbl_error.Visible = true;
                }
                else
                {
                    txt_producto.Focus();
                    lbl_error.Visible = false;
                }
            }
            catch
            {
            }
        }

        protected void txt_producto_TextChanged1(object sender, EventArgs e)
        {
            try
            {
                InventarioClass vInventario = new InventarioClass();
                if (vInventario.ValidaCodProducto(txt_producto.Text) == 0)
                {
                    txt_producto.Focus();
                    lbl_error.Text = "Cod. Producto no existe";
                    lbl_error.Visible = true;
                }
                else
                {
                    txt_lote.Focus();
                    lbl_error.Visible = false;
                }
            }
            catch
            {
            }
        }

        protected void txt_lote_TextChanged1(object sender, EventArgs e)
        {
            try
            {
                InventarioClass vInventario = new InventarioClass();
                if (vInventario.ValidaLote(txt_lote.Text) == 0)
                {
                    txt_lote.Focus();
                    lbl_error.Text = "Lote no existe";
                    lbl_error.Visible = true;
                }
                else
                {
                    txt_cantidad.Focus();
                    lbl_error.Visible = false;
                }
            }
            catch
            {
            }

        }

        protected void txt_ubicacion_TextChanged1(object sender, EventArgs e)
        {
            try
            {
                InventarioClass vInventario = new InventarioClass();
                if (vInventario.ValidaUbicacion(Convert.ToInt32(txt_ubicacion.Text)) == 0)
                {
                    txt_ubicacion.Focus();
                    lbl_error.Text = "Ubicacion no existe";
                    lbl_error.Visible = true;
                }
                else
                {
                    btn_agregar.Focus();
                    lbl_error.Visible = false;
                }
            }
            catch
            {
            }
        }
    }
}