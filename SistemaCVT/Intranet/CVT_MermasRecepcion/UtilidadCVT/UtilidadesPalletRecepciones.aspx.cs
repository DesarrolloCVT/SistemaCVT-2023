using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.UtilidadCVT
{
    public partial class UtilidadesPalletRecepciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblNumero.Visible = false;
            txtNelimina.Visible = false;
            btnEliminar.Visible = false;
        }

        protected void cboTarea_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblNumero.Visible = true;
            txtNelimina.Visible = true;
            btnEliminar.Visible = true;
            if (Convert.ToInt32(cboTarea.Value) == 1)
            {
                lblNumero.Text = "Ingrese N° Pallet";
                btnEliminar.Text = "Eliminar Pallet";

            }
            else
            {
                lblNumero.Text = "Ingrese N° Recepcion";
                btnEliminar.Text = "Eliminar Recepcion";

            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            int NEliminar = Convert.ToInt32(txtNelimina.Text);
            int TipoTar = Convert.ToInt32(cboTarea.Value);

            if (TipoTar == 1)
            {
                UtilidadCVTClass ut = new UtilidadCVTClass();

                bool rsu = ut.SP_EliminaPallet(NEliminar);
                if (rsu == true)
                {
                    CVT_LogUtilidades lg = new CVT_LogUtilidades();
                    lg.IdUsuario = Convert.ToInt32(Session["IDCVTUsuario"]);
                    lg.FechaRegistro = DateTime.Now;
                    lg.NTransaccion = NEliminar;
                    lg.TipoTransac = "Elimina Pallet";
                    ut.InsertaRegistroLogUtilidades(lg);

                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Pallet N°: " + NEliminar + "  se ha Eliminado');", true);


                    lblNumero.Visible = true;
                    txtNelimina.Visible = true;
                    btnEliminar.Visible = true;
                    txtNelimina.Text = string.Empty;

                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('No se ha Eliminado  el Pallet N°: " + NEliminar + " o no Existe ');", true);
                    txtNelimina.Text = string.Empty;
                    lblNumero.Visible = true;
                    txtNelimina.Visible = true;
                    btnEliminar.Visible = true;
                }
            }
            if (TipoTar == 2)
            {
                UtilidadCVTClass ut = new UtilidadCVTClass();

                bool rsu = ut.SP_EliminaRecepcion(NEliminar);
                if (rsu == true)
                {
                    CVT_LogUtilidades lg = new CVT_LogUtilidades();
                    lg.IdUsuario = Convert.ToInt32(Session["IDCVTUsuario"]);
                    lg.FechaRegistro = DateTime.Now;
                    lg.NTransaccion = NEliminar;
                    lg.TipoTransac = "Elimina Recepcion";
                    ut.InsertaRegistroLogUtilidades(lg);

                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Recepcion N°: " + NEliminar + "  se ha Eliminado');", true);


                    lblNumero.Visible = true;
                    txtNelimina.Visible = true;
                    btnEliminar.Visible = true;
                    txtNelimina.Text = string.Empty;

                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('No se ha Eliminado Recepcion N°: " + NEliminar + " o no Existe ');", true);
                    txtNelimina.Text = string.Empty;
                    lblNumero.Visible = true;
                    txtNelimina.Visible = true;
                    btnEliminar.Visible = true;
                }
            }
        }
    }
}