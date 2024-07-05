using DBMermasRecepcion;
using System;

namespace CVT_MermasRecepcion.Mantenedores
{
    public partial class SocioNegocios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GvDatos.DataBind();
            if (!IsPostBack)
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 105, "Ingreso");
            }
        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    LogClass vLog = new LogClass();
        //    vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 105, "Boton");
        //    DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //    this.ASPxGridViewExporter1.FileName = "Socios";
        //    this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        //}

        //protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        //{
        //    LogClass vLog = new LogClass();
        //    vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 105, "Boton");
        //    GvDatos.AddNewRow();
        //}

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)

        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 105, "Crea Registro");

            e.NewValues["Company_Id"] = Convert.ToInt32(1);
            e.NewValues["Language_Id"] = Convert.ToInt32(159);
            e.NewValues["Country_Id"] = Convert.ToInt32(41);
            e.NewValues["Business_Partner_Type"] = Convert.ToInt32(1);
            e.NewValues["Category_Id"] = Convert.ToInt32(1);
            e.NewValues["Business_Partner_Id"] = e.NewValues["Business_Partner_CId"];
            e.NewValues["BusinessType_Id"] = Convert.ToInt32(1);

        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Socios";
            }
        }

        protected void GvDatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 105, "Elimina Registro");
        }
    }
}