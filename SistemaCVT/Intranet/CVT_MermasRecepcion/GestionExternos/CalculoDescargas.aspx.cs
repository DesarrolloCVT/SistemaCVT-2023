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
    public partial class CalculoDescargas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           if(IsPostBack)
            {
                CargaGvCalculoDescargas();
            }
        }

        private void CargaGvCalculoDescargas()
        {
            DateTime fdesde = cbo_Desde.Date;
            DateTime fhasta = cbo_Hasta.Date;
            GestionClass vGes = new GestionClass();
            DataTable dt = new DataTable();
            dt = vGes.ObtieneCalculoDescargas(fdesde, fhasta);
            GVCalculoDescargas.DataSource = dt;
            Session["datosCalculoDescargas"] = dt;
            GVCalculoDescargas.DataBind();
        }

        protected void btnBuscarCalculoDesc_Click(object sender, EventArgs e)
        {
            CargaGvCalculoDescargas();
            GVCalculoDescargas.DataBind();
        }
      

        protected void GVCalculoDescargas_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GVCalculoDescargas.SettingsExport.FileName = "Descargas Periodo  " + cbo_Desde.Date.ToShortDateString() +"-"+ cbo_Hasta.Date.ToShortDateString();
            }
        }
    }
}