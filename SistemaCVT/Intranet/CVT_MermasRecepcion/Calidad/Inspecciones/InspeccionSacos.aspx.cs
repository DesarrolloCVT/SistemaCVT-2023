using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Calidad.Inspecciones
{
    public partial class InspeccionSacos : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    dteFecha.Value = DateTime.Now.AddDays(-7);            }
            //else
            //{
            //    try
            //    {
            //        LqsSacos.Where = Session["Parametros"].ToString();
            //        GvDatos.DataBind();

            //    }
            //    catch
            //    {

            //    }

            //}
            memoprov.Visible = false;
            GvDatos.DataBind();
        }

        //protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        //{
        //    //GvDatos.AddNewRow();
        //    popInspeccionSacos.ShowOnPageLoad = true;
        //    dteFechaReg.Date = DateTime.Now;
        //    //txtHora.Text =Convert.ToString(DateTime.Now.Hour)+ Convert.ToString(DateTime.Now.Minute);
        //}

        //protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        //{
        //    e.NewValues["IdUsuario"] = Session["IDCVTUsuario"];
        //    e.NewValues["Fecha_ingresoRegistro"] = DateTime.Now;
        //}

        protected void btnGenerainforme_Click(object sender, EventArgs e)
        {
            DateTime fecha = Convert.ToDateTime(dteFecha.Value);
            ReportDocument Info = new ReportDocument();
            Info.Load(Server.MapPath("~/R.HACCP.03.rpt"));
            Info.SetDatabaseLogon("sa", "cvt.vdp22$");
            Info.SetParameterValue(0, fecha);
            ExportOptions op = new ExportOptions();
            Response.Buffer = false;
            Response.Clear();
            // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
            Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            //DateTime fch =Convert.ToDateTime(dteFecha.Text);
            //LqsSacos.WhereParameters.Clear();
            //LqsSacos.WhereParameters.Add("FCH", DbType.DateTime, fch.ToString());
            //LqsSacos.Where = "Fecha_registro>=@FCH";

            //Session["Parametros"] = LqsSacos.Where.ToString();
            //GvDatos.DataBind();
            GvDatos.DataBind();
        }

        protected void cboProveedor_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (ckProveedorMixto.Checked == true)
            {
                memoprov.Visible = true;
                string rov = cboProveedor.Text;
                memoprov.Text += rov + " - ";
            }

        }

        protected void ckProveedorMixto_CheckedChanged(object sender, EventArgs e)
        {
            if (ckProveedorMixto.Checked == true)
            {
                memoprov.Visible = true;
            }
            else { memoprov.Visible = false; }
        }

        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            CalidadClass ca = new CalidadClass();
            CVT_Inspeccion_Visual_Sacos ivs = new CVT_Inspeccion_Visual_Sacos();

            int ano = dteFechaReg.Date.Year;
            int dia = dteFechaReg.Date.Day;
            int mes = dteFechaReg.Date.Month;
            DateTime fmon = new DateTime(ano, mes, dia, 0, 0, 0);


            if (ckProveedorMixto.Checked == true)
            {

                string pmix = memoprov.Text;
                string nmix = pmix.Remove(pmix.Length - 2);

                ivs.Fecha_registro = fmon;
                ivs.ItemCode = Convert.ToString(cboProducto.Value);
                ivs.Hora = TimeSpan.Parse(txtHora.Text);
                ivs.LoteMP = txtLoteMateriaPrima.Text.ToUpper();
                ivs.LotePT = txtLoteProductoTerminado.Text.ToUpper();
                ivs.Humedad = Convert.ToDecimal(txtPorcHumedad.Text);
                ivs.MateriaExtranaAnimal = Convert.ToInt16(cboMatExtranaAnimal.Value);
                ivs.MateriaExtrana = Convert.ToInt16(cboMaterialesExtranos.Value);
                ivs.IdUsuario = Convert.ToInt32(Session["IDCVTUsuario"]);
                ivs.EstadoSaco = Convert.ToInt16(cboEstadoSaco.Value);
                ivs.AccionCorrectiva = memoAccionCorrectiva.Text;
                ivs.Fecha_ingresoRegistro = DateTime.Now;
                ivs.ProvMixto = ckProveedorMixto.Checked;
                ivs.Proveedores_Mixtos = nmix;
                ivs.Id_EncargadaCalidad = 63;
                ivs.NAccionCorrectiva = txtNAccionCorrectiva.Text == "" ? 0 : Convert.ToInt32(txtNAccionCorrectiva.Text);

                bool resul = ca.InsertaInspeccionVisualSacos(ivs);
                if (resul == true)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registro Guardado');", true);
                    GvDatos.DataBind();
                    popInspeccionSacos.ShowOnPageLoad = false;
                    limpiar1();

                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al Registrar Contactar con Administrador');", true);
                    limpiar1();
                }


            }
            else
            {
                ivs.Fecha_registro = fmon;
                ivs.ItemCode = Convert.ToString(cboProducto.Value);
                ivs.Hora = TimeSpan.Parse(txtHora.Text);
                ivs.LoteMP = txtLoteMateriaPrima.Text.ToUpper();
                ivs.LotePT = txtLoteProductoTerminado.Text.ToUpper();
                ivs.Humedad = Convert.ToDecimal(txtPorcHumedad.Text);
                ivs.MateriaExtranaAnimal = Convert.ToInt16(cboMatExtranaAnimal.Value);
                ivs.MateriaExtrana = Convert.ToInt16(cboMaterialesExtranos.Value);
                ivs.IdUsuario = Convert.ToInt32(Session["IDCVTUsuario"]);
                ivs.EstadoSaco = Convert.ToInt16(cboEstadoSaco.Value);
                ivs.AccionCorrectiva = memoAccionCorrectiva.Text;
                ivs.Fecha_ingresoRegistro = DateTime.Now;
                ivs.ProvMixto = ckProveedorMixto.Checked;
                ivs.CardCode = Convert.ToString(cboProveedor.Value);
                ivs.Id_EncargadaCalidad = 63;
                ivs.NAccionCorrectiva = txtNAccionCorrectiva.Text == "" ? 0:Convert.ToInt32(txtNAccionCorrectiva.Text);


                bool resul = ca.InsertaInspeccionVisualSacos(ivs);
                if (resul == true)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registro Guardado');", true);
                    GvDatos.DataBind();
                    popInspeccionSacos.ShowOnPageLoad = false;
                    limpiar1();

                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al Registrar Contactar con Administrador');", true);
                    limpiar1();
                }

            }

        }
        protected void limpiar1()
        {
            txtHora.Text = string.Empty;
            dteFechaReg.Date = DateTime.Now;
            cboProducto.SelectedIndex = -1;
            txtLoteMateriaPrima.Text = string.Empty;
            txtLoteProductoTerminado.Text = string.Empty;
            ckProveedorMixto.Checked = false;
            cboProveedor.SelectedIndex = -1;
            memoprov.Text = string.Empty;
            cboEstadoSaco.SelectedIndex = -1;
            txtPorcHumedad.Text = "0,0";
            cboMatExtranaAnimal.SelectedIndex = 1;
            cboMaterialesExtranos.SelectedIndex = 1;
            memoAccionCorrectiva.Text = string.Empty;
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (e.Item.Name.Equals("Nuevo"))
            {
                popInspeccionSacos.ShowOnPageLoad = true;
                dteFechaReg.Date = DateTime.Now;
            }
        }

        protected void GvDatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 145, "Elimina Registro");

            UsuarioClass us = new UsuarioClass();

            var veri = us.idUsuarioVerificador(Convert.ToInt32(Session["IDCVTUsuario"]));

            if (veri == "False")
            {
                e.Cancel = true;
            }
        }

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 145, "Crea Registro");
        }

        protected void GvDatos_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 145, "Actualiza Registro");

            UsuarioClass us = new UsuarioClass();

            var veri = us.idUsuarioVerificador(Convert.ToInt32(Session["IDCVTUsuario"]));

            if (veri == "False")
            {
                GvDatos.SettingsPopup.EditForm.ShowFooter = true;
                GvDatos.SettingsText.PopupEditFormFooterText = "solo usuarios verificadores pueden editar";
                GvDatos.StylesPopup.EditForm.Footer.ForeColor = System.Drawing.Color.Red;

                e.Cancel = true;


            }
        }
    }
}