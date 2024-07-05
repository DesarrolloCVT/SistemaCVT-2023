using DBMermasRecepcion;
using System;
using System.Data;

namespace CVT_MermasRecepcion.Mayorista
{
    public partial class StockVentas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                GvDatos.DataSource = Session["Datos"];
            }
           
        }
        //private void CargaGrilla()
        //{
          
        //}

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    GvDatos.ExportXlsxToResponse("Stock+Ventas", new XlsxExportOptionsEx { ExportType = ExportType.Default });
        //}

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Stock+Ventas";
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {


            MMetroClass mme = new MMetroClass();
            DataTable dt = new DataTable();
            dt = mme.SP_StockVentas(dteInicio.Date,dteTermino.Date);
            GvDatos.DataSource = dt;
            Session["Datos"] = dt;
            GvDatos.DataBind();
        }
    }
}