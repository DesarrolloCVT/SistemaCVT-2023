using DBMermasRecepcion;
using System;

namespace CVT_MermasRecepcion.Produccion
{
    public partial class SalasEnvasado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 56, "Ingreso");
            }
        }

        //protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        //{
        //    LogClass vLog = new LogClass();
        //    vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 56, "Boton");
        //    GvDatos.AddNewRow();
        //}

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    LogClass vLog = new LogClass();
        //    vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 56, "Boton");
        //    DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //    this.ASPxGridViewExporter1.FileName = "SALAS ENVASADO";
        //    this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        //}

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "SALAS ENVASADO";
            }
        }

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 56, "Crea Registro");
        }

        protected void GvDatos_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 56, "Actualiza Registro");
        }
    }
}