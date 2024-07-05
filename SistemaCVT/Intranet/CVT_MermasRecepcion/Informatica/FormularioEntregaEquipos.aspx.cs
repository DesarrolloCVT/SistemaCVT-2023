using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Informatica
{
    public partial class FormularioEntregaEquipos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            labelNlinea.Visible = false;
            cboNLinea.Visible = false;
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                string iduser = Convert.ToString(cboUsuario.Value);
                InformaticaClass vINF = new InformaticaClass();
                CVT_INF_FORM_EntregaCelulares vNuevo = new CVT_INF_FORM_EntregaCelulares();


                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 171, "Crea Registro");

                if (Convert.ToInt32(cboTipoEquipo.Value) == 1)
                {
                    vNuevo.idUsuarioAsignado = iduser;
                    vNuevo.TipoDispo = cboTipoEquipo.Value.ToString();
                    vNuevo.NLinea = Convert.ToInt32(cboNLinea.Value);
                    vNuevo.Equipo = Convert.ToInt32(cboEquipo.Value);

                    vNuevo.CajaOriginal = chkCaja.Checked;
                    vNuevo.TarjetaSIM = chkSim.Checked;
                    vNuevo.CargadorBateria = chkCargador.Checked;
                    vNuevo.TarjetaMicroSD = chkMicroSD.Checked;
                    vNuevo.Auriculares = chkAuriculares.Checked;
                    vNuevo.Carcasa = chkCarcasa.Checked;
                    vNuevo.CableDatosUSB = chkCableDatos.Checked;
                    vNuevo.LaminaVidrio = chkLamina.Checked;
                    vNuevo.Otro = txtOtros.Text;
                    vNuevo.Fecha_Entrega = Convert.ToDateTime(dteDesde.Value);
                    //vNuevo.Fecha_Hasta = Convert.ToDateTime(dteHasta.Value);
                    vNuevo.VB = false;
                    vINF.AgregaFormulario(vNuevo);
                    Gvdatos.DataBind();
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registro Creado');", true);
                    limpiar();
                }
                else
                {
                    vNuevo.idUsuarioAsignado = iduser;
                    vNuevo.TipoDispo = cboTipoEquipo.Value.ToString();
                    //vNuevo.NLinea = Convert.ToInt32(txtNLinea.Text);
                    vNuevo.Equipo = Convert.ToInt32(cboEquipo.Value);

                    vNuevo.CajaOriginal = chkCaja.Checked;
                    vNuevo.TarjetaSIM = chkSim.Checked;
                    vNuevo.CargadorBateria = chkCargador.Checked;
                    vNuevo.TarjetaMicroSD = chkMicroSD.Checked;
                    vNuevo.Auriculares = chkAuriculares.Checked;
                    vNuevo.Carcasa = chkCarcasa.Checked;
                    vNuevo.CableDatosUSB = chkCableDatos.Checked;
                    vNuevo.LaminaVidrio = chkLamina.Checked;
                    vNuevo.Otro = txtOtros.Text;
                    vNuevo.Fecha_Entrega = Convert.ToDateTime(dteDesde.Value);

                    //vNuevo.Fecha_Hasta = Convert.ToDateTime(dteHasta.Value);
                    vNuevo.VB = false;
                    vINF.AgregaFormulario(vNuevo);
                    Gvdatos.DataBind();
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registro Creado');", true);
                    limpiar();
                }
            }
            catch
            {

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('ERROR AL CREAR REGISTRO');", true);
            }

        }



        protected void cboTipoEquipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt32(cboTipoEquipo.Value) == 1)
            {
                labelNlinea.Visible = true;
                cboNLinea.Visible = true;
                //cboNLinea.ValidationSettings.RequiredField.IsRequired = true;                
            }
        }

        protected void Gvdatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetallePdf")
            {
                int id = Convert.ToInt32(e.KeyValue);
                ReportDocument Info = new ReportDocument();
                Info.Load(Server.MapPath("~/FormularioEntregaEquipo.rpt"));
                Info.SetDatabaseLogon("sa", "cvt.vdp22$");
                Info.SetParameterValue(0, id);
                ExportOptions op = new ExportOptions();
                Response.Buffer = false;
                Response.Clear();
                Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "Formulario Entrega Equipo.pdf");
            }
        }
        private void limpiar()
        {
            cboUsuario.SelectedIndex = -1;
            cboTipoEquipo.SelectedIndex = -1;
            cboEquipo.SelectedIndex = -1;
            cboNLinea.SelectedIndex = -1;
            txtOtros.Text = string.Empty;
            chkCaja.Checked = false;
            chkSim.Checked = false;
            chkCargador.Checked = false;
            chkMicroSD.Checked = false;
            chkAuriculares.Checked = false;
            chkCarcasa.Checked = false;
            chkCableDatos.Checked = false;
            chkLamina.Checked = false;
            dteDesde.Text = string.Empty;

        }

        protected void cboUsuario_SelectedIndexChanged(object sender, EventArgs e)
        {

            cboTipoEquipo.SelectedIndex = -1;
            cboEquipo.SelectedIndex = -1;
            cboNLinea.SelectedIndex = -1;
        }

        protected void Gvdatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 171, "Elimina Registro");
        }

        protected void Gvdatos_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 171, "Actualiza Registro");
        }
    }
}