using DBMermasRecepcion;
using System;

namespace CVT_MermasRecepcion.MayoristaOP
{
    public partial class SMMTomaInventario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void txt_pallet_TextChanged1(object sender, EventArgs e)
        {
            try
            {
                SMMInventarioClass vInventario = new SMMInventarioClass();
                string CodProd = vInventario.ValidaCodProducto(txt_pallet.Text);
                if (CodProd.Equals(""))
                {
                    txt_pallet.Focus();
                    lbl_error.Text = "DUN14 NO ENCONTRADO";
                    lbl_error.Visible = true;
                }
                else
                {
                    txt_producto.Text = CodProd;
                    dteFvenci.Focus();
                    lbl_error.Visible = false;
                }
            }
            catch
            {
            }
        }

        protected void txt_ubicacion_TextChanged(object sender, EventArgs e)
        {
            try
            {
                SMMInventarioClass vInventario = new SMMInventarioClass();

                if (Convert.ToInt32(vInventario.ValidaUbicacionSMM(txt_ubicacion.Text)) == 0)
                {
                    txt_ubicacion.Focus();
                    lbl_error.Text = "Ubicacion no existe";
                    lbl_error.Visible = true;
                }
                else
                {
                    cboPasillo.Focus();
                    lbl_error.Visible = false;
                }
            }
            catch
            {
            }
        }

        protected void btn_agregar_Click(object sender, EventArgs e)
        {
            SMMInventarioClass vInventario = new SMMInventarioClass();

            string codPro = vInventario.TraeCodProd(txt_pallet.Text);
            if (vInventario.ValidaCodProducto(txt_pallet.Text) != "")
            {

                if (Convert.ToInt32(vInventario.ValidaUbicacionSMM(txt_ubicacion.Text)) != 0)
                {

                    try
                    {
                        SMM_InventarioDetalle vNuevo = new SMM_InventarioDetalle();
                        vNuevo.Inventario_Id = Convert.ToInt32(cbo_Folio.Value);
                        vNuevo.Dun14 = txt_pallet.Text;
                        vNuevo.CodProducto = codPro;
                        vNuevo.Cantidad = Convert.ToDecimal(txt_cantidad.Text);
                        vNuevo.SiteID = Convert.ToInt32(vInventario.ValidaUbicacionSMM(txt_ubicacion.Text));
                        vNuevo.IdUsuario = Convert.ToInt32(Session["IDCVTUsuario"]);
                        vNuevo.FechaRegistro = DateTime.Now;
                        vNuevo.UbiPasillo = cboPasillo.Value.ToString();
                        vNuevo.FechaVencimiento = Convert.ToDateTime(dteFvenci.Value);
                        //#region accUbicacion
                        //WMSClass vWMS = new WMSClass();
                        //int staffid = vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString());
                        //int Package_Id = vWMS.ObtienePackageIdPosicionamiento(txt_ubicacion.Text);
                        //vWMS.ActualizaLayoutPackage(Package_Id, Convert.ToInt32(txt_ubicacion.Text));
                        //vWMS.AddLocation(Package_Id, Convert.ToInt32(txt_ubicacion.Text), staffid);
                        //#endregion

                        vInventario.InsertaRegistroInventarioSMM(vNuevo);

                        txt_pallet.Text = string.Empty;
                        txt_producto.Text = string.Empty;
                        txt_cantidad.Text = string.Empty;
                        txt_pallet.Focus();
                        lbl_error.Visible = false;
                    }
                    catch
                    {
                    }
                }
                else
                {
                    txt_ubicacion.Focus();
                    lbl_error.Text = "BODEGA NO ENCONTRADA";
                    lbl_error.Visible = true;
                }

            }
            else
            {
                txt_pallet.Focus();
                lbl_error.Text = "DUN14 NO ENCONTRADO";
                lbl_error.Visible = true;
            }
        }

        protected void cbo_Folio_SelectedIndexChanged(object sender, EventArgs e)
        {
            txt_ubicacion.Focus();
        }

        protected void cboPasillo_SelectedIndexChanged(object sender, EventArgs e)
        {
            txt_pallet.Focus();
            lbl_error.Visible = false;
        }

        protected void dteFvenci_DateChanged(object sender, EventArgs e)
        {
            txt_cantidad.Focus();
        }
    }
}