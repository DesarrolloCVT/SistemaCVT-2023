using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Comercial
{
    public partial class DetalleRapel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Detalle Rapel";
            }
            else
            {
                popNuevo.ShowOnPageLoad = true;

            }
        }

        protected void cboCliente_SelectedIndexChanged(object sender, EventArgs e)
        {
            cboDireccion.SelectedIndex = -1;
        }

        private void Limpiar()
        {
            cboCliente.SelectedIndex = -1;
            cboDireccion.SelectedIndex = -1;
            cboProducto.SelectedIndex = -1;
            txtPastaColiseo.Text = string.Empty;
            txt4laColiseo.Text = string.Empty;
            txt4LA_Coliseo_W.Text = string.Empty;
            txt3LA_MMPP.Text = string.Empty;
            txtCentralizacion.Text = string.Empty;
            txtMerma.Text = string.Empty;
            txtDisCentMMPP.Text = string.Empty;
            txtDisCentResSurtido.Text = string.Empty;
            txtExtranetResSurtido.Text = string.Empty;
            txtRebateFijo.Text = string.Empty;
            txtRepoSellOut.Text = string.Empty;
            txtNoDevolucion.Text = string.Empty;
            txtPEL.Text = string.Empty;
            txtCobroFianza.Text = string.Empty;
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Limpiar();
            popNuevo.ShowOnPageLoad = false;

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            ComercialClass cCls = new ComercialClass();
            CVT_Porcentaje_Rapel pr = new CVT_Porcentaje_Rapel();

            pr.CardCode = Convert.ToString(cboCliente.Value);
            pr.Address = Convert.ToString(cboDireccion.Value);
            pr.ItemCode = Convert.ToString(cboProducto.Value);
            pr.FechaInicio = dteFechaInicio.Date;
            pr.PastaColiseo = txtPastaColiseo.Text == string.Empty ? 0 : Convert.ToDecimal(txtPastaColiseo.Text);
            pr.LA_Coliseo_CM = txt4laColiseo.Text == string.Empty ? 0 : Convert.ToDecimal(txt4laColiseo.Text);
            pr.LA_Coliseo_W = txt4LA_Coliseo_W.Text == string.Empty ? 0 : Convert.ToDecimal(txt4LA_Coliseo_W.Text);
            pr.LA_MMPP_W = txt3LA_MMPP.Text == string.Empty ? 0 : Convert.ToDecimal(txt3LA_MMPP.Text);
            pr.Centralizacion = txtCentralizacion.Text == string.Empty ? 0 : Convert.ToDecimal(txtCentralizacion.Text);
            pr.Merma = txtMerma.Text == string.Empty ? 0 : Convert.ToDecimal(txtMerma.Text);
            pr.Distrib_Cent_MMPP = txtDisCentMMPP.Text == string.Empty ? 0 : Convert.ToDecimal(txtDisCentMMPP.Text);
            pr.Distrib_Cent_Rest_Surtido = txtDisCentResSurtido.Text == string.Empty ? 0 : Convert.ToDecimal(txtDisCentResSurtido.Text);
            pr.Extranet_Rest_Surtido = txtExtranetResSurtido.Text == string.Empty ? 0 : Convert.ToDecimal(txtExtranetResSurtido.Text);
            pr.Rebate_Fijo = txtRebateFijo.Text == string.Empty ? 0 : Convert.ToDecimal(txtRebateFijo.Text);
            pr.Reposicion_Int_SellOut = txtRepoSellOut.Text == string.Empty ? 0 : Convert.ToDecimal(txtRepoSellOut.Text);
            pr.NoDevolucion = txtNoDevolucion.Text == string.Empty ? 0 : Convert.ToDecimal(txtNoDevolucion.Text);
            pr.PEL = txtPEL.Text == string.Empty ? 0 : Convert.ToDecimal(txtPEL.Text);
            pr.CobroFianza = txtCobroFianza.Text == string.Empty ? 0 : Convert.ToDecimal(txtCobroFianza.Text);

            bool resul = cCls.InsertaDetalleRapel(pr);

            if (resul == true)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registro Guardado');", true);
                GvDatos.DataBind();
                popNuevo.ShowOnPageLoad = false;

                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 224, "Crea Registro");

                Limpiar();

            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al Registrar Contactar con Administrador');", true);
                Limpiar();
            }
        }

        protected void GvDatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 224, "Elimina Registro");
        }

        protected void GvDatos_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {

            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 224, "Actualiza Registro");
        }
    }
}
