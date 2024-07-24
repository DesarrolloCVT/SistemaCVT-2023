using DBMermasRecepcion;
using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.WMS
{
    public partial class PosicionamientoFecha : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                GvPosicionamientoFecha.DataSource = Session["datos"];
            }
        }

        protected void btn_generar_Click(object sender, EventArgs e)
        {
            WMSClass vWMS = new WMSClass();
            DataTable dt = new DataTable();
            dt = vWMS.SP_PosicionamientoFecha(cbo_fecha.Date);
            GvPosicionamientoFecha.DataSource = dt;
            Session["datos"] = dt;
            GvPosicionamientoFecha.DataBind();
        }
    }
}