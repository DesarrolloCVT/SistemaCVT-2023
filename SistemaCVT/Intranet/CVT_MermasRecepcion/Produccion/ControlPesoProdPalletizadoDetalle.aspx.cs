using DBMermasRecepcion;
using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Produccion
{
    public partial class ControlPesoProdPalletizadoDetalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
          
            e.NewValues["Id_ContrPesoPallet"]=Convert.ToInt32(Session["ControlID"]);
            ProduccionClass ps = new ProduccionClass();
            int nOrden = ps.TraeNOrdenPallet(Convert.ToInt32(Session["ControlID"]));
            e.NewValues["NPallet"] = nOrden + 1;

            string horaPso =DateTime.Now.TimeOfDay.Hours+":"+ DateTime.Now.TimeOfDay.Minutes;
            e.NewValues["HoraPeso"] = horaPso;
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

                e.Cancel = true;


            }
        }

        protected void cmdVolver_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Produccion/ControlPesoProdPalletizado.aspx");
        }

        private bool EvaluaEstadoPlan(DevExpress.Web.ASPxGridView grid, int visibleindex)
        {
            ProduccionClass pr = new ProduccionClass();
            bool ret = false;
            string Estado = pr.TraeEstadoControl(Convert.ToInt32(Session["ControlID"]));
            if (Estado != "Verificado")
            {
                ret = true;
            }
            return ret;
        }

        protected void GvDatos_CommandButtonInitialize(object sender, DevExpress.Web.ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Edit)
            {
                e.Visible = EvaluaEstadoPlan((DevExpress.Web.ASPxGridView)sender, e.VisibleIndex);
            }
            if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Delete)
            {
                e.Visible = EvaluaEstadoPlan((DevExpress.Web.ASPxGridView)sender, e.VisibleIndex);
            }          
        }
        protected void GvDatos_Init(object sender, EventArgs e)
        {
            ProduccionClass pr = new ProduccionClass();           
            string Estado = pr.TraeEstadoControl(Convert.ToInt32(Session["ControlID"]));

            if (Estado.Equals("Verificado"))
            {
                ASPxGridView grid = (ASPxGridView)sender;
                GridViewToolbar toolbar = (GridViewToolbar)grid.Toolbars.FindByName("tools");
                ((GridViewToolbarItem)toolbar.Items.FindByName("Nuevo")).Visible = false;
            }
          
            //((GridViewToolbarItem)toolbar.Items.FindByName("Edit")).ClientEnabled = true / false;
            //((GridViewToolbarItem)toolbar.Items.FindByName("Delete")).ClientEnabled = true / false;
        }
    }
}