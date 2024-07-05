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
    public partial class InformeTickets : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(IsPostBack)
            {
                GvFull.DataSource = Session["GvFull"];
                GvTotalTick.DataSource = Session["GvTotalTick"];
                GvTotalTiempo.DataSource = Session["GvTotalTiempo"];

            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            TicketClass tk = new TicketClass();
            DataTable dt = tk.SP_Inf_Full(dteInicio.Date, dteTermino.Date,Convert.ToInt32(cboArea.Value));
            GvFull.DataSource = dt;
            GvFull.DataBind();
            Session["GvFull"] = dt;

            DataTable dt2 = tk.SP_Inf_totalTick(dteInicio.Date, dteTermino.Date, Convert.ToInt32(cboArea.Value));
            GvTotalTick.DataSource = dt2;
            GvTotalTick.DataBind();
            Session["GvTotalTick"] = dt2;

            DataTable dt3 = tk.SP_Inf_PromedioTiempo(dteInicio.Date, dteTermino.Date, Convert.ToInt32(cboArea.Value));
            GvTotalTiempo.DataSource = dt3;
            GvTotalTiempo.DataBind();
            Session["GvTotalTiempo"] = dt3;
        }

        protected void GvTotalTick_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvTotalTick.SettingsExport.FileName = "Total Tickets";
            }
        }

        protected void GvTotalTiempo_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvTotalTiempo.SettingsExport.FileName = "Promedio Tiempo de respuesta en minutos";
            }
        }

        protected void GvFull_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvFull.SettingsExport.FileName = "Detalle Tickets";
            }
        }
    }
}