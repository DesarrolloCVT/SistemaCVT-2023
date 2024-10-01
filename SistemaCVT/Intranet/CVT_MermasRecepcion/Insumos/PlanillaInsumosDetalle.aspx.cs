using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBMermasRecepcion;

namespace CVT_MermasRecepcion.Insumos
{
    public partial class PlanillaInsumosDetalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_pinsumos_ID.Text = Session["PInsumosId"].ToString();
        }

        protected void GvPlanillaInsumosDetalle_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            InventarioClass vInv = new InventarioClass();
            int UsurioPlanilla = vInv.ValidaUsuarioPlanillaInsumos(Convert.ToInt32(Session["PInsumosId"]));
            int mesPlanilla = vInv.ValidaMesPlanillaInsumos(Convert.ToInt32(Session["PInsumosId"]));
            int diaactual = DateTime.Now.Day;
            int anoPlanilla = vInv.ValidaAnoPlanillaInsumos(Convert.ToInt32(Session["PInsumosId"]));

            //DateTime fechaPlanilla = new DateTime(anoPlanilla, mesPlanilla, diaactual);

            DateTime fechaLimite = new DateTime(anoPlanilla, mesPlanilla, 1,00,00,01);

            //DateTime fechaLimiteMesAnt = new DateTime(DateTime.Now.Year, DateTime.Now.Month-1, 6);
            //Fecha Corte establecida 6 de cada mes


            if (DateTime.Now<= fechaLimite)
                //&& fechaPlanilla >= fechaLimiteMesAnt)
            {
                if (Convert.ToInt32(Session["IDCVTUsuario"].ToString()) == UsurioPlanilla)
                {
                    e.NewValues["PInsumos_Id"] = Convert.ToInt32(Session["PInsumosId"].ToString());
                }
                else
                    e.Cancel = true;
            }
            else
                e.Cancel = true;
        }

        protected void GvPlanillaInsumosDetalle_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvPlanillaInsumosDetalle.SettingsExport.FileName = "Planilla Insumos detalle "+ Session["PInsumosId"].ToString();
            }
        }
    }
}