using DBMermasRecepcion;
using System;
using System.Collections.Generic;

namespace CVT_MermasRecepcion.WMS
{
    public partial class CambioFechas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Session["PerfilId"]) == 1)
            {
                txt_lote.ReadOnly = false;
            }
            else { txt_lote.ReadOnly = true; }

        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            WMSClass vWMS = new WMSClass();
            List<Package> dt = vWMS.ObtieneInfoPallet(txt_pallet.Text);
            foreach (var r in dt)
            {
                cb_fp.Date = r.Package_ProductionDate;
                cb_fv.Date = r.Package_ExpiresDate;
                txt_lp.Text = r.Package_Data1;
                List<ArticleProvider> da = new List<ArticleProvider>();
                da = vWMS.ObtieneInfoProducto(r.ArticleProvider_Id);
                foreach (var a in da)
                {
                    lbl_producto.Text = a.ArticleProvider_CodClient + " ; " + a.ArticleProvider_Description;
                }
                lbl_cantidad.Text = r.Package_Quantity.ToString();
                txt_lote.Text = r.Package_Lot;

            }
        }

        protected void btn_cambiar_Click(object sender, EventArgs e)
        {
            try
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 74, "Crea Registro");

                WMSClass vWMS = new WMSClass();
                vWMS.ActualizaFechasPackage(txt_pallet.Text, cb_fp.Date, cb_fv.Date, txt_lp.Text,txt_lote.Text);
                txt_pallet.Text = string.Empty;
            }
            catch
            {
            }
        }
    }
}