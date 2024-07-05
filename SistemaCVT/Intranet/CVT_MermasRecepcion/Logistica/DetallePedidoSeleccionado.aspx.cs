using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;

namespace CVT_MermasRecepcion.Logistica
{
    public partial class DetallePedidoSeleccionado : System.Web.UI.Page
    {
        int UnidadesxPallet;
        int CantidadPallet = 0;
        int diferenciaPall;
        int pesoPall = 0;
        int altoPall;
        int anchoPall;
        int largoPall;
        string MarcaPall;
        string ColorPall;
        string MaterialPall;
        int VolumenPallet;
        decimal pesoTotal = 0;
        decimal volumenTotal = 0;
        int numDocumento;
        int numLinea;
        string codPro;
        string descProducto;
        int cantidad;
        protected void Page_Load(object sender, EventArgs e)
        {

            txtCanLibera.Visible = false;
            lbllib.Visible = false;
            lblVoltotal.Visible = false;
            lblTotal.Visible = false;
            Gvdatos.DataSource = Session["Opcion"];
        }


        protected void Gvdatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {

            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                Session["datos"] = e.KeyValue;
                string[] a = new string[8];
                a = e.KeyValue.ToString().Split('|');
                int cantidad = Convert.ToInt32(a[4]);
                int cantidadPall = Convert.ToInt32(a[5]);
                if (cantidad == cantidadPall)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Producto Seleccionado Ya fue Palletizado');", true);
                }
                else
                {
                    Pop1.ShowOnPageLoad = true;

                }
            }
        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            LogisticaClass vLogistica = new LogisticaClass();
            int doc = Convert.ToInt32(Session["DocEntry"]);
            dt = vLogistica.SP_ListaPedidoDetalle(doc);
            Gvdatos.DataSource = dt;
            Session["Opcion"] = dt;
            Gvdatos.DataBind();
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Pop1.ShowOnPageLoad = false;
            limpiar();
        }

        public void llenaCamposAdetalle()
        {
            UnidadesxPallet = Convert.ToInt32(txtCantBase.Text) * Convert.ToInt32(txtCorridas.Text);

            string[] a = new string[8];
            a = Session["datos"].ToString().Split('|');
            numDocumento = Convert.ToInt32(a[0]);
            numLinea = Convert.ToInt32(a[1]);
            codPro = a[2];
            descProducto = a[3];
            cantidad = Convert.ToInt32(a[4]) - Convert.ToInt32(a[5]);


            if (ChkForzarPallet.Checked == false)
            {

                CantidadPallet = (cantidad % UnidadesxPallet) > 0 ? (cantidad / UnidadesxPallet) + 1 : (cantidad / UnidadesxPallet);


                if (ChkLiberaPallet.Checked)
                {
                    diferenciaPall = cantidad % UnidadesxPallet;
                }
                else
                {

                    diferenciaPall = (cantidad / UnidadesxPallet) < UnidadesxPallet ? 0 : cantidad % UnidadesxPallet;
                }

                if (ChkLiberaPallet.Checked && diferenciaPall > 0)
                {
                    cantidad = cantidad - diferenciaPall;
                    CantidadPallet = CantidadPallet > 1 ? CantidadPallet - 1 : CantidadPallet;
                }
                if (CantidadPallet == 0 && (cantidad / CantidadPallet) > 0)
                {
                    CantidadPallet = CantidadPallet + 1;
                }

            }
            else
            {


                UnidadesxPallet = Convert.ToInt32(txtCantBase.Text) * Convert.ToInt32(txtCorridas.Text);
                diferenciaPall = cantidad - (UnidadesxPallet * CantidadPallet);
                cantidad = diferenciaPall > 0 ? cantidad - diferenciaPall : cantidad;
            }

            //trae datos de contenedores para calcular volumen y peso de pallets

            LogisticaClass LogC = new LogisticaClass();
            List<CVT_Contenedores> dt = LogC.ObtieneDatosContenedores(Convert.ToInt32(cboContenedor.Value));

            foreach (var t in dt)
            {
                pesoPall = Convert.ToInt32(t.Peso);
                altoPall = Convert.ToInt32(t.Alto);
                anchoPall = Convert.ToInt32(t.Ancho);
                largoPall = Convert.ToInt32(t.Largo);
                MarcaPall = t.Marca;
                ColorPall = t.Color;
                MaterialPall = t.Material;
                VolumenPallet = altoPall * anchoPall * largoPall;
            }

            List<VW_CVT_LOGTRANSTraePesoTotalProd2> dte = LogC.ObtienePesoVolumen(codPro);
            foreach (var s in dte)
            {
                pesoTotal = s.Peso * cantidad;
                volumenTotal = Convert.ToDecimal(s.Volumen * cantidad);
            }

            lblCantPalletsItem.Text = Convert.ToString(CantidadPallet);
            lblPesoTaprox.Text = Convert.ToString(Math.Round(pesoTotal + (pesoPall * CantidadPallet), 2));
            lblPesoAproxPallet.Text = Convert.ToString(Math.Round((pesoTotal / CantidadPallet) + pesoPall, 2));
            lblVolAproxPallet.Text = Convert.ToString(Math.Round(volumenTotal, 2));
            lblTotal.Text = Convert.ToString(Math.Round(pesoTotal, 2));
            lblVoltotal.Text = Convert.ToString(Math.Round(volumenTotal, 2));
            if ((pesoTotal / CantidadPallet) > 1000)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('ADVERTENCIA. Con la configuración actual supera los 1000 Kilos por Pallet');", true);
                //limpiar();
            }

            txtNPedido.Text = numDocumento.ToString();
            txtNlinea.Text = numLinea.ToString();
            txtCodProducto.Text = codPro.ToString();
            txtDescProducto.Text = descProducto.ToString();
            txtCantidadPro.Text = cantidad.ToString();
        }


        protected void txtCorridas_TextChanged(object sender, EventArgs e)
        {
            llenaCamposAdetalle();
        }
        protected void limpiar()
        {
            cboContenedor.SelectedIndex = -1;
            txtCantBase.Text = string.Empty;
            txtCorridas.Text = string.Empty;
            txtIndicaciones.Text = string.Empty;
            txtObsEntrega.Text = string.Empty;
            ChkLiberaPallet.Checked = false;
            ChkForzarPallet.Checked = false;
            lbllib.Visible = false;
            txtCanLibera.Text = string.Empty;
            txtCanLibera.Visible = false;
            lblCantPalletsItem.Text = string.Empty;
            lblPesoTaprox.Text = string.Empty;
            lblPesoAproxPallet.Text = string.Empty;
            lblVolAproxPallet.Text = string.Empty;
            txtNPedido.Text = string.Empty;
            txtNlinea.Text = string.Empty;
            txtCodProducto.Text = string.Empty;
            txtDescProducto.Text = string.Empty;
            txtCantidadPro.Text = string.Empty;
            UnidadesxPallet = 0;
            CantidadPallet = 0;
            diferenciaPall = 0;
            pesoPall = 0;
            altoPall = 0;
            anchoPall = 0;
            largoPall = 0;
            MarcaPall = string.Empty;
            ColorPall = string.Empty;
            MaterialPall = string.Empty;
            VolumenPallet = 0;
            pesoTotal = 0;
            volumenTotal = 0;
            numDocumento = 0;
            numLinea = 0;
            codPro = string.Empty;
            descProducto = string.Empty;
            cantidad = 0;
        }


        protected void txtCanLibera_TextChanged(object sender, EventArgs e)
        {
            CantidadPallet = Convert.ToInt32(txtCanLibera.Text);

            if (CantidadPallet == 0)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Cantidad de Pallets No Puede ser Cero');", true);
            }
            else
            {
                //UnidadesxPallet = Convert.ToInt32(txtCantBase.Text) * Convert.ToInt32(txtCorridas.Text);
                //diferenciaPall = cantidad - (UnidadesxPallet * CantidadPallet);
                //cantidad = diferenciaPall > 0 ? cantidad - diferenciaPall : cantidad;
                llenaCamposAdetalle();
            }

        }

        protected void ChkForzarPallet_CheckedChanged(object sender, EventArgs e)
        {
            if (ChkForzarPallet.Checked == true)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Ingrese la Cantidad de Pallets que necesita configurar, Forzar la Cantidad de Pallets');", true);
                txtCanLibera.Visible = true;
                lbllib.Visible = true;
            }
            else
            {
                txtCanLibera.Visible = false;
                lbllib.Visible = false;
            }
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            int IdContenedor = 0;
            Int16 tipContenedor = Convert.ToInt16(cboContenedor.Value);
            int numpedido = Convert.ToInt32(txtNPedido.Text);
            Int16 numlinea = Convert.ToInt16(txtNlinea.Text);
            string codigoProducto = txtCodProducto.Text;
            int cantidadPedido = Convert.ToInt32(txtCantidadPro.Text);
            int cantidadPallets = Convert.ToInt32(lblCantPalletsItem.Text);
            int cantidadBase = Convert.ToInt32(txtCantBase.Text);
            int cantidadCorrida = Convert.ToInt32(txtCorridas.Text);
            decimal pesoT = Convert.ToDecimal(lblTotal.Text);//Math.Round(pesoTotal,2);
            decimal volumT = Convert.ToDecimal(lblVoltotal.Text);//Math.Round(volumenTotal,2);
            string usoPallet = txtIndicaciones.Text;
            string observacionEntrega = txtObsEntrega.Text;
            int idUsuario = Convert.ToInt32(Session["IDCVTUsuario"].ToString());
            string nombrePC = Session["CIDUsuario"].ToString();
            string nombreUsuario = Session["NombreUsuario"].ToString();
            string ip = "0.0.0.0";
            int IndLlamadoArmaCont = 0;

            LogisticaClass logCl = new LogisticaClass();
            logCl.SP_insertaContenedorCarga(IdContenedor, tipContenedor, numpedido, numlinea, codigoProducto, cantidadPedido, cantidadPallets,
                                             cantidadBase, cantidadCorrida, pesoT, volumT, usoPallet, observacionEntrega, idUsuario, nombrePC, nombreUsuario, ip, IndLlamadoArmaCont);


            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Pallet ha sido confirmado');", true);

            DataTable dt = new DataTable();
            int doc = Convert.ToInt32(Session["DocEntry"]);
            dt = logCl.SP_ListaPedidoDetalle(doc);
            Gvdatos.DataSource = dt;
            Session["Opcion"] = dt;
            Gvdatos.DataBind();
            Pop1.ShowOnPageLoad = false;
            limpiar();

        }

        protected void GvPedido_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {

            if (e.CommandArgs.CommandName == "cmdDetallePalletizado")
            {
                Session["DocEntry"] = e.KeyValue;
                Response.Redirect("/Logistica/PalletPedido.aspx");
            }
            if (e.CommandArgs.CommandName == "cmdOrden")
            {


            }
        }

        protected void btnMixto_Click(object sender, EventArgs e)
        {
            Session["Doc"] = Session["DocEntry"];
            Response.Redirect("/Logistica/CreaPalletMixto.aspx");
        }

        protected void ChkLiberaPallet_CheckedChanged(object sender, EventArgs e)
        {
            llenaCamposAdetalle();
        }

        protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/Logistica/SeleccionPedidos.aspx");
        }
    }
}


