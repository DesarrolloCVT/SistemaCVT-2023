using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Contabilidad
{
    public partial class InformeGestion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack)
            {
                //CargaPivot();
                PvDatos.DataSource = Session["datos"];
            }
        }

        protected void btn_Buscar_Click(object sender, EventArgs e)
        {
            int ano = dteano.Date.Year;
            int mes = Convert.ToInt32(cboMes.Value);
            string uni = cboUAdmi.Value.ToString();

            ContabilidadClass cCl = new ContabilidadClass();
            DataTable dt = new DataTable();
            dt = cCl.SP_InformeGestion(ano, mes, uni);
            PvDatos.DataSource = dt;
            PvDatos.DataBind();

            Session["datos"] = dt;
        }

        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {
            DevExpress.Export.ExportSettings.DefaultExportType = DevExpress.Export.ExportType.WYSIWYG;
            ASPxPivotGridExporter1.ExportXlsToResponse("informe Gestion-" + dteano.Date.Year.ToString() + "-" + cboMes.Text + "-" + cboUAdmi.Value.ToString() + ".xlsx");
        }
    }
}