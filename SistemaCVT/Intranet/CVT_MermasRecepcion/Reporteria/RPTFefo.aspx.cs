using System;
using System.Data;
using System.Web.UI;

namespace CVT_MermasRecepcion.Reporteria
{
    public partial class RPTFefo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                //LqDsGvDatos.Where = Session["Parametros"].ToString();
                //ASPxGridView1.DataBind();
                CargaDatos();
            }

        }

        protected void btn_Generar_Click(object sender, EventArgs e)
        {
            CargaDatos();

        }
        private void CargaDatos()
        {
            if (cbo_producto.Value != null)
            {
                LqDsGvDatos.WhereParameters.Clear();
                LqDsGvDatos.WhereParameters.Add("Prod", DbType.String, cbo_producto.Value.ToString());
                LqDsGvDatos.WhereParameters.Add("Bod", DbType.String, cbo_bodega.Value.ToString());
                LqDsGvDatos.Where = "ArticleProvider_CodClient=@Prod && Site_ShortDescription=@bod";
            }
            else
            {
                LqDsGvDatos.WhereParameters.Clear();
                LqDsGvDatos.WhereParameters.Add("Bod", DbType.String, cbo_bodega.Value.ToString());
                LqDsGvDatos.Where = "Site_ShortDescription=@bod";
            }


            //Session["Parametros"] = LqDsGvDatos.Where.ToString();
            ASPxGridView1.DataBind();
        }

        protected void ASPxGridView1_DetailRowExpandedChanged(object sender, DevExpress.Web.ASPxGridViewDetailRowEventArgs e)
        {
            Session["Producto"] = ((DevExpress.Web.ASPxGridView)(sender)).GetRowValues(e.VisibleIndex, "ArticleProvider_CodClient");
            Session["Bodega"] = ((DevExpress.Web.ASPxGridView)(sender)).GetRowValues(e.VisibleIndex, "Site_ShortDescription");
            Session["Lote"] = ((DevExpress.Web.ASPxGridView)(sender)).GetRowValues(e.VisibleIndex, "Lote");
            Session["FProduccion"] = ((DevExpress.Web.ASPxGridView)(sender)).GetRowValues(e.VisibleIndex, "FProduccion");

        }

        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {
            if (cbo_producto.Value != null)
            {
                DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
                this.GridExporter.GridViewID = "ASPxGridView1";
                this.GridExporter.FileName = "Informe FEFO " + cbo_producto.Value.ToString() + ":" + cbo_bodega.Value.ToString();
                Options.SheetName = this.GridExporter.FileName;
                this.GridExporter.WriteXlsToResponse(Options);
            }
            else
            {
                DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
                this.GridExporter.GridViewID = "ASPxGridView1";
                this.GridExporter.FileName = "Informe FEFO :" + cbo_bodega.Value.ToString();
                Options.SheetName = this.GridExporter.FileName;
                this.GridExporter.WriteXlsToResponse(Options);
            }

        }

        protected void cmdExcelDetalle_Click(object sender, ImageClickEventArgs e)
        {

            DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
            this.GridExporter.GridViewID = "ASPxGridView2";
            this.GridExporter.FileName = "Informe FEFO Lote " + Session["Producto"].ToString() + ":" + cbo_bodega.Value.ToString() + ":" + Session["Lote"].ToString();
            Options.SheetName = this.GridExporter.FileName;
            this.GridExporter.WriteXlsToResponse(Options);



        }
    }
}