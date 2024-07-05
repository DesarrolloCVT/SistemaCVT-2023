using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;

namespace CVT_MermasRecepcion.ControlFilm
{
    public partial class RepaletizadoFilm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btnGenerar.Enabled = false;
        }

        protected void txtNPallet_TextChanged(object sender, EventArgs e)
        {
            WMSClass vWMS = new WMSClass();

            ControlFilmClass cfc = new ControlFilmClass();
            List<CVT_FILM_BOBINA> dt = cfc.ObtieneInfoPalletFilm(txtNPallet.Text);
            if (dt.Count() == 0)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Pallet No Existe');", true);
                btnGenerar.Enabled = false;
                lblBodega.Text = string.Empty;
                lblCantidad.Text = string.Empty;
                lblCodProd.Text = string.Empty;
                lblProducto.Text = string.Empty;
                txtNPallet.Text = string.Empty;
                txtCantidadPaletizar.Text = string.Empty;

            }
            else
            {

                btnGenerar.Enabled = true;
                foreach (var p in dt)
                {
                    SAPClass sp = new SAPClass();


                    lblCodProd.Text = p.Producto;
                    lblProducto.Text = sp.ObtieneNombreProducto(p.Producto);
                    lblCantidad.Text = p.PesoBruto.ToString();
                    txtPesoCono.Text = p.PesoCono.ToString();
                    txtPesoNeto.Text = p.PesoNeto.ToString();
                    lblBodega.Text = vWMS.ObtieneNombreCortoSitio(Convert.ToInt32(p.IdBodega)).ToString();
                    txtCantidadPaletizar.Focus();
                }
            }
        }


        protected void btnGenerar_Click(object sender, EventArgs e)
        {

            ControlFilmClass cfc = new ControlFilmClass();

            decimal can1 = Convert.ToDecimal(lblCantidad.Text);
            decimal can2 = Convert.ToDecimal(txtCantidadPaletizar.Text);

            decimal pesoN = (can1 - can2);
            decimal cono = Convert.ToDecimal(txtPesoCono.Text);

            int IdBode= cfc.ObtieneBodegaPalletFilm(Convert.ToInt32(txtNPallet.Text));

            string us1 = cfc.TraeBodegaWMS(IdBode);
            string us2 = cfc.ObtieneBodegaUsuario(Convert.ToInt32(Session["IDCVTUsuario"]));

            int VerifProd = cfc.VerificaFilmDetProduccion(txtNPallet.Text);



                if ((lblBodega.Text.Equals("CV400") || lblBodega.Text.Equals("CV201")) && (us2.Equals("CV400") || (us2.Equals("CV201"))))
                {
                    if ((can2 < can1))
                    {
                        if (pesoN > cono)
                        {
                                //if (cfc.VerificaReservaPalletFilm(txtNPallet.Text) == 0 ||(cfc.VerificaReservaPalletFilm(txtNPallet.Text).Equals("")))
                                //{


                                    string Npallet = cfc.RepaletizaNuevoFilm(txtNPallet.Text, Convert.ToDecimal(txtCantidadPaletizar.Text), Convert.ToInt32(Session["IDCVTUsuario"]));
                                    if (cfc.VerificaFilmDetProduccion(txtNPallet.Text) != 0)
                                    {
                                        decimal peso = Convert.ToDecimal((Convert.ToDecimal(lblCantidad.Text) - Convert.ToDecimal(txtCantidadPaletizar.Text)) - Convert.ToDecimal(txtPesoCono.Text));// cfc.TraePesoNeto(Npallet);
                                                                                                                                                                                                     //cfc.ActualizaRestaCantidadFilmProduccion(Convert.ToInt32(txtNPallet.Text),peso);
                                        cfc.ActualizaPalletProducionFilm(Convert.ToInt32(txtNPallet.Text), peso);

                                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Su Nueva Bobina es: " + Npallet + "');", true);
                                        #region Limpia Componentes
                                        txtNPallet.Text = string.Empty;
                                        lblCodProd.Text = string.Empty;
                                        lblProducto.Text = string.Empty;
                                        lblCantidad.Text = string.Empty;
                                        lblBodega.Text = string.Empty;
                                        txtPesoCono.Text = string.Empty;
                                        txtCantidadPaletizar.Text = string.Empty;
                                        btnGenerar.Enabled = false;
                                        #endregion
                                    }

                                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Su Nueva Bobina es: " + Npallet + "');", true);
                                    #region Limpia Componentes
                                    txtNPallet.Text = string.Empty;
                                    lblCodProd.Text = string.Empty;
                                    lblProducto.Text = string.Empty;
                                    lblCantidad.Text = string.Empty;
                                    lblBodega.Text = string.Empty;
                                    txtPesoCono.Text = string.Empty;
                                    txtCantidadPaletizar.Text = string.Empty;
                                    btnGenerar.Enabled = false;
                                    #endregion


                                    ////////////////////////////LogClass vLog = new LogClass();
                                    ////////////////////////////vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 279, "Crea Repalletizado film");



                                //}
                                //else
                                //{
                                //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Bobina Origen posee reserva, no es posible realizar repaletizado');", true);
                                //    #region Limpia Componentes
                                //    txtNPallet.Text = string.Empty;
                                //    lblCodProd.Text = string.Empty;
                                //    lblProducto.Text = string.Empty;
                                //    lblCantidad.Text = string.Empty;
                                //    lblBodega.Text = string.Empty;
                                //    txtPesoCono.Text = string.Empty;
                                //    txtCantidadPaletizar.Text = string.Empty;
                                //    btnGenerar.Enabled = false;
                                //    #endregion
                                //}
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Peso neto es menor a peso de cono ,VERIFICAR VALORES BONINA  N°:" + txtNPallet.Text + "');", true);
                            btnGenerar.Enabled = true;
                        }

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Excede cantidad permitida');", true);
                        btnGenerar.Enabled = true;
                    }

                }
                else if (us1 == "CV300 ")
                {
                    
                    if ((can2 < can1))
                    {
                        if (pesoN > cono)
                        {
                            //if (cfc.VerificaReservaPalletFilm(txtNPallet.Text) == 0 || (cfc.VerificaReservaPalletFilm(txtNPallet.Text).Equals("")))
                            //{


                                string Npallet = cfc.RepaletizaNuevoFilm(txtNPallet.Text, Convert.ToDecimal(txtCantidadPaletizar.Text), Convert.ToInt32(Session["IDCVTUsuario"]));
                                if (cfc.VerificaFilmDetProduccion(txtNPallet.Text) != 0)
                                {
                                    decimal peso = Convert.ToDecimal((Convert.ToDecimal(lblCantidad.Text) - Convert.ToDecimal(txtCantidadPaletizar.Text)) - Convert.ToDecimal(txtPesoCono.Text));// cfc.TraePesoNeto(Npallet);
                                                                                                                                                                                                 //cfc.ActualizaRestaCantidadFilmProduccion(Convert.ToInt32(txtNPallet.Text),peso);
                                    cfc.ActualizaPalletProducionFilm(Convert.ToInt32(txtNPallet.Text), peso);

                                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Su Nueva Bobina es: " + Npallet + "');", true);
                                    #region Limpia Componentes
                                    txtNPallet.Text = string.Empty;
                                    lblCodProd.Text = string.Empty;
                                    lblProducto.Text = string.Empty;
                                    lblCantidad.Text = string.Empty;
                                    lblBodega.Text = string.Empty;
                                    txtPesoCono.Text = string.Empty;
                                    txtCantidadPaletizar.Text = string.Empty;
                                    btnGenerar.Enabled = false;
                                    #endregion
                                }


                                ////////////////////////////LogClass vLog = new LogClass();
                                ////////////////////////////vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 279, "Crea Repalletizado film");

                                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Su Nueva Bobina es: " + Npallet + "');", true);
                                #region Limpia Componentes
                                txtNPallet.Text = string.Empty;
                                lblCodProd.Text = string.Empty;
                                lblProducto.Text = string.Empty;
                                lblCantidad.Text = string.Empty;
                                lblBodega.Text = string.Empty;
                                txtPesoCono.Text = string.Empty;
                                txtCantidadPaletizar.Text = string.Empty;
                                btnGenerar.Enabled = false;
                                #endregion

                            //}
                            //else
                            //{
                            //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Bobina Origen posee reserva, no es posible realizar repaletizado');", true);
                            //    #region Limpia Componentes
                            //    txtNPallet.Text = string.Empty;
                            //    lblCodProd.Text = string.Empty;
                            //    lblProducto.Text = string.Empty;
                            //    lblCantidad.Text = string.Empty;
                            //    lblBodega.Text = string.Empty;
                            //    txtPesoCono.Text = string.Empty;
                            //    txtCantidadPaletizar.Text = string.Empty;
                            //    btnGenerar.Enabled = false;
                            //    #endregion
                            //}
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Peso neto es menor a peso de cono ,VERIFICAR VALORES BONINA  N°:" + txtNPallet.Text + "');", true);
                            btnGenerar.Enabled = true;
                        }

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Excede cantidad permitida');", true);
                        btnGenerar.Enabled = true;
                    }
                }
                else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('No puedes repaletizar en esta bodega');", true); 
                
            }
          

        }
    }
}
