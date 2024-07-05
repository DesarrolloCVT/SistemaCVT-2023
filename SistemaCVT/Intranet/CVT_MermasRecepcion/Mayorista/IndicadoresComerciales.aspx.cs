using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Mayorista
{
    public partial class IndicadoresComerciales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargaDatos();
        }

        private void CargaDatos()
        {
            SqlConnection con = new SqlConnection("Data Source=roble;Initial Catalog=SBO_MMETRO;User ID=sa;Password=cvt");
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            cmd.CommandTimeout = 60000;
            DataSet ds = new DataSet();
            cmd = new SqlCommand("SMM_INDICADORESCOMERCIALES", con);
            cmd.CommandType = CommandType.StoredProcedure;

            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            con.Close();

            DataTable a = new DataTable();
            DataTable b = new DataTable();
            DataTable c = new DataTable();
            DataTable d = new DataTable();
            DataTable e = new DataTable();
            DataTable f = new DataTable();
            DataTable g = new DataTable();
            DataTable h = new DataTable();
            DataTable i = new DataTable();
            DataTable j = new DataTable();

            a = ds.Tables[0];
            b = ds.Tables[1];
            c = ds.Tables[2];
            d = ds.Tables[3];
            e = ds.Tables[4];
            f = ds.Tables[5];
            g = ds.Tables[6];
            h = ds.Tables[7];
            i = ds.Tables[8];
            j = ds.Tables[9];


            //GvDatosA.Columns.Clear();
            //GvDatosA.AutoGenerateColumns = true;
            //GvDatosB.Columns.Clear();
            //GvDatosB.AutoGenerateColumns = true;
            //GvDatosC.Columns.Clear();
            //GvDatosC.AutoGenerateColumns = true;
            //GvDatosD.Columns.Clear();
            //GvDatosD.AutoGenerateColumns = true;
            //GvDatosE.Columns.Clear();
            //GvDatosE.AutoGenerateColumns = true;
            //GvDatosF.Columns.Clear();
            //GvDatosF.AutoGenerateColumns = true;
            //GvDatosG.Columns.Clear();
            //GvDatosG.AutoGenerateColumns = true;
            //GvDatosH.Columns.Clear();
            //GvDatosH.AutoGenerateColumns = true;
            //GvDatosI.Columns.Clear();
            //GvDatosI.AutoGenerateColumns = true;
            //GvDatosJ.Columns.Clear();
            //GvDatosJ.AutoGenerateColumns = true;

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

            GvDatosE.DataSource = e;
            GvDatosE.DataBind();
            Session["opcionE"] = e;

            GvDatosF.DataSource = f;
            GvDatosF.DataBind();
            Session["opcionF"] = f;

            GvDatosG.DataSource = g;
            GvDatosG.DataBind();
            Session["opcionG"] = g;

            GvDatosH.DataSource = h;
            GvDatosH.DataBind();
            Session["opcionH"] = h;

            GvDatosI.DataSource = i;
            GvDatosI.DataBind();
            Session["opcionI"] = i;

            GvDatosJ.DataSource = j;
            GvDatosJ.DataBind();
            Session["opcionJ"] = j;
        }

        protected void GvDatosA_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("ExportA"))
            {
                GvDatosA.SettingsExport.FileName = "Indicadores Globales Venta";
            }
        }

        protected void GvDatosB_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("ExportB"))
            {
                GvDatosB.SettingsExport.FileName = "Ventas por Tipo de Clientes Mes Actual";
            }
        }

        protected void GvDatosC_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("ExportC"))
            {
                GvDatosC.SettingsExport.FileName = "Ventas por Tipo de Clientes Mes Anterior";
            }
        }

        protected void GvDatosD_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("ExportD"))
            {
                GvDatosD.SettingsExport.FileName = "Ventas por Grupo de Articulo Mes Actual";
            }
        }

        protected void GvDatosE_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("ExportE"))
            {
                GvDatosE.SettingsExport.FileName = "Ventas por Grupo de Articulo Mes Anterior";
            }
        }

        protected void GvDatosF_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("ExportF"))
            {
                GvDatosF.SettingsExport.FileName = "Ventas por Tipo de Clientes - Grupo Articulo Mes Actual";
            }
        }

        protected void GvDatosG_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("ExportG"))
            {
                GvDatosG.SettingsExport.FileName = "Ventas por Tipo de Clientes - Grupo Articulo Mes Anterior";
            }
        }

        protected void GvDatosH_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("ExportH"))
            {
                GvDatosH.SettingsExport.FileName = "Ventas Por Proveedor Mes Actual";
            }
        }

        protected void GvDatosI_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("ExportI"))
            {
                GvDatosI.SettingsExport.FileName = "Ventas Por Proveedor Mes Anterior";
            }
        }

        protected void GvDatosJ_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("ExportJ"))
            {
                GvDatosJ.SettingsExport.FileName = "Venta - Costo - Margen";
            }
        }
    }
}