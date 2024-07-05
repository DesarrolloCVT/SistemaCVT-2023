using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;

namespace CVT_MermasRecepcion.MayoristaOP
{
    public partial class SMMRepaletizado : System.Web.UI.Page
    {    
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_destino.Visible = false;
            txt_destino.Visible = false;
            txt_cantidad.Enabled = false;
            lbl_compatible.Visible = false;
            lbl_error0.Visible = false;
            btnGenerar.Enabled = false;

        }

        protected void txtPalletOrigen_TextChanged(object sender, EventArgs e)
        {
            CVTWMSMetroClass smmWms = new CVTWMSMetroClass();
            SAPSMM sp = new SAPSMM();

            if (txtPalletOrigen.Text.Equals(""))
            {
                lbl_error.Visible = true;
            }
            else
            {

                List<SMM_Package> ls = smmWms.ObtieneDatosDelBultoSMM(Convert.ToInt32(txtPalletOrigen.Text));

                if (ls.Count == 0)
                {
                    lbl_error.Visible = true;
                    //btn_generar.Enabled = false;
                    lbl_cantidad.Text = string.Empty;
                    lbl_codproducto.Text = string.Empty;
                    lbl_producto.Text = string.Empty;
                    lbl_lote.Text = string.Empty;
                }
                else
                {
                    lbl_error.Visible = false;
                    //btn_generar.Enabled = true;

                    foreach (var t in ls)
                    {
                        int estadoR= smmWms.obtieneEstadoRecepcion(Convert.ToInt32(t.Reception_Id));

                        if (estadoR == 2 || t.Reception_Id == 0)
                        {
                            lbl_codproducto.Text = t.ItemCode.ToString();
                            lbl_producto.Text =sp.ObtieneNombreProducto(t.ItemCode).ToString(); 
                            

                            int idSite = smmWms.ObtieneSiteLayoutSMM(t.Layout_Id);
                            string vBodega = smmWms.ObtieneNombreCortoSitioSMM(idSite);

                            lblUnidadMedida.Text = t.UomCode;
                            lblBodega.Text = vBodega;
                            lbl_lote.Text = t.Package_Lot;
                            lbl_cantidad.Text = t.Package_Quantity.ToString();
                            Session["fExp1"]= Convert.ToDateTime(t.Package_ExpiresDate);
                            
                        }
                        else {

                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Pallet en Recepcion no confirmada favor Verificar');", true);
                        }


                    }

                }
            }

        }

        protected void chk_tipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt32(chk_tipo.Value) == 1)
            {
                lbl_destino.Visible = true;
                txt_destino.Visible = true;
                txt_destino.Text = string.Empty;
                txt_destino.Focus();
                txt_cantidad.Text = string.Empty;
            }
            else
            {
                lbl_destino.Visible = false;
                txt_destino.Visible = false;
                txt_cantidad.Enabled = true;
                dvDat.Visible = false;
                txt_cantidad.Focus();
            }
        }

        protected void txt_destino_TextChanged(object sender, EventArgs e)
        {
            CVTWMSMetroClass smmWms = new CVTWMSMetroClass();
            SAPSMM sp = new SAPSMM();

            if (txt_destino.Text.Equals(""))
            {
                lbl_error0.Visible = true;
                lbl_destino.Visible = true;
                txt_destino.Visible = true;

            }
            else
            {
                List<SMM_Package> ls = smmWms.ObtieneDatosDelBultoSMM(Convert.ToInt32(txt_destino.Text));
                if (ls.Count() == 0)
                {
                    lbl_error0.Visible = true;
                    lbl_destino.Visible = true;
                    txt_destino.Visible = true;

                }
                else
                {
                    lbl_error0.Visible = false;
                    dvDat.Visible = true;
                    lbl_destino.Visible = true;
                    txt_destino.Visible = true;

                    foreach (var p in ls)
                    {
                        lbl_dcodproducto.Text = p.ItemCode;
                        lbl_dproducto.Text = sp.ObtieneNombreProducto(p.ItemCode).ToString();

                        int idSite = smmWms.ObtieneSiteLayoutSMM(p.Layout_Id);
                        string vBodega = smmWms.ObtieneNombreCortoSitioSMM(idSite);

                        lbl_dBodega.Text = vBodega;
                        lbl_dlote.Text = p.Package_Lot;
                        lbl_dcantidad.Text = p.Package_Quantity.ToString();
                        lbldUnidadMedida.Text = p.UomCode;
                        Session["fexp2"]= Convert.ToDateTime(p.Package_ExpiresDate);                    
                    }
                    if (txtPalletOrigen.Text != txt_destino.Text)
                    {

                        if (lblBodega.Text != lbl_dBodega.Text)
                        {

                            lbl_compatible.Visible = true;
                            lbl_compatible.ForeColor = System.Drawing.Color.Red;
                            lbl_compatible.Text = "NO COMPATIBLE : Pallet en bodega diferente o N° de pallet son identicos ";
                            lbl_destino.Visible = true;
                            txt_destino.Visible = true;
                        }
                        else if (lbl_dcodproducto.Text != lbl_codproducto.Text)
                        { 
                            lbl_compatible.Visible = true;
                            lbl_compatible.ForeColor = System.Drawing.Color.Red;
                            lbl_compatible.Text = "NO COMPATIBLE : Codigo de productos Diferentes";
                            lbl_destino.Visible = true;
                            txt_destino.Visible = true;

                        }
                        else if(lblUnidadMedida.Text!=lbldUnidadMedida.Text)
                        {

                            lbl_compatible.Visible = true;
                            lbl_compatible.ForeColor = System.Drawing.Color.Red;
                            lbl_compatible.Text = "NO COMPATIBLE : Unidades de medida diferentes";
                            lbl_destino.Visible = true;
                            txt_destino.Visible = true;
                        }
                        else
                        {

                            lbl_compatible.Visible = true;
                            lbl_compatible.ForeColor = System.Drawing.Color.Green;
                            lbl_compatible.Text = "COMPATIBLE";
                            txt_cantidad.Enabled = true;
                            lbl_destino.Visible = true;
                            txt_destino.Visible = true;
                            txt_cantidad.Focus();
                            //lbl_compatible.Visible = true;
                            //lbl_compatible.ForeColor = System.Drawing.Color.Red;
                            //lbl_compatible.Text = "NO COMPATIBLE : Pallet en bodega diferente o N° de pallet son identicos ";
                            //lbl_destino.Visible = true;
                            //txt_destino.Visible = true;
                        }

                    }
                    else
                    {
                        lbl_compatible.Visible = true;
                        lbl_compatible.ForeColor = System.Drawing.Color.Red;
                        lbl_compatible.Text = "NO COMPATIBLE : Pallet en bodega diferente o N° de pallet son identicos ";
                        lbl_destino.Visible = true;
                        txt_destino.Visible = true;
                    }
                }
            }

        }

        protected void txt_cantidad_TextChanged(object sender, EventArgs e)
        {
            if (txt_cantidad.Text == "" || txt_cantidad.Text == "0")
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Ingrese una Cantidad');", true);
                txt_cantidad.Enabled = true;
                btnGenerar.Enabled = false;
                txt_cantidad.Focus();
            }
            else
            {
                txt_cantidad.Enabled = true;
                btnGenerar.Enabled = true;
            }

        }

        protected void btnGenerar_Click(object sender, EventArgs e)
        {
            decimal C1 = Convert.ToDecimal(lbl_cantidad.Text);
            decimal C2 = Convert.ToDecimal(txt_cantidad.Text);

            DateTime fExpira;
            DateTime _exp1 =Convert.ToDateTime(Session["fExp1"]);
            DateTime _exp2=Convert.ToDateTime(Session["fexp2"]);
            if ( _exp1 >= _exp2 )
            {

                fExpira = _exp2;

            }
            else { fExpira = _exp1; }

            //if

            try
            {
                CVTWMSMetroClass smmWms = new CVTWMSMetroClass();

                if (Convert.ToInt32(chk_tipo.Value) == 1)
                {
                    if (smmWms.VerificaReservaPalletSMM(txtPalletOrigen.Text) == 0)
                    {
                        if (smmWms.VerificaReservaPalletSMM(txt_destino.Text) == 0)
                        {
                            if (smmWms.RepaletizaConDestinoSMM(txtPalletOrigen.Text.Trim(), txt_destino.Text.Trim(), Convert.ToDecimal(txt_cantidad.Text), Convert.ToInt32(Session["IDCVTUsuario"]), fExpira))
                            {
                                #region Limpia Componentes
                                txtPalletOrigen.Text = string.Empty;
                                lbl_codproducto.Text = string.Empty;
                                lbl_producto.Text = string.Empty;
                                lbl_lote.Text = string.Empty;
                                lbl_cantidad.Text = string.Empty;
                                txt_destino.Text = string.Empty;
                                lbl_dcodproducto.Visible = false;
                                lbl_dcodproducto.Text = string.Empty;
                                lbl_dproducto.Visible = false;
                                lbl_dproducto.Text = string.Empty;
                                lbl_dlote.Visible = false;
                                lbl_dlote.Text = string.Empty;
                                lbl_dcantidad.Visible = false;
                                lbl_dcantidad.Text = string.Empty;
                                //txt_cantidad.Visible=false;
                                txt_cantidad.Text = string.Empty;
                                lbl_cantrepaletizar.Visible = false;
                                lbl_compatible.Visible = false;
                                dvDat.Visible = false;
                                btnGenerar.Enabled = false;
                                txtPalletOrigen.Focus();
                                #endregion
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Pallet destino posee reserva, no es posible realizar repaletizado');", true);
                        }
                    }
                    else
                    {

                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Pallet origen posee reserva, no es posible realizar repaletizado');", true);
                    }
                }
                else
                {
                    try
                    {
                        if (C2 < C1)
                        {
                            if (smmWms.VerificaReservaPalletSMM(txtPalletOrigen.Text) == 0)
                            {
                                string Npallet = smmWms.RepaletizaNuevo(txtPalletOrigen.Text, Convert.ToDecimal(txt_cantidad.Text), Convert.ToInt32(Session["IDCVTUsuario"]));
                                //LogClass vLog = new LogClass();
                                //vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 20, "Crea Repalletizado");
                                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Su Nuevo Pallet es: " + Npallet + "');", true);
                                #region Limpia Componentes
                                txtPalletOrigen.Text = string.Empty;
                                lbl_codproducto.Text = string.Empty;
                                lbl_producto.Text = string.Empty;
                                lbl_lote.Text = string.Empty;
                                lbl_cantidad.Text = string.Empty;
                                txt_destino.Text = string.Empty;
                                lbl_dcodproducto.Visible = false;
                                lbl_dcodproducto.Text = string.Empty;
                                lbl_dproducto.Visible = false;
                                lbl_dproducto.Text = string.Empty;
                                lbl_dlote.Visible = false;
                                lbl_dlote.Text = string.Empty;
                                lbl_dcantidad.Visible = false;
                                lbl_dcantidad.Text = string.Empty;
                                txt_cantidad.Visible=false;
                                txt_cantidad.Text = string.Empty;
                                lbl_cantrepaletizar.Visible = false;
                                lbl_compatible.Visible = false;
                                btnGenerar.Enabled = false;
                                txtPalletOrigen.Focus();
                                #endregion
                            }
                            else {
                                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Pallet origen posee reserva, no es posible realizar repaletizado');", true);
                            }

                        }
                        else { }
                    }
                    catch { }
                }


            }
            catch
            {
            }
        }
    }
}