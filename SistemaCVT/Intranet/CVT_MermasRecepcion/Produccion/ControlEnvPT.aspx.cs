using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Produccion
{
    public partial class ControlEnvPT : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            ProduccionClass proCla = new ProduccionClass();
            int idPerf = Convert.ToInt32(Session["PerfilId"]);
            if (idPerf == 1 || idPerf == 13 || idPerf == 16)
            {
                LqsDatosControlEnvPT.WhereParameters.Clear();
            }
            else
            {
                int idPersonal = proCla.ObtieneIdPersonal(Convert.ToString(Session["NombreUsuario"]));

                LqsDatosControlEnvPT.WhereParameters.Clear();
                LqsDatosControlEnvPT.WhereParameters.Add("IdPer", DbType.Int32, idPersonal.ToString());
                LqsDatosControlEnvPT.Where = "Operador==@IdPer";
            }
        }

        protected void btnAgregarEnv_Click(object sender, EventArgs e)
        {
            ProduccionClass pCls = new ProduccionClass();
            CVT_ControlEnvasadoPT cEnv = new CVT_ControlEnvasadoPT();

            TimeSpan? hini = null;
            TimeSpan? hiter = null;
            if (txtHoraInicio.Text.Equals("")) { hini = null; }
            if (txtHoraTermino.Text.Equals("")) { hiter = null; }

            cEnv.Operador = Convert.ToInt32(cboOperador.Value);
            cEnv.OF = Convert.ToInt32(cboOF.Value);
            cEnv.Turno = Convert.ToInt32(cboTurno.Value);
            cEnv.Sala = Convert.ToInt32(cboSala.Value);
            cEnv.Linea = cboLinea.Value.ToString();
            cEnv.HoraInicio = txtHoraInicio.Text.Equals("") ? hini : TimeSpan.Parse(txtHoraInicio.Text);
            cEnv.HoraTermino = txtHoraTermino.Text.Equals("") ? hiter : TimeSpan.Parse(txtHoraTermino.Text);
            cEnv.Abocador = Convert.ToInt32(cboAbocador.Value);
            cEnv.Origen1 = Convert.ToString(cboOrigen1.Value);
            cEnv.Origen2 = Convert.ToString(cboOrigen2.Value);
            cEnv.LoteMP = txtLoteMateriaPrima.Text;
            cEnv.Marca = Marca.Text;
            cEnv.MateriaPrima = txtMateriaPrima.Text;
            cEnv.FechaRegistro = DateTime.Now;
            cEnv.Estado = 1;
            bool ins = pCls.InsertaControlEnv(cEnv);

            if (ins == true)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registro Guardado');", true);
                limpiar();
                GvDatos.DataBind();
                popu1.ShowOnPageLoad = false;

                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 177, "Crea Registro");
            }
        }
        protected void limpiar()
        {
            cboOperador.SelectedIndex = -1;
            cboOF.SelectedIndex = -1;
            cboTurno.SelectedIndex = -1;
            cboSala.SelectedIndex = -1;
            cboLinea.SelectedIndex = -1;
            txtHoraInicio.Text = string.Empty;
            txtHoraTermino.Text = string.Empty;
            cboAbocador.SelectedIndex = -1;
            cboOrigen1.SelectedIndex = -1;
            cboOrigen2.SelectedIndex = -1;
        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                Session["IdControlEnvPT"] = e.KeyValue;
                Response.Redirect("~/Produccion/DetalleControlEnvasadoPT.aspx");


            }
            if (e.CommandArgs.CommandName == "cmdDetallePeso")
            {
                Session["IdControlEnvPT"] = e.KeyValue;
                Response.Redirect("~/Produccion/ControlPesoLineaPT.aspx");
            }
            if (e.CommandArgs.CommandName == "cmdDetalleAseo")
            {
                Session["IdControlEnvPT"] = e.KeyValue;
                Response.Redirect("~/Produccion/ControlAseoDiarioPT.aspx");
            }
            if (e.CommandArgs.CommandName == "cmdDetallePuestaEnMarcha")
            {
                Session["IdControlEnvPT"] = e.KeyValue;
                Response.Redirect("~/Produccion/MonitoreoPuestaEnMarchaMaquinaPT.aspx");
            }
            if (e.CommandArgs.CommandName == "cmdDetallePdf")
            {
                ProduccionClass pr = new ProduccionClass();
                int id = Convert.ToInt32(e.KeyValue);

                int orden = pr.ObtieneOF(id);
                string linea = pr.ObtieneLinea(id);

                ReportDocument Info = new ReportDocument();
                Info.Load(Server.MapPath("~/R.OP.15.07.rpt"));
                Info.SetDatabaseLogon("sa", "cvt.vdp22$");
                Info.SetParameterValue(0, orden);
                Info.SetParameterValue(1, linea);
                Info.SetParameterValue(2, id);
                ExportOptions op = new ExportOptions();
                Response.Buffer = false;
                Response.Clear();
                // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
                Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");

            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            popu1.ShowOnPageLoad = true;
        }

        protected void GvDatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            UsuarioClass us = new UsuarioClass();

            var veri = us.idUsuarioVerificador(Convert.ToInt32(Session["IDCVTUsuario"]));

            if (veri == "False")
            {
                e.Cancel = true;
            }
        }

        protected void GvDatos_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
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

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.Columns["Informe"].Visible = false;
                GvDatos.Columns["Puesta en Marcha"].Visible = false;
                GvDatos.Columns["Aseo"].Visible = false;
                GvDatos.Columns["Control Peso"].Visible = false;
                GvDatos.Columns["Control Film"].Visible = false;
                GvDatos.SettingsExport.FileName = "Control envasado PT";
                GvDatos.SettingsExport.ExcelExportMode = DevExpress.Export.ExportType.Default;



            }
        }
    }
}