﻿using DBMermasRecepcion;
using System;

namespace CVT_MermasRecepcion.Calidad
{
    public partial class RegistroFumigacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GvDatos.DataBind();
        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //	DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //	this.ASPxGridViewExporter1.FileName = "Control Fumigacion";
        //	this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        //}

        //protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        //{
        //	GvDatos.AddNewRow();
        //}

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Control Fumigacion";
            }
        }

        protected void GvDatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 126, "Elimina Registro");
        }

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 126, "Crea Registro");
        }

        protected void GvDatos_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 126, "Actualiza Registro");
        }
    }
}