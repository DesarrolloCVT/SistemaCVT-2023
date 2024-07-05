using DBMermasRecepcion;
using System;

namespace CVT_MermasRecepcion.Transformaciones
{
    public partial class AjusteAsientoTransformacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GvDatos_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != DevExpress.Web.GridViewRowType.Data) return;
            TransformacionesClass vTrans = new TransformacionesClass();
            int Estado = vTrans.ObtieneTransformacionAjustada(Convert.ToInt32(e.KeyValue));
            if (Estado != 0)
            {
                System.Web.UI.WebControls.ImageButton imgConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Confirma") as System.Web.UI.WebControls.ImageButton;
                imgConfirma.Visible = false;
            }
        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdConfirma")
            {

            }
        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //    this.ASPxGridViewExporter1.FileName = "Detalle Asientos Con Diferencia";
        //    this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        //}

        protected void btn_filtrar_Click(object sender, EventArgs e)
        {
            GvDatos.DataBind();
            GvResumen.DataBind();
        }

        protected void GvResumen_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvResumen.SettingsExport.FileName = "Resumen Asientos Con Diferencia";
            }
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Detalle Asientos Con Diferencia";
            }
        }
    }
}