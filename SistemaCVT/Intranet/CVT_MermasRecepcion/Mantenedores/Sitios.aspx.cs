using DBMermasRecepcion;
using System;

namespace CVT_MermasRecepcion.Mantenedores
{
    public partial class Sitios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    GvDatosSitios.ExportXlsxToResponse("Sitios", new XlsxExportOptionsEx { ExportType = ExportType.Default });
        //}

        //protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        //{
        //    //GvDatosSitios.AddNewRow();
        //    PopSitios.ShowOnPageLoad = true;

        //}

        protected void GvDatosSitios_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdSectores")
            {
                Session["Site_Id"] = e.KeyValue;
                Response.Redirect("~/Mantenedores/SectoresSitio.aspx");
            }
            if (e.CommandArgs.CommandName == "cmdDisSitios")
            {
                Session["Site_Id"] = e.KeyValue;
                Response.Redirect("~/Mantenedores/DistribucionSitios.aspx");
            }
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            WMSClass WMSC = new WMSClass();
            Site st = new Site();

            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 200, "Crea Registro");

            st.Company_Id = 1;
            st.Site_Description = txtDescripcion.Text;
            st.Site_ShortDescription = txtNombreCorto.Text;
            st.Site_Notes = txtobs.Text;
            st.Site_GLN = txtGLN.Text;
            int idSitio = WMSC.CreaSitio(st);

            //crea sectores
            Sector sct = new Sector();
            sct.Company_Id = 1;
            sct.Site_Id = idSitio;
            sct.Sector_Description = "ALMACENAMIENTO";
            sct.Sector_ShortDescription = "ALMAC";
            sct.Sector_Status = 1;
            sct.Sector_AllowStack = 1;
            sct.Sector_Notes = "ALMACENAMIENTO";
            int idSector1 = WMSC.CreaNuevoSector(sct);

            Sector sct2 = new Sector();
            sct2.Company_Id = 1;
            sct2.Site_Id = idSitio;
            sct2.Sector_Description = "PALLET FAST";
            sct2.Sector_ShortDescription = "FAST";
            sct2.Sector_Status = 8;
            sct2.Sector_AllowStack = 1;
            sct2.Sector_Notes = "PALLET FAST";
            int idSector2 = WMSC.CreaNuevoSector(sct2);

            //inserta Distribucion                       
            Warehouse wh = new Warehouse();
            wh.Company_Id = 1;
            wh.Site_Id = idSitio;
            wh.Warehouse_Description = txtDescripcion.Text;
            wh.Warehouse_ShortDescription = txtNombreCorto.Text;
            wh.Warehouse_CapComercial = 9999;
            wh.Warehouse_Status = 1;
            int idWh = WMSC.InsertaNuevaDistribucion(wh);

            Layout ly = new Layout();
            ly.Company_Id = 1;
            ly.Site_Id = idSitio;
            ly.Warehouse_Id = idWh;
            ly.Sector_Id = idSector1;
            ly.Layout_Description = "Sin Posicion";
            ly.Layout_ShortDescription = "1,1,1";
            ly.Layout_Width = 1000;
            ly.Layout_Height = 1000;
            ly.Layout_Depth = 1000;
            ly.Layout_Weight = 10000;
            ly.Layout_Status = 1;
            ly.Rack_Id = 3;
            ly.Layout_Y_Pasillo = 1;
            ly.Layout_X_Fila = 1;
            ly.Layout_Z_Columna = 1;
            WMSC.CreaNuevoLayout(ly);


            Layout ly2 = new Layout();
            ly2.Company_Id = 1;
            ly2.Site_Id = idSitio;
            ly2.Warehouse_Id = idWh;
            ly2.Sector_Id = idSector1;
            ly2.Layout_Description = "Default";
            ly2.Layout_ShortDescription = "99,99,99";
            ly2.Layout_Width = 1000;
            ly2.Layout_Height = 1000;
            ly2.Layout_Depth = 1000;
            ly2.Layout_Weight = 10000;
            ly2.Layout_Status = 1;
            ly2.Rack_Id = 3;
            ly2.Layout_Y_Pasillo = 99;
            ly2.Layout_X_Fila = 99;
            ly2.Layout_Z_Columna = 99;
            WMSC.CreaNuevoLayout(ly2);

            GvDatosSitios.DataBind();
            PopSitios.ShowOnPageLoad = false;


        }

        protected void GvDatosSitios_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatosSitios.SettingsExport.FileName = "Sitios";
            }
            if (e.Item.Name.Equals("Nuevo"))
            {
                PopSitios.ShowOnPageLoad = true;
            }
        }

        protected void GvDatosSitios_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 200, "Elimina Registro");

        }

        protected void GvDatosSitios_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 200, "Actualiza Registro");
        }
    }
}