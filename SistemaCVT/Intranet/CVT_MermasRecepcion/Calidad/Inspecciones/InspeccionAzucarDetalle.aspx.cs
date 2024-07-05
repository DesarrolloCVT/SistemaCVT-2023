using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Calidad.Inspecciones
{
    public partial class InspeccionAzucarDetalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GvDatos.DataBind();
        }

        //protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        //{
        //    //GvDatos.AddNewRow();
        //    popInsAzucarDetalle.ShowOnPageLoad = true;
        //}

        protected void cmdVolver_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Calidad/Inspecciones/InspeccionAzucar.aspx");
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            CalidadClass ca = new CalidadClass();
            CVT_InspeccionPT_AzucarDetalle azu = new CVT_InspeccionPT_AzucarDetalle();

            azu.Linea = Convert.ToInt32(cboLinea.Value);
            azu.HoraAnalisis = TimeSpan.Parse(txtHora.Text);
            azu.Impuresas = Convert.ToInt16(cboImpuresas.Value);
            azu.MateriaExtranaAnimal = Convert.ToInt16(cboMateriaAnimal.Value);
            azu.MateriaExtrana = Convert.ToInt16(cboMateriaExtrana.Value);
            azu.Id_InspeccionPT_Azucar = Convert.ToInt32(Session["Id_InspeccionPT_Azucar"]);
            azu.observacion = txtObservacion.Text;

            bool result = ca.InsertaVerificacionAzucarDetalle(azu);
            if (result == true)
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 140, "Crea Registro Ins.Azuc.Det");

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registro Guardado');", true);
                GvDatos.DataBind();
                popInsAzucarDetalle.ShowOnPageLoad = false;
                limpiar();

            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al Registrar Contactar con Administrador');", true);
                limpiar();
            }
        }

        protected void limpiar()
        {
            cboLinea.SelectedIndex = -1;
            txtHora.Text = string.Empty;
            cboImpuresas.SelectedIndex = 1;
            cboMateriaAnimal.SelectedIndex = 1;
            cboMateriaExtrana.SelectedIndex = 1;
            txtObservacion.Text = string.Empty;
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {

            if (e.Item.Name.Equals("Nuevo"))
            {
                popInsAzucarDetalle.ShowOnPageLoad = true;

            }
        }

        protected void GvDatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 140, "Elimina Registro Ins.Azuc.Det");

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
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 140, "Actualiza Registro Ins.Azuc.Det");

            
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