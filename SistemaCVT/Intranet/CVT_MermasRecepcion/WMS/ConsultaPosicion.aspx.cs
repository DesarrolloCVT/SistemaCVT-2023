using DBMermasRecepcion;
using System;
using System.Data;

namespace CVT_MermasRecepcion.WMS
{
    public partial class ConsultaPosicion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GvDatos.DataSource = Session["Opcion"];
        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            int idposi = Convert.ToInt32(txt_ubicacion.Text);
            WMSClass vWMS = new WMSClass();
            DataTable dt = new DataTable();
            dt = vWMS.SP_ConsultaPosicion(idposi);
            GvDatos.DataSource = dt;
            Session["Opcion"] = dt;
            GvResumen.DataBind();
            GvDatos.DataBind();
            GvUbicCamion.DataBind();
        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //    this.ASPxGridViewExporter1.FileName = "Consulta Ubicacion " + txt_ubicacion.Text;
        //    Options.SheetName = this.ASPxGridViewExporter1.FileName;
        //    this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        //}

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Consulta Ubicacion " + txt_ubicacion.Text;
            }
        }
    }
}