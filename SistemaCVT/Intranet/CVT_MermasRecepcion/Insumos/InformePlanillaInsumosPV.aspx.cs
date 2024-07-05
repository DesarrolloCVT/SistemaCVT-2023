using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBMermasRecepcion;
using System.Data;

namespace CVT_MermasRecepcion.Insumos
{
    public partial class InformePlanillaInsumosPV : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                CargaPivot();
            }
        }

       

        protected void btn_Generar_Click(object sender, EventArgs e)
        {
            CargaPivot();
        }
        private void CargaPivot()
        {
            int mes = Convert.ToInt32(cbo_Mes.Value);
            int ano = Convert.ToInt32(cb_ano.Value); 
            InventarioClass cInv = new InventarioClass();
            DataTable dt = new DataTable();
            dt = cInv.SP_InformePlanillaInsumos(mes,ano);
            PvInformePlanillaIns.DataSource = dt;
            Session["PvInformePlanillaIns"] = dt;
            PvInformePlanillaIns.DataBind();
        }

        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {
            DevExpress.Export.ExportSettings.DefaultExportType = DevExpress.Export.ExportType.WYSIWYG;
            ASPxPivotGridExporter1.ExportXlsToResponse("Resumen Planilla Insumos Mes " +cbo_Mes.Value.ToString() +".xlsx");
        }
    }
}