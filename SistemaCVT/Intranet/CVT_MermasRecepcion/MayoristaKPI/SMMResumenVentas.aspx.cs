using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.MayoristaKPI
{
    public partial class SMMResumenVentas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack){

                GvDatosA.DataSource = Session["opcionA"];
                GvDatosB.DataSource = Session["opcionB"];
                GvDatosC.DataSource = Session["opcionC"];
                GvDatosD.DataSource = Session["opcionD"];
                GvDatosE.DataSource = Session["opcionE"];
                GvDatosF.DataSource = Session["opcionF"];

            }
            PanelA.Collapsed = true;
            PanelB.Collapsed = true;
            PanelC.Collapsed = true;
        }

        protected void btnBuscars_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=roble;Initial Catalog=SBO_MMETRO;User ID=sa;Password=cvt");
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            cmd.CommandTimeout = 60000;
            DataSet ds = new DataSet();
            cmd = new SqlCommand("CVT_TEST_LISTAPRECIO", con);

            cmd.Parameters.Add("@FecDesde", SqlDbType.Date);
            cmd.Parameters["@FecDesde"].Value = dteInicio.Date;

            cmd.Parameters.Add("@FecHasta", SqlDbType.Date);
            cmd.Parameters["@FecHasta"].Value = dteTermino.Date;

            cmd.CommandType = CommandType.StoredProcedure;

            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            con.Close();

            DataTable a = new DataTable();
            DataTable b = new DataTable();
            DataTable c = new DataTable();
            DataTable d = new DataTable();
            DataTable ee = new DataTable();
            DataTable f = new DataTable();

            a = ds.Tables[0];
            b = ds.Tables[1];
            c = ds.Tables[2];
            d = ds.Tables[3];
            ee = ds.Tables[4];
            f = ds.Tables[5];


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

            GvDatosE.DataSource = ee;
            GvDatosE.DataBind();
            Session["opcionE"] = ee;

            GvDatosF.DataSource = f;
            GvDatosF.DataBind();
            Session["opcionF"] = f;
        }

        protected void GvDatosA_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("ExportA"))
            {
                GvDatosA.SettingsExport.FileName = "Ventas por Grupo Cliente";
            }
        }

        protected void GvDatosB_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("ExportB"))
            {
                GvDatosB.SettingsExport.FileName = "Ventas por Grupo Cliente Ultimo dia"+dteTermino.Date.Day.ToString()+" de "+dteTermino.Date.Month.ToString();
            }
        }

        protected void GvDatosC_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("ExportC"))
            {
                GvDatosC.SettingsExport.FileName = "Ventas por Vendedor";
            }
        }

        protected void GvDatosD_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("ExportD"))
            {
                GvDatosD.SettingsExport.FileName = "Ventas por Vendedor Ultimo dia" + dteTermino.Date.Day.ToString() + " de " + dteTermino.Date.Month.ToString();
            }
        }

        protected void GvDatosE_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("ExportE"))
            { 
                
                GvDatosE.SettingsExport.FileName = "Ventas por Grupo Producto";
            }
        }

        protected void GvDatosF_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("ExportF"))
            {
                GvDatosF.SettingsExport.FileName = "Ventas por Grupo Producto Ultimo dia " + dteTermino.Date.Day.ToString() + " de " + dteTermino.Date.Month.ToString();
            }
        }
    }
}