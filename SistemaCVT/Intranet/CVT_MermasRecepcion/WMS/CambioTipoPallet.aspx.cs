using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.WMS
{
    public partial class CambioTipoPallet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtNPallet.Focus();
        }

        protected void txtNPallet_TextChanged(object sender, EventArgs e)
        {
            InventarioClass inv = new InventarioClass();
            int npall = Convert.ToInt32(txtNPallet.Text);
            int pkID = inv.ValidaNPallet(npall);

            if (pkID != 0)
            {
                string tip = inv.TraeNombrePalletPackage(pkID);
                lblTipo.Text = "Pallet Actual = " + tip;
            }
            else{
                lblTipo.Text = "Pallet no se encuentra";
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            WMSClass wms = new WMSClass();


            bool res = wms.ActualizaTipoPallet(Convert.ToInt32(txtNPallet.Text),Convert.ToInt32(cboTipoPallet.Value));

            if (res == true)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Tipo de Pallet Actualizado');", true);

                txtNPallet.Text = string.Empty;
                cboTipoPallet.SelectedIndex = -1;
                lblTipo.Text = string.Empty;
            }
            else {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al Actualizar Tipo de Pallet , Favor Verificar');", true);
                txtNPallet.Text = string.Empty;
                cboTipoPallet.SelectedIndex = -1;
                lblTipo.Text = string.Empty;
            }
        }
    }
}