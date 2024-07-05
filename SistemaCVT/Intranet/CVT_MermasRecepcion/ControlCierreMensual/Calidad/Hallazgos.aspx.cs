using DBMermasRecepcion;
using System;
using System.Data;

namespace CVT_MermasRecepcion.ControlCierreMensual.Calidad
{
    public partial class Hallazgos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Server.ScriptTimeout = 6000;
            //Session.Timeout = 6000;
            GvTest.DataSource = Session["Opcion"];
        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //    this.ASPxGridViewExporter11.FileName = "Hallazgos";
        //    this.ASPxGridViewExporter11.WriteXlsToResponse(Options);
        //}

        protected void btn_Buscar_Click(object sender, EventArgs e)
        {
            int mes = Convert.ToInt32(cbo_Mes.Value);
            int ano = Convert.ToInt32(cbo_Ano.Value);
            CalidadClass Cal = new CalidadClass();
            DataTable dt = new DataTable();
            dt = Cal.SP_Hallazgo(mes, ano);
            GvTest.DataSource = dt;
            Session["Opcion"] = dt;
            GvTest.DataBind();
        }

        protected void GvTest_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvTest.SettingsExport.FileName = "Hallazgos";
            }
        }
    }
}