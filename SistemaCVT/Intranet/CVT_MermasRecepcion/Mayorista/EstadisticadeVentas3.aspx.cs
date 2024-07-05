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
    public partial class EstadisticadeVentas3 : System.Web.UI.Page
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

            dt=mc.SP_ListadoVentas_DiVenti(dteFinicio.Date, dteFTermino.Date);

            GvDatos.DataSource = dt;
            GvDatos.DataBind();
            Session["Datos"] = dt;

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            CargaDatos();
            //GvDatos.DataBind();
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Estadisticas de Ventas"+dteFinicio.Date.ToShortDateString()+"-"+dteFTermino.Date.ToShortDateString();
            }
        }

        //protected void Export_Click(object sender, EventArgs e)
        //{
        //    DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //    this.ASPxGridViewExporter1.FileName = "Menus";
        //    this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        //}
    }
}