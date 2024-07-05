using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Mantenedores
{
    public partial class DistribucionSitios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        //{
        //    GvDistribucion.AddNewRow();
        //}

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    GvDistribucion.ExportXlsxToResponse("Distribucion Sitios", new XlsxExportOptionsEx { ExportType = ExportType.Default });
        //}

        protected void Atras_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Sitios.aspx");
        }

        protected void GvDistribucion_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 200, "Crea Registro Dist.Sitios");

            e.NewValues["Site_Id"] = Session["Site_Id"];
            e.NewValues["Company_Id"] = 1;
        }

        protected void GvDistribucion_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdLayout")
            {
                Session["id_site"] = Session["Site_Id"];
                Session["idDistri"] = e.KeyValue;
                Response.Redirect("~/Mantenedores/DistribucionLayout.aspx");
            }
        }

        protected void GvDistribucion_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDistribucion.SettingsExport.FileName = "Distribucion Sitios";
            }
        }

        protected void GvDistribucion_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 200, "Elimina Registro Dist.Sitios");
        }

        protected void GvDistribucion_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 200, "Actualiza Registro Dist.Sitios");
        }
    }
}