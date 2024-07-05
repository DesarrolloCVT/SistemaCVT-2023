using DBMermasRecepcion;
using System;

namespace CVT_MermasRecepcion.WMS
{
    public partial class ReporteControlBodega : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //    this.ASPxGridViewExporter1.FileName = "Informe Control Bodega";
        //    Options.SheetName = this.ASPxGridViewExporter1.FileName;
        //    this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        //}

        protected void txt_clave_TextChanged(object sender, EventArgs e)
        {
            UsuarioClass vUsuario = new UsuarioClass();
            int CID = vUsuario.VerificaUsuario(txt_usuario.Text, txt_clave.Text);

            if (CID != 0)
            {
                lbl_error.Visible = false;
                lbl_j.Enabled = true;
                txt_justificacion.Enabled = true;
                btn_Grabar.Enabled = true;
                Session["UsuarioJust"] = CID;
                txt_usuario.Enabled = false;
                txt_clave.Enabled = false;
            }
            else
            {
                lbl_error.Visible = true;
                lbl_j.Enabled = false;
                txt_justificacion.Enabled = false;
                btn_Grabar.Enabled = false;
            }
        }

        protected void btn_Grabar_Click(object sender, EventArgs e)
        {
            UsuarioClass vUsuario = new UsuarioClass();
            int CID = Convert.ToInt32(Session["UsuarioJust"]);
            if (CID != 0)
            {
                ControlClass vControl = new ControlClass();
                vControl.InsertaJustificacion(Convert.ToInt32(Session["IdControl"]), CID, txt_justificacion.Text);
                PopUp_Justificacion.ShowOnPageLoad = false;
            }
            else
            {
                lbl_error.Visible = true;
                lbl_j.Enabled = false;
                txt_justificacion.Enabled = false;
                btn_Grabar.Enabled = false;
            }
        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdJustificacion")
            {
                Session["ControlId"] = e.KeyValue;
                PopUp_Justificacion.ShowOnPageLoad = true;
            }
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Informe Control Bodega";
            }
        }
    }
}