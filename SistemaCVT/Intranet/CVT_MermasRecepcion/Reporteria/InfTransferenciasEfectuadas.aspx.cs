using DBMermasRecepcion;
using System;
using System.Data;

namespace CVT_MermasRecepcion.Reporteria
{
    public partial class InfTransferenciasEfectuadas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GvDatos.DataSource = Session["Opcion"];
            if (!IsPostBack)
            {
                fdesde.Date = DateTime.Now.AddDays(-14);
                fhasta.Date = DateTime.Now;
                GvDatos.DataSource = Session["Opcion"];
            }
        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //    this.ASPxGridViewExporter1.FileName = "Informe Transferencias Efectuadas";
        //    this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        //}

        protected void btn_Generar_Click(object sender, EventArgs e)
        {
            DateTime fini = Convert.ToDateTime(fdesde.Value);
            DateTime fter = Convert.ToDateTime(fhasta.Value);
            string bOrig = Convert.ToString(cbo_bodegaOrigen.Value);
            string bDest = Convert.ToString(cbo_bodegaDestino.Value);

            WMSClass Cal = new WMSClass();
            DataTable dt = new DataTable();
            dt = Cal.SP_TransferenciasEfectuadas(fini, fter, bOrig, bDest);
            GvDatos.DataSource = dt;
            GvDatos.DataBind();
            Session["Opcion"] = dt;
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Informe Transferencias Efectuadas:" + cbo_bodegaOrigen.Value.ToString() + '-' + cbo_bodegaDestino.Value.ToString();
            }
        }
    }
}