using DBMermasRecepcion;
using DevExpress.XtraPrinting;
using System;
using System.Collections.Generic;
using System.Web.UI;

namespace CVT_MermasRecepcion.Informatica
{
    public partial class InventarioEquipos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 48, "Ingreso");
            }
        }
        protected void GvServidores_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvServidores.SettingsExport.FileName = "Servidores";
            }
        }

        protected void GvComputadores_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvComputadores.SettingsExport.FileName = "Computadores";
            }
        }

        protected void GvImpresoras_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvImpresoras.SettingsExport.FileName = "Impresoras";
            }
        }

        protected void GvRF_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvRF.SettingsExport.FileName = "RF";
            }
        }

        protected void GvRED_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvRED.SettingsExport.FileName = "RED";
            }
        }

        protected void GvWIFI_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvWIFI.SettingsExport.FileName = "WIFI";
            }
        }

        protected void GvOtros_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvOtros.SettingsExport.FileName = "OTROS EQUIPOS";
            }
        }

        protected void GvVideo_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {

            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvVideo.SettingsExport.FileName = "Video Vigilancia";
            }
        }

        protected void GvUPS_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvUPS.SettingsExport.FileName = "UPS";
            }
        }

        //protected void GvMoviles_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        //{
        //    if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
        //    {
        //        GvMoviles.SettingsExport.FileName = "UPS";
        //    }
        //}

        //protected void GvPlan_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        //{
        //    if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
        //    {
        //        GvPlan.SettingsExport.FileName = "Planes";
        //    }
        //}

        protected void GvTFija_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvTFija.SettingsExport.FileName = "Telefonia fija";
            }
        }

        protected void GvEquiposMoviles_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvEquiposMoviles.SettingsExport.FileName = "Equipos Moviles";
            }
        }

        protected void GvMonitores_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvMonitores.SettingsExport.FileName = "Monitores";
            }
        }

        protected void GvServidores_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {

                InformaticaClass inf = new InformaticaClass();
                string codInv = inf.TraeCodAFServidor(Convert.ToInt32(e.KeyValue));

                if (codInv == null)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Item No contiene codigo de inventario, verificar');", true);
                }
                else
                {
                    Session["CodInventario"] = codInv;
                    Response.Redirect("/Informatica/InventarioEquipoAdjuntos.aspx");
                }
                //  Session["TipoInv"] ="SERV";

            }
            if (e.CommandArgs.CommandName == "cmdBajada")

            {
                InformaticaClass inf = new InformaticaClass();
                string codInv = inf.TraeCodAFServidor(Convert.ToInt32(e.KeyValue));

                Session["CodActivoServidor"] = codInv;
                PopBajadaServidor.ShowOnPageLoad = true;
            }
        }

        protected void GvComputadores_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {

                InformaticaClass inf = new InformaticaClass();
                string codInv = inf.TraeCodAFComputador(Convert.ToInt32(e.KeyValue));

                if (codInv == null)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Item No contiene codigo de inventario, verificar');", true);
                }
                else
                {
                    Session["CodInventario"] = codInv;
                    Response.Redirect("/Informatica/InventarioEquipoAdjuntos.aspx");
                }
            }
            if (e.CommandArgs.CommandName == "cmdBajada")

            {
                InformaticaClass inf = new InformaticaClass();
                string codInv = inf.TraeCodAFComputador(Convert.ToInt32(e.KeyValue));

                Session["CodActivoComputador"] = codInv;
                PopComputadores.ShowOnPageLoad = true;
            }
        }

        protected void GvImpresoras_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {

                InformaticaClass inf = new InformaticaClass();
                string codInv = inf.TraeCodAFImpresora(Convert.ToInt32(e.KeyValue));

                if (codInv == null)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Item No contiene codigo de inventario, verificar');", true);
                }
                else
                {
                    Session["CodInventario"] = codInv;
                    Response.Redirect("/Informatica/InventarioEquipoAdjuntos.aspx");
                }
            }
            if (e.CommandArgs.CommandName == "cmdBajadaImpresora")

            {
                InformaticaClass inf = new InformaticaClass();
                string codInv = inf.TraeCodAFImpresora(Convert.ToInt32(e.KeyValue));

                Session["CodActivoImpresora"] = codInv;
                PopImpresora.ShowOnPageLoad = true;
            }
        }

        protected void GvRF_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {

                InformaticaClass inf = new InformaticaClass();
                string codInv = inf.TraeCodAFRadioF(Convert.ToInt32(e.KeyValue));

                if (codInv == null)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Item No contiene codigo de inventario, verificar');", true);
                }
                else
                {
                    Session["CodInventario"] = codInv;
                    Response.Redirect("/Informatica/InventarioEquipoAdjuntos.aspx");
                }
            }
            if (e.CommandArgs.CommandName == "cmdBajadaRF")

            {
                InformaticaClass inf = new InformaticaClass();
                string codInv = inf.TraeCodAFRadioF(Convert.ToInt32(e.KeyValue));

                Session["CodActivoRF"] = codInv;
                PopRF.ShowOnPageLoad = true;
            }
        }

        protected void GvRED_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {

                InformaticaClass inf = new InformaticaClass();
                string codInv = inf.TraeCodAFRed(Convert.ToInt32(e.KeyValue));

                if (codInv == null)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Item No contiene codigo de inventario, verificar');", true);
                }
                else
                {
                    Session["CodInventario"] = codInv;
                    Response.Redirect("/Informatica/InventarioEquipoAdjuntos.aspx");
                }
            }
            if (e.CommandArgs.CommandName == "cmdBajadaRed")

            {
                InformaticaClass inf = new InformaticaClass();
                string codInv = inf.TraeCodAFRed(Convert.ToInt32(e.KeyValue));

                Session["CodActivoRed"] = codInv;
                PopRed.ShowOnPageLoad = true;
            }
        }

        protected void GvWIFI_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {

            if (e.CommandArgs.CommandName == "cmdDetalle")
            {

                InformaticaClass inf = new InformaticaClass();
                string codInv = inf.TraeCodAFWifi(Convert.ToInt32(e.KeyValue));

                if (codInv == null)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Item No contiene codigo de inventario, verificar');", true);
                }
                else
                {
                    Session["CodInventario"] = codInv;
                    Response.Redirect("/Informatica/InventarioEquipoAdjuntos.aspx");
                }
            }
            if (e.CommandArgs.CommandName == "cmdBajadaWifi")

            {
                InformaticaClass inf = new InformaticaClass();
                string codInv = inf.TraeCodAFWifi(Convert.ToInt32(e.KeyValue));

                Session["CodActivoWifi"] = codInv;
                PopWifi.ShowOnPageLoad = true;
            }
        }

        protected void GvVideo_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {

                InformaticaClass inf = new InformaticaClass();
                string codInv = inf.TraeCodAFVideoV(Convert.ToInt32(e.KeyValue));

                if (codInv == null)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Item No contiene codigo de inventario, verificar');", true);
                }
                else
                {
                    Session["CodInventario"] = codInv;
                    Response.Redirect("/Informatica/InventarioEquipoAdjuntos.aspx");
                }
            }
            if (e.CommandArgs.CommandName == "cmdBajadaVideo")

            {
                InformaticaClass inf = new InformaticaClass();
                string codInv = inf.TraeCodAFVideoV(Convert.ToInt32(e.KeyValue));

                Session["CodActivoVideo"] = codInv;
                Popvideo.ShowOnPageLoad = true;
            }
        }

        protected void GvEquiposMoviles_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {

                InformaticaClass inf = new InformaticaClass();
                string codInv = inf.TraeCodAFEqMovil(Convert.ToInt32(e.KeyValue));

                if (codInv == null)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Item No contiene codigo de inventario, verificar');", true);
                }
                else
                {
                    Session["CodInventario"] = codInv;
                    Response.Redirect("/Informatica/InventarioEquipoAdjuntos.aspx");
                }
            }
            if (e.CommandArgs.CommandName == "cmdBajadaEM")

            {
                InformaticaClass inf = new InformaticaClass();
                string codInv = inf.TraeCodAFEqMovil(Convert.ToInt32(e.KeyValue));

                Session["CodActivoEM"] = codInv;
                PopEM.ShowOnPageLoad = true;
            }
        }

        protected void GvMonitores_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {

                InformaticaClass inf = new InformaticaClass();
                string codInv = inf.TraeCodAFMonitor(Convert.ToInt32(e.KeyValue));

                if (codInv == null)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Item No contiene codigo de inventario, verificar');", true);
                }
                else
                {
                    Session["CodInventario"] = codInv;
                    Response.Redirect("/Informatica/InventarioEquipoAdjuntos.aspx");
                }
            }
            if (e.CommandArgs.CommandName == "cmdBajadaMonitor")

            {
                InformaticaClass inf = new InformaticaClass();
                string codInv = inf.TraeCodAFMonitor(Convert.ToInt32(e.KeyValue));

                Session["CodActivoMonitores"] = codInv;
                PopMonitor.ShowOnPageLoad = true;
            }
        }


        protected void GvOtros_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdBajadaOtros")

            {
                InformaticaClass inf = new InformaticaClass();
                string codInv = inf.TraeCodAFOtrosEquipos(Convert.ToInt32(e.KeyValue));

                Session["CodActivoOtros"] = codInv;
                PopOtros.ShowOnPageLoad = true;
            }
        }


        protected void GvUPS_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdBajadaUps")

            {
                InformaticaClass inf = new InformaticaClass();
                string codInv = inf.TraeCodAFUps(Convert.ToInt32(e.KeyValue));

                Session["CodActivoUps"] = codInv;
                PopUps.ShowOnPageLoad = true;
            }
        }

        protected void GvTFija_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdBajadaTF")

            {
                InformaticaClass inf = new InformaticaClass();
                string codInv = inf.TraeCodAFTF(Convert.ToInt32(e.KeyValue));

                Session["CodActivoTF"] = codInv;
                PopTelF.ShowOnPageLoad = true;
            }
        }

        protected void btnGuardarBajaServidor_Click(object sender, EventArgs e)
        {
            InformaticaClass inf = new InformaticaClass();

            string Codi = Session["CodActivoServidor"].ToString();
            string valida = inf.validaCodActivoBajda(Codi);

            if (valida.Equals(""))
            {
                List<CVT_INF_Servidor> dt = inf.DatosServidores(Codi);
               foreach(var t in dt) {

                    CVT_INF_Bajada_Equipos bj = new CVT_INF_Bajada_Equipos();

                    bj.CodActivo = Codi;
                    bj.Marca =inf.TraeMarca(Convert.ToInt32(t.Marca));
                    bj.Tipo = t.Dispositivo;
                    bj.NSerie = t.Direccion_MAC;
                    bj.ResponsableTI = Session["NombreUsuario"].ToString();
                    bj.MotivoBaja = Convert.ToString(cboMotivo.Value);
                    bj.FechaBajada = DateTime.Now;
                    bj.Observaciones = txtObservacion.Text;
                    bj.Modelo = t.Modelo.ToString();

                  bool rs= inf.InsertaNuevaBajada(bj);

                    if (rs == true)
                    {
                        inf.ActualizaEstadoServidor(Codi);
                        GvServidores.DataBind();
                        cboMotivo.SelectedIndex = -1;
                        txtObservacion.Text = string.Empty;
                        PopBajadaServidor.ShowOnPageLoad = false;
                    }
                    else {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('No se puede dar de baja este Item ');", true);
                    }
                }


            }
            else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Codigo de activo ya se encuentra Registrado');", true); }         
          


        }

        protected void btnBajadaComputadores_Click(object sender, EventArgs e)
        {
            InformaticaClass inf = new InformaticaClass();

            string Codi = Session["CodActivoComputador"].ToString();
            string valida = inf.validaCodActivoBajda(Codi);

            if (valida.Equals(""))
            {
                List<CVT_INF_Computador> dt = inf.DatosComputadores(Codi);
                foreach (var t in dt)
                {

                    CVT_INF_Bajada_Equipos bj = new CVT_INF_Bajada_Equipos();

                    bj.CodActivo = Codi;
                    bj.Marca = inf.TraeMarca(Convert.ToInt32(t.Marca));
                    bj.Tipo =inf.BuscaNombreDispositivo(Convert.ToInt32(t.Dispositivo));
                    bj.NSerie = t.Direccion_MAC;
                    bj.ResponsableTI = Session["NombreUsuario"].ToString();
                    bj.MotivoBaja = Convert.ToString(cboMotivocomputador.Value);
                    bj.Dpto = inf.BuscaNombreArea(Convert.ToInt32(t.Area_u_Oficina));
                    bj.FechaBajada = DateTime.Now;
                    bj.Observaciones = txtObsComputador.Text;
                    bj.Modelo = t.Modelo.ToString();
                    bj.Usuario = inf.TraeNombreUsuario(Convert.ToString(t.ID_Usuario));
                    bj.Licencia = t.CodLicencia;

                    bool rs = inf.InsertaNuevaBajada(bj);

                    if (rs == true)
                    {
                        inf.ActualizaEstadoComputador(Codi);
                        GvComputadores.DataBind();
                        cboMotivocomputador.SelectedIndex = -1;
                        txtObsComputador.Text = string.Empty;
                        PopComputadores.ShowOnPageLoad = false;
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('No se puede dar de baja este Item ');", true);
                    }
                }


            }
            else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Codigo de activo ya se encuentra Registrado');", true); }

        }

        protected void btnBajadaImpresora_Click(object sender, EventArgs e)
        {
            InformaticaClass inf = new InformaticaClass();

            string Codi = Session["CodActivoImpresora"].ToString();
            string valida = inf.validaCodActivoBajda(Codi);

            if (valida.Equals(""))
            {
                List<CVT_INF_Impresora> dt = inf.DatosImpresoras(Codi);
                foreach (var t in dt)
                {

                    CVT_INF_Bajada_Equipos bj = new CVT_INF_Bajada_Equipos();

                    bj.CodActivo = Codi;
                    bj.Marca = inf.TraeMarca(Convert.ToInt32(t.Marca));
                    bj.Tipo = t.Tipo_Dispositivo;
                    bj.NSerie = t.MAC;
                    bj.ResponsableTI = Session["NombreUsuario"].ToString();
                    bj.MotivoBaja = Convert.ToString(cboMotivoImpresora.Value);
                    bj.Dpto = t.Ubicación___Usuario;
                    bj.FechaBajada = DateTime.Now;
                    bj.Observaciones = txtObsImpresora.Text;
                    bj.Modelo = t.Modelo.ToString();
                    bj.Usuario = t.Usuario;
                   // bj.Licencia = t.CodLicencia;

                    bool rs = inf.InsertaNuevaBajada(bj);

                    if (rs == true)
                    {
                        inf.ActualizaEstadoImpresora(Codi);
                        GvImpresoras.DataBind();
                        cboMotivoImpresora.SelectedIndex = -1;
                        txtObsImpresora.Text = string.Empty;
                        PopImpresora.ShowOnPageLoad = false;
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('No se puede dar de baja este Item ');", true);
                    }
                }


            }
            else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Codigo de activo ya se encuentra Registrado');", true); }

        }

        protected void btnBajadaRF_Click(object sender, EventArgs e)
        {
            InformaticaClass inf = new InformaticaClass();

            string Codi = Session["CodActivoRF"].ToString();
            string valida = inf.validaCodActivoBajda(Codi);

            if (valida.Equals(""))
            {
                List<CVT_INF_RadioFrecuencia> dt = inf.DatosRF(Codi);
                foreach (var t in dt)
                {

                    CVT_INF_Bajada_Equipos bj = new CVT_INF_Bajada_Equipos();

                    string us1 = inf.TraeNombreUsuario(Convert.ToString(t.Usuario));
                    string us2 = inf.TraeNombreUsuario(Convert.ToString(t.UsuarioDos));

                    bj.CodActivo = Codi;
                    bj.Marca = inf.TraeMarca(Convert.ToInt32(t.Marca));
                    bj.Tipo =inf.BuscaNombreDispositivo(Convert.ToInt32(t.Dispositivo));
                    bj.NSerie = t.Serial_Number;
                    bj.ResponsableTI = Session["NombreUsuario"].ToString();
                    bj.MotivoBaja = Convert.ToString(cboRF.Value);
                    bj.Dpto = inf.BuscaNombreArea(Convert.ToInt32(t.Area));
                    bj.FechaBajada = DateTime.Now;
                    bj.Observaciones = txtObsRF.Text;
                    bj.Modelo = t.Modelo.ToString();
                    bj.Usuario = us1+" - "+us2;
                    // bj.Licencia = t.CodLicencia;

                    bool rs = inf.InsertaNuevaBajada(bj);

                    if (rs == true)
                    {
                        inf.ActualizaEstadoRF(Codi);
                        GvRF.DataBind();
                        cboRF.SelectedIndex = -1;
                        txtObsRF.Text = string.Empty;
                        PopRF.ShowOnPageLoad = false;
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('No se puede dar de baja este Item ');", true);
                    }
                }
            }
            else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Codigo de activo ya se encuentra Registrado');", true); }
        }

        protected void btnBajadaRed_Click(object sender, EventArgs e)
        {
            InformaticaClass inf = new InformaticaClass();

            string Codi = Session["CodActivoRed"].ToString();
            string valida = inf.validaCodActivoBajda(Codi);

            if (valida.Equals(""))
            {
                List<CVT_INF_EqRED> dt = inf.DatosRed(Codi);
                foreach (var t in dt)
                {

                    CVT_INF_Bajada_Equipos bj = new CVT_INF_Bajada_Equipos();

                    //string us1 = inf.TraeNombreUsuario(Convert.ToString(t.Usuario));
                    //string us2 = inf.TraeNombreUsuario(Convert.ToString(t.UsuarioDos));

                    bj.CodActivo = Codi;
                    bj.Marca = inf.TraeMarca(Convert.ToInt32(t.Marca));
                    bj.Tipo = t.Dispositivo;
                    bj.NSerie =t.MAC;
                    bj.ResponsableTI = Session["NombreUsuario"].ToString();
                    bj.MotivoBaja = Convert.ToString(cboRed.Value);
                    bj.Dpto =t.Ubicación;
                    bj.FechaBajada = DateTime.Now;
                    bj.Observaciones = txtObsRed.Text;
                    bj.Modelo = t.Modelo_.ToString();
                    bj.Usuario = t.Usuario;
                    // bj.Licencia = t.CodLicencia;

                    bool rs = inf.InsertaNuevaBajada(bj);

                    if (rs == true)
                    {
                        inf.ActualizaEstadoRed(Codi);
                        GvRED.DataBind();
                        cboRed.SelectedIndex = -1;
                        txtObsRed.Text = string.Empty;
                        PopRed.ShowOnPageLoad = false;
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('No se puede dar de baja este Item ');", true);
                    }
                }
            }
            else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Codigo de activo ya se encuentra Registrado');", true); }
        }

        protected void btnBajadaWifi_Click(object sender, EventArgs e)
        {
            InformaticaClass inf = new InformaticaClass();

            string Codi = Session["CodActivoWifi"].ToString();
            string valida = inf.validaCodActivoBajda(Codi);

            if (valida.Equals(""))
            {
                List<CVT_INF_EqWireless> dt = inf.DatosWifi(Codi);
                foreach (var t in dt)
                {

                    CVT_INF_Bajada_Equipos bj = new CVT_INF_Bajada_Equipos();

                    //string us1 = inf.TraeNombreUsuario(Convert.ToString(t.Usuario));
                    //string us2 = inf.TraeNombreUsuario(Convert.ToString(t.UsuarioDos));

                    bj.CodActivo = Codi;
                    bj.Tipo = t.Dispositivo;
                    bj.Marca = inf.TraeMarca(Convert.ToInt32(t.Marca));
                    bj.NSerie = t.MAC;
                    bj.ResponsableTI = Session["NombreUsuario"].ToString();
                    bj.MotivoBaja = Convert.ToString(cboWifi.Value);
                    bj.Dpto = t.Ubicación;
                    bj.FechaBajada = DateTime.Now;
                    bj.Observaciones = txtObsWifi.Text;
                    bj.Modelo = t.Modelo.ToString();
                    bj.Usuario = t.Usuario_Adm;
                    // bj.Licencia = t.CodLicencia;

                    bool rs = inf.InsertaNuevaBajada(bj);

                    if (rs == true)
                    {
                        inf.ActualizaEstadoWifi(Codi);
                        GvWIFI.DataBind();
                        cboWifi.SelectedIndex = -1;
                        txtObsWifi.Text = string.Empty;
                        PopWifi.ShowOnPageLoad = false;
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('No se puede dar de baja este Item ');", true);
                    }
                }
            }
            else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Codigo de activo ya se encuentra Registrado');", true); }
        }

        protected void btnBajadaVideo_Click(object sender, EventArgs e)
        {
            InformaticaClass inf = new InformaticaClass();

            string Codi = Session["CodActivoVideo"].ToString();
            string valida = inf.validaCodActivoBajda(Codi);

            if (valida.Equals(""))
            {
                List<CVT_INF_VideoVigilancia> dt = inf.DatosVideo(Codi);
                foreach (var t in dt)
                {

                    CVT_INF_Bajada_Equipos bj = new CVT_INF_Bajada_Equipos();

                    //string us1 = inf.TraeNombreUsuario(Convert.ToString(t.Usuario));
                    //string us2 = inf.TraeNombreUsuario(Convert.ToString(t.UsuarioDos));

                    bj.CodActivo = Codi;
                    bj.Tipo = t.Dispositivo;
                    bj.Marca = inf.TraeMarca(Convert.ToInt32(t.Marca));
                    bj.NSerie = t.Dirección_MAC;
                    bj.ResponsableTI = Session["NombreUsuario"].ToString();
                    bj.MotivoBaja = Convert.ToString(cboVideo.Value);
                    bj.Dpto = t.Monitoreo;
                    bj.FechaBajada = DateTime.Now;
                    bj.Observaciones = txtObsVideo.Text;
                    bj.Modelo = t.Modelo.ToString();
                    bj.Usuario = t.Usuario;
                    // bj.Licencia = t.CodLicencia;

                    bool rs = inf.InsertaNuevaBajada(bj);

                    if (rs == true)
                    {
                        inf.ActualizaEstadoVideo(Codi);
                        GvVideo.DataBind();
                        cboVideo.SelectedIndex = -1;
                        txtObsVideo.Text = string.Empty;
                        Popvideo.ShowOnPageLoad = false;
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('No se puede dar de baja este Item ');", true);
                    }
                }
            }
            else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Codigo de activo ya se encuentra Registrado');", true); }
        }
        protected void btnBajadaOtros_Click(object sender, EventArgs e)
        {
            InformaticaClass inf = new InformaticaClass();

            string Codi = Session["CodActivoOtros"].ToString();
            string valida = inf.validaCodActivoBajda(Codi);

            if (valida.Equals(""))
            {
                List<CVT_INF_OtroEq> dt = inf.DatosOtros(Codi);
                foreach (var t in dt)
                {

                    CVT_INF_Bajada_Equipos bj = new CVT_INF_Bajada_Equipos();

                    //string us1 = inf.TraeNombreUsuario(Convert.ToString(t.Usuario));
                    //string us2 = inf.TraeNombreUsuario(Convert.ToString(t.UsuarioDos));

                    bj.CodActivo = Codi;
                    bj.Tipo = t.Dispositivo;
                    bj.Marca = inf.TraeMarca(Convert.ToInt32(t.Marca));
                    bj.NSerie = t.MAC;
                    bj.ResponsableTI = Session["NombreUsuario"].ToString();
                    bj.MotivoBaja = Convert.ToString(cboOtros.Value);
                    // bj.Dpto = t.Monitoreo;
                    bj.FechaBajada = DateTime.Now;
                    bj.Observaciones = txtObsOtros.Text;
                    bj.Modelo = t.Modelo.ToString();
                    //bj.Usuario = t.Usuario;
                    // bj.Licencia = t.CodLicencia;

                    bool rs = inf.InsertaNuevaBajada(bj);

                    if (rs == true)
                    {
                        inf.ActualizaEstadoOtros(Codi);
                        GvOtros.DataBind();
                        cboOtros.SelectedIndex = -1;
                        txtObsOtros.Text = string.Empty;
                        PopOtros.ShowOnPageLoad = false;
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('No se puede dar de baja este Item ');", true);
                    }
                }
            }
            else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Codigo de activo ya se encuentra Registrado');", true); }
        }      

        protected void btnBajadaUps_Click(object sender, EventArgs e)
        {

            InformaticaClass inf = new InformaticaClass();

            string Codi = Session["CodActivoUps"].ToString();
            string valida = inf.validaCodActivoBajda(Codi);

            if (valida.Equals(""))
            {
                List<CVT_INF_EqRespaldoEnergia> dt = inf.DatosUps(Codi);
                foreach (var t in dt)
                {

                    CVT_INF_Bajada_Equipos bj = new CVT_INF_Bajada_Equipos();

                    //string us1 = inf.TraeNombreUsuario(Convert.ToString(t.Usuario));
                    //string us2 = inf.TraeNombreUsuario(Convert.ToString(t.UsuarioDos));

                    bj.CodActivo = Codi;
                    bj.Tipo = t.Dispositivo;
                    bj.Marca = inf.TraeMarca(Convert.ToInt32(t.Marca));
                    // bj.NSerie = t.MAC;
                    bj.ResponsableTI = Session["NombreUsuario"].ToString();
                    bj.MotivoBaja = Convert.ToString(cboUps.Value);
                    bj.Dpto = t.Rack_de_comunicaciones;
                    bj.FechaBajada = DateTime.Now;
                    bj.Observaciones = txtObsUps.Text;
                    bj.Modelo = t.Modelo.ToString();
                    //bj.Usuario = t.Usuario;
                    // bj.Licencia = t.CodLicencia;

                    bool rs = inf.InsertaNuevaBajada(bj);

                    if (rs == true)
                    {
                        inf.ActualizaEstadoUps(Codi);
                        GvUPS.DataBind();
                        cboUps.SelectedIndex = -1;
                        txtObsUps.Text = string.Empty;
                        PopUps.ShowOnPageLoad = false;
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('No se puede dar de baja este Item ');", true);
                    }
                }
            }
            else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Codigo de activo ya se encuentra Registrado');", true); }
        } 

        protected void btnBajaTF_Click1(object sender, EventArgs e)
        {
            InformaticaClass inf = new InformaticaClass();

            string Codi = Session["CodActivoTF"].ToString();
            string valida = inf.validaCodActivoBajda(Codi);

            if (valida.Equals(""))
            {
                List<CVT_INF_Telefonia_Fija> dt = inf.DatosTF(Codi);
                foreach (var t in dt)
                {

                    CVT_INF_Bajada_Equipos bj = new CVT_INF_Bajada_Equipos();

                    //string us1 = inf.TraeNombreUsuario(Convert.ToString(t.Usuario));
                    //string us2 = inf.TraeNombreUsuario(Convert.ToString(t.UsuarioDos));

                    bj.CodActivo = Codi;
                    bj.Tipo = t.Dispositivo;
                    bj.Marca = inf.TraeMarca(Convert.ToInt32(t.Marca));
                    bj.NSerie = t.DireccionMAC;
                    bj.ResponsableTI = Session["NombreUsuario"].ToString();
                    bj.MotivoBaja = Convert.ToString(cboTF.Value);
                    bj.Dpto = t.Oficina;
                    bj.FechaBajada = DateTime.Now;
                    bj.Observaciones = txtObsTF.Text;
                    bj.Modelo = t.Modelo.ToString();
                    bj.Usuario = t.Usuario;
                    // bj.Licencia = t.CodLicencia;

                    bool rs = inf.InsertaNuevaBajada(bj);

                    if (rs == true)
                    {
                        inf.ActualizaEstadoTF(Codi);
                        GvTFija.DataBind();
                        cboTF.SelectedIndex = -1;
                        txtObsTF.Text = string.Empty;
                        PopTelF.ShowOnPageLoad = false;
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('No se puede dar de baja este Item ');", true);
                    }
                }
            }
            else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Codigo de activo ya se encuentra Registrado');", true); }
        }

        protected void btnBajadaEM_Click(object sender, EventArgs e)
        {
            InformaticaClass inf = new InformaticaClass();

            string Codi = Session["CodActivoEM"].ToString();
            string valida = inf.validaCodActivoBajda(Codi);

            if (valida.Equals(""))
            {
                List<CVT_INF_EquiposMoviles> dt = inf.DatosEM(Codi);
                foreach (var t in dt)
                {

                    CVT_INF_Bajada_Equipos bj = new CVT_INF_Bajada_Equipos();

                    //string us1 = inf.TraeNombreUsuario(Convert.ToString(t.Usuario));
                    //string us2 = inf.TraeNombreUsuario(Convert.ToString(t.UsuarioDos));

                    bj.CodActivo = Codi;
                    bj.Tipo ="Equipo Movil";
                    bj.Marca = inf.TraeMarca(Convert.ToInt32(t.id_Marca));
                    bj.NSerie = t.IMEI;
                    bj.ResponsableTI = Session["NombreUsuario"].ToString();
                    bj.MotivoBaja = Convert.ToString(cboEM.Value);
                   // bj.Dpto = t.Oficina;
                    bj.FechaBajada = DateTime.Now;
                    bj.Observaciones = txtObsEM.Text;
                    bj.Modelo = t.Modelo.ToString();
                   // bj.Usuario = t.Usuario;
                    // bj.Licencia = t.CodLicencia;

                    bool rs = inf.InsertaNuevaBajada(bj);

                    if (rs == true)
                    {
                        inf.ActualizaEstadoEM(Codi);
                        GvEquiposMoviles.DataBind();
                        cboEM.SelectedIndex = -1;
                        txtObsEM.Text = string.Empty;
                        PopEM.ShowOnPageLoad = false;
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('No se puede dar de baja este Item ');", true);
                    }
                }
            }
            else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Codigo de activo ya se encuentra Registrado');", true); }
        }

        protected void btnBajadaMonitores_Click(object sender, EventArgs e)
        {
            InformaticaClass inf = new InformaticaClass();

            string Codi = Session["CodActivoMonitores"].ToString();
            string valida = inf.validaCodActivoBajda(Codi);

            if (valida.Equals(""))
            {
                List<CVT_INF_Monitores> dt = inf.DatosMonitor(Codi);
                foreach (var t in dt)
                {

                    CVT_INF_Bajada_Equipos bj = new CVT_INF_Bajada_Equipos();

                    //string us1 = inf.TraeNombreUsuario(Convert.ToString(t.Usuario));
                    //string us2 = inf.TraeNombreUsuario(Convert.ToString(t.UsuarioDos));

                    bj.CodActivo = Codi;
                    bj.Tipo = "Monitor";
                    bj.Marca = inf.TraeMarca(Convert.ToInt32(t.Id_Marca));
                 //   bj.NSerie = t.IMEI;
                    bj.ResponsableTI = Session["NombreUsuario"].ToString();
                    bj.MotivoBaja = Convert.ToString(cboMonitores.Value);
                    bj.Dpto =inf.BuscaNombreArea(Convert.ToInt32(t.Id_Area));
                    bj.FechaBajada = DateTime.Now;
                    bj.Observaciones = txtObsMonitores.Text;
                    bj.Modelo = t.Modelo.ToString();
                    bj.Usuario =inf.TraeNombreUsuario(t.Id_Usuario);
                    // bj.Licencia = t.CodLicencia;

                    bool rs = inf.InsertaNuevaBajada(bj);

                    if (rs == true)
                    {
                        inf.ActualizaEstadoMonitor(Codi);
                        GvMonitores.DataBind();
                        cboMonitores.SelectedIndex = -1;
                        txtObsMonitores.Text = string.Empty;
                        PopMonitor.ShowOnPageLoad = false;
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('No se puede dar de baja este Item ');", true);
                    }
                }
            }
            else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Codigo de activo ya se encuentra Registrado');", true); }
        }

        protected void GvServidores_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["Estado"] = 1;
        }

        protected void GvComputadores_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["Estado"] = 1;
        }

        protected void GvImpresoras_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["Estado"] = 1;
        }

        protected void GvRF_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["Estado"] = 1;
        }

        protected void GvRED_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["Estado"] = 1;
        }

        protected void GvWIFI_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["Estado"] = 1;
        }

        protected void GvOtros_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["Estado"] = 1;
        }

        protected void GvVideo_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["Estado"] = 1;
        }

        protected void GvUPS_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["Estado"] = 1;
        }

        protected void GvTFija_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["Estado"] = 1;
        }

        protected void GvEquiposMoviles_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["Estado"] = 1;
        }

        protected void GvMonitores_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["Estado"] = 1;
        }
    }
}