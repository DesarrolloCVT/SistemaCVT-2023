using DBMermasRecepcion;
using System;
using System.Data;

namespace CVT_MermasRecepcion.Tesoreria
{
    public partial class ListaPagoCobranzasPeriodo : System.Web.UI.Page
    {
        DataTable _DTLista = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarDatos();
            }
            GvDatos2.DataSource = Session["DTLista"];
        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            TesoreriaClass vTesoreria = new TesoreriaClass();
            DataTable dt = new DataTable();
            dt = vTesoreria.SP_ListarPagoCobranzaPeriodo(cb_fini.Date, cb_fter.Date);
            GvDatos.DataSource = dt;
            GvDatos.DataBind();

            _DTLista = vTesoreria.SP_ListarPagoCobranzaClientePeriodo(cb_fini.Date, cb_fter.Date);
            Session["DTLista"] = _DTLista;
            GvDatos2.DataSource = Session["DTLista"];
            GvDatos2.DataBind();
        }

        protected void cargarDatos()
        {
            DateTime mes = DateTime.Today.AddMonths(-1);
            DateTime inicioMesAnterior = new DateTime(DateTime.Now.Year, mes.Month, 1);
            cb_fini.Date = inicioMesAnterior;

            DateTime mesfin = DateTime.Now;
            DateTime finMesAnterior = new DateTime(DateTime.Now.Year, mesfin.Month, 1);
            finMesAnterior = finMesAnterior.AddDays(-1);
            cb_fter.Date = finMesAnterior;

            TesoreriaClass vTesoreria = new TesoreriaClass();
            DataTable dt = new DataTable();
            dt = vTesoreria.SP_ListarPagoCobranzaPeriodo(cb_fini.Date, cb_fter.Date);
            GvDatos.DataSource = dt;
            GvDatos.DataBind();

            _DTLista = vTesoreria.SP_ListarPagoCobranzaClientePeriodo(cb_fini.Date, cb_fter.Date);
            Session["DTLista"] = _DTLista;
            GvDatos2.DataSource = Session["DTLista"];
            GvDatos2.DataBind();
        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //    this.ASPxGridViewExporter1.FileName = "Pago Cobranza Cliente";
        //    this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        //}

        protected void GvDatos2_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos2.SettingsExport.FileName = "Lista Pago Cobranza x Periodo";
            }
        }
    }
}