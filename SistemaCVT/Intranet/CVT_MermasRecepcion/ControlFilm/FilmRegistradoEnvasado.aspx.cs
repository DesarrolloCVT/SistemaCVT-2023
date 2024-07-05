using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.ControlFilm
{
    public partial class FilmRegistradoEnvasado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dteInicio.Value = DateTime.Now.AddDays(-14);
                dteTermino.Value = DateTime.Now;
            }
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Film Registrado Envasado";              
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            GvDatos.DataBind();
        }
    }
}