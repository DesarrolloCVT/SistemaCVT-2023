using DBMermasRecepcion;
using System;
using System.Data;

namespace CVT_MermasRecepcion.Reporteria
{
    public partial class InfListadoCobranza : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                try
                {
                    DataTable dt = new DataTable();
                    dt = (DataTable)Session["Dt"];
                    GvDatos.DataSource = dt;
                    GvDatos.DataBind();
                }
                catch (Exception)
                {


                }
            }
        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //    this.ASPxGridViewExporter1.FileName = "Listado Cobranza -"+cbo_fecha.Date.ToShortDateString();
        //    this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        //}

        protected void btn_procesar_Click(object sender, EventArgs e)
        {
            SAPClass vSAP = new SAPClass();
            DataTable dt = new DataTable();
            int Vendedor = cbo_vendedor.Value == null ? 0 : Convert.ToInt32(cbo_vendedor.Value);
            string Cliente = cbo_cliente.Value == null ? "-" : cbo_cliente.Value.ToString();
            DateTime Fecha = cbo_fecha.Date;
            dt = vSAP.ObtieneListaCobranza(Vendedor, Cliente, Fecha);
            Session["Dt"] = dt;
            GvDatos.DataSource = dt;
            GvDatos.DataBind();
        }

        protected void GvDatos_PageIndexChanged(object sender, EventArgs e)
        {

            //DataTable dt = new DataTable();
            //dt = (DataTable)Session["Dt"];
            //GvDatos.DataSource = dt;
            //GvDatos.DataBind();

        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Listado Cobranza -" + cbo_fecha.Date.ToShortDateString();
            }
        }
    }
}