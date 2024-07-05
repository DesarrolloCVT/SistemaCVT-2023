using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;

namespace CVT_MermasRecepcion.WMS
{
    public partial class Pisicionamiento : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txt_origen_TextChanged(object sender, EventArgs e)
        {
            try
            {
                WMSClass vWMS = new WMSClass();
                List<Package> dt = vWMS.ObtieneInfoPalletPosicionamiento(txt_origen.Text);
                if (dt.Count() == 0)
                {
                    lbl_error.Visible = true;
                    btn_generar.Enabled = false;
                }
                else
                {
                    lbl_error.Visible = false;
                    //btn_generar.Enabled = true;
                    foreach (var p in dt)
                    {
                        List<ArticleProvider> ap = vWMS.ObtieneInfoProducto(p.ArticleProvider_Id);
                        foreach (var a in ap)
                        {
                            lbl_codproducto.Text = a.ArticleProvider_CodClient;
                            lbl_producto.Text = a.ArticleProvider_Description;
                        }
                        List<Layout> ly = vWMS.ObtieneInfoLayout((int)p.Layout_Id);
                        foreach (var l in ly)
                        {
                            lbl_ubicacion.Text = l.Layout_Description;
                            lbl_sitio.Text = vWMS.ObtieneNombreCortoSitio(l.Site_Id);
                        }
                        lbl_lote.Text = p.Package_Lot;
                        lbl_cantidad.Text = p.Package_Quantity.ToString();
                    }
                }
            }
            catch
            {
            }
        }

        protected void txt_destino_TextChanged(object sender, EventArgs e)
        {
            try
            {
                WMSClass vWMS = new WMSClass();
                List<Layout> ly = vWMS.ObtieneInfoLayout(Convert.ToInt32(txt_destino.Text));
                foreach (var l in ly)
                {
                    lbl_ubicacion_nueva.Text = l.Layout_Description;
                    lbl_sitio_nuevo.Text = vWMS.ObtieneNombreCortoSitio(l.Site_Id);
                }
                if (lbl_sitio.Text == lbl_sitio_nuevo.Text)
                {
                    btn_generar.Enabled = true;
                }
                else
                {
                    btn_generar.Enabled = false;
                }
            }
            catch
            {
            }
        }



        protected void btn_generar_Click(object sender, EventArgs e)
        {
            try
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 26, "Asigna Ubicacion");

                WMSClass vWMS = new WMSClass();
                int staffid = vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString());
                int Package_Id = vWMS.ObtienePackageIdPosicionamiento(txt_origen.Text);
                vWMS.ActualizaLayoutPackage(Package_Id, Convert.ToInt32(txt_destino.Text));
                if (vWMS.AddLocation(Package_Id, Convert.ToInt32(txt_destino.Text), staffid))
                {
                    #region Limpia Componentes
                    txt_origen.Text = string.Empty;
                    lbl_codproducto.Text = string.Empty;
                    lbl_producto.Text = string.Empty;
                    lbl_lote.Text = string.Empty;
                    lbl_cantidad.Text = string.Empty;
                    txt_destino.Text = string.Empty;
                    lbl_sitio_nuevo.Text = string.Empty;
                    lbl_sitio.Text = string.Empty;
                    lbl_ubicacion.Text = string.Empty;
                    lbl_ubicacion_nueva.Text = string.Empty;
                    #endregion
                    txt_origen.Focus();
                }
            }
            catch
            {
            }
        }
    }
}