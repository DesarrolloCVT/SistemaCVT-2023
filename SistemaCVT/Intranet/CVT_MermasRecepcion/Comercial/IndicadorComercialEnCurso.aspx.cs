using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Comercial
{
    public partial class IndicadorComercialEnCurso : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {

                GvDatosA.DataSource = Session["opcionA"];
                GvDatosB.DataSource = Session["opcionB"];
                GvDatosC.DataSource = Session["opcionC"];
                GvDatosD.DataSource = Session["opcionD"];
                //GvDatosE.DataSource = Session["opcionE"];
                //GvDatosF.DataSource = Session["opcionF"];

            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=roble;Initial Catalog=SBO_CVTRADING;User ID=sa;Password=cvt");
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            //cmd.CommandTimeout = 60000;
            DataSet ds = new DataSet();
            cmd = new SqlCommand("SP_CVT_INDICADORES_COMERCIALES_EN_CURSO", con);

            cmd.Parameters.Add("@FecDesde", SqlDbType.Date);
            cmd.Parameters["@FecDesde"].Value = dteFini.Date;

            cmd.Parameters.Add("@FecHasta", SqlDbType.Date);
            cmd.Parameters["@FecHasta"].Value = dteTermino.Date;

            cmd.Parameters.Add("@ValorKiloFlete", SqlDbType.Decimal);
            cmd.Parameters["@ValorKiloFlete"].Value = Convert.ToDecimal(txtVKilo.Text);

            cmd.CommandType = CommandType.StoredProcedure;

            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            con.Close();

            DataTable a = new DataTable();
            DataTable b = new DataTable();
            DataTable c = new DataTable();
            DataTable d = new DataTable();
            //DataTable ee = new DataTable();
            //DataTable f = new DataTable();

            a = ds.Tables[0];
            b = ds.Tables[1];
            c = ds.Tables[2];
            d = ds.Tables[3];
            //ee = ds.Tables[4];
            //f = ds.Tables[5];

            GvDatosA.DataSource = a;
            GvDatosA.DataBind();
            Session["opcionA"] = a;

            GvDatosB.DataSource = b;
            GvDatosB.DataBind();
            Session["opcionB"] = b;

            GvDatosC.DataSource = c;
            GvDatosC.DataBind();
            Session["opcionC"] = c;

            GvDatosD.DataSource = d;
            GvDatosD.DataBind();
            Session["opcionD"] = d;

            //ComercialClass cC = new ComercialClass();
            //DataTable dt = cC.SP_IndicadorComercialxCliente()
            //PvDatos.DataSource = dt;
            //PvDatos.DataBind();
        }

        protected void GvDatosA_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("ExportA"))
            {
                GvDatosA.SettingsExport.FileName = "INFORME POR TIPO DE NEGOCIO-" + dteFini.Date.ToString() + "-" + dteTermino.Date.ToString();
            }
        }

        protected void GvDatosB_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("ExportB"))
            {
                GvDatosB.SettingsExport.FileName = "INFORME POR CATEGORIA PRODUCTO-" + dteFini.Date.ToString() + "-" + dteTermino.Date.ToString();
            }
        }

        protected void GvDatosC_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {

            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("ExportC"))
            {
                GvDatosC.SettingsExport.FileName = "INFORME POR VENDEDORES-" + dteFini.Date.ToString() + "-" + dteTermino.Date.ToString();
            }
        }

        protected void GvDatosD_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {

            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("ExportD"))
            {
                GvDatosD.SettingsExport.FileName = "INFORME POR CLIENTES-" + dteFini.Date.ToString() + "-" + dteTermino.Date.ToString();
            }
        }
    }
}