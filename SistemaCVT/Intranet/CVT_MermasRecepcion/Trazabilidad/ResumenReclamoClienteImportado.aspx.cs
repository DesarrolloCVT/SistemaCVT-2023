using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace CVT_MermasRecepcion.Trazabilidad
{
    public partial class ResumenReclamoClienteImportado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                CargaGrillas();
            }
        }

        protected void btn_generar_Click(object sender, EventArgs e)
        {
            CargaGrillas();
        }
        private void CargaGrillas()
        {
            SqlConnection con = new SqlConnection("Data Source=Alerce;Initial Catalog=SBO_CVTRADING;User ID=sa;Password=cvt.vdp22$");
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            //cmd.CommandTimeout = 60000;
            DataSet ds = new DataSet();
            cmd = new SqlCommand("SP_RECLAMO_CLIENTE_IMPORTADO", con);

            cmd.CommandType = CommandType.StoredProcedure;

            //cmd.Parameters.Add("@FecDesde", SqlDbType.Date);
            //cmd.Parameters["@FecDesde"].Value = dteFini.Date;

            cmd.Parameters.Add("@OF", SqlDbType.VarChar);
            cmd.Parameters["@OF"].Value = txt_OF.Text;
            cmd.Parameters.Add("@Codigo", SqlDbType.VarChar);
            cmd.Parameters["@Codigo"].Value = cbo_producto.Value.ToString();
            cmd.Parameters.Add("@Cliente", SqlDbType.VarChar);
            cmd.Parameters["@Cliente"].Value = cbo_cliente.Value.ToString();
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            con.Close();

            DataTable Stock = new DataTable();
            DataTable Movimientos = new DataTable();
            DataTable Facturas = new DataTable();


            
            Stock = ds.Tables[0];
            Movimientos = ds.Tables[1];
            Facturas = ds.Tables[2];

            
            GV_StockActual.DataSource = Stock;
            GV_StockActual.DataBind();
            GV_Movimientos.DataSource = Movimientos;
            GV_Movimientos.DataBind();
            GV_Facturas.DataSource = Facturas;
            GV_Facturas.DataBind();

        }

    }
}