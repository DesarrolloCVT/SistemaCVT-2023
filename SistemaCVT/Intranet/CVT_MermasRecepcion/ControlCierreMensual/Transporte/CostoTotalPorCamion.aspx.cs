using System;
using System.Data;
using System.Web.UI;

namespace CVT_MermasRecepcion.ControlCierreMensual.Transporte
{
    public partial class CostoTotalPorCamion1 : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cb_Mes.Value = DateTime.Now.Month;
                txt_ano.Value = DateTime.Now.Year;
                txt_anografico.Value = DateTime.Now.Year;
            }

        }

        protected void btn_Buscar_Click(object sender, EventArgs e)
        {
            try
            {
                int mes = Convert.ToInt32(cb_Mes.Value);
                int ano = Convert.ToInt32(txt_ano.Text);
                string Patt = txt_Patente.Text;

                if (txt_ano.Text != "" && cb_Mes.Value != "")
                {

                    LqsDatosMes.WhereParameters.Clear();
                    LqsDatosMes.WhereParameters.Add("Mes", DbType.Int32, mes.ToString());
                    LqsDatosMes.WhereParameters.Add("Año", DbType.Int32, ano.ToString());

                    LqsDatosCategoria.WhereParameters.Clear();
                    LqsDatosCategoria.WhereParameters.Add("Mes", DbType.Int32, mes.ToString());
                    LqsDatosCategoria.WhereParameters.Add("Año", DbType.Int32, ano.ToString());

                    LqsDatosPorGastos.WhereParameters.Clear();
                    LqsDatosPorGastos.WhereParameters.Add("Mes", DbType.Int32, mes.ToString());
                    LqsDatosPorGastos.WhereParameters.Add("Año", DbType.Int32, ano.ToString());

                    if (txt_ano.Text != "" && cb_Mes.Value != "" && txt_Patente.Text != "")
                    {
                        LqsDatosMes.WhereParameters.Clear();
                        LqsDatosMes.WhereParameters.Add("Mes", DbType.Int32, mes.ToString());
                        LqsDatosMes.WhereParameters.Add("Año", DbType.Int32, ano.ToString());
                        LqsDatosMes.WhereParameters.Add("Patente", DbType.String, Patt.ToString());
                        LqsDatosMes.Where = "Mes==@Mes && Año==@Año && Patente == @Patente";

                        LqsDatosCategoria.WhereParameters.Clear();
                        LqsDatosCategoria.WhereParameters.Add("Mes", DbType.Int32, mes.ToString());
                        LqsDatosCategoria.WhereParameters.Add("Año", DbType.Int32, ano.ToString());
                        LqsDatosCategoria.WhereParameters.Add("Patente", DbType.String, Patt.ToString());
                        LqsDatosCategoria.Where = "Mes==@Mes && Año==@Año && Patente == @Patente";

                        LqsDatosPorGastos.WhereParameters.Clear();
                        LqsDatosPorGastos.WhereParameters.Add("Mes", DbType.Int32, mes.ToString());
                        LqsDatosPorGastos.WhereParameters.Add("Año", DbType.Int32, ano.ToString());
                        LqsDatosPorGastos.WhereParameters.Add("Patente", DbType.String, Patt.ToString());
                        LqsDatosPorGastos.Where = "Mes==@Mes && Año==@Año && Patente == @Patente";

                    }

                }
            }
            catch { }


        }

        protected void cmdExcel_ClickTipo(object sender, ImageClickEventArgs e)
        {
            DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
            this.ASPxGridViewExporter3.FileName = "Resumen Gastos por Tipo";
            this.ASPxGridViewExporter3.WriteXlsToResponse(Options);
        }

        protected void cmdExcel_ClickAnual(object sender, ImageClickEventArgs e)
        {
            DevExpress.Export.ExportSettings.DefaultExportType = DevExpress.Export.ExportType.WYSIWYG;
            ASPxPivotGridExporter1.ExportXlsToResponse("EstadisticasVentas.xlsx");
        }

        protected void btn_Seleccion_Click(object sender, EventArgs e)
        {
            WebChartControl1.DataBind();
        }

        protected void GvDatosMes_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatosMes.SettingsExport.FileName = "Resumen Gastos por Mes";
            }
        }

        protected void GvDatosCategoria_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatosCategoria.SettingsExport.FileName = "Resumen Gastos por Categoria";
            }
        }

        protected void GvDatosTipoGasto_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatosTipoGasto.SettingsExport.FileName = "Resumen Gastos por Tipo";
            }
        }
    }


}
