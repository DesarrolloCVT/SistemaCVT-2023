using DBMermasRecepcion;
using System;

namespace CVT_MermasRecepcion.Inventario
{
    public partial class Inventario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {

                Session["Inventario_Id"] = e.KeyValue;
                Response.Redirect("~/Inventario/DetalleInventario.aspx");
            }
           
        }

        

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 68, "Crea Registro");

            AsistenciaClass vAsistencia = new AsistenciaClass();
            e.NewValues["Id_Usuario"] = vAsistencia.obtenerIdUsuario(Session["CIDUsuario"].ToString());
            e.NewValues["FechaCreacion"] = DateTime.Now;
        }

        protected void GvDatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 68, "Elimina Registro");
        }

        protected void GvDatos_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 68, "Actualiza Registro");
        }
    }
}