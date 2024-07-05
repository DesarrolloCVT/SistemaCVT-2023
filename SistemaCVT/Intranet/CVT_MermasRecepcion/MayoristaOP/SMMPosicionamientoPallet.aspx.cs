using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.MayoristaOP
{
    public partial class SMMPosicionamientoPallet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txtNPallet_TextChanged(object sender, EventArgs e)
        {
            try
            {
                CVTWMSMetroClass vWMS = new CVTWMSMetroClass();
                List<SMM_Package> dt = vWMS.ObtieneDatosDelBultoSMM(Convert.ToInt32(txtNPallet.Text));
                if (dt.Count() == 0)
                {
                    lbl_error.Visible = true;
                    //btn_generar.Enabled = false;
                }
                else
                {
                    lbl_error.Visible = false;
                    //btn_generar.Enabled = true;
                    foreach (var p in dt)
                    {
                        SAPSMM sp = new SAPSMM();

                        lblCodProd.Text = p.ItemCode;
                        lblProducto.Text = sp.ObtieneNombreProducto(p.ItemCode);


                        List<SMM_Layout> ly = vWMS.ObtieneInfoLayout((int)p.Layout_Id);
                        foreach (var l in ly)
                        {
                            lblUbicacion.Text = l.Layout_Description;
                            lblBodega.Text = vWMS.ObtieneNombreCortoSitioSMM(l.Site_Id);
                        }
                        lblLote.Text = p.Package_Lot;
                        lblCantidad.Text = p.Package_Quantity.ToString();
                    }
                }
            }
            catch
            {
            }
        }

        protected void txtDestino_TextChanged(object sender, EventArgs e)
        {
            try
            {

                CVTWMSMetroClass vWMS = new CVTWMSMetroClass();
                List<SMM_Layout> ly = vWMS.ObtieneInfoLayout(Convert.ToInt32(txtDestino.Text));
                foreach (var l in ly)
                {
                    lbl_ubicacion_nueva.Text = l.Layout_Description;
                    lblBodegaNueva.Text = vWMS.ObtieneNombreSitio(l.Site_Id);
                }
                if (lblBodega.Text == lblBodegaNueva.Text)
                {
                    btnGuardar.Enabled = true;
                }
                else
                {
                    btnGuardar.Enabled = false;
                }
            }
            catch
            {
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {


                CVTWMSMetroClass vWMS = new CVTWMSMetroClass();
                int Package_Id = vWMS.ObtienePackageIdSMM(txtNPallet.Text);
                int idUser = Convert.ToInt32(Session["IDCVTUsuario"]);
                vWMS.ActualizaLayoutPackage(Package_Id, Convert.ToInt32(txtDestino.Text));
                if (vWMS.AddLocation(Package_Id, Convert.ToInt32(txtDestino.Text), idUser))
                {
                    #region Limpia Componentes
                    txtNPallet.Text = string.Empty;
                    lblCodProd.Text = string.Empty;
                    lblProducto.Text = string.Empty;
                    lblLote.Text = string.Empty;
                    lblCantidad.Text = string.Empty;
                    txtDestino.Text = string.Empty;
                    lblBodega.Text = string.Empty;
                    lblBodegaNueva.Text = string.Empty;
                    lblUbicacion.Text = string.Empty;
                    lbl_ubicacion_nueva.Text = string.Empty;
                    #endregion
                    txtNPallet.Focus();
                }
            }
            catch
            {
            }

        }
    }
}