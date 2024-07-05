using System;

namespace CVT_MermasRecepcion.SAP
{
    public partial class RebajaFilm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cbo_mes.Value = DateTime.Now.Month;
                cbo_año.Value = DateTime.Now.Year;
            }
        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //    this.ASPxGridViewExporter1.FileName = "Rebaja Film "+ cbo_año.Value.ToString()+"-"+cbo_mes.Value.ToString();
        //    Options.SheetName = this.ASPxGridViewExporter1.FileName;
        //    this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        //}

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            GvDatos.DataBind();
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Rebaja Film " + cbo_año.Value.ToString() + "-" + cbo_mes.Value.ToString();
            }
        }

        protected void cbo_mes_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}