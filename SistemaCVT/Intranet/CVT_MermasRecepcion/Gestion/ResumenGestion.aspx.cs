using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Gestion
{
    public partial class ResumenGestion : System.Web.UI.Page
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

           
            ContabilidadClass cCl = new ContabilidadClass();
            DataTable dt = new DataTable();

            DateTime finicio = dteInicio.Date;
            DateTime ftermino = dteTermino.Date;
            int tipo = Convert.ToInt32(cbotipoInf.Value); 

            dt = cCl.SP_ResumenGestion(finicio, ftermino, tipo);
          
            GvDatos.DataSource = dt;
            GvDatos.DataBind();
            Session["datos"] = dt;
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = cbotipoInf.Text + "_" + dteInicio.Date.ToString()+"_"+dteTermino.Date.ToString() ;
            }
        }
    }
}