using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.PRiesgo
{
    public partial class PermisoTrabajoSeguroAST : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PRiesgosClass pr = new PRiesgosClass();

            string est = pr.BuscaEstadoPts(Convert.ToInt32(Session["IdPTS"]));

            if (est.Equals("Iniciado")) 
            {
                FileUpload1.Visible = true;

            }
            else { FileUpload1.Visible = false; }
        }

        protected void FileUpload1_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            PRiesgosClass pr = new PRiesgosClass();

            //=

            CVT_PermisoTrabajoSeguro_AST pts = new CVT_PermisoTrabajoSeguro_AST();
            pts.FechaCarga = DateTime.Now;
            int IdAST= pr.InsertaRegistroRutaArchivoAST(pts);
            int ASTOrder = pr.TraeCantAST(Convert.ToInt32(Session["IdPTS"]));

            try
            {
                string name = e.UploadedFile.FileName;
                e.UploadedFile.SaveAs(@"\\BIGEL\\PERMISOS DE TRABAJO\\AST\\" + "PTS " + Session["IdPTS"].ToString() + "_ AST_" + ASTOrder + " "+ name);
                string ruta = @"\\BIGEL\\PERMISOS DE TRABAJO\\AST\\" + "PTS " + Session["IdPTS"].ToString() + "_ AST_" + ASTOrder + " " + name;

                string nombre1 = Path.GetFileName(ruta).ToString();
                string Ext1 = Path.GetExtension(ruta).ToString();

                //CVT_PermisoTrabajoSeguro_AST vRutaAst = new CVT_PermisoTrabajoSeguro_AST();

                //vRutaAst.Id_Ast = IdAST;
                //vRutaAst.Id_Pts = Convert.ToInt32(Session["IdPTS"]);              
                //vRutaAst.UrlAst = ruta;
                //vRutaAst.NombreArchivo = nombre1;
                

                pr.RegistraDatosAST(Convert.ToInt32(Session["IdPTS"]), IdAST, ruta, nombre1, ASTOrder);


                GvDatos.DataBind();


                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('ARCHIVO REGISTRADO');", true);
            }

            catch (Exception ex)
            {
                string ms = ex.Message;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('ERROR AL SUBIR EL ARCHIVO');", true);
            }

            GvDatos.DataBind();
        }
        protected void btnRecargaGrilla_Click(object sender, EventArgs e)
        {
            GvDatos.DataBind();
        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdVerAST")
            {

                PRiesgosClass pr = new PRiesgosClass();

                string ruta = pr.BuscaRutaArchAST(Convert.ToInt32(e.KeyValue));

                Response.Clear();
                Response.ContentType = @"application\octet-stream";
                System.IO.FileInfo file = new System.IO.FileInfo(ruta);
                Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
                Response.AddHeader("Content-Length", file.Length.ToString());

                Response.WriteFile(file.FullName);
                Response.Flush();
            }
          
        }

        protected void cmdVolver_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/PRiesgo/PermisoTrabajoSeguro.aspx");
        }
    }
}