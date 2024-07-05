using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.MayoristaReportes
{
    public partial class SMMInformeReposición : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                dteFini.Date = DateTime.Now.AddDays(-7);
                dteTermino.Date = DateTime.Now;
            }
           
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Informe Reposición";
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            GvDatos.DataBind();
        }
    }
}