using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.IO;

namespace CVT_MermasRecepcion.Gestion
{
    public partial class CertificadosFumigacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                string ruta = @"\\BIGEL\certificados fumigacion";
                CargarGridviewConArchivos(ruta);     
          
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 94, "Ingreso");

            }
            else {                    
            
            
             }

        }
        private void CargarGridviewConArchivos(string ruta)
        {

            #region CertifAntiguo
            //string ruta = @"\\BIGEL\certificados fumigacion";
            //// var directorioPath = Server.MapPath("/pdf");
            //var archivos = Directory.GetFiles(ruta);
            ////litCantidad.Text = archivos.Count().ToString();

            //List<NombreArchivo> listado = new List<NombreArchivo>();

            //foreach (var a in archivos)
            //{
            //    listado.Add(new NombreArchivo { Nombre = Path.GetFileName(a).ToString(), Ruta = Path.GetFullPath(a).ToString(),Extension = Path.GetExtension(a).ToString() });
            //    //var archivo = new
            //    //{


            //    //    Nombre = Path.GetFileName(a).ToString(),
            //    //    Ruta = Path.GetFullPath(a).ToString(),
            //    //    Extension = Path.GetExtension(a).ToString()
            //    //};              

            //}

            //UtilidadCVTClass u = new UtilidadCVTClass();      
            //DBMLCVTDESAINTDataContext DBDESAINT = new DBMLCVTDESAINTDataContext();

            //u.TruncaTablaRutas();

            //foreach (var t in listado)
            //{
            //    CVT_RutaCertificadoFumigacion fu = new CVT_RutaCertificadoFumigacion();
            //    fu.Nombre = t.Nombre;
            //    fu.Ruta = t.Ruta;
            //    fu.Extension = t.Extension;

            //    DBDESAINT.CVT_RutaCertificadoFumigacion.InsertOnSubmit(fu);
            //    DBDESAINT.SubmitChanges();

            //    //u.InsertarutaCertificadosFumigacion(fu);
            //}

            ////GvDatos.DataSource = listado;
            //GvDatos.DataBind();
            ////Session["DatosListaRuta"] = listado;

            #endregion

            // var directorioPath = Server.MapPath("/pdf");
            var archivos = Directory.GetFiles(ruta);
            var folders = Directory.GetDirectories(ruta);
            //litCantidad.Text = archivos.Count().ToString();
            var listado = new List<object>();
            if (ruta == @"\\BIGEL\certificados fumigacion")
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

        public class NombreArchivo
        {
            public string Nombre { get; set; }
            public string Ruta { get; set; }
            public string Extension { get; set; }
        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            //if (e.CommandArgs.CommandName == "cmdDetalle")
            //{

            //    Response.Clear();
            //    Response.ContentType = @"application\octet-stream";
            //    System.IO.FileInfo file = new System.IO.FileInfo(e.KeyValue.ToString());
            //    Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
            //    Response.AddHeader("Content-Length", file.Length.ToString());

            //    Response.WriteFile(file.FullName);
            //    Response.Flush();

            //}
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 94, "Boton");

                string Tipo = string.Empty;
                Tipo = GvDatos.GetRowValuesByKeyValue(e.KeyValue, "Tipo").ToString();
                if (Tipo == "A")
                {

                    Response.Clear();
                    //Response.ContentType = @"application\octet-stream";
                    Response.ContentType = @"application\Pdf";
                    System.IO.FileInfo file = new System.IO.FileInfo(e.KeyValue.ToString());
                    Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
                    Response.AddHeader("Content-Length", file.Length.ToString());

                    Response.WriteFile(file.FullName);
                    Response.Flush();
                    Response.End();
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

        //protected void btnVer_Click(object sender, EventArgs e)
        //{
        //    CargarGridviewConArchivos();
        //}
    }
}