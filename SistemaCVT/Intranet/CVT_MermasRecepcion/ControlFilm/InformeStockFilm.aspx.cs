using DBMermasRecepcion;
using System;
using System.Data;

namespace CVT_MermasRecepcion.ControlFilm
{
    public partial class InformeStockFilm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (IsPostBack)
            //{
            //    string codproducto = cbo_producto.Value != null ? cbo_producto.Value.ToString() : "";
            //    string lote = txt_lote.Text;
            //    string sitioid = cbo_bodega.Value.ToString();
            //    LqsInfStockFilm.WhereParameters.Add("sitio", System.Data.DbType.String, sitioid);
            //    LqsInfStockFilm.Where = "BodegaActual==@sitio";
            //    if (codproducto != "")
            //    {
            //        LqsInfStockFilm.WhereParameters.Add("Codigo", codproducto);
            //        LqsInfStockFilm.Where = LqsInfStockFilm.Where.ToString() + "&& CodProducto==@Codigo";
            //    }
            //    if (lote != "")
            //    {
            //        LqsInfStockFilm.WhereParameters.Add("lote", lote);
            //        LqsInfStockFilm.Where = LqsInfStockFilm.Where.ToString() + "&& LoteInterno.Contains(@lote)";
            //    }
            //    GvDatos.DataBind();
            //}
            if (IsPostBack)
            {
                GvDatos.DataSource = Session["Opcion"];
            }
        }

        protected void btn_Buscar_Click(object sender, EventArgs e)
        {
            ControlFilmClass cfc = new ControlFilmClass();
            string prod = Convert.ToString(cbo_producto.Value).Equals(string.Empty) ? "" : Convert.ToString(cbo_producto.Value);
            string lote = txt_lote.Text;

            DataTable dt = cfc.SP_inf_Stock_Film(Convert.ToString(cbo_bodega.Value), prod, lote);
            GvDatos.DataSource = dt;
            GvDatos.DataBind();
            Session["Opcion"] = dt;

            GvDatos.DataBind();
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Informe Stock Film " + DateTime.Now.ToShortDateString();
            }
        }
    }
}