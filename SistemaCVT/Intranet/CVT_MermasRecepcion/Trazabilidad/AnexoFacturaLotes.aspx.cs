using System;

namespace CVT_MermasRecepcion.Trazabilidad
{
    public partial class AnexoFacturaLotes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {

                string m = GvDatos.GetRowValuesByKeyValue(e.KeyValue, "ANEXO").ToString();
                if (m.Contains("10.0.20.3:81"))
                { Response.Redirect(m); }
                else
                {
                    Response.Clear();
                    Response.ContentType = @"application\octet-stream";
                    System.IO.FileInfo file = new System.IO.FileInfo(m);
                    Response.AddHeader("Content-Disposition", "attachment; filename=" + file.Name);
                    Response.AddHeader("Content-Length", file.Length.ToString());
                    Response.ContentType = "application/octet-stream";
                    Response.WriteFile(file.FullName);
                    Response.Flush();
                }
            }

        }

        protected void btn_Buscar_Click(object sender, EventArgs e)
        {
            GvDatos.DataBind();
        }
    }
}