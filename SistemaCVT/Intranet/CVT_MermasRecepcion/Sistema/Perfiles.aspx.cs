using DBMermasRecepcion;
using System;

namespace CVT_MermasRecepcion.Sistema
{
    public partial class Perfiles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        //{
        //    GvDatos.AddNewRow();
        //}

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //    this.ASPxGridViewExporter1.FileName = "Informe Perfiles";
        //    this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        //}

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                Session["IdPerfil"] = e.KeyValue;
                Response.Redirect("~/Sistema/PrivilegiosPerfil.aspx");
            }
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Informe Perfiles";
            }
        }

        protected void GvDatos_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != DevExpress.Web.GridViewRowType.Data) return;
            string NomPerfil = (string)e.GetValue("Nombre_Perfil");
            if (NomPerfil.Contains("Movile"))
            {
                //System.Web.UI.WebControls.ImageButton imgAnula = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Anula") as System.Web.UI.WebControls.ImageButton;
                System.Web.UI.WebControls.ImageButton imgDetalle = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "detalle") as System.Web.UI.WebControls.ImageButton;
                //imgAnula.Visible = false;
                imgDetalle.Visible = false;
            }
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

        private bool EvaluaEstadoPlan(DevExpress.Web.ASPxGridView grid, int visibleindex)
        {
            bool ret = true;
            string idPeMov = Convert.ToString(grid.GetRowValues(visibleindex, "Nombre_Perfil").ToString());
            if (idPeMov.Contains("Movile"))
            {
                ret = false;
            }

            return ret;
        }

        protected void GvDatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 101, "Elimina Registro");
        }

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 101, "Crea Registro");
        }

        protected void GvDatos_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 101, "Actualiza Registro");
        }
    }
}