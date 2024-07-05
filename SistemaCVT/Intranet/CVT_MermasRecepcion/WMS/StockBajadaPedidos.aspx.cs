using System;

namespace CVT_MermasRecepcion.WMS
{
    public partial class StockBajadaPedidos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                string codproducto = cbo_producto.Value != null ? cbo_producto.Value.ToString() : "";
                string lote = txt_lote.Text;
                string sitioid = cbo_bodega.Value.ToString();
                LqsDatos.WhereParameters.Add("sitio", System.Data.DbType.Int32, sitioid);
                //LqDsStock.WhereParameters.Add("estado", System.Data.DbType.Int32, "3");
                LqsDatos.Where = "Site_Id==@sitio";
                if (codproducto != "")
                {
                    LqsDatos.WhereParameters.Add("Codigo", codproducto);
                    LqsDatos.Where = LqsDatos.Where.ToString() + "&& ArticleProvider_CodClient==@Codigo";
                }
                if (lote != "")
                {
                    LqsDatos.WhereParameters.Add("lote", lote);
                    LqsDatos.Where = LqsDatos.Where.ToString() + "&& Lote==@lote";
                }
                GvDatos.DataBind();
            }

        }

        protected void btn_Generar_Click(object sender, EventArgs e)
        {
            LqsDatos.WhereParameters.Clear();
            string codproducto = cbo_producto.Value != null ? cbo_producto.Value.ToString() : "";
            string lote = txt_lote.Text;
            string sitioid = cbo_bodega.Value.ToString();
            LqsDatos.WhereParameters.Add("sitio", System.Data.DbType.Int32, sitioid);
            LqsDatos.Where = "Site_Id==@sitio";
            if (codproducto != "")
            {
                LqsDatos.WhereParameters.Add("Codigo", codproducto);
                LqsDatos.Where = LqsDatos.Where.ToString() + "&& ArticleProvider_CodClient==@Codigo";

            }
            if (lote != "")
            {
                LqsDatos.WhereParameters.Add("lote", lote);
                LqsDatos.Where = LqsDatos.Where.ToString() + "&& Lote==@lote";

            }

            GvDatos.DataBind();
        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    GvDatos.ExportXlsxToResponse("Stock disponible Bajada Pedido", new XlsxExportOptionsEx { ExportType = ExportType.WYSIWYG });
        //}

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Stock disponible Bajada Pedido";
            }
        }
    }
}