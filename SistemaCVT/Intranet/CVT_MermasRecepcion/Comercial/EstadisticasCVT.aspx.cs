using DBMermasRecepcion;
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
    public partial class EstadisticasCVT : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (IsPostBack)
            //{
            //    int tipo = Convert.ToInt32(cboTipoInforme.Value);
            //    if (tipo == 1)
            //    {
            //        GvEstadisticaTodos.DataSource = Session["DtEstadisticasCVT"];
            //    }
            //    if (tipo == 2)
            //    {
            //        GvEstadisticaRapel.DataSource = Session["DtEstadisticasCVTRapel"];
            //    }
            //    if (tipo == 3)
            //    {
            //        GvEstadisticaComision.DataSource = Session["DtEstadisticasCVTComision"];
            //    }
            //    if (tipo == 6)
            //    {
            //        GvEstadisticaVendedores.DataSource = Session["DtEstadisticasCVTVendedores"];
            //    }
            //    if (tipo == 7)
            //    {
            //        GvEstadisticaRentabilidad.DataSource = Session["DtEstadisticasCVTRentabilidad"];
            //    }
            //}
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            //SqlConnection con = new SqlConnection("Data Source=alerce;Initial Catalog=SBO_CVTRADING;User ID=sa;Password=cvt.vdp22$");          

            int tipo = Convert.ToInt32(cboTipoInforme.Value);
            int ValorKM= Convert.ToInt32(txtValorKM.Text);

            if (tipo == 1)
            {
                DivGrillaTodos.Visible = true;
                DivGrillaRapel.Visible = false;
                DivRentabilidad.Visible = false;
                DivGrillaVendedores.Visible = false;
                DivGrillaComision.Visible = false;
                DivGrillaSeguro.Visible = false;
                
                SqlDataSource1.SelectParameters.Clear();
                SqlDataSource1.SelectParameters.Add("FechaDesde", dteFinicio.Value.ToString());
                SqlDataSource1.SelectParameters.Add("fechaHasta", dteFtermino.Value.ToString());
                SqlDataSource1.SelectParameters.Add("TipoInforme", tipo.ToString());
                SqlDataSource1.SelectParameters.Add("ValorKM", ValorKM.ToString());
                
                
                GvDatoTodos.DataBind();

                //SqlDataSource1.Parameter.Add("FTerm", System.Data.DbType.DateTime, dtTer.ToString());
                //SqlDataSource1.Where = "FechaInicio>=@FInicio && FechaInicio<=@FTerm";
                //GvDatos.DataBind();

                //ComercialClass cC = new ComercialClass();
                //DataTable dt1 = cC.SP_EstadisticasCVT(dteFinicio.Date, dteFtermino.Date, tipo);

                //GvEstadisticaTodos.DataSource = dt1;
                //GvEstadisticaTodos.DataBind();
                //Session["DtEstadisticasCVT"] = dt1;
            }
            if (tipo == 2)
            {
                DivGrillaTodos.Visible = false;
                DivGrillaRapel.Visible = true;
                DivRentabilidad.Visible = false;
                DivGrillaVendedores.Visible = false;
                DivGrillaComision.Visible = false;
                DivGrillaSeguro.Visible = false;
                SqlDataRapel.SelectParameters.Clear();
                SqlDataRapel.SelectParameters.Add("FechaDesde", dteFinicio.Value.ToString());
                SqlDataRapel.SelectParameters.Add("fechaHasta", dteFtermino.Value.ToString());
                SqlDataRapel.SelectParameters.Add("TipoInforme", tipo.ToString());
                SqlDataRapel.SelectParameters.Add("ValorKM", ValorKM.ToString());
                GvEstadisticaRapel.DataBind();

                //ComercialClass cC = new ComercialClass();
                //DataTable dt2 = cC.SP_EstadisticasCVT(dteFinicio.Date, dteFtermino.Date, tipo);

                //GvEstadisticaRapel.DataSource = dt2;
                //GvEstadisticaRapel.DataBind();
                //Session["DtEstadisticasCVTRapel"] = dt2;
            }
            if (tipo == 3)
            {
                DivGrillaComision.Visible = true;
                DivGrillaRapel.Visible = false;
                DivGrillaTodos.Visible = false;
                DivRentabilidad.Visible = false;
                DivGrillaVendedores.Visible = false;
                DivGrillaSeguro.Visible = false;

                SqlsDataComision.SelectParameters.Clear();
                SqlsDataComision.SelectParameters.Add("FechaDesde ", dteFinicio.Value.ToString());
                SqlsDataComision.SelectParameters.Add("fechaHasta ", dteFtermino.Value.ToString());
                SqlsDataComision.SelectParameters.Add("TipoInforme", tipo.ToString());
                SqlsDataComision.SelectParameters.Add("ValorKM", ValorKM.ToString());
                GvEstadisticaComision.DataBind();

              
            }
            if (tipo == 5)
            {
                DivGrillaComision.Visible = false;
                DivGrillaRapel.Visible = false;
                DivGrillaTodos.Visible = false;
                DivRentabilidad.Visible = false;
                DivGrillaVendedores.Visible = false;
                DivGrillaSeguro.Visible = true;

                SqlDataSeguro.SelectParameters.Clear();
                SqlDataSeguro.SelectParameters.Add("FechaDesde ", dteFinicio.Value.ToString());
                SqlDataSeguro.SelectParameters.Add("fechaHasta ", dteFtermino.Value.ToString());
                SqlDataSeguro.SelectParameters.Add("TipoInforme", tipo.ToString());
                SqlDataSeguro.SelectParameters.Add("ValorKM", ValorKM.ToString());
                GvEstadisticasSeguro.DataBind();


            }
            if (tipo == 6)
            {
                DivGrillaVendedores.Visible = true;
                DivGrillaComision.Visible = false;
                DivGrillaRapel.Visible = false;
                DivGrillaTodos.Visible = false;
                DivRentabilidad.Visible = false;

                SqlDataVendedores.SelectParameters.Clear();
                SqlDataVendedores.SelectParameters.Add("FechaDesde ", dteFinicio.Value.ToString());
                SqlDataVendedores.SelectParameters.Add("fechaHasta ", dteFtermino.Value.ToString());
                SqlDataVendedores.SelectParameters.Add("TipoInforme", tipo.ToString());
                SqlDataVendedores.SelectParameters.Add("ValorKM", ValorKM.ToString());
                GvEstadisticaVendedores.DataBind();

               
            }
            if (tipo == 7)
            {
                DivRentabilidad.Visible = true;
                DivGrillaVendedores.Visible = false;
                DivGrillaComision.Visible = false;
                DivGrillaRapel.Visible = false;
                DivGrillaTodos.Visible = false;

                SqlDataRentabilidad.SelectParameters.Clear();
                SqlDataRentabilidad.SelectParameters.Add("FechaDesde ", dteFinicio.Value.ToString());
                SqlDataRentabilidad.SelectParameters.Add("fechaHasta ", dteFtermino.Value.ToString());
                SqlDataRentabilidad.SelectParameters.Add("TipoInforme", tipo.ToString());
                SqlDataRentabilidad.SelectParameters.Add("ValorKM", ValorKM.ToString());
                GvEstadisticaRentabilidad.DataBind();

                
            }
          

        }

        protected void GvDatoTodos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatoTodos.SettingsExport.FileName = "Estadisticas -" + dteFinicio.Date.ToString() + "-" + dteFtermino.Date.ToString();
            }
        }

        protected void GvEstadisticaRapel_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvEstadisticaRapel.SettingsExport.FileName = "Estadisticas Rapel -" + dteFinicio.Date.ToString() + "-" + dteFtermino.Date.ToString();
            }
        }

        protected void GvEstadisticaComision_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {

            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvEstadisticaComision.SettingsExport.FileName = "Estadisticas Comision -" + dteFinicio.Date.ToString() + "-" + dteFtermino.Date.ToString();
            }
        }

        protected void GvEstadisticaVendedores_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvEstadisticaVendedores.SettingsExport.FileName = "Estadisticas para Vendedores -" + dteFinicio.Date.ToString() + "-" + dteFtermino.Date.ToString();
            }
        }

        protected void GvEstadisticaRentabilidad_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {

            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvEstadisticaRentabilidad.SettingsExport.FileName = "Estadisticas para Rentabilidad -" + dteFinicio.Date.ToString() + "-" + dteFtermino.Date.ToString();
            }
        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.CommandTimeout = 3600;
        }

        protected void SqlDataRapel_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.CommandTimeout = 3600;
        }

        protected void SqlsDataComision_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.CommandTimeout = 3600;
        }

        protected void SqlDataSeguro_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.CommandTimeout = 3600;
        }

        protected void SqlDataVendedores_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.CommandTimeout = 3600;
        }

        protected void SqlDataRentabilidad_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            e.Command.CommandTimeout = 3600;
        }
    }
}