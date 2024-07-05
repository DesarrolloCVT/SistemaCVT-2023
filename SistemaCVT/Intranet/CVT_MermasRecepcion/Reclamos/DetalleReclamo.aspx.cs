using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Reclamos
{
    public partial class DetalleReclamo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_NReclamo.Text = Session["idReclamo"].ToString();
        }

        protected void cmdVolver_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Reclamos/RegistroReclamos.aspx");
        }

        protected void GvDatoDetalleReclamo_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["id_Reclamo"] = Session["idReclamo"];
            GvDatoDetalleReclamo.DataBind();
        }

        protected void GvDatoDetalleReclamo_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (e.Item.Name.Equals("Nuevo"))
            {
                PopNuevo.ShowOnPageLoad = true;

            }
        }

        protected void txtNpallet_TextChanged(object sender, EventArgs e)
        {
            try
            {
                ReclamosClass rc = new ReclamosClass();

                int npallet = txtNpallet.Text.Equals(string.Empty) ? 0 :Convert.ToInt32(txtNpallet.Text);

                if (npallet == 0)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert(' Ingrese N° de pallet ');", true);
                }
                else
                {

                    List<Package> ls = rc.ObtieneInfoPallet(npallet);

                    if(ls.Count>0)
                    {
                        foreach (var t in ls)
                        {
                            List<ArticleProvider> lap = rc.ObtieneInfoProducto(t.ArticleProvider_Id);

                            foreach (var a in lap)
                            {
                                lblCodProd.Text = a.ArticleProvider_CodClient;
                                lblDescripcion.Text = a.ArticleProvider_Description;

                                lblCantidad.Visible = true;
                                txtCantidad.Visible = true;
                            }
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Numero de Pallet  " + npallet + " no existe ');", true);

                    }

                }
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert(' " + ex.Message + " ');", true);
            }
        }

        private void limpiar()
        {
            txtNpallet.Text = string.Empty;
            txtCantidad.Text = string.Empty;
            txtCantidad.Visible = false;
            lblCantidad.Visible = false;
            lblCodProd.Text = string.Empty;
            lblDescripcion.Text = string.Empty;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            limpiar();
            PopNuevo.ShowOnPageLoad = false;
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                ReclamosClass rc = new ReclamosClass();
                CVT_Reclamo_DetalleProd rd = new CVT_Reclamo_DetalleProd();

                rd.ID_Reclamo = Convert.ToInt32(Session["idReclamo"]);
                rd.NPallet =Convert.ToInt32(txtNpallet.Text);
                rd.Cantidad = Convert.ToInt32(txtCantidad.Text);
                rd.CodProducto = lblCodProd.Text;

                string rest = rc.insertaReclamoDetalleProd(rd);

                if(rest.Equals("Registrado"))
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert(' " + rest + " ');", true);
                    GvDatoDetalleReclamo.DataBind();
                    limpiar();
                    PopNuevo.ShowOnPageLoad = false;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert(' " + rest + " ');", true);
                }
            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert(' " + ex.Message + " ');", true);
            }          
            
        }
    }
}