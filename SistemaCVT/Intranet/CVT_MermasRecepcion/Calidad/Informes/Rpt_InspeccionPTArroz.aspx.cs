using System;

namespace CVT_MermasRecepcion.Calidad.Informes
{
    public partial class Rpt_InspeccionPTArroz : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Buscar_Click(object sender, EventArgs e)
        {
            Session["ano"] = dteano.Date.Year;
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Inf_Inspeccion PT Arroz_" + DateTime.Now.ToString();
            }
        }
    }
}