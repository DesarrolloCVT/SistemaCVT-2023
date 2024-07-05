using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Transporte
{
    public partial class RegCargaCombPersonal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                dteInicio.Date = DateTime.Now.AddDays(-7);
                dteTermino.Date = DateTime.Now;
            }
         

        }

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["IdUsuarioCreador"]= Session["IDCVTUsuario"];
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Registro Carga Combustible";
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            GvDatos.DataBind();

        }
    }
}