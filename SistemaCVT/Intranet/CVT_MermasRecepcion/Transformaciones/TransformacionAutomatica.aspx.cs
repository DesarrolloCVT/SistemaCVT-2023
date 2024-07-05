using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Transformaciones
{
    public partial class TransformacionAutomatica : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_Transformacion.Text = Session["TransformacionId"].ToString();
        }

        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {
            DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
            this.ASPxGridViewExporter1.FileName = "Detalle Transformacion " + Session["TransformacionId"].ToString();
            Options.SheetName = this.ASPxGridViewExporter1.FileName;
            this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        }

        protected void GvDatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            int key = Convert.ToInt32(e.Keys["TransformacionDet_Id"]);
            TransformacionesClass vTR = new TransformacionesClass();
            vTR.EliminaDetTransformacion(key);
            GvDatos.DataBind();
            e.Cancel = true;
        }
    }
}