using DBMermasRecepcion;
using System;

namespace CVT_MermasRecepcion.Mantenedores
{
    public partial class Productos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 104, "Ingreso");
            }
        }

        //protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        //{
        //    LogClass vLog = new LogClass();
        //    vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 104, "Boton");
        //    GvDatos.AddNewRow();
        //}

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    LogClass vLog = new LogClass();
        //    vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 104, "Boton");
        //    DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //    this.ASPxGridViewExporter1.FileName = "Productos";
        //    this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        //}

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {

            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 104, "Crea Registro");

            e.NewValues["Company_Id"] = Convert.ToInt32(1);
            e.NewValues["Business_Partner_Id"] = "19";
            e.NewValues["MeasurementUnit_Id"] = Convert.ToInt32(1);
            e.NewValues["ArticleType_Id"] = Convert.ToInt32(101);
            e.NewValues["Accounts_Id"] = Convert.ToInt32(0);
            e.NewValues["Container_Id"] = Convert.ToInt32(1);
            e.NewValues["ArticleProvider_QualityStatus"] = Convert.ToInt32(1);
            e.NewValues["ArticleProvider_ControlSN"] = Convert.ToInt32(2);
            e.NewValues["ArticleProvider_ControlPN"] = Convert.ToInt32(2);
            e.NewValues["ArticleProvider_ControlLT"] = Convert.ToInt32(1);
            e.NewValues["ArticleProvider_AllowControlQuality"] = Convert.ToInt32(2);
            e.NewValues["ArticleProvider_Bulk"] = Convert.ToInt32(0);
            e.NewValues["ArticleProvider_CriticalStock"] = Convert.ToInt32(0);
            e.NewValues["ArticleProvider_EnvQty"] = Convert.ToInt32(1);
            e.NewValues["ArticleProvider_Height"] = Convert.ToDecimal(0);
            e.NewValues["ArticleProvider_Width"] = Convert.ToDecimal(0);
            e.NewValues["ArticleProvider_Length"] = Convert.ToDecimal(0);
            e.NewValues["ArticleProvider_MaxStock"] = Convert.ToInt32(0);
            e.NewValues["ArticleProvider_CreationDate"] = DateTime.Today;
            e.NewValues["ArticleProvider_UpdateDate"] = DateTime.Today;
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Productos";
            }
        }

        protected void GvDatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 104, "Elimina Registro");
        }

        protected void GvDatos_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 104, "Actualiza Registro");
        }
    }
}