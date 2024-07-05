using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.MayoristaReportes
{
    public partial class Rentabilidad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                GvDatosA.DataSource = Session["opcionA"];
                GvDatosAA.DataSource = Session["opcionAA"];
                GvDatosB.DataSource = Session["opcionB"];
                GvDatosC.DataSource = Session["opcionC"];
                GvDatosCC.DataSource = Session["opcionCC"];
                GvDatosD.DataSource = Session["opcionD"];
                GvDatosDD.DataSource = Session["opcionDD"];
                GvDatosF.DataSource = Session["opcionF"];
                GvDatosFF.DataSource = Session["opcionFF"];
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            //MMetroClass mc = new MMetroClass();
            //DataTable dt = mc.sp_Rentabilidad(dteFInicio.Date, dteFTermino.Date);
            //GvDatos.DataSource = dt;
            //Session["datos"] = dt;
            //GvDatos.DataBind();

            SqlConnection con = new SqlConnection("Data Source=alerce;Initial Catalog=SBO_MMETRO;User ID=sa;Password=cvt.vdp22$");
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            cmd.CommandTimeout = 60000;
            DataSet ds = new DataSet();
            cmd = new SqlCommand("CVT_Rentabilidad", con);
            cmd.Parameters.Add("@FecDesde", SqlDbType.Date);
            cmd.Parameters["@FecDesde"].Value = dteFInicio.Date;

            cmd.Parameters.Add("@FecHasta", SqlDbType.Date);
            cmd.Parameters["@FecHasta"].Value = dteFTermino.Date;
            cmd.CommandType = CommandType.StoredProcedure;

            da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            con.Close();

            DataTable a = new DataTable();
            DataTable b = new DataTable();
            DataTable c = new DataTable();
            DataTable d = new DataTable();
            DataTable f = new DataTable();

            a = ds.Tables[0];
            b = ds.Tables[1];
            c = ds.Tables[2];
            d = ds.Tables[3];
            f = ds.Tables[4];

            GvDatosA.DataSource = a;
            GvDatosA.DataBind();
            Session["opcionA"] = a;

            GvDatosAA.DataSource = a;
            GvDatosAA.DataBind();
            Session["opcionAA"] = a;

            GvDatosB.DataSource = b;
            GvDatosB.DataBind();
            Session["opcionB"] = b;

            GvDatosC.DataSource = c;
            GvDatosC.DataBind();
            Session["opcionC"] = c;

            GvDatosCC.DataSource = c;
            GvDatosCC.DataBind();
            Session["opcionCC"] = c;

            GvDatosD.DataSource = d;
            GvDatosD.DataBind();
            Session["opcionD"] = d;

            GvDatosDD.DataSource = d;
            GvDatosDD.DataBind();
            Session["opcionDD"] = d;

            GvDatosF.DataSource = f;
            GvDatosF.DataBind();
            Session["opcionF"] = f;

            GvDatosFF.DataSource = f;
            GvDatosFF.DataBind();
            Session["opcionFF"] = f;


        }

        protected void GvDatosAA_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("ExportA"))
            {
                GvDatosAA.SettingsExport.FileName = "Rentabilidad Mensual-" + dteFInicio.Date.ToString() + "-" + dteFTermino.Date.ToString();
            }
        }

        protected void GvDatosB_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("ExportB"))
            {
                GvDatosB.SettingsExport.FileName = "Rentabilidad Acomulada-" + dteFInicio.Date.ToString() + "-" + dteFTermino.Date.ToString();
            }
        }

        protected void GvDatosCC_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("ExportC"))
            {
                GvDatosCC.SettingsExport.FileName = "Rentabilidad Por Grupo Cliente-" + dteFInicio.Date.ToString() + "-" + dteFTermino.Date.ToString();
            }
        }

        protected void GvDatosDD_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("ExportD"))
            {
                GvDatosDD.SettingsExport.FileName = "Rentabilidad Por Grupo Proveedor-" + dteFInicio.Date.ToString() + "-" + dteFTermino.Date.ToString();
            }
        }

        protected void GvDatosFF_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("ExportF"))
            {
                GvDatosFF.SettingsExport.FileName = "Rotacion Mensual-" + dteFInicio.Date.ToString() + "-" + dteFTermino.Date.ToString();
            }
        }

        protected void BtnExpotar1_Click(object sender, EventArgs e)
        {
            DevExpress.Export.ExportSettings.DefaultExportType = DevExpress.Export.ExportType.WYSIWYG;
            ASPxPivotGridExporter1.ExportXlsToResponse("Rentabilidad Mensual-" + dteFInicio.Date.ToString() + "-" + dteFTermino.Date.ToString());
        }

        protected void Exportar2_Click(object sender, EventArgs e)
        {
          
            DevExpress.Export.ExportSettings.DefaultExportType = DevExpress.Export.ExportType.WYSIWYG;
            ASPxPivotGridExporter2.ExportXlsToResponse("Rentabilidad Por Grupo Cliente-" + dteFInicio.Date.ToString() + "-" + dteFTermino.Date.ToString());
        }

        protected void Exportar3_Click(object sender, EventArgs e)
        {

            DevExpress.Export.ExportSettings.DefaultExportType = DevExpress.Export.ExportType.WYSIWYG;
            ASPxPivotGridExporter3.ExportXlsToResponse("Rotacion Mensual-" + dteFInicio.Date.ToString() + "-" + dteFTermino.Date.ToString());
        }

        protected void Exportar4_Click(object sender, EventArgs e)
        {
            DevExpress.Export.ExportSettings.DefaultExportType = DevExpress.Export.ExportType.WYSIWYG;
            ASPxPivotGridExporter4.ExportXlsToResponse("Rentabilidad Por Grupo Proveedor-" + dteFInicio.Date.ToString() + "-" + dteFTermino.Date.ToString());
        }
    }
}