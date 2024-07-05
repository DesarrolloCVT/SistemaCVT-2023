using DBMermasRecepcion;
using System;
using System.Data;

namespace CVT_MermasRecepcion.Merma
{
    public partial class InformeSalidaDesecho : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                GvDatos.DataSource = Session["Opcion"];
            }
        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    GvDatos.ExportXlsxToResponse("Informe Salida Desecho", new XlsxExportOptionsEx { ExportType = ExportType.Default });
        //}

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            MermasClass Ts = new MermasClass();
            DataTable dt = new DataTable();

            int mesIn = Convert.ToInt32(cboMes.Value);
            int anoIn = Convert.ToInt32(cboAno.Value);

            dt = Ts.SP_informeSalidaDesecho(mesIn, anoIn);
            GvDatos.DataSource = dt;
            GvDatos.DataBind();
            Session["opcion"] = dt;

        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Informe Salida Desecho";
            }
        }
    }
}