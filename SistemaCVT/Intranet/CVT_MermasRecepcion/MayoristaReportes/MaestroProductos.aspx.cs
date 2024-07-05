using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.MayoristaReportes
{
    public partial class MaestroProductos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                GvDatos.DataSource = Session["Datos"];
            }
        }

        private void CargaDatos()
        {
            MMetroClass mc = new MMetroClass();
            DataTable dt = new DataTable();

            dt = mc.SP_MaestroProductos();
            Session["Datos"] = dt;
            GvDatos.DataSource = Session["Datos"];
            GvDatos.DataBind();

        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Maestro Productos SMM_"+DateTime.Now;
            }
        }

        protected void btnVer_Click(object sender, EventArgs e)
        {
            CargaDatos();
        }
    }
}