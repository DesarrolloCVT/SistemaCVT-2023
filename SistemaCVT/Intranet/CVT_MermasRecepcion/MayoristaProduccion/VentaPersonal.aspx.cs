


using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.MayoristaProduccion
{
    public partial class VentaPersonal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            divPickear.Visible = false;
        }

        protected void btnSelecionar_Click(object sender, EventArgs e)
        {


            VentaPersonalClass vp = new VentaPersonalClass();

            List<VW_LIST_CLIENTE_INTERNO> lt = vp.ListaclienteInterno(Convert.ToString(cboCliente.Value));

            if (lt.Count != 0)
            {
                foreach (var t in lt)
                {
                    txtCodCliente.Text = t.CodCliente;
                    txtNombreCliente.Text = t.NomCliente;
                    txtRunCli.Text = t.Run;
                    txtTelefono.Text = t.Telefono;
                    txtCreditoDisponible.Text = Convert.ToString(Convert.ToInt32(t.Saldo));
                    txtCreditoAsignado.Text = Convert.ToString(Convert.ToInt32(t.Credito));

                }
            }
            else
            {

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Cliente No Encontrado');", true);
            }

            cboCliente.SelectedIndex = -1;
        }

        protected void GvDatos_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            if (Convert.ToInt32(e.NewValues["Descuento"]) > 5)
            {
                e.Cancel = true;
            }
            GvDatos.DataBind();
        }

        protected void GvDatos_RowDeleted(object sender, DevExpress.Web.Data.ASPxDataDeletedEventArgs e)
        {

            GvDatos.DataBind();
        }

        protected void btnPickear_Click(object sender, EventArgs e)
        {
            int Disponible = Convert.ToInt32(txtCreditoDisponible.Text);

            if (Disponible > 0)
            {
                try
                {
                    VentaPersonalClass vp = new VentaPersonalClass();
                    SMM_VentaPersonal p = new SMM_VentaPersonal();

                    p.CodCliente = txtCodCliente.Text;
                    p.NombreCliente = txtNombreCliente.Text;
                    p.RunCliente = txtRunCli.Text;
                    p.Telefono = txtTelefono.Text;
                    p.FechaCompra = DateTime.Now;
                    p.MesCompra = DateTime.Now.Month;
                    p.DiaCompra = DateTime.Now.Day;
                    p.IdUsuario = Convert.ToInt32(Session["IDCVTUsuario"]);

                    Session["IdVentaP"] = vp.InsertaCabVentaPersonal(p);

                    btnPickear.Enabled = false;
                    txtDun.Focus();
                    divPickear.Visible = true;
                }
                catch (Exception ex)
                {

                    string err = ex.Message;
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al Registrar'('" + err + "'));", true);
                    btnPickear.Enabled = true;
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('No tienes Saldo Disponible, Favor verificar');", true);
            }


        }

        protected void btnAnular_Click(object sender, EventArgs e)
        {
            popAnulaPreventa.ShowOnPageLoad = true;
        }

        protected void btnSiAnula_Click(object sender, EventArgs e)
        {
            int IdVent = Convert.ToInt32(Session["IdVentaP"]);
            VentaPersonalClass vp = new VentaPersonalClass();

            int resB = vp.EliminaProductosVentaPer(IdVent);

            if (resB != 0)
            {
                int resC = vp.EliminaVentaP(IdVent);

                if (resC != 0)
                {
                    txtCodCliente.Text = string.Empty;
                    txtNombreCliente.Text = string.Empty;
                    txtRunCli.Text = string.Empty;
                    txtTelefono.Text = string.Empty;
                    txtCreditoAsignado.Text = string.Empty;
                    txtCreditoDisponible.Text = string.Empty;

                    btnPickear.Enabled = false;
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Anulado !');", true);
                    divPickear.Visible = false;
                    popAnulaPreventa.ShowOnPageLoad = false;
                }
            }
        }

        protected void btnNoAnula_Click(object sender, EventArgs e)
        {
            popAnulaPreventa.ShowOnPageLoad = false;
        }

        protected void txtDun_TextChanged(object sender, EventArgs e)
        {
            VentaPersonalClass vp = new VentaPersonalClass();
          
            SMM_VentaPersonal_Detalle pr = new SMM_VentaPersonal_Detalle();

            List<SMM_VW_DATO_BUSCAPROD_VENTAPERSONAL> lt = vp.ConsultaProductoVentaPersonal(txtDun.Text);
            int nOrden = vp.TraeNOrdenPrevPers(Convert.ToInt32(Session["IdPreventa"]));

            if (lt.Count != 0)
            {
                foreach (var t in lt)
                {
                    int cod = vp.validaProdRegistradoVentaPer(t.ItemCode, Convert.ToInt32(Session["IdPreventa"]), t.UomCode);


                    if (cod == 0)
                    {
                        pr.Id_Venta = Convert.ToInt32(Session["IdVentaP"]);
                        pr.Cod_Producto = t.ItemCode;
                        pr.UniMedida = t.UomCode;
                        pr.Producto = t.ItemName;
                        pr.Cantidad = 1;
                        pr.Precio = t.Price;
                        pr.CodBarra = t.BcdCode;
                        pr.CodUniMed = t.UomEntry;
                        pr.ByOrder = nOrden + 1;


                        vp.InsertaVentaPerDetalle(pr);
                        divPickear.Visible = true;
                        txtDun.Text = string.Empty;
                        txtDun.Focus();
                    }
                    else
                    {
                        vp.ActualizaCantidadVentaPer(Convert.ToInt32(Session["IdVentaP"]), t.ItemCode, 1, t.UomCode);
                        divPickear.Visible = true;
                        txtDun.Text = string.Empty;
                        txtDun.Focus();


                    }

                }

            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Codigo de producto no existe!');", true);
                divPickear.Visible = true;
                txtDun.Text = string.Empty;
                txtDun.Focus();
            }
        }

        protected void btnAgregaProdSinDun_Click(object sender, EventArgs e)
        {

            divPickear.Visible = true;

            VentaPersonalClass vp = new VentaPersonalClass();
            SMM_VentaPersonal_Detalle pr = new SMM_VentaPersonal_Detalle();

            string[] co = new string[2];
            string cP = "";

            if (cboProductosinDun.Value.ToString() == null)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Codigo de producto no existe!');", true);
            }
            else
            {
                cP = cboProductosinDun.Value.ToString();

            }

            co = cP.Split(';');

            string coPro = co[0].ToString();
            string uMed = co[1].ToString().Trim();


            List<SMM_VW_DATO_BUSCAPROD_VENTAPERSONAL> lt = vp.BusquedaProductoSinDun(coPro, uMed);


            int cod = vp.validaProdRegistradoVentaPer(coPro, Convert.ToInt32(Session["IdVentaP"]), uMed);
            int nOrden = vp.TraeNOrdenPrevPers(Convert.ToInt32(Session["IdVentaP"]));


            if (cod == 0)
            {
                foreach (var t in lt)
                {
                    pr.Id_Venta = Convert.ToInt32(Session["IdVentaP"]);
                    pr.Cod_Producto = t.ItemCode;
                    pr.Producto = t.ItemName;
                    pr.Cantidad = 1;
                    pr.Precio = t.Price;
                    pr.CodBarra = t.BcdCode;
                    pr.UniMedida = t.UomCode;
                    pr.CodUniMed = t.UomEntry;
                    pr.ByOrder = nOrden + 1;


                    vp.InsertaVentaPerDetalle(pr);
                    divPickear.Visible = true;
                    txtDun.Text = string.Empty;
                    cboProductosinDun.SelectedIndex = -1;
                    //cboProductosinDun.Text = string.Empty;
                    txtDun.Focus();


                }

            }
            else
            {
                foreach (var t in lt)
                {

                    vp.ActualizaCantidadVentaPer(Convert.ToInt32(Session["IdVentaP"]), t.ItemCode, 1, uMed);
                    divPickear.Visible = true;
                    txtDun.Text = string.Empty;
                    cboProductosinDun.SelectedIndex = -1;
                    //cboProductosinDun.Text = string.Empty;
                    txtDun.Focus();
                }
            }
        }

        protected void btnCrear_Click(object sender, EventArgs e)
        {
            VentaPersonalClass vp = new VentaPersonalClass();

            int totaVen =Convert.ToInt32(vp.TraeTotalVenta(Convert.ToString(Session["IdVentaP"])));

            if(totaVen <= Convert.ToInt32(txtCreditoDisponible.Text))
            {

                txtCodCliente.Text = string.Empty;
                txtNombreCliente.Text = string.Empty;
                txtRunCli.Text = string.Empty;
                txtTelefono.Text = string.Empty;
                txtCreditoAsignado.Text = string.Empty;
                txtCreditoDisponible.Text = string.Empty;

                btnPickear.Enabled = false;             
                divPickear.Visible = false;

            }
            else {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Supera monto disponible favor verificar!');", true);
                divPickear.Visible = true;
            }

        }
    }
}