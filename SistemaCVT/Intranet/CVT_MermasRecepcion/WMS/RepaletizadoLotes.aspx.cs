using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;

namespace CVT_MermasRecepcion.WMS
{
    public partial class RepaletizadoLotes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txt_origen_TextChanged(object sender, EventArgs e)
        {
            WMSClass vWMS = new WMSClass();
            List<Package> dt = vWMS.ObtieneInfoPallet(txt_origen.Text);
            if (dt.Count() == 0)
            {
                lbl_error.Visible = true;
                btn_generar.Enabled = false;
                lbl_cantidad.Text = string.Empty;
                lbl_codproducto.Text = string.Empty;
                lbl_producto.Text = string.Empty;
                lbl_lote.Text = string.Empty;
            }
            else
            {
                lbl_error.Visible = false;
                btn_generar.Enabled = true;
                foreach (var p in dt)
                {
                    int TipoBloq = Convert.ToInt32(p.ID_TipoBloqueo);
                    int Bloq = Convert.ToInt32(p.Package_QualityStatus);

                    if (Bloq == 2 && TipoBloq == 6)
                    {
                        List<ArticleProvider> ap = vWMS.ObtieneInfoProducto(p.ArticleProvider_Id);
                        foreach (var a in ap)
                        {
                            lbl_codproducto.Text = a.ArticleProvider_CodClient;
                            lbl_producto.Text = a.ArticleProvider_Description;
                        }
                        int idSite = vWMS.ObtieneSiteLayout(p.Layout_Id);
                        string vBodega = vWMS.ObtieneNombreCortoSitio(idSite);

                        lblBodega.Text = vBodega;
                        lbl_lote.Text = p.Package_Lot;
                        lbl_cantidad.Text = p.Package_Quantity.ToString();

                    }
                    else if (Bloq == 2)
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert(' Pallet Bloqueado,no es posible realizar repaletizado');", true);
                    }
                    else
                    {
                        List<ArticleProvider> ap = vWMS.ObtieneInfoProducto(p.ArticleProvider_Id);
                        foreach (var a in ap)
                        {
                            lbl_codproducto.Text = a.ArticleProvider_CodClient;
                            lbl_producto.Text = a.ArticleProvider_Description;
                        }
                        int idSite = vWMS.ObtieneSiteLayout(p.Layout_Id);
                        string vBodega = vWMS.ObtieneNombreCortoSitio(idSite);

                        lblBodega.Text = vBodega;
                        lbl_lote.Text = p.Package_Lot;
                        lbl_cantidad.Text = p.Package_Quantity.ToString();
                    }

                }
            }
        }

        protected void txt_destino_TextChanged(object sender, EventArgs e)
        {
            txt_destino.ClientVisible = true;
            lbl_destino.ClientVisible = true;
            ASPxLabel9.Visible = true;
            ASPxLabel10.Visible = true;
            ASPxLabel11.Visible = true;
            ASPxLabel12.Visible = true;
            lbl_dcantidad.Visible = true;
            lbl_dcodproducto.Visible = true;
            lbl_dlote.Visible = true;
            lbl_dproducto.Visible = true;
            lbldBod.Visible = true;
            lbl_dBodega.Visible = true;
            WMSClass vWMS = new WMSClass();
            List<Package> dt = vWMS.ObtieneInfoPallet(txt_destino.Text);



            if (dt.Count() == 0)
            {
                lbl_error0.Visible = true;
                lbl_compatible.Visible = false;
                btn_generar.Enabled = false;
                lbl_dcantidad.Text = string.Empty;
                lbl_dcodproducto.Text = string.Empty;
                lbl_dproducto.Text = string.Empty;
                lbl_dlote.Text = string.Empty;
                lbl_dBodega.Text = string.Empty;

            }
            else
            {
                lbl_error0.Visible = false;
                foreach (var p in dt)
                {
                    int TipoBloq = Convert.ToInt32(p.ID_TipoBloqueo);
                    int Bloq = Convert.ToInt32(p.Package_QualityStatus);

                    if (Bloq == 2 && TipoBloq == 6)
                    {
                        List<ArticleProvider> ap = vWMS.ObtieneInfoProducto(p.ArticleProvider_Id);
                        foreach (var a in ap)
                        {
                            lbl_dcodproducto.Text = a.ArticleProvider_CodClient;
                            lbl_dproducto.Text = a.ArticleProvider_Description;
                        }
                        int idSite = vWMS.ObtieneSiteLayout(p.Layout_Id);
                        string vBodega = vWMS.ObtieneNombreCortoSitio(idSite);

                        lbl_dBodega.Text = vBodega;
                        lbl_dlote.Text = p.Package_Lot;
                        lbl_dcantidad.Text = p.Package_Quantity.ToString();

                        if (txt_origen.Text != txt_destino.Text)
                        {

                            if (lblBodega.Text != lbl_dBodega.Text)
                            {

                                lbl_compatible.Visible = true;
                                lbl_compatible.ForeColor = System.Drawing.Color.Red;
                                lbl_compatible.Text = "NO COMPATIBLE : Pallet en bodega diferente o N° de pallet son identicos ";
                                btn_generar.Enabled = false;
                            }
                            else if (lbl_dcodproducto.Text == lbl_codproducto.Text && lbl_dlote.Text == lbl_lote.Text)
                            {
                                lbl_compatible.Visible = true;
                                lbl_compatible.ForeColor = System.Drawing.Color.Green;
                                lbl_compatible.Text = "COMPATIBLE";
                                btn_generar.Enabled = true;
                            }
                            else
                            {
                                lbl_compatible.Visible = true;
                                lbl_compatible.ForeColor = System.Drawing.Color.Red;
                                lbl_compatible.Text = "NO COMPATIBLE : Pallet en bodega diferente o N° de pallet son identicos ";
                                btn_generar.Enabled = false;
                            }

                        }
                        else
                        {
                            lbl_compatible.Visible = true;
                            lbl_compatible.ForeColor = System.Drawing.Color.Red;
                            lbl_compatible.Text = "NO COMPATIBLE : Pallet en bodega diferente o N° de pallet son identicos ";
                            btn_generar.Enabled = false;
                        }

                    }
                    else if (Bloq == 2)
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert(' Pallet Bloqueado,no es posible realizar repaletizado');", true);
                    }
                    else
                    {
                        List<ArticleProvider> ap = vWMS.ObtieneInfoProducto(p.ArticleProvider_Id);
                        foreach (var a in ap)
                        {
                            lbl_dcodproducto.Text = a.ArticleProvider_CodClient;
                            lbl_dproducto.Text = a.ArticleProvider_Description;
                        }
                        int idSite = vWMS.ObtieneSiteLayout(p.Layout_Id);
                        string vBodega = vWMS.ObtieneNombreCortoSitio(idSite);

                        lbl_dBodega.Text = vBodega;
                        lbl_dlote.Text = p.Package_Lot;
                        lbl_dcantidad.Text = p.Package_Quantity.ToString();

                        if (txt_origen.Text != txt_destino.Text)
                        {

                            if (lblBodega.Text != lbl_dBodega.Text)
                            {

                                lbl_compatible.Visible = true;
                                lbl_compatible.ForeColor = System.Drawing.Color.Red;
                                lbl_compatible.Text = "NO COMPATIBLE : Pallet en bodega diferente o N° de pallet son identicos ";
                                btn_generar.Enabled = false;
                            }
                            else if (lbl_dcodproducto.Text == lbl_codproducto.Text && lbl_dlote.Text == lbl_lote.Text)
                            {
                                lbl_compatible.Visible = true;
                                lbl_compatible.ForeColor = System.Drawing.Color.Green;
                                lbl_compatible.Text = "COMPATIBLE";
                                btn_generar.Enabled = true;
                            }
                            else
                            {
                                lbl_compatible.Visible = true;
                                lbl_compatible.ForeColor = System.Drawing.Color.Red;
                                lbl_compatible.Text = "NO COMPATIBLE : Pallet en bodega diferente o N° de pallet son identicos ";
                                btn_generar.Enabled = false;
                            }

                        }
                        else
                        {
                            lbl_compatible.Visible = true;
                            lbl_compatible.ForeColor = System.Drawing.Color.Red;
                            lbl_compatible.Text = "NO COMPATIBLE : Pallet en bodega diferente o N° de pallet son identicos ";
                            btn_generar.Enabled = false;
                        }
                    }

                }
               
            }
        }



        protected void btn_generar_Click(object sender, EventArgs e)
        {
            try
            {

                WMSClass vWMS = new WMSClass();
                if (chk_tipo.Value.ToString() == "1")
                {
                    if (txt_destino.Text != string.Empty)
                    {
                        if (vWMS.VerificaReservaPallet(txt_origen.Text) == 0)
                        {
                            if (vWMS.VerificaReservaPallet(txt_destino.Text) == 0)
                            {
                                if (vWMS.RepaletizaConDestino(txt_origen.Text, txt_destino.Text, Convert.ToInt32(txt_cantidad.Text), Session["CIDUsuario"].ToString()))
                                {
                                LogClass vLog = new LogClass();
                                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 20, "Crea Repalletizado");
                                #region Limpia Componentes
                                txt_origen.Text = string.Empty;
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
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert(' pallet origen posee reserva,no es posible realizar repaletizado');", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Debe ingresar Pallet destino');", true);
                    }
                }
                else
                {
                    try
                    {
                        
                            if (Convert.ToInt32(lbl_cantidad.Text) >= Convert.ToInt32(txt_cantidad.Text))
                            {
                                if (vWMS.VerificaReservaPallet(txt_origen.Text) == 0)
                                {
                                    string Npallet = vWMS.RepaletizaNuevo(txt_origen.Text, Convert.ToInt32(txt_cantidad.Text), Session["CIDUsuario"].ToString());
                                    LogClass vLog = new LogClass();
                                    vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 20, "Crea Repalletizado");
                                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Su Nuevo Pallet es: " + Npallet + "');", true);

                                    #region AccTipoPallet
                                    vWMS.ActualizaTipoPallet(Convert.ToInt32(Npallet), Convert.ToInt32(cboTipoPallet.Value));
                                    #endregion
                                    #region Limpia Componentes
                                    txt_origen.Text = string.Empty;
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
                                    #endregion

                                }
                                else
                                {
                                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Pallet Origen posee reserva, no es posible realizar repaletizado');", true);
                                }
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Excede cantidad permitida');", true);
                            }
                        
                    }
                    catch (Exception)
                    {


                    }

                }
            }
            catch
            {
            }
        }

    }
}