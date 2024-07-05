using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.MayoristaKPI
{
    public partial class DocVentasPorPagar : System.Web.UI.Page
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
            MMetroClass mme = new MMetroClass();
            DataTable dt = new DataTable();
            dt = mme.SP_DocVentasporPagar(Convert.ToInt32(cboDepto.Value));
            GvDatos.DataSource = dt;
            GvDatos.DataBind();
            Session["Datos"] = dt;
            GvDatos.ExpandAll();
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Documentos por Pagar -" +cboDepto.Text;
            }
        }
    }
}