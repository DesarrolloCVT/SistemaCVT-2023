using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Mantenedores
{
    public partial class SectoresSitio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    GvDatosSector.ExportXlsxToResponse("Sectores", new XlsxExportOptionsEx { ExportType = ExportType.Default });
        //}

        //protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        //{
        //    GvDatosSector.AddNewRow();
        //}

        protected void Atras_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Sitios.aspx");
        }

        protected void GvDatosSector_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 200, "Crea Registro Sectores");

            e.NewValues["Company_Id"] = 1;
            e.NewValues["Site_Id"] = Convert.ToInt32(Session["Site_Id"]);

        }

        protected void GvDatosSector_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatosSector.SettingsExport.FileName = "Sectores";
            }
        }

        protected void GvDatosSector_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 200, "Elimina Registro");
        }

        protected void GvDatosSector_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {

            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 200, "Actualiza Registro");
        }
    }
}