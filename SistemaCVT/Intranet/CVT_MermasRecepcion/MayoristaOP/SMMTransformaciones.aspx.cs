using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.MayoristaOP
{
    public partial class SMMTransformaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void txtNpallet_TextChanged(object sender, EventArgs e)
        {
            CVTWMSMetroClass mws = new CVTWMSMetroClass();
            List<SMM_Package> ret = mws.ObtieneDatosDelBultoSMM(Convert.ToInt32(txtNpallet.Text));

            if (ret.Count != 0)
            {
                lbl_error.Visible = false;
                foreach (var t in ret)
                {
                    txtCodProducto.Text = t.ItemCode;
                    txtCantidad.Text = Convert.ToInt32(t.Package_Quantity).ToString();
                    txtUMedida.Text = t.UomCode;
                    txtBaseUMedida.Text = t.BaseUnMed.ToString();
                    txtNombreProducto.Text = mws.ObtienenombreProducto(t.ItemCode);
                    Session["TipoUMed"] = t.UomEntry;
                }
            }
            else { lbl_error.Visible = true; }
          
        }

        protected void cboTipoUm_SelectedIndexChanged(object sender, EventArgs e)
        {
            CVTWMSMetroClass mws = new CVTWMSMetroClass();
            List<SMM_VW_DATO_PROD_RECEPCION> lt = mws.ObtieneDetosProdRecSAP(txtCodProducto.Text, txtCodBarra.Text, Convert.ToInt32(cboTipoUm.Value));

            if (Convert.ToInt32(cboTipoUm.Value) == 1)
            {
                int CantidadTransf = Convert.ToInt32(txtCantidad.Text) * Convert.ToInt32(txtBaseUMedida.Text);
                txtCantATransformar.Text = CantidadTransf.ToString() + " ; " + cboTipoUm.Text;
            }
            else {

                double CantidadTransf = 0;


                foreach (var t in lt)
                {
                      CantidadTransf = Convert.ToDouble(txtCantidad.Text) / Convert.ToDouble(t.BaseQty);                  

                }

                double rr = CantidadTransf % 1;
                if (rr != 0)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('No puedes Transformar esta cantidad');", true);
                }
                else { txtCantATransformar.Text = CantidadTransf.ToString() + " ; " + cboTipoUm.Text; }
            }
        }

        protected void btnTransformar_Click(object sender, EventArgs e)
        {
            CVTWMSMetroClass mws = new CVTWMSMetroClass();
            List<SMM_Package> ret = mws.ObtieneDatosDelBultoSMM(Convert.ToInt32(txtNpallet.Text));
            List<SMM_VW_DATO_PROD_RECEPCION> lt = mws.ObtieneDetosProdRecSAP(txtCodProducto.Text,txtCodBarra.Text, Convert.ToInt32(cboTipoUm.Value));
            int UmT = Convert.ToInt32(Session["TipoUMed"]);

            if (UmT != Convert.ToInt32(cboTipoUm.Value))
            {
                if (Convert.ToInt32(cboTipoUm.Value) == 1)
                {
                    if (lt.Count != 0)
                    {
                        int CantidadTransf = Convert.ToInt32(txtCantidad.Text) * Convert.ToInt32(txtBaseUMedida.Text);
                        string CodBarrTrans = txtCodBarra.Text;
                        string UnMedTransf = "";
                        int BaseTransf = 0;
                        int UgpEntryTransf = 0;
                        int UomTransf = 0;
                        string UomCodTransf = "";


                        foreach (var t in lt)
                        {
                            UnMedTransf = t.UgpName;
                            BaseTransf = Convert.ToInt32(t.BaseQty);
                            UgpEntryTransf = t.UgpEntry;
                            UomTransf = t.UomEntry;
                            UomCodTransf = t.UomCode;
                        }

                        bool resp = mws.ActualizaPKGTransformacion(Convert.ToInt32(txtNpallet.Text), CantidadTransf, CodBarrTrans, UnMedTransf, BaseTransf, UgpEntryTransf, UomTransf, UomCodTransf);

                        if (resp == true)
                        {
                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Producto se a Transformado vafor verificar');", true);

                            txtNpallet.Text = string.Empty;
                            txtNombreProducto.Text = string.Empty;
                            txtCodProducto.Text = string.Empty;
                            txtCantidad.Text = string.Empty;
                            txtUMedida.Text = string.Empty;
                            txtBaseUMedida.Text = string.Empty;
                            txtCodBarra.Text = string.Empty;
                            cboTipoUm.SelectedIndex = -1;
                            txtCantATransformar.Text = string.Empty;
                            txtNpallet.Focus();
                        }
                        else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al transformar producto vafor verificar');", true); }

                    }
                    else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Codigo de barra no existe o no coincide con su seleccion');", true); }
                }
                else
                {
                    if (lt.Count != 0) 
                    {
                        double CantidadTransf = 0;
                        string CodBarrTrans = txtCodBarra.Text;
                        string UnMedTransf = "";
                        int BaseTransf = 0;
                        int UgpEntryTransf = 0;
                        int UomTransf = 0;
                        string UomCodTransf = "";


                        foreach (var t in lt)
                        {
                            UnMedTransf = t.UgpName;
                            BaseTransf = Convert.ToInt32(t.BaseQty);
                            UgpEntryTransf = t.UgpEntry;
                            UomTransf = t.UomEntry;
                            UomCodTransf = t.UomCode;
                            CantidadTransf = Convert.ToDouble(txtCantidad.Text) / Convert.ToDouble(t.BaseQty);
                        }

                        double rr = CantidadTransf % 1;
                        if (rr != 0)
                        {
                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('No puedes Transformar esta cantidad');", true);
                        }
                        else
                        {

                            bool resp = mws.ActualizaPKGTransformacion(Convert.ToInt32(txtNpallet.Text), Convert.ToInt32(CantidadTransf), CodBarrTrans, UnMedTransf, BaseTransf, UgpEntryTransf, UomTransf, UomCodTransf);

                            if (resp == true)
                            {
                                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Producto se a Transformado vafor verificar');", true);
                                txtNpallet.Text = string.Empty;
                                txtNombreProducto.Text = string.Empty;
                                txtCodProducto.Text = string.Empty;

                                txtCantidad.Text = string.Empty;
                                txtUMedida.Text = string.Empty;
                                txtBaseUMedida.Text = string.Empty;
                                txtCodBarra.Text = string.Empty;
                                cboTipoUm.SelectedIndex = -1;
                                txtCantATransformar.Text = string.Empty;
                                txtNpallet.Focus();
                            }
                            else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al transformar producto vafor verificar');", true); }
                        }
                    }
                    else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Codigo de barra no existe o no coincide con su seleccion');", true); }
                }


            }
            else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Producto ya se encuentra en el formato de su seleccion');", true); }
        }
    }
}