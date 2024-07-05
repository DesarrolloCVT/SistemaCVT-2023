using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Mayorista
{
    public partial class SMMCuentaClientes : System.Web.UI.Page
    {
        int CountBase = 0;
        int Count = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                cbo_fdesde0.Date = DateTime.Now.AddMonths(-1);
                cbo_fhasta0.Date = DateTime.Now;
                GvDatos.DataBind();


            }
            else
            {
                try
                {
                    LqDsCuentas.Where = Session["Parametros"].ToString();
                    GvDatos.DataBind();
                }
                catch
                {

                }
            }
        }

        protected void btn_Filtrar_Click(object sender, EventArgs e)
        {
            string fi = cbo_fdesde0.Date.Year.ToString() + "/" + cbo_fdesde0.Date.Month.ToString() + "/" + cbo_fdesde0.Date.Day.ToString() + " 00:00:00";
            string ft = cbo_fhasta0.Date.Year.ToString() + "/" + cbo_fhasta0.Date.Month.ToString() + "/" + cbo_fhasta0.Date.Day.ToString() + " 23:59:59";
            LqDsCuentas.WhereParameters.Clear();
            LqDsCuentas.WhereParameters.Add("Inicio", System.Data.DbType.DateTime, fi);
            LqDsCuentas.WhereParameters.Add("Termino", System.Data.DbType.DateTime, ft);

            LqDsCuentas.Where = "FechaVenc>@Inicio && FechaVenc<@Termino";
            if (cbo_grupo0.Value != null)
            {
                LqDsCuentas.WhereParameters.Add("Vendedor", System.Data.DbType.Int32, cbo_grupo0.Value.ToString());
                LqDsCuentas.Where = LqDsCuentas.Where.ToString() + " && SlpCode=@Vendedor";
            }
            if (cbo_pdesde0.Value != null && cbo_phasta0.Value != null)
            {
                LqDsCuentas.WhereParameters.Add("pdesde", cbo_pdesde0.Value.ToString());
                LqDsCuentas.WhereParameters.Add("phasta", cbo_phasta0.Value.ToString());
                LqDsCuentas.Where = LqDsCuentas.Where.ToString() + " && CodProveedor>=@pdesde && CodProveedor<=@phasta";
            }
            Session["Parametros"] = LqDsCuentas.Where.ToString();
            GvDatos.DataBind();
        }

        protected void btn_limpiar_Click(object sender, EventArgs e)
        {
            cbo_grupo0.SelectedIndex = -1;
            cbo_pdesde0.SelectedIndex = -1;
            cbo_phasta0.SelectedIndex = -1;
        }

        protected void cbo_grupo_SelectedIndexChanged(object sender, EventArgs e)
        {
            cbo_pdesde0.SelectedIndex = -1;
            cbo_phasta0.SelectedIndex = -1;
        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    LqDsCuentas.Where = Session["Parametros"].ToString();
        //    GvDatos.DataBind();
        //    DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //    this.ASPxGridViewExporter1.FileName = "Cuenta Clientes - " + DateTime.Now.ToShortDateString();
        //    Options.SheetName = this.ASPxGridViewExporter1.FileName;
        //    this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        //}

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
            //    (e.PrintingSystem as PrintingSystemBase).PageSettings.Landscape = true;
                GvDatos.SettingsExport.FileName = "Cuenta Clientes - " + DateTime.Now.ToShortDateString();
            }
        }

        protected void GvDatos_CustomSummaryCalculate(object sender, DevExpress.Data.CustomSummaryEventArgs e)
        {
            CountBase = GvDatos.VisibleRowCount;
           int NN=Convert.ToInt32(GvDatos.GroupCount);



            if (Count <= CountBase)
            {
                if (e.SummaryProcess == DevExpress.Data.CustomSummaryProcess.Start)
                {

                    //decimal Pendiente = Convert.ToDecimal(GvDatos.GetGroupSummaryValue(Count, GvDatos.GroupSummary["Pendiente", DevExpress.Data.SummaryItemType.Sum]));
                    ASPxSummaryItem PendienteSummary = (sender as ASPxGridView).GroupSummary["Pendiente"];
                    ASPxSummaryItem SeguroSummary = (sender as ASPxGridView).GroupSummary["SeguroFecha"];
                    Decimal Pendiente = Convert.ToDecimal(((ASPxGridView)sender).GetGroupSummaryValue(Count, PendienteSummary));
                    decimal Seguro = Convert.ToDecimal(((ASPxGridView)sender).GetGroupSummaryValue(Count, SeguroSummary));
                    e.TotalValue = Seguro - Pendiente;
                    Count++;
                }
            }

            //
            //
            //
            //Decimal Seguro = 
            //Seguro - Pendiente;
        }

    }
}