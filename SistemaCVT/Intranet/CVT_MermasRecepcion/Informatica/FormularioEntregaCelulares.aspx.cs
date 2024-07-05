using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Informatica
{
    public partial class FormularioEntregaCelulares : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            OcultarRF();
            OcultarPrincipal();
            if (!IsPostBack)
            {
                GvDatos.DataBind();
            }
        }
        protected void cboUsuario_SelectedIndexChanged(object sender, EventArgs e)
        {
            int iduser = Convert.ToInt32(cboUsuario.Value);
            InformaticaClass vINF = new InformaticaClass();

            int idRF = vINF.VerificaUserinRF(iduser);
            int idLM = vINF.VerificaUserinLineasMov(iduser);
      
          
            if (idLM != 0 && idRF != 0)
            {
                rbtOpcionRFQ.Items.Clear();
                string dispo1 = "";
                string dispo2 = "";

                List<CVT_INF_LineasMoviles> dt = vINF.ObtieneDatosLineas(iduser);

                foreach (var t in dt)
                {
                    MostrarPrincipal();
                    lblArea.Text = vINF.BuscaNombreArea(Convert.ToInt32(t.Area));
                    ASPxLabel2.Text = "Linea N°:";
                    lblNlinea.Text = Convert.ToString(t.NLinea);
                    lblDispositivo.Text = vINF.BuscaNombreDispositivo(Convert.ToInt32(t.TipoEquipo));
                    dispo1= vINF.BuscaNombreDispositivo(Convert.ToInt32(t.TipoEquipo));

                    //int verifica = vINF.VerificaFormulario(iduser, dispo1);
                    //if (verifica != 0)
                    //{
                    //    lblVerificado.Visible = true;
                    //    lblVerificado.Text = "Registrado";
                    //    btnGuardar.Visible = false;
                    //}
                    //else { btnGuardar.Visible = true; }
                       
                }

                List<CVT_INF_RadioFrecuencia> dtrf = vINF.ObtieneDatosRF(iduser);
                foreach (var t in dtrf)
                {
                    lblModeloRF.Visible = true;
                    lblDispoRF.Visible = true;
                    labelDispoRF.Visible = true;
                    labelModeloRF.Visible = true;
                    lblAreaRF.Visible = true;
                    labelAreaRF.Visible = true;
                    labelAreaRF.Text = vINF.BuscaNombreArea(Convert.ToInt32(t.Area));
                    labelModeloRF.Text = t.Modelo;
                    labelDispoRF.Text = vINF.BuscaNombreDispositivo(Convert.ToInt32(t.Dispositivo));
                    dispo2= vINF.BuscaNombreDispositivo(Convert.ToInt32(t.Dispositivo));

                    //int verifica = vINF.VerificaFormulario(iduser, dispo2);
                    //if (verifica != 0)
                    //{
                    //    lblVerificadoRF.Visible = true;
                    //    lblVerificadoRF.Text = "Registrado";
                    //    btnGuardar.Visible = false;
                    //}
                    //else { btnGuardar.Visible = true; }
                }

                labelTipoForm.Visible = true;
                rbtOpcionRFQ.Items.Add(dispo1, 1);
                rbtOpcionRFQ.Items.Add(dispo2, 2);
                rbtOpcionRFQ.Border.BorderStyle = BorderStyle.None;
                rbtOpcionRFQ.ValidationSettings.RequiredField.IsRequired = true;
                rbtOpcionRFQ.Visible = true;

                //labelTipoForm.Visible = true;
                //if (lblVerificado.Text.Equals("")) { rbtOpcionRFQ.Items.Add(dispo1, 1); }
                //if (lblVerificadoRF.Text.Equals("")) { rbtOpcionRFQ.Items.Add(dispo2, 2); }
                //rbtOpcionRFQ.Border.BorderStyle = BorderStyle.None;
                //rbtOpcionRFQ.ValidationSettings.RequiredField.IsRequired = true;
                //rbtOpcionRFQ.Visible = true;
            }
            else if(idRF != 0)
            {
                List<CVT_INF_RadioFrecuencia> dtrf = vINF.ObtieneDatosRF(iduser);
                foreach (var t in dtrf)
                {
                    MostrarPrincipal();
                    lblArea.Text = vINF.BuscaNombreArea(Convert.ToInt32(t.Area));
                    ASPxLabel2.Text = "Modelo: ";
                    lblNlinea.Text = t.Modelo;
                    lblDispositivo.Text = vINF.BuscaNombreDispositivo(Convert.ToInt32(t.Dispositivo));
                }
            }
            else if (idLM != 0)
            {
                List<CVT_INF_LineasMoviles> dt = vINF.ObtieneDatosLineas(iduser);

                foreach (var t in dt)
                {
                    MostrarPrincipal();
                    lblArea.Text = vINF.BuscaNombreArea(Convert.ToInt32(t.Area));
                    ASPxLabel2.Text = "Linea N°:";
                    lblNlinea.Text = Convert.ToString(t.NLinea);
                    lblDispositivo.Text = vINF.BuscaNombreDispositivo(Convert.ToInt32(t.TipoEquipo));
                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
          
            try {
                int iduser = Convert.ToInt32(cboUsuario.Value);
                InformaticaClass vINF = new InformaticaClass();

                int idRF = vINF.VerificaUserinRF(iduser);
                int idLM = vINF.VerificaUserinLineasMov(iduser);
                int opc =Convert.ToInt32(rbtOpcionRFQ.Value);

                int vArea = 0;
                int vMarca = 0;
                string vModelo = "";
                string vIMEI = "";


                if (idLM != 0 && idRF != 0)
                {
                    if (opc == 1)
                    {
                        List<CVT_INF_LineasMoviles> dt = vINF.ObtieneDatosLineas(iduser);
                        CVT_INF_FORM_EntregaCelulares vNuevo = new CVT_INF_FORM_EntregaCelulares();


                        foreach (var t in dt)
                        {
                            vArea = Convert.ToInt32(t.Area);
                            vMarca = Convert.ToInt32(t.Marca);
                            vModelo = t.Modelo;
                            vIMEI = t.SIM;
                        }

                        //vNuevo.idUsuario = Convert.ToInt32(cboUsuario.Value);
                        vNuevo.NLinea = Convert.ToInt32(lblNlinea.Text);
                        //vNuevo.Marca = vMarca;
                        //vNuevo.Modelo = vModelo;
                        //vNuevo.IMEI = vIMEI;
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
                        vNuevo.Fecha_Hasta = Convert.ToDateTime(dteHasta.Value);
                        vNuevo.TipoDispo = lblDispositivo.Text;
                        vINF.AgregaFormulario(vNuevo);

                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registro Creado');", true);
                        limpiar();
                        OcultarPrincipal();
                        GvDatos.DataBind();
                    }
                    else if (opc == 2)
                    {
                        List<CVT_INF_RadioFrecuencia> dtrf = vINF.ObtieneDatosRF(iduser);

                        foreach (var t in dtrf)
                        {
                            vArea = Convert.ToInt32(t.Area);
                            vMarca = Convert.ToInt32(t.Marca);
                            vModelo = t.Modelo;
                        }
                        CVT_INF_FORM_EntregaCelulares vNueva = new CVT_INF_FORM_EntregaCelulares();
                        //vNueva.idUsuario = Convert.ToInt32(cboUsuario.Value);
                        vNueva.NLinea = 0;
                        //vNueva.Marca = vMarca;
                        //vNueva.Modelo = vModelo;
                        //vNueva.IMEI = "";
                        vNueva.CajaOriginal = chkCaja.Checked;
                        vNueva.TarjetaSIM = chkSim.Checked;
                        vNueva.CargadorBateria = chkCargador.Checked;
                        vNueva.TarjetaMicroSD = chkMicroSD.Checked;
                        vNueva.Auriculares = chkAuriculares.Checked;
                        vNueva.Carcasa = chkCarcasa.Checked;
                        vNueva.CableDatosUSB = chkCableDatos.Checked;
                        vNueva.LaminaVidrio = chkLamina.Checked;
                        vNueva.Otro = txtOtros.Text;
                        vNueva.Fecha_Entrega = Convert.ToDateTime(dteDesde.Value);
                        vNueva.Fecha_Hasta = Convert.ToDateTime(dteHasta.Value);
                        vNueva.TipoDispo = labelDispoRF.Text;
                        vINF.AgregaFormulario(vNueva);
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registro Creado');", true);
                        limpiar();
                        OcultarRF();
                        GvDatos.DataBind();

                    }
                }
                else if (idRF != 0)
                {
                    List<CVT_INF_RadioFrecuencia> dtrf = vINF.ObtieneDatosRF(iduser);

                    foreach (var t in dtrf)
                    {
                        vArea = Convert.ToInt32(t.Area);
                        vMarca = Convert.ToInt32(t.Marca);
                        vModelo = t.Modelo;
                    }
                    CVT_INF_FORM_EntregaCelulares vNueva = new CVT_INF_FORM_EntregaCelulares();
                    //vNueva.idUsuario = Convert.ToInt32(cboUsuario.Value);
                    vNueva.NLinea = 0;
                    //vNueva.Marca = vMarca;
                    //vNueva.Modelo = vModelo;
                    //vNueva.IMEI = "";
                    vNueva.CajaOriginal = chkCaja.Checked;
                    vNueva.TarjetaSIM = chkSim.Checked;
                    vNueva.CargadorBateria = chkCargador.Checked;
                    vNueva.TarjetaMicroSD = chkMicroSD.Checked;
                    vNueva.Auriculares = chkAuriculares.Checked;
                    vNueva.Carcasa = chkCarcasa.Checked;
                    vNueva.CableDatosUSB = chkCableDatos.Checked;
                    vNueva.LaminaVidrio = chkLamina.Checked;
                    vNueva.Otro = txtOtros.Text;
                    vNueva.Fecha_Entrega = Convert.ToDateTime(dteDesde.Value);
                    vNueva.Fecha_Hasta = Convert.ToDateTime(dteHasta.Value);
                    vNueva.TipoDispo = lblDispositivo.Text;
                    vINF.AgregaFormulario(vNueva);

                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registro Creado');", true);
                    limpiar();
                    GvDatos.DataBind();

                }
                else if (idLM != 0)
                {

                    List<CVT_INF_LineasMoviles> dt = vINF.ObtieneDatosLineas(iduser);
                    CVT_INF_FORM_EntregaCelulares vNuevo = new CVT_INF_FORM_EntregaCelulares();


                    foreach (var t in dt)
                    {
                        vArea = Convert.ToInt32(t.Area);
                        vMarca = Convert.ToInt32(t.Marca);
                        vModelo = t.Modelo;
                        vIMEI = t.SIM;
                    }

                    //vNuevo.idUsuario = Convert.ToInt32(cboUsuario.Value);
                    vNuevo.NLinea = Convert.ToInt32(lblNlinea.Text);
                    //vNuevo.Marca = vMarca;
                    //vNuevo.Modelo = vModelo;
                    //vNuevo.IMEI = vIMEI;
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
                    vNuevo.Fecha_Hasta = Convert.ToDateTime(dteHasta.Value);
                    vNuevo.TipoDispo = lblDispositivo.Text;
                    vINF.AgregaFormulario(vNuevo);

                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registro Creado');", true);
                    limpiar();
                    GvDatos.DataBind();
                }

            } catch {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al Registrar');", true);
                limpiar();
            }         

        }

        private void limpiar()
        {
            cboUsuario.SelectedIndex = -1;
            lblArea.Text = string.Empty;
            lblNlinea.Text = string.Empty;
            txtOtros.Text = string.Empty;
            chkCaja.Checked = false;
            chkSim.Checked = false;
            chkCargador.Checked = false;
            chkMicroSD.Checked = false;
            chkAuriculares.Checked = false;
            chkCarcasa.Checked = false;
            chkCableDatos.Checked = false;
            chkLamina.Checked = false;
            lblDispositivo.Text = string.Empty;
            rbtOpcionRFQ.Items.Clear();          
        }

        private void OcultarPrincipal()
        {
            ASPxLabel1.Visible = false;
            ASPxLabel2.Visible = false;
            ASPxLabel3.Visible = false;
            lblArea.Visible = false;
            lblNlinea.Visible = false;
            lblDispositivo.Visible = false;
            lblVerificado.Visible = false;
        }
        private void MostrarPrincipal()
        {
            ASPxLabel1.Visible = true;
            ASPxLabel2.Visible = true;
            ASPxLabel3.Visible = true;
            lblArea.Visible = true;
            lblNlinea.Visible = true;
            lblDispositivo.Visible = true;
        }
        private void OcultarRF()
        {
            lblModeloRF.Visible = false;
            lblDispoRF.Visible = false;
            labelDispoRF.Visible = false;
            labelModeloRF.Visible = false;
            lblAreaRF.Visible = false;
            labelAreaRF.Visible = false;
            labelTipoForm.Visible = false;
            rbtOpcionRFQ.Visible = false;
            lblVerificadoRF.Visible = false;
            
        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetallePdf")
            {
                //int id = Convert.ToInt32(e.KeyValue);
                //ReportDocument Info = new ReportDocument();
                //Info.Load(Server.MapPath("~/R.OP.14.06.rpt"));
                //Info.SetDatabaseLogon("sa", "cvt");
                //Info.SetParameterValue(0, id);
                //ExportOptions op = new ExportOptions();
                //Response.Buffer = false;
                //Response.Clear();
                //// Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
                //Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('esta en proceso ');", true);
            }
        }
    }
}