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
    public partial class CalculoPedidosRetiraCliente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                CargaGvCalculoPedidosRetiraCliente();
            }
        }

        private void CargaGvCalculoPedidosRetiraCliente()
        {
            DateTime fdesde = cbo_Desde.Date;
            DateTime fhasta = cbo_Hasta.Date;
            GestionClass vGes = new GestionClass();
            DataTable dt = new DataTable();
            dt = vGes.ObtieneCalculoPedidosRetiraCliente(fdesde, fhasta);
            GVCalculoPedRetCliente.DataSource = dt;
            Session["datosCalculoPedidosRetiraCliente"] = dt;
            GVCalculoPedRetCliente.DataBind();
        }

        protected void btn_BuscaPedRetCliente_Click(object sender, EventArgs e)
        {
            CargaGvCalculoPedidosRetiraCliente();
            GVCalculoPedRetCliente.DataBind();
        }

        protected void GVCalculoPedRetCliente_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GVCalculoPedRetCliente.SettingsExport.FileName = "Pedidos Ret Cliente " + cbo_Desde.Date.ToShortDateString() + "-" + cbo_Hasta.Date.ToShortDateString();
            }
        }
    }
}