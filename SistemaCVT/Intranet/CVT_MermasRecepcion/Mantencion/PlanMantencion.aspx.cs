using DBMermasRecepcion;
using System;
using System.Web.UI;


namespace CVT_MermasRecepcion.Mantencion
{
    public partial class PlanMantencion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cmdNuevo_Click(object sender, ImageClickEventArgs e)
        {
            GvEncabezado.AddNewRow();
            GvEncabezado.DataBind();
        }
        protected void GvEncabezado_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 154, "Crea Registro");

            e.NewValues["Usuario"] = Convert.ToString(Session["NombreUsuario"]);
            e.NewValues["Fecha_Registro"] = DateTime.Now;
            e.NewValues["Estado"] = "Creado";
            GvEncabezado.DataBind();
        }



        protected void GvEncabezado_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                Session["Id_PlanMantencion"] = e.KeyValue;
                Response.Redirect("~/Mantencion/PlanMantencionDetalle.aspx");
            }
            if (e.CommandArgs.CommandName == "cmdConfirma")
            {
                int idplan = Convert.ToInt32(e.KeyValue);
                PlanMantencionClass PLM = new PlanMantencionClass();
                PLM.ActualizaEstadoPlan(idplan);
                GvEncabezado.DataBind();
            }
        }

        protected void GvEncabezado_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType == DevExpress.Web.GridViewRowType.Data)
            {
                string Estado = (string)e.GetValue("Estado");
                if (Estado.Equals("Terminado"))
                {
                    System.Web.UI.WebControls.ImageButton imgDetalle = GvEncabezado.FindRowCellTemplateControl(e.VisibleIndex, null, "detalle") as System.Web.UI.WebControls.ImageButton;
                    System.Web.UI.WebControls.ImageButton imgConfirma = GvEncabezado.FindRowCellTemplateControl(e.VisibleIndex, null, "Confirma") as System.Web.UI.WebControls.ImageButton;
                    imgDetalle.Visible = true;
                    imgConfirma.Visible = false;
                }
            }

        }

        protected void GvEncabezado_CommandButtonInitialize(object sender, DevExpress.Web.ASPxGridViewCommandButtonEventArgs e)
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
            bool ret = false;
            string Estado = grid.GetRowValues(visibleindex, "Estado").ToString();
            if (Estado != "Terminado")
            {
                ret = true;
            }
            return ret;
        }

        protected void GvEncabezado_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 154, "Elimina Registro");
        }

        protected void GvEncabezado_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 154, "Actualiza Registro");
        }
    }
}