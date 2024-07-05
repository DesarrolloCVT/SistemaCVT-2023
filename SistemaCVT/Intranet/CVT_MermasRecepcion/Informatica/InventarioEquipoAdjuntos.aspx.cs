using DBMermasRecepcion;
using System;
using System.IO;
using System.Web.UI;

namespace CVT_MermasRecepcion.Informatica
{
    public partial class InventarioEquipoAdjuntos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (e.Item.Name.Equals("Nuevo"))
            {
                popAgregar.ShowOnPageLoad = true;
            }
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            popAgregar.ShowOnPageLoad = false;
        }

        protected void btnSubirLicencia_Click(object sender, EventArgs e)
        {
            try
            {
                string name = Session["CodInventario"].ToString() + '_' + DateTime.Now.Hour + DateTime.Now.Minute + DateTime.Now.Second + '_' + FileUploadLicencia.FileName;
                FileUploadLicencia.SaveAs(@"\\bigel\\Intranet\\Informatica\\Licencias\\" + name);
                string ruta = @"\\BIGEL\\Intranet\\Informatica\\Licencias\\" + name;


                string nombre1 = Path.GetFileName(ruta).ToString();
                string Ext1 = Path.GetExtension(ruta).ToString();

                InformaticaClass inf = new InformaticaClass();

                CVT_INF_AdjuntosInventarioEquipos ad = new CVT_INF_AdjuntosInventarioEquipos();

                ad.CodInventario = Session["CodInventario"].ToString();
                ad.RutaArchivo = ruta;
                ad.NombreArchivo = nombre1;
                ad.ExtencionArchivo = Ext1;
                ad.TipoArchivo = "Licencia";
                inf.InsertaNuevoAdjunto(ad);
                GvDatos.DataBind();

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('ARCHIVO REGISTRADO');", true);

            }
            catch
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('ERROR AL SUBIR EL ARCHIVO');", true);

            }

        }

        protected void btnSubirEquipo_Click(object sender, EventArgs e)
        {
            try
            {
                string name = Session["CodInventario"].ToString() + '_' + DateTime.Now.Hour + DateTime.Now.Minute + DateTime.Now.Second + '_' + FileUploadEquipo.FileName;
                FileUploadEquipo.SaveAs(@"\\bigel\\Intranet\\Informatica\\Fotos Equipos\\" + name);
                string ruta = @"\\BIGEL\\Intranet\\Informatica\\Fotos Equipos\\" + name;


                string nombre1 = Path.GetFileName(ruta).ToString();
                string Ext1 = Path.GetExtension(ruta).ToString();

                InformaticaClass inf = new InformaticaClass();

                CVT_INF_AdjuntosInventarioEquipos ad = new CVT_INF_AdjuntosInventarioEquipos();

                ad.CodInventario = Session["CodInventario"].ToString();
                ad.RutaArchivo = ruta;
                ad.NombreArchivo = nombre1;
                ad.ExtencionArchivo = Ext1;
                ad.TipoArchivo = "Equipo";
                inf.InsertaNuevoAdjunto(ad);

                GvDatos.DataBind();
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('ARCHIVO REGISTRADO');", true);

            }
            catch
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('ERROR AL SUBIR EL ARCHIVO');", true);

            }
        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdArchivosHistorial")
            {

                Response.Clear();
                Response.ContentType = @"application\octet-stream";
                System.IO.FileInfo file = new System.IO.FileInfo(e.KeyValue.ToString());
                Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
                Response.AddHeader("Content-Length", file.Length.ToString());

                Response.WriteFile(file.FullName);
                Response.Flush();

            }
        }

        protected void GvDatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            string ruta = Convert.ToString(e.Values["RutaArchivo"]);
            File.Delete(ruta);
        }
    }
}