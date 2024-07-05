using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Reporteria
{
    public partial class InformeFefo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                GvDatos.DataSource = Session["Datos"];
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            ProduccionClass pc = new ProduccionClass();
            DataTable dt = new DataTable();
            string cop = cbo_producto.Value == null ? "-1" : cbo_producto.Value.ToString();
            dt = pc.SP_RptFefo(cboBodega.Value.ToString(), cop);

            GvDatos.DataSource = dt;
            GvDatos.DataBind();
            Session["Datos"] = dt;
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                string cop = cbo_producto.Value == null ? "-1" : cbo_producto.Value.ToString();
                //    (e.PrintingSystem as PrintingSystemBase).PageSettings.Landscape = true;
                GvDatos.SettingsExport.FileName = "Fefo - " + cboBodega.Value.ToString();
            }
        }
    }
}