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
    public partial class CalculoPedidosCamionExterno : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                CargaGvCalculoPedidosCamionExterno();
            }
        }

        private void CargaGvCalculoPedidosCamionExterno()
        {
            DateTime fdesde = cbo_Desde.Date;
            DateTime fhasta = cbo_Hasta.Date;
            GestionClass vGes = new GestionClass();
            DataTable dt = new DataTable();
            dt = vGes.ObtieneCalculoPedidosCamionExterno(fdesde, fhasta);
            GVCalculoPedCamExterno.DataSource = dt;
            Session["datosCalculoPedidosCamionExterno"] = dt;
            GVCalculoPedCamExterno.DataBind();
        }

        protected void btn_BuscaCalPedCamExterno_Click(object sender, EventArgs e)
        {
            CargaGvCalculoPedidosCamionExterno();
            GVCalculoPedCamExterno.DataBind();

        }

        protected void GVCalculoPedCamExterno_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GVCalculoPedCamExterno.SettingsExport.FileName = "Pedidos Cam Externo " + cbo_Desde.Date.ToShortDateString() + "-" + cbo_Hasta.Date.ToShortDateString();
            }
        }
    }
}