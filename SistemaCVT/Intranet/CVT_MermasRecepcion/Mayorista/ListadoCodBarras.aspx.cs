﻿using System;

namespace CVT_MermasRecepcion.Mayorista
{
    public partial class ListadoCodBarras : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Listado CodBarras-" + DateTime.Now;
            }
        }
    }
}