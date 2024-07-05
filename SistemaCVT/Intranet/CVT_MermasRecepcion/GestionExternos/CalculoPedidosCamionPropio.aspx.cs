using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBMermasRecepcion;
using System.Data;

namespace CVT_MermasRecepcion.GestionExternos
{
    public partial class CalculoPedidosCamionPropio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                CargaGvCalculoPedidosCamionPropio();
            }
        }

        private void CargaGvCalculoPedidosCamionPropio()
        {
            DateTime fdesde = cbo_Desde.Date;
            DateTime fhasta = cbo_Hasta.Date;
            GestionClass vGes = new GestionClass();
            DataTable dt = new DataTable();
            dt = vGes.ObtieneCalculoPedidosCamionPropio(fdesde, fhasta);
            GVCalculoPedCamPropio.DataSource = dt;
            Session["datosCalculoPedidosCamionPropio"] = dt;
            GVCalculoPedCamPropio.DataBind();
        }

        protected void btn_BuscaPedCamPropio_Click(object sender, EventArgs e)
        {
            CargaGvCalculoPedidosCamionPropio();
            GVCalculoPedCamPropio.DataBind();
        }

        protected void GVCalculoPedCamPropio_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GVCalculoPedCamPropio.SettingsExport.FileName = "Pedidos Cam Propios " + cbo_Desde.Date.ToShortDateString() + "-" + cbo_Hasta.Date.ToShortDateString();
            }
        }
    }
}