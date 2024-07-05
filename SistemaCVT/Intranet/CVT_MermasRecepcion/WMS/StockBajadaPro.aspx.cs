using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.WMS
{
    public partial class StockBajadaPro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                GvDatos.DataSource = Session["datos"];
            }
        }

        protected void btn_Generar_Click(object sender, EventArgs e)
        {
            int sitio = Convert.ToInt32(cbo_bodega.Value);
            string Codproduc = Convert.ToString(cbo_producto.Value);
            string lote = txt_lote.Text;

            ProduccionClass pro = new ProduccionClass();
            DataTable dt = new DataTable();
            dt = pro.SP_StockBajadaPedido(sitio, Codproduc, lote);
            GvDatos.DataSource = dt;
            Session["datos"] = dt;
            GvDatos.DataBind();
        }
    }
}