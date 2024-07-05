using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Tesoreria
{
    public partial class RendicionCostoDetalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_Rendi.Text = Session["idRendi"].ToString();
        }

        protected void cmdVolver_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Tesoreria/RendicionCostos.aspx");
        }

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["Id_Rendi"] = lbl_Rendi.Text.ToString();
            GvDatos.DataBind();
        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdAdjunto")
            {
                Session["idDetRendi"] = e.KeyValue;
                popAdjunto.ShowOnPageLoad = true;
            }
            if (e.CommandArgs.CommandName == "cmdVerAdjunto")
            {
                RendicionClass rd = new RendicionClass();
                int IdDet =Convert.ToInt32(e.KeyValue);

                string RutaDoc = rd.TraeRutaArchivo(IdDet);

                Response.Clear();
                Response.ContentType = @"application\octet-stream";
                System.IO.FileInfo file = new System.IO.FileInfo(RutaDoc);
                Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
                Response.AddHeader("Content-Length", file.Length.ToString());

                Response.WriteFile(file.FullName);
                Response.Flush();

            }
        }

        protected void FileUpload1_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {

            try
            {
                RendicionClass rd = new RendicionClass();
                string nComp = rd.TraeNumDocumento(Convert.ToInt32(Session["idDetRendi"]));

                string name = Session["idRendi"].ToString()+ "_"+nComp+"_"+e.UploadedFile.FileName;
                e.UploadedFile.SaveAs(@"\\bigel\\RENDICIONES\\" + name);
                string ruta = @"\\bigel\\RENDICIONES\\" + name;

                string nombre1 = Path.GetFileName(ruta).ToString();
                string Ext1 = Path.GetExtension(ruta).ToString();

                CVT_RendicionCostos vRuta = new CVT_RendicionCostos();
              
                int Id_RenDet = Convert.ToInt32(Session["idDetRendi"]);
     
                rd.AgregaDatosArchivo(ruta, Ext1, nombre1,Id_RenDet);
                GvDatos.DataBind();

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('ARCHIVO REGISTRADO');", true);
               
            }

            catch (Exception ex)
            {
                string err = ex.Message.ToString();
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('ERROR AL SUBIR EL ARCHIVO');", true);
            }
        }

        protected void btnCerrar_Click(object sender, EventArgs e)
        {
            popAdjunto.ShowOnPageLoad = false;
            GvDatos.DataBind();
        }
    }
}