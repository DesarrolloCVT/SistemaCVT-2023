using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Mayorista
{
    public partial class InformeInventario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                GvDatos.DataSource = Session["datos"];
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            int fol =Convert.ToInt32(cboFolio.Value);

            CVTWMSMetroClass wms= new CVTWMSMetroClass();
            DataTable dt = new DataTable();
            dt = wms.SP_InformeInventario(fol);
            GvDatos.DataSource = dt;
            GvDatos.DataBind();
            Session["datos"] = dt;
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {

            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "informe inventario Folio "+cboFolio.Value.ToString();
            }
        }
    }
}