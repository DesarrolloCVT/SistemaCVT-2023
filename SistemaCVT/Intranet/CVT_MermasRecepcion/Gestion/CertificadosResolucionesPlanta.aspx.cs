using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.IO;
using System.Web.UI;

namespace CVT_MermasRecepcion.Gestion
{
    public partial class CertificadosResolucionesPlanta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                string ruta = @"\\Bigel\certif y resoluciones planta";
                CargarGridviewConArchivos(ruta);
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 94, "Ingreso");

            }
            //else
            //{
            //    try
            //    {
            //        GvDatos.DataSource = Session["datos"];
            //    }
            //    catch { }
            //}
        }
        private void CargarGridviewConArchivos(string ruta)
        {
            // var directorioPath = Server.MapPath("/pdf");
            var archivos = Directory.GetFiles(ruta);
            var folders = Directory.GetDirectories(ruta);
            //litCantidad.Text = archivos.Count().ToString();
            var listado = new List<object>();
            if (ruta == @"\\Bigel\certif y resoluciones planta")
            {

                foreach (var a in archivos)
                {
                    var archivo = new
                    {
                        Tipo = "A",
                        Nombre = Path.GetFileName(a).ToString(),
                        Ruta = Path.GetFullPath(a).ToString(),
                        Extension = Path.GetExtension(a).ToString()
                    };
                    listado.Add(archivo);
                }
                foreach (var d in folders)
                {
                    var archivo = new
                    {
                        Tipo = "C",
                        Nombre = Path.GetFileName(d).ToString(),
                        Ruta = Path.GetFullPath(d).ToString(),
                        Extension = Path.GetExtension(d).ToString()

                    };
                    listado.Add(archivo);
                }
            }
            else
            {
                var archivoV = new
                {
                    Tipo = "C",
                    Nombre = "Volver",
                    Ruta = Path.GetDirectoryName(ruta).ToString(),
                    Extension = Path.GetExtension(ruta).ToString()

                };
                listado.Add(archivoV);
                foreach (var a in archivos)
                {
                    var archivo = new
                    {
                        Tipo = "A",
                        Nombre = Path.GetFileName(a).ToString(),
                        Ruta = Path.GetFullPath(a).ToString(),
                        Extension = Path.GetExtension(a).ToString()
                    };
                    listado.Add(archivo);
                }
                foreach (var d in folders)
                {
                    var archivo = new
                    {
                        Tipo = "C",
                        Nombre = Path.GetFileName(d).ToString(),
                        Ruta = Path.GetFullPath(d).ToString(),
                        Extension = Path.GetExtension(d).ToString()

                    };
                    listado.Add(archivo);
                }
            }

            //Session["datos"] = listado;
            GvDatos.DataSource = listado;
            GvDatos.DataBind();

        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 94, "Boton");
                string Tipo = string.Empty;
                Tipo = GvDatos.GetRowValuesByKeyValue(e.KeyValue, "Tipo").ToString();
                if (Tipo == "A")
                {

                    Response.Clear();
                    Response.ContentType = @"application\octet-stream";
                    System.IO.FileInfo file = new System.IO.FileInfo(e.KeyValue.ToString());
                    Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
                    Response.AddHeader("Content-Length", file.Length.ToString());

                    Response.WriteFile(file.FullName);
                    Response.Flush();
                }
                if (Tipo == "C")
                {
                    CargarGridviewConArchivos(e.KeyValue.ToString());
                }
            }
        }

        protected void GvDatos_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != DevExpress.Web.GridViewRowType.Data) return;
            string Tipo = e.GetValue("Tipo").ToString();
            if (Tipo == "C")
            {
                System.Web.UI.WebControls.ImageButton detalle = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "detalle") as System.Web.UI.WebControls.ImageButton;
                string nombre = e.GetValue("Nombre").ToString();
                if (nombre == "Volver")
                {
                    detalle.ImageUrl = "~/Images/back.png";
                }
                else
                {
                    detalle.ImageUrl = "~/Images/treeview_add.gif";
                }

            }
        }
    }
}