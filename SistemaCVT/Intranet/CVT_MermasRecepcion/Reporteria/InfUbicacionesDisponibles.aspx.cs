using System;
using System.Data;

namespace CVT_MermasRecepcion.Reporteria
{
    public partial class InfUbicacionesDisponibles : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                try
                {
                    LqDsUbicaciones.Where = Session["Parametros"].ToString();
                    GvDatos.DataBind();
                }
                catch { }

            }
        }
        protected void btn_filtrar_Click(object sender, EventArgs e)
        {

            try
            {
                int sit = Convert.ToInt32(cb_site.Value);
                int rac = Convert.ToInt32(cb_rack.Value);

                if (cb_site.Value != null)
                {

                    LqDsUbicaciones.WhereParameters.Clear();
                    LqDsUbicaciones.WhereParameters.Add("Site_Id", DbType.Int32, sit.ToString());
                    LqDsUbicaciones.Where = "Site_Id=@Site_Id";
                    //Session["DT"] = LqDsUbicaciones;
                    //GvDatos.DataSource = Session["DT"];
                    //GvDatos.DataBind();
                    if (cb_rack.Value != null && cb_site.Value != null)
                    {
                        LqDsUbicaciones.WhereParameters.Clear(); LqDsUbicaciones.WhereParameters.Clear();
                        LqDsUbicaciones.WhereParameters.Add("Site_Id", DbType.Int32, sit.ToString());
                        LqDsUbicaciones.WhereParameters.Add("Rack_Id", DbType.Int32, rac.ToString());
                        LqDsUbicaciones.Where = "Site_Id=@Site_Id && Rack_Id=@Rack_Id";
                        //Session["DT"] = LqDsUbicaciones;
                        //GvDatos.DataSource = Session["DT"];
                        //GvDatos.DataBind();
                    }
                }


                Session["Parametros"] = LqDsUbicaciones.Where.ToString();
                GvDatos.DataBind();
            }
            catch { }
            //else
            //{
            //    if (cb_rack.Value != null)
            //    {
            //        LqDsUbicaciones.WhereParameters.Clear(); 
            //        LqDsUbicaciones.WhereParameters.Add("RACK", DbType.Int32, cb_rack.Value.ToString());
            //        LqDsUbicaciones.Where = "Rack_Id=@RACK";
            //        Session["DT"] = LqDsUbicaciones;
            //        GvDatos.DataSource = Session["DT"];
            //        GvDatos.DataBind();
            //        if (cb_site.Value != null)
            //        {
            //            LqDsUbicaciones.WhereParameters.Clear();
            //            LqDsUbicaciones.WhereParameters.Add("RACK", DbType.Int32, cb_rack.Value.ToString());
            //            LqDsUbicaciones.Where = "Rack_Id=@RACK";
            //            LqDsUbicaciones.WhereParameters.Add("SITE", DbType.Int32, cb_site.Value.ToString());
            //            LqDsUbicaciones.Where = "Site_Id=@SITE && Rack_Id=@RACK";
            //            Session["DT"] = LqDsUbicaciones;
            //            GvDatos.DataSource = Session["DT"];
            //            GvDatos.DataBind();
            //        }
            //    }
            //}

        }

        protected void btn_limpiar_Click(object sender, EventArgs e)
        {
            LqDsUbicaciones.WhereParameters.Clear();
            cb_site.SelectedIndex = -1;
            cb_rack.SelectedIndex = -1;
            GvDatos.DataBind();
            // LqDsUbicaciones.WhereParameters.Add("SITE", DbType.Int32, cb_site.Value.ToString());
            //LqDsUbicaciones.Where = "Site_Id=@SITE";
            //Session["DT"] = LqDsUbicaciones;
            //GvDatos.DataSource = Session["DT"];

        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    try
        //    {
        //        DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //        this.ASPxGridViewExporter1.FileName = "Ubicaciones disponibles";
        //        Options.SheetName = this.ASPxGridViewExporter1.FileName;
        //        this.ASPxGridViewExporter1.WriteXlsToResponse(Options);

        //    }
        //    catch (Exception)
        //    {

        //    }
        //}

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Ubicaciones disponibles";
            }
        }
    }
}