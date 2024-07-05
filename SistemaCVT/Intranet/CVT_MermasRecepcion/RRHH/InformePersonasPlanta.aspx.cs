using System;

namespace CVT_MermasRecepcion.RRHH
{
    public partial class InformePersonasPlanta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cboinicio.Date = DateTime.Now;
            }
            //if (IsPostBack)
            //{
            //    try
            //    {
            //        LqDsPersonas.Where = Session["Where"].ToString();
            //    }
            //    catch
            //    {
            //    }
            //}
            //GvDatos.DataSource = LqDsPersonas;
        }

        protected void btn_Procesar_Click(object sender, EventArgs e)
        {
            GvDatos.DataBind();
        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //    this.ASPxGridViewExporter1.FileName = "Informe Personas en Planta " + cboinicio.Date.ToShortDateString() + " - " + cbo_empresa.Text;
        //    Options.SheetName = this.ASPxGridViewExporter1.FileName;
        //    this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        //}

        protected void cbo_empresa_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Informe Personas en Planta " + cboinicio.Date.ToShortDateString() + " - " + cbo_empresa.Text;
            }
        }
    }
}