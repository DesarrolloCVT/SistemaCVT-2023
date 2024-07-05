using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.ActivoFijo
{
    public partial class ActivoFijo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatosActivoFijo.SettingsExport.FileName = "Lista Activo Fijo ";
            }
            if (e.Item.Name.Equals("Nuevo"))
            {
                PopNuevoActivo.ShowOnPageLoad = true;

            }
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            Limpiar();
        }

        protected void Limpiar()
        {
            txtPlaca.Text = string.Empty;
            txtNombreActivo.Text = string.Empty;
            dteFechaCompra.Text = string.Empty;
            dteFechaIniDeprec.Text = string.Empty;
            txtNFactura.Text = string.Empty;
            chkBeneficio33BIS.Checked = false;
            txtCtaContable.Text = string.Empty;
            txtCentroCosto.Text = string.Empty;
            txtLugarFisico.Text = string.Empty;
            txtDivision.Text = string.Empty;
            txtUnidadAdmin.Text = string.Empty;
            txtVidaUtilMeses.Text = string.Empty;
            txtValorCompraNeto.Text = string.Empty;

            //txtVidaUtilTranscurrida.Text = string.Empty;
            //txtCmac.Text = string.Empty;
            //txtCmej.Text = string.Empty;
            //txtDepac.Text = string.Empty;
            //txtCmda.Text = string.Empty;
            //txtDepej.Text = string.Empty;
            //txtValorFinalActivo.Text = string.Empty;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Limpiar();
            PopNuevoActivo.ShowOnPageLoad = false;
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {


            try
            {
                string Placa = txtPlaca.Text;
                string NombreActivo = txtNombreActivo.Text;
                DateTime FCompra = dteFechaCompra.Date;
                int NumFact = Convert.ToInt32(txtNFactura.Text);
                string CtaContable = txtCtaContable.Text;
                int VidUtilMes = Convert.ToInt32(txtVidaUtilMeses.Text);
                decimal vCompraNeto = Convert.ToDecimal(txtValorCompraNeto.Text);
                string UniAdmin = txtUnidadAdmin.Text;
                string Dvision = txtDivision.Text;
                string CCosto = txtCentroCosto.Text;
                string LuFisico = txtLugarFisico.Text;
                DateTime FDepresiacion = dteFechaIniDeprec.Date;
                int BeneficioBis = Convert.ToInt32(chkBeneficio33BIS.Value);

                ContabilidadClass cn = new ContabilidadClass();
                CVT_ActivoFIjo ac = new CVT_ActivoFIjo();

                ac.Placa = Placa;
                ac.Nombre_Activo = NombreActivo;
                ac.Fecha_Compra = FCompra;
                ac.N_Factura = NumFact;
                ac.Cuenta_Contable = CtaContable;
                ac.Vida_Util_Meses = VidUtilMes;
                ac.Valor_Compra_Neto = vCompraNeto;
                ac.Beneficio_33BIS = Convert.ToSByte(BeneficioBis);
                ac.Dvision = Dvision;
                ac.Unid_Administrativa = UniAdmin;
                ac.Centro_Costo = CCosto;
                ac.Lugar_Fisico = LuFisico;
                ac.FechaInicioDepresiacion = FDepresiacion;

              bool res= cn.InsertaRegistroActivoFijo(ac);

                if(res==true)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registrado');", true);
                    GvDatosActivoFijo.DataBind();
                    Limpiar();
                    PopNuevoActivo.ShowOnPageLoad = false;
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Ticket Enviado, N° de Ticket: " + ex.Message + " ');", true);
               
            }

        }
    }
}