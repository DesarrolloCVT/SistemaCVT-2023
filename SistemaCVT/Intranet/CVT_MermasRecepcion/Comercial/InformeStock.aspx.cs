using System;

namespace CVT_MermasRecepcion.Comercial
{
    public partial class InformeStock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string codproducto = cbo_producto.Value != null ? cbo_producto.Value.ToString() : "";
                string lote = txt_lote.Text;
                string sitioid = cbo_bodega.Value.ToString();
                LqDsStock.WhereParameters.Add("sitio", System.Data.DbType.Int32, sitioid);
                LqDsStock.WhereParameters.Add("estado", System.Data.DbType.Int32, "3");
                LqDsStock.Where = "Site_Id==@sitio && Package_Status=@estado";
                if (codproducto != "")
                {
                    LqDsStock.WhereParameters.Add("Codigo", codproducto);
                    LqDsStock.Where = LqDsStock.Where.ToString() + "&& Cod_Cliente==@Codigo";
                }
                if (lote != "")
                {
                    LqDsStock.WhereParameters.Add("lote", lote);
                    LqDsStock.Where = LqDsStock.Where.ToString() + "&& Lote==@lote";
                }
                GvDatos.DataBind();
            }
        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //    this.ASPxGridViewExporter1.FileName = "Informe Stock " + DateTime.Now.ToShortDateString();
        //    Options.SheetName = this.ASPxGridViewExporter1.FileName;
        //    this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        //}
        protected void btn_Generar_Click(object sender, EventArgs e)
        {
            LqDsStock.WhereParameters.Clear();
            string codproducto = cbo_producto.Value != null ? cbo_producto.Value.ToString() : "";
            string lote = txt_lote.Text;
            string sitioid = cbo_bodega.Value.ToString();
            LqDsStock.WhereParameters.Add("sitio", System.Data.DbType.Int32, sitioid);
            LqDsStock.WhereParameters.Add("estado", System.Data.DbType.Int32, "3");
            LqDsStock.Where = "Site_Id==@sitio && Package_Status=@estado";
            if (codproducto != "")
            {
                LqDsStock.WhereParameters.Add("Codigo", codproducto);
                LqDsStock.Where = LqDsStock.Where.ToString() + "&& Cod_Cliente==@Codigo";
            }
            if (lote != "")
            {
                LqDsStock.WhereParameters.Add("lote", lote);
                LqDsStock.Where = LqDsStock.Where.ToString() + "&& Lote==@lote";
            }
            GvDatos.DataBind();
            //LqDsStock.Where = "";
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Informe Stock " + DateTime.Now.ToShortDateString(); ;
            }
        }
    }
}