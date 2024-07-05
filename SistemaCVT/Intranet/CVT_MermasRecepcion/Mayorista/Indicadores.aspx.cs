using DBMermasRecepcion;
using DevExpress.XtraCharts;
using System;
using System.Data;
using System.Web.UI;

namespace CVT_MermasRecepcion.Mayorista
{
    public partial class Indicadores : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //WebChartControl1.RefreshData();
            //WebChartControl1.ClearSelection();
            WebChartControl1.Series.Clear();
            WebChartControl2.Series.Clear();
        }

        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {

        }

        private void CargaGrilla()
        {

            MMetroClass mme = new MMetroClass();
            DataTable dt = new DataTable();
            dt = mme.SP_indicadores(Convert.ToDateTime(dteInicio.Value), Convert.ToDateTime(dteTermino.Value));
            GvDatos.DataSource = dt;
            GvDatos.DataBind();
        }

        protected void btnVer_Click(object sender, EventArgs e)
        {
            CargaGrilla();

            try
            {

                MMetroClass mme = new MMetroClass();
                DataTable dt = new DataTable();
                dt = mme.SP_indicadores(Convert.ToDateTime(dteInicio.Value), Convert.ToDateTime(dteTermino.Value));

                Series series = new Series("Cantidad Ventas", ViewType.Bar);
                WebChartControl1.Series.Add(series);
                series.DataSource = dt;

                series.ArgumentDataMember = "Horario";
                series.ValueDataMembers.AddRange(new string[] { "CantVentas" });
                WebChartControl1.DataBind();

                ///////////

                DataTable dt1 = new DataTable();
                dt1 = mme.SP_VentasxDia(Convert.ToDateTime(dteInicio.Value), Convert.ToDateTime(dteTermino.Value));
                GvDatos2.DataSource = dt1;
                GvDatos2.DataBind();

                Series series1 = new Series("Cantidad Ventas", ViewType.Bar);
                WebChartControl2.Series.Add(series1);
                series1.DataSource = dt1;

                series1.ArgumentDataMember = "Dia";
                series1.ValueDataMembers.AddRange(new string[] { "Cantidad" });
                WebChartControl2.DataBind();


            }
            catch (Exception)
            {


            }



        }
    }
}