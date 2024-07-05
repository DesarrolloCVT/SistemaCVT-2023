using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Tareas
{
    public partial class TareaInforme : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //TareasClass tr = new TareasClass();
            int idPerfil = Convert.ToInt32(Session["PerfilId"]);
            //int idUsuario = Convert.ToInt32(Session["IDCVTUsuario"]);
            //Session["AreaUser"]  = tr.AreaUser(idUsuario);
            ////cboArea.Visible = false;

            if(!IsPostBack)
            {
                if (idPerfil == 1)
                {                  
                    cboArea.Visible = true;
                }
                else { cboArea.Visible = false; }

            }
          

         


            //else if (idPerfil == 13)
            //{
            //    LqsDatosTareas.WhereParameters.Clear();
            //    LqsDatosTareas.WhereParameters.Add("idArea", System.Data.DbType.Int32, AreaUser.ToString());
            //    //LqDsCuentas.WhereParameters.Add("phasta", cbo_phasta0.Value.ToString());
            //    LqsDatosTareas.Where = "DptoID=@idArea";
            //}
            //else
            //{
            //    LqsDatosTareas.WhereParameters.Clear();
            //    LqsDatosTareas.WhereParameters.Add("IdAsignado", System.Data.DbType.Int32, idUsuario.ToString());
            //    //LqDsCuentas.WhereParameters.Add("phasta", cbo_phasta0.Value.ToString());
            //    LqsDatosTareas.Where = "IdAsignado=@IdAsignado";

            //}
            //GvDatos.DataBind();
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Tareas/Tarea.aspx");
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            TareasClass tr = new TareasClass();
            UsuarioClass us = new UsuarioClass();
            int idPerfil = Convert.ToInt32(Session["PerfilId"]);
            int idArea =Convert.ToInt32(cboArea.Value);
            int idUsuario = Convert.ToInt32(Session["IDCVTUsuario"]);
            int Jef = us.VerificaJefeArea(idUsuario);
            DateTime dtIni = dteDesde.Date;
            DateTime dtTer = dteHasta.Date;          
            int AreaUser = tr.AreaUser(idUsuario);
     
            if (idPerfil==1)
            {
                LqsDatosTareas.WhereParameters.Clear();

                if(idArea==0)
                {
                   
                    LqsDatosTareas.WhereParameters.Add("FInicio", System.Data.DbType.DateTime, dtIni.ToString());
                    LqsDatosTareas.WhereParameters.Add("FTerm", System.Data.DbType.DateTime, dtTer.ToString());
                    LqsDatosTareas.Where = "FechaInicio>=@FInicio && FechaInicio<=@FTerm";
                    GvDatos.DataBind();
                }
                else {

                    LqsDatosTareas.WhereParameters.Add("idArea", System.Data.DbType.Int32, idArea.ToString());
                    LqsDatosTareas.WhereParameters.Add("FInicio", System.Data.DbType.DateTime, dtIni.ToString());
                    LqsDatosTareas.WhereParameters.Add("FTerm", System.Data.DbType.DateTime, dtTer.ToString());
                    LqsDatosTareas.Where = "DptoID=@idArea && FechaInicio>=@FInicio && FechaInicio<=@FTerm";
                    GvDatos.DataBind();
                }

                Session["Parametros"] = LqsDatosTareas.Where.ToString();
                GvDatos.DataBind();

            }
            else if(idPerfil==13 || Jef == 1)
            {
                LqsDatosTareas.WhereParameters.Clear();

                LqsDatosTareas.WhereParameters.Add("idArea", System.Data.DbType.Int32, AreaUser.ToString());
                LqsDatosTareas.WhereParameters.Add("FInicio", System.Data.DbType.DateTime, dtIni.ToString());
                LqsDatosTareas.WhereParameters.Add("FTerm", System.Data.DbType.DateTime, dtTer.ToString());
                LqsDatosTareas.Where = "DptoID=@idArea && FechaInicio>=@FInicio && FechaInicio<=@FTerm";
     
                Session["Parametros"] = LqsDatosTareas.Where.ToString();
                GvDatos.DataBind();
            }
            else
            {
                LqsDatosTareas.WhereParameters.Clear();
                LqsDatosTareas.WhereParameters.Add("idArea", System.Data.DbType.Int32, AreaUser.ToString());
                LqsDatosTareas.WhereParameters.Add("FInicio", System.Data.DbType.DateTime, dtIni.ToString());
                LqsDatosTareas.WhereParameters.Add("FTerm", System.Data.DbType.DateTime, dtTer.ToString());
                LqsDatosTareas.WhereParameters.Add("idus", System.Data.DbType.Int32, idUsuario.ToString());
                LqsDatosTareas.Where = "DptoID=@idArea && FechaInicio>=@FInicio && FechaInicio<=@FTerm && IdAsignado=@idus";
                Session["Parametros"] = LqsDatosTareas.Where.ToString();
                GvDatos.DataBind();
            }

           
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
        }

        protected void btnExportar_Click(object sender, EventArgs e)
        {
            LqsDatosTareas.Where = Session["Parametros"].ToString();
            GvDatos.DataBind();
            //DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
            //DevExpress.Export.ExportSettings.DefaultExportType = DevExpress.Export.ExportType.Default;
            //this.ASPxGridViewExporter1.FileName = "Informe Tareas";
            //Options.ExportMode = default;
            //Options.SheetName = this.ASPxGridViewExporter1.FileName;
            //this.ASPxGridViewExporter1.WriteXlsToResponse(Options);

            DevExpress.Export.ExportSettings.DefaultExportType = DevExpress.Export.ExportType.Default;
            ASPxGridViewExporter1.WriteXlsToResponse("Informe Tareas.xlsx");

        }
    }
}