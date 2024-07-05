using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CVT_MermasRecepcion.WMS;

namespace CVT_MermasRecepcion.Trazabilidad
{
    public partial class EjercicioTrazabilidadMP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                ReCargaGrillas();
            }
            
        }
        private void CargaGrillas()
        {
            SqlConnection con = new SqlConnection("Data Source=Alerce;Initial Catalog=SBO_CVTRADING;User ID=sa;Password=cvt.vdp22$");
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            //cmd.CommandTimeout = 60000;
            DataSet ds = new DataSet();
            cmd = new SqlCommand("SP_TrazabilidadMP", con);

            cmd.CommandType = CommandType.StoredProcedure;

            //cmd.Parameters.Add("@FecDesde", SqlDbType.Date);
            //cmd.Parameters["@FecDesde"].Value = dteFini.Date;

            cmd.Parameters.Add("@LoteAuditable", SqlDbType.VarChar);
            cmd.Parameters["@LoteAuditable"].Value = txt_lote.Text;
            cmd.CommandTimeout = 3000;
            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            con.Close();

            DataTable Recepciones = new DataTable();
            DataTable ConsumosMP = new DataTable();
            DataTable Ventas = new DataTable();
            DataTable Consumibles = new DataTable();


            Recepciones = ds.Tables[0];
            ConsumosMP = ds.Tables[1];
            Ventas = ds.Tables[2];
            Consumibles = ds.Tables[3];
            Session["Recepciones"] = Recepciones;
            Session["ConsumosMP"] = ConsumosMP;
            Session["Ventas"] = Ventas;
            Session["Consumibles"] = Consumibles;

            GV_Recepciones.DataSource = Recepciones;
            GV_Recepciones.DataBind();
            GV_ConsumosMP.DataSource = ConsumosMP;
            GV_ConsumosMP.DataBind();
            GV_Ventas.DataSource = Ventas;
            GV_Ventas.DataBind();
            GV_Consumibles.DataSource = Consumibles;
            GV_Consumibles.DataBind();
            

        }
        private void ReCargaGrillas()
        {
            GV_Recepciones.DataSource = Session["Recepciones"];
            GV_Recepciones.DataBind();
            GV_ConsumosMP.DataSource = Session["ConsumosMP"];
            GV_ConsumosMP.DataBind();
            GV_Ventas.DataSource = Session["Ventas"];
            GV_Ventas.DataBind();
            GV_Consumibles.DataSource = Session["Consumibles"];
            GV_Consumibles.DataBind();
        }

        protected void btn_generar_Click(object sender, EventArgs e)
        {
            CargaGrillas();
        }
    }
}