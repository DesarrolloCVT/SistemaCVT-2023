using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Mantenedores
{
    public partial class DistribucionLayout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                GvDatosLayout.DataBind();
            }
        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{

        //}

        //protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        //{
        //    GvDatosLayout.AddNewRow();
        //}

        protected void Atras_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("DistribucionSitios.aspx");

        }

        protected void GvDatosLayout_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {

            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 200, "Crea Registro layout");

            int pas = Convert.ToInt32(e.NewValues["Layout_Y_Pasillo"]);
            int fil = Convert.ToInt32(e.NewValues["Layout_X_Fila"]);
            int col = Convert.ToInt32(e.NewValues["Layout_Z_Columna"]);
            string srtDesc = pas + "," + fil + "," + col;

            e.NewValues["Layout_ShortDescription"] = srtDesc;
            e.NewValues["Warehouse_Id"] = Session["idDistri"];
            e.NewValues["Site_Id"] = Session["id_site"];
            e.NewValues["Company_Id"] = 1;
        }

        protected void GvDatosLayout_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatosLayout.SettingsExport.FileName = "Layout";
            }
        }

        protected void GvDatosLayout_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 200, "Elimina Registro layout");
        }

        protected void GvDatosLayout_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 200, "Actualiza Registro layout");
        }
    }
}