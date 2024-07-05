using DBMermasRecepcion;
using DevExpress.Web;
using DevExpress.XtraGrid.Views.Grid;
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
    public partial class IndicadoresComercialesCVT : System.Web.UI.Page
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

            //ComercialClass com = new ComercialClass();

            //DataTable dt = new DataTable();
            //dt = com.SP_IndicadorComercialxTipoNegocio(dteFini.Date, dteTermino.Date, Convert.ToDecimal(txtVKilo.Text));
            //GvDatosA.DataSource = dt;
            //GvDatosA.DataBind();



            SqlConnection con = new SqlConnection("Data Source=alerce;Initial Catalog=SBO_CVTRADING;User ID=sa;Password=cvt.vdp22$");
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();

            DataSet ds = new DataSet();
            cmd = new SqlCommand("SP_CVT_INDICADORES_COMERCIALES", con);

            cmd.Parameters.Add("@FecDesde", SqlDbType.Date);
            cmd.Parameters["@FecDesde"].Value = dteFini.Date;

            cmd.Parameters.Add("@FecHasta", SqlDbType.Date);
            cmd.Parameters["@FecHasta"].Value = dteTermino.Date;

            cmd.Parameters.Add("@ValorKiloFlete", SqlDbType.Decimal);
            cmd.Parameters["@ValorKiloFlete"].Value = Convert.ToDecimal(txtVKilo.Text);

            cmd.CommandType = CommandType.StoredProcedure;


            da = new SqlDataAdapter(cmd);
            cmd.CommandTimeout = 60000;
            da.Fill(ds);

            con.Close();

            DataTable a = new DataTable();
            DataTable b = new DataTable();
            DataTable c = new DataTable();
            DataTable d = new DataTable();
            //DataTable ee = new DataTable();
            ////DataTable f = new DataTable();

            a = ds.Tables[0];
            b = ds.Tables[1];
            c = ds.Tables[2];
            d = ds.Tables[3];
            ////ee = ds.Tables[4];
            ////f = ds.Tables[5];

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

            ////ComercialClass cC = new ComercialClass();
            ////DataTable dt = cC.SP_IndicadorComercialxCliente()
            ////PvDatos.DataSource = dt;
            ////PvDatos.DataBind();

        }

        protected void GvDatosA_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("ExportA"))
            {
                //DevExpress.XtraPrinting.XlsxExportOptionsEx exp = new DevExpress.XtraPrinting.XlsxExportOptionsEx();

                //exp.ShowGridLines = false;               
           
                GvDatosA.SettingsExport.FileName ="INFORME POR TIPO DE NEGOCIO-"+dteFini.Date.ToString()+"-"+dteTermino.Date.ToString();
                           
           
                


               
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

        protected void GvDatosA_CustomSummaryCalculate(object sender, DevExpress.Data.CustomSummaryEventArgs e)
        {
            DevExpress.Web.ASPxSummaryItem vNeta = (sender as ASPxGridView).TotalSummary["Ven_Neta"];
            DevExpress.Web.ASPxSummaryItem vAnt = (sender as ASPxGridView).TotalSummary["Ven_netaAnt"];
            decimal  v1 = Convert.ToDecimal(((ASPxGridView)sender).GetTotalSummaryValue(vNeta));
            decimal v2 = Convert.ToDecimal(((ASPxGridView)sender).GetTotalSummaryValue(vAnt));
            e.TotalValue = v1 - v2;
        }

        protected void GvDatosB_CustomSummaryCalculate(object sender, DevExpress.Data.CustomSummaryEventArgs e)
        {
            DevExpress.Web.ASPxSummaryItem vNeta = (sender as ASPxGridView).TotalSummary["Ven_Neta"];
            DevExpress.Web.ASPxSummaryItem vAnt = (sender as ASPxGridView).TotalSummary["Ven_netaAnt"];
            decimal v1 = Convert.ToDecimal(((ASPxGridView)sender).GetTotalSummaryValue(vNeta));
            decimal v2 = Convert.ToDecimal(((ASPxGridView)sender).GetTotalSummaryValue(vAnt));
            e.TotalValue = v1 - v2;
            
        }

        protected void GvDatosC_CustomSummaryCalculate(object sender, DevExpress.Data.CustomSummaryEventArgs e)
        {

            DevExpress.Web.ASPxSummaryItem vNeta = (sender as ASPxGridView).TotalSummary["Ven_Neta"];
            DevExpress.Web.ASPxSummaryItem vAnt = (sender as ASPxGridView).TotalSummary["Ven_netaAnt"];
            decimal v1 = Convert.ToDecimal(((ASPxGridView)sender).GetTotalSummaryValue(vNeta));
            decimal v2 = Convert.ToDecimal(((ASPxGridView)sender).GetTotalSummaryValue(vAnt));
            e.TotalValue = v1 - v2;
        }

        protected void GvDatosD_CustomSummaryCalculate(object sender, DevExpress.Data.CustomSummaryEventArgs e)
        {

            DevExpress.Web.ASPxSummaryItem vNeta = (sender as ASPxGridView).TotalSummary["Ven_Neta"];
            DevExpress.Web.ASPxSummaryItem vAnt = (sender as ASPxGridView).TotalSummary["Ven_netaAnt"];
            decimal v1 = Convert.ToDecimal(((ASPxGridView)sender).GetTotalSummaryValue(vNeta));
            decimal v2 = Convert.ToDecimal(((ASPxGridView)sender).GetTotalSummaryValue(vAnt));
            e.TotalValue = v1 - v2;
        }

 

        protected void GvDatosA_ExportRenderBrick(object sender, ASPxGridViewExportRenderingEventArgs e)
        {
            e.BrickStyle.ResetBorders();
        }
    }
}