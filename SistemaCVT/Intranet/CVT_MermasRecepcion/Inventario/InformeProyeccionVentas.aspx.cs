using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Inventario
{
    public partial class InformeProyeccionVentas : System.Web.UI.Page
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
            CargaDatos();
        }
        private void CargaDatos()
        {
            InventarioClass inv = new InventarioClass();

            DataTable dt = new DataTable();

            dt = inv.SP_InformeProyeccionVentas(dteInicio.Date, dteTermino.Date);
            GvDatos.DataSource = dt;
            Session["Datos"] = dt;
            GvDatos.DataBind();
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "informe Proyeccion Ventas-"+dteInicio.Date.ToString()+"-"+dteTermino.Date.ToString();
            }
        }
    }
}