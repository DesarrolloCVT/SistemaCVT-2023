using DBMermasRecepcion;
using System;
using System.Data;
using System.Web.UI;

namespace CVT_MermasRecepcion.Contabilidad
{
    public partial class DetalleCenCosto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                PvDatos.DataSource = Session["datos"];
            }
        }

        protected void btn_Buscar_Click(object sender, EventArgs e)
        {
            int ano = dteano.Date.Year;
            int mes = Convert.ToInt32(cboMes.Value);

            ContabilidadClass cCl = new ContabilidadClass();
            DataTable dt = new DataTable();
            dt = cCl.SP_DetCenCosto(ano, mes, "Todos");
            PvDatos.DataSource = dt;
            PvDatos.DataBind();
            Session["datos"] = dt;
        }

        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {

            DevExpress.Export.ExportSettings.DefaultExportType = DevExpress.Export.ExportType.WYSIWYG;
            ASPxPivotGridExporter1.ExportXlsToResponse("Detalle Centro de Costos.xlsx");
        }


    }
}