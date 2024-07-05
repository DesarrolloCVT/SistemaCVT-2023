using DBMermasRecepcion;
using System;

namespace CVT_MermasRecepcion.Calidad
{
    public partial class AreaHigiene : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GvDatos.DataBind();
        }

        //protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        //{
        //	GvDatos.AddNewRow();
        //}

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //	DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //	this.ASPxGridViewExporter1.FileName = "Area Higiene";
        //	this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        //}

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Area Higiene";
            }
        }

        protected void GvDatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 130, "Elimina Registro");
            UsuarioClass us = new UsuarioClass();

            var veri = us.idUsuarioVerificador(Convert.ToInt32(Session["IDCVTUsuario"]));

            if (veri == "False")
            {
                lblErrorVeri.Text = "Error";
                lblErrorVeri.Focus();

                //if (IsPostBack)
                //{
                //    System.Web.UI.ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Cliente no existe o no se puede encontrar , favor verificar o registrar');", true);
                //   
                //}
                e.Cancel = true;               

            }
        }

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 130, "Crea Registro");
        }

        protected void GvDatos_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 130, "Actualiza Registro");
            UsuarioClass us = new UsuarioClass();

            var veri = us.idUsuarioVerificador(Convert.ToInt32(Session["IDCVTUsuario"]));

            if (veri == "False")
            {
                lblErrorVeri.Text = "Error";
                lblErrorVeri.Focus();
                GvDatos.SettingsPopup.EditForm.ShowFooter = true;
                GvDatos.SettingsText.PopupEditFormFooterText = "solo usuarios verificadores pueden editar";
                
                //if (IsPostBack)
                //{
                //    System.Web.UI.ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Cliente no existe o no se puede encontrar , favor verificar o registrar');", true);
                //   
                //}
                e.Cancel = true;
                //GvDatos.CancelEdit();

            }

        }
        protected void GvDatos_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            //UsuarioClass us = new UsuarioClass();

            //var veri = us.idUsuarioVerificador(Convert.ToInt32(Session["IDCVTUsuario"]));

            //if (veri == "False")
            //{
            //    lblErrorVeri.Text = "Error";
            //    lblErrorVeri.Focus();
            //    GvDatos.SettingsPopup.EditForm.ShowFooter = true;
            //    GvDatos.SettingsText.PopupEditFormFooterText = "solo usuarios verificadores pueden editar";
               
            //    //if (IsPostBack)
            //    //{
            //    //    System.Web.UI.ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Cliente no existe o no se puede encontrar , favor verificar o registrar');", true);
            //    //   
            //    //}
            //    e.Cancel = true;
            //    GvDatos.CancelEdit();

            //}
        }
    }
}