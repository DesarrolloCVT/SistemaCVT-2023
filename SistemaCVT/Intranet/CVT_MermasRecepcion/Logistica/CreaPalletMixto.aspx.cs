using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Web.UI;

namespace CVT_MermasRecepcion.Logistica
{
    public partial class CreaPalletMixto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GvDatos.DataSource = Session["Opcion"];
            lblTotal.Visible = false;
            lblVoltotal.Visible = false;


        }

        protected void btnver_Click(object sender, EventArgs e)
        {
            CargatablaDatos();
        }

        private void CargatablaDatos()
        {
            //int doc =Convert.ToInt32(Session["DocEntry"]);
            DataTable dt = new DataTable();
            LogisticaClass vLogistica = new LogisticaClass();
            int doc = Convert.ToInt32(Session["DocEntry"]);
            dt = vLogistica.SP_ListaPedidoDetalle(doc);
            GvDatos.DataSource = dt;
            Session["Opcion"] = dt;
            GvDatos.DataBind();
            GvDatos.Visible = true;
        }
        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                Session["datos"] = e.KeyValue;
                string[] a = new string[8];
                a = e.KeyValue.ToString().Split('|');
                int numpe = Convert.ToInt32(a[0]);
                Int16 linea = Convert.ToInt16(a[1]);
                string codPro = a[2];
                decimal cantidad = Convert.ToInt16(a[4]);
                int cantidadPall = Convert.ToInt32(a[5]);
                int cantidadb = 0;

                decimal pesoTotal;
                decimal volumenTotal;
                int IdContenedor;

                if (cantidad == cantidadPall)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Producto Seleccionado Ya fue Palletizado');", true);
                }
                else
                {
                    //calcular peso y volumen 
                    LogisticaClass LogC = new LogisticaClass();
                    List<VW_CVT_LOGTRANSTraePesoTotalProd2> dte = LogC.ObtienePesoVolumen(codPro);
                    foreach (var s in dte)
                    {

                        pesoTotal = s.Peso * cantidad;
                        lblTotal.Text = Convert.ToString(pesoTotal);
                        volumenTotal = Convert.ToDecimal(s.Volumen * cantidad);
                        lblVoltotal.Text = Convert.ToString(volumenTotal);
                    }

                    //inserta 
                    if (txtIdPalletizado.Text.Equals(""))
                    {
                        IdContenedor = 0;
                    }
                    else
                    {
                        IdContenedor = Convert.ToInt32(txtIdPalletizado.Text);
                    }
                    //if (txtCantBase.Text.Equals(""))
                    //{
                    //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('  debe registrar una cantidad base');", true);

                    //}
                    //else {
                    //    cantidadb = Convert.ToInt32(txtCantBase.Text);
                    //}
                    int ccontenedorCargaDet = 0;
                    Int16 tipContenedor = Convert.ToInt16(cboContenedor.Value);
                    int numpedido = numpe;
                    Int16 numlinea = linea;
                    string codigoProducto = codPro;
                    decimal cantidadPedido = cantidad - cantidadPall;
                    int cantidadbase = Convert.ToInt32(txtCantBase.Text);
                    int cantidadPallets = 1;
                    int cantidadCorrida = Convert.ToInt32(txtCorridas.Text);
                    string usoPallet = txtIndicaciones.Text;
                    string observacionEntrega = txtObsEntrega.Text;
                    int idUsuario = Convert.ToInt32(Session["IDCVTUsuario"].ToString());
                    string nombrePC = Session["CIDUsuario"].ToString();
                    string nombreUsuario = Session["NombreUsuario"].ToString();
                    string ip = "0.0.0.0";
                    int orden = 0;
                    decimal pesoT = Convert.ToDecimal(Math.Round(Convert.ToDecimal(lblTotal.Text), 2));//Math.Round(pesoTotal,2);
                    decimal volumT = Convert.ToDecimal(Math.Round(Convert.ToDecimal(lblVoltotal.Text), 2));//Math.Round(volumenTotal,2);

                    LogC.InsertaPalletMixto(IdContenedor, ccontenedorCargaDet, tipContenedor, numpedido, numlinea, codigoProducto, cantidadPedido
                                            , cantidadPallets, cantidadbase, cantidadCorrida, usoPallet, observacionEntrega, idUsuario, nombrePC, nombreUsuario, ip, pesoT, volumT);


                    int idContenedormixto = LogC.obtenerIdContenedorPalletMixto(numpe, numlinea);
                    txtIdPalletizado.Text = idContenedormixto.ToString();

                    List<CVT_ContenedorCarga> cc = LogC.ObtieneDatosContenedorCargaMixto(numpe, 2);
                    foreach (var i in cc)
                    {
                        if ((i.PesoTotalPallets / i.CantidadPallets) > 1000)
                        {
                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('ADVERTENCIA. Con la configuración actual supera los 1000 Kilos por Pallet');", true);
                            //limpiar();
                            lblPesoAproxPallet.ForeColor = Color.Red;
                        }
                        int cantPall = Convert.ToInt32(i.CantidadPallets);
                        lblCantPalletsItem.Text = Convert.ToString(cantPall);
                        lblPesoAproxPallet.Text = Convert.ToString(Convert.ToInt32(i.PesoTotalPallets) + 30);
                        lblPesoTaprox.Text = Convert.ToString(Convert.ToInt32(i.PesoTotalPallets) + 30);
                        lblVolAproxPallet.Text = Convert.ToString(Math.Round(i.VolTotalPallets, 2));

                    }

                    btnConfirmar.Visible = true;
                    btnDesarmar.Visible = true;
                    GvDatoPallMix.Visible = true;
                    DataTable Dta = new DataTable();
                    Dta = LogC.SP_ListadetPalleMix(Convert.ToInt32(txtIdPalletizado.Text));
                    GvDatoPallMix.DataSource = Dta;
                    Session["Opc"] = Dta;
                    GvDatoPallMix.DataBind();

                    CargatablaDatos();
                }
            }
        }

        protected void btnConfirmar_Click(object sender, EventArgs e)
        {
            if (txtIdPalletizado.Text.Equals(""))
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error: No Existe pallet a confirmar');", true);
            }
            else
            {
                int idPalleMix = Convert.ToInt32(txtIdPalletizado.Text);
                int idUsuario = Convert.ToInt32(Session["IDCVTUsuario"].ToString());
                string nombrePC = Session["CIDUsuario"].ToString();
                string nombreUsuario = Session["NombreUsuario"].ToString();
                string ip = "0.0.0.0";
                LogisticaClass LogC = new LogisticaClass();
                LogC.ConfirmaPalletMixto(idPalleMix, idUsuario, nombrePC, nombreUsuario, ip);
                btnDesarmar.Visible = false;
                btnConfirmar.Visible = false;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('El Pallet Mixto fué confirmado con Éxito.');", true);
            }
            limpiar();
            //Response.Redirect("/Logistica/DetallePedidoSeleccionado.aspx");
            GvDatoPallMix.Visible = false;
            GvDatos.Visible = false;

        }

        protected void GvDatoPallMix_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdQuitar")
            {
                Session["datos"] = e.KeyValue;
                string[] a = new string[8];
                a = e.KeyValue.ToString().Split('|');
                int idConte = Convert.ToInt32(a[0]);
                int idContDet = Convert.ToInt16(a[1]);
                int Orden = Convert.ToInt32(a[2]);
                //decimal cantidad = Convert.ToInt16(a[4]);
                //int cantidadPall = Convert.ToInt32(a[5]);

                int idUsuario = Convert.ToInt32(Session["IDCVTUsuario"].ToString());
                string nombrePC = Session["CIDUsuario"].ToString();
                string nombreUsuario = Session["NombreUsuario"].ToString();
                string ip = "0.0.0.0";

                LogisticaClass LogC = new LogisticaClass();
                LogC.EliminaProductoPalletMixto(idConte, idContDet, Orden, idUsuario, nombrePC, nombreUsuario, ip);

                int doc = Convert.ToInt32(Session["DocEntry"]);
                List<CVT_ContenedorCarga> cc = LogC.ObtieneDatosContenedorCargaMixto(doc, 2);
                foreach (var i in cc)
                {
                    if ((i.PesoTotalPallets / i.CantidadPallets) > 1000)
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('ADVERTENCIA. Con la configuración actual supera los 1000 Kilos por Pallet');", true);
                        //limpiar();
                        lblPesoAproxPallet.ForeColor = Color.Red;
                    }
                    int cantPall = Convert.ToInt32(i.CantidadPallets);
                    lblCantPalletsItem.Text = Convert.ToString(cantPall);
                    lblPesoAproxPallet.Text = Convert.ToString(Convert.ToInt32(i.PesoTotalPallets) + 30);
                    lblPesoTaprox.Text = Convert.ToString(Convert.ToInt32(i.PesoTotalPallets) + 30);
                    lblVolAproxPallet.Text = Convert.ToString(Math.Round(i.VolTotalPallets, 2));

                }

                DataTable Dta = new DataTable();
                Dta = LogC.SP_ListadetPalleMix(Convert.ToInt32(txtIdPalletizado.Text));
                GvDatoPallMix.DataSource = Dta;
                GvDatoPallMix.DataBind();

                CargatablaDatos();
            }
        }

        protected void btnDesarmar_Click(object sender, EventArgs e)
        {
            if (txtIdPalletizado.Text.Equals(""))
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error: No se puede desarmar pallet');", true);
            }
            else
            {
                int cont = Convert.ToInt32(txtIdPalletizado.Text);
                LogisticaClass logC = new LogisticaClass();
                List<CVT_ContenedorCarga> dt = logC.ObtieneDatosContenedorCarga(cont);
                int id = 0;
                string equipo = "";
                string usuario = "";
                string ipad = "";
                foreach (var t in dt)
                {
                    id = t.IdUsuario;
                    equipo = t.Equipo;
                    usuario = t.EqUsuario;
                    ipad = t.IpAddress;
                }

                logC.eliminaPallets(cont, id, equipo, usuario, ipad);
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Pallet se ha desarmado');", true);

                DataTable Dta = new DataTable();
                Dta = logC.SP_ListadetPalleMix(Convert.ToInt32(txtIdPalletizado.Text));
                GvDatoPallMix.DataSource = Dta;
                Session["Opc"] = Dta;
                GvDatoPallMix.DataBind();
                CargatablaDatos();

                limpiar();
                GvDatos.Visible = false;

            }
        }

        private void limpiar()
        {
            lblCantPalletsItem.Text = string.Empty;
            lblPesoAproxPallet.Text = string.Empty;
            lblPesoTaprox.Text = string.Empty;
            lblTotal.Text = string.Empty;
            lblVolAproxPallet.Text = string.Empty;
            lblVoltotal.Text = string.Empty;
            txtCantBase.Text = string.Empty;
            txtCorridas.Text = string.Empty;
            cboContenedor.SelectedIndex = -1;
            txtIdPalletizado.Text = string.Empty;
            txtIndicaciones.Text = string.Empty;
            txtObsEntrega.Text = string.Empty;
        }

        protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/Logistica/SeleccionPedidos.aspx");
        }
    }
}