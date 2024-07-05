using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.MayoristaOP
{
    public partial class SMMActualizaPallet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            CVTWMSMetroClass mc = new CVTWMSMetroClass();

            List<SMM_Package> pl = mc.ObtieneDatosDelBultoSMM(Convert.ToInt32(txtNPallet.Text));
       
            foreach (var t in pl)
            {
                txtCodProducto.Text = t.ItemCode;
                txtProducto.Text = mc.ObtienenombreProducto(t.ItemCode);
                txtLoteInterno.Text = t.Package_Lot;
                txtLotProveedor.Text = t.Package_Data1;
                dteFechaProd.Date =Convert.ToDateTime(t.Package_ProductionDate);
                dteFechaVenc.Date = Convert.ToDateTime(t.Package_ExpiresDate);
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            CVTWMSMetroClass mc = new CVTWMSMetroClass(); 

            int Pallet =Convert.ToInt32(txtNPallet.Text);
            string lote = txtLoteInterno.Text;
            string loteProv = txtLotProveedor.Text;

            bool res = mc.ActualizaPallet(Pallet, lote, loteProv, dteFechaProd.Date, dteFechaVenc.Date);

            if (res == true)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Pallet Actualizado');", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al actualizar favor verificar o contactar con administrador');", true);
            }
        }
    }
}