﻿using DBMermasRecepcion;
using System;

namespace CVT_MermasRecepcion.Sistema
{
    public partial class PrivilegiosPerfilXamarin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {

            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Privilegios Xamarin";
            }
        }

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["idPerfil"] = Convert.ToInt32(Session["IdPerfil"]);
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 264, "Crea Registro");
        }

        protected void GvDatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 264, "Elimina Registro");
        }

        protected void GvDatos_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 264, "Actualiza Registro");
        }
    }
}