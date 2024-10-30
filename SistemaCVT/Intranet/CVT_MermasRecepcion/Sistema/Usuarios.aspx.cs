using DBMermasRecepcion;
using System;

namespace CVT_MermasRecepcion.Sistema
{
    public partial class Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GvUsuario.DataBind();
        }

        

        protected void GvDatos_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            DBMLCVTWMSDataContext db = new DBMLCVTWMSDataContext();

            Staff vStaff = new Staff();
            LogClass lg = new LogClass();

            vStaff.Company_Id = 1;
            vStaff.Staff_Name = Convert.ToString(e.NewValues["NombreUsuario"]);
            vStaff.Staff_UserName = Convert.ToString(e.NewValues["UsuarioSistema"]);
            vStaff.Staff_Password = lg.Encrypt("1234", true);
            vStaff.Profiles_Id = 21;
            vStaff.Staff_Enabled = 1;

            db.Staff.InsertOnSubmit(vStaff);
            db.SubmitChanges();
        }

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            LogClass lg = new LogClass();
            e.NewValues["FechaRegistro"] = DateTime.Now;
            e.NewValues["FechaUpdate"] = DateTime.Now;
            e.NewValues["Clave"] = "1234";
            e.NewValues["ClaveEncriptada"] = lg.Encrypt("1234", true);
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 112, "Crea Registro");
        }

        protected void GvDatos_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            e.NewValues["FechaUpdate"] = DateTime.Now;

            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 112, "Actualiza Registro");
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvUsuario.SettingsExport.FileName = "Usuarios";
            }
        }

        protected void GvDatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 112, "Elimina Registro");
        }
    }
}
