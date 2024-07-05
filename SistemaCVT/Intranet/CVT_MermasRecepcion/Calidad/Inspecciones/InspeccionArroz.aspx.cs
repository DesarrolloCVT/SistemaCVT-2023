using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Calidad.Inspecciones
{
    public partial class InspeccionArroz : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            memoMixto.Visible = false;
        }

        //protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        //{
        //    //GvDatos.AddNewRow();
        //    //popInsArroz.ShowOnPageLoad = true;
        //    //dteFechReg.Date = DateTime.Now;
        //}

        //protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        //{
        //    e.NewValues["IdUsuario"] = Session["IDCVTUsuario"];
        //    e.NewValues["Fecha_ingresoRegistro"] = DateTime.Now;
        //}


        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                Session["Id_InspeccionPT_Arroz"] = e.KeyValue;
                Response.Redirect("~/Calidad/Inspecciones/InspeccionArrozDetalle.aspx");
            }
            if (e.CommandArgs.CommandName == "cmdDetallePdf")
            {
                int id = Convert.ToInt32(e.KeyValue);
                ReportDocument Info = new ReportDocument();
                Info.Load(Server.MapPath("~/R.HACCP.04.rpt"));
                Info.SetDatabaseLogon("sa", "cvt.vdp22$");
                Info.SetParameterValue(0, id);
                ExportOptions op = new ExportOptions();
                Response.Buffer = false;
                Response.Clear();
                // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
                Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");



            }
            if (e.CommandArgs.CommandName == "cmdVerificado")
            {
                popVerificar.ShowOnPageLoad = true;
                Session["Inspeccion"] = Convert.ToInt32(e.KeyValue);

            }
        }

        protected void chkmixto_CheckedChanged(object sender, EventArgs e)
        {
            if (chkmixto.Checked == true)
            {
                memoMixto.Visible = true;
            }
            else { memoMixto.Visible = false; }
        }

        protected void cboProveedor_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (chkmixto.Checked == true)
            {
                memoMixto.Visible = true;
                string rov = cboProveedor.Text;
                memoMixto.Text += rov + " - ";
            }
        }

        protected void BtnGuardar_Click(object sender, EventArgs e)
        {
            CalidadClass ca = new CalidadClass();
            CVT_InspeccionPT_Arroz inAr = new CVT_InspeccionPT_Arroz();

            int ano = dteFechReg.Date.Year;
            int dia = dteFechReg.Date.Day;
            int mes = dteFechReg.Date.Month;
            DateTime fmon = new DateTime(ano, mes, dia, 0, 0, 0);




            if (chkmixto.Checked == true)
            {
                string pmix = memoMixto.Text;
                string nmix = pmix.Remove(pmix.Length - 2);

                inAr.Lote = txtLote.Text;
                inAr.PMixto = chkmixto.Checked;
                inAr.ProvMixto = nmix;
                inAr.ItemCode = Convert.ToString(cboProductos.Value);
                inAr.IdUsuario = Convert.ToInt32(Session["IDCVTUsuario"]);
                inAr.FechaRegisro = fmon;
                inAr.AccionCorrectiva = memoAccionCorrectiva.Text;
                inAr.Estado = "Creado";
                inAr.Fecha_ingresoRegistro = DateTime.Now;

                bool resul = ca.InsertaInspeccionArroz(inAr);
                if (resul == true)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registro Guardado');", true);
                    GvDatos.DataBind();
                    popInsArroz.ShowOnPageLoad = false;
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
                inAr.Lote = txtLote.Text;
                inAr.PMixto = chkmixto.Checked;
                inAr.CardCode = Convert.ToString(cboProveedor.Value);
                inAr.ItemCode = Convert.ToString(cboProductos.Value);
                inAr.IdUsuario = Convert.ToInt32(Session["IDCVTUsuario"]);
                inAr.FechaRegisro = fmon;
                inAr.AccionCorrectiva = memoAccionCorrectiva.Text;
                inAr.Estado = "Creado";
                inAr.Fecha_ingresoRegistro = DateTime.Now;

                bool resul = ca.InsertaInspeccionArroz(inAr);
                if (resul == true)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registro Guardado');", true);
                    GvDatos.DataBind();
                    popInsArroz.ShowOnPageLoad = false;

                    LogClass vLog = new LogClass();
                    vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 138, "Crea Registro");
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
            txtLote.Text = string.Empty;
            dteFechReg.Date = DateTime.Now;
            cboProveedor.SelectedIndex = -1;
            cboProductos.SelectedIndex = -1;
            chkmixto.Checked = false;
            memoAccionCorrectiva.Text = string.Empty;
            memoMixto.Text = string.Empty;
            memoMixto.Visible = false;
        }

        protected void GvDatos_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType == DevExpress.Web.GridViewRowType.Data)
            {
                string Estado = (string)e.GetValue("Estado");
                //int idPerf = Convert.ToInt32(Session["PerfilId"]);

                if (Estado.Equals("Creado"))
                {
                    System.Web.UI.WebControls.ImageButton imgValidacion = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Verificado") as System.Web.UI.WebControls.ImageButton;
                    System.Web.UI.WebControls.ImageButton imgPdf = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "detallePdf") as System.Web.UI.WebControls.ImageButton;
                    imgValidacion.Visible = true;
                    imgPdf.Visible = true;

                }
                else if (Estado.Equals("Verificado"))
                {
                    System.Web.UI.WebControls.ImageButton imgValidacion = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Verificado") as System.Web.UI.WebControls.ImageButton;
                    System.Web.UI.WebControls.ImageButton imgPdf = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "detallePdf") as System.Web.UI.WebControls.ImageButton;
                    imgValidacion.Visible = false;
                    imgPdf.Visible = true;
                }
            }
        }

        protected void btnVerificar_Click(object sender, EventArgs e)
        {
            LogClass lg = new LogClass();
            //encriptar la clave que ingresa el usuario para ser comparada en la bd
            string pass = lg.Encrypt(txtContrasena.Text, true);

            UsuarioClass us = new UsuarioClass();
            int idUser = us.TraeIdUsuarioVerificador(txtUsuario.Text, pass);


            if (idUser == 0)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Usuario no permitido para verificar');", true);
            }
            else
            {

                CalidadClass Cal = new CalidadClass();
                //string verif = Convert.ToString(Session["NombreUsuario"]);

                int idIsn = Convert.ToInt32(Session["Inspeccion"]);
                bool res = Cal.ActualizaEstadoInspeccionArroz(idIsn, "Verificado", idUser);

                if (res == true)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Verificado');", true);
                    GvDatos.DataBind();
                    txtContrasena.Text = string.Empty;
                    txtUsuario.Text = string.Empty;
                    popVerificar.ShowOnPageLoad = false;

                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al Verificar Contactar con Administrador');", true);
                    txtContrasena.Text = string.Empty;
                    txtUsuario.Text = string.Empty;
                    popVerificar.ShowOnPageLoad = true;
                }


            }
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (e.Item.Name.Equals("Nuevo"))
            {
                popInsArroz.ShowOnPageLoad = true;
                dteFechReg.Date = DateTime.Now;
            }

        }

        protected void GvDatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 138, "Elimina Registro");

            UsuarioClass us = new UsuarioClass();

            var veri = us.idUsuarioVerificador(Convert.ToInt32(Session["IDCVTUsuario"]));

            if (veri == "False")
            {
                e.Cancel = true;
            }
        }

        protected void GvDatos_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 138, "Actualiza Registro");
           
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
    }
}