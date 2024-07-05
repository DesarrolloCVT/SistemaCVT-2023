using DBMermasRecepcion;
using System;
using System.Data;

namespace CVT_MermasRecepcion.Contabilidad
{
    public partial class DetCCostosGrilla : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                GvDatos.DataSource = Session["datos"];
            }
        }

        protected void btn_Buscar_Click(object sender, EventArgs e)
        {
            int ano = dteano.Date.Year;
            int mes = Convert.ToInt32(cboMes.Value);

            ContabilidadClass cCl = new ContabilidadClass();
            DataTable dt = new DataTable();
            dt = cCl.SP_DetCenCosto(ano, mes, "Todos");
            GvDatos.DataSource = dt;
            GvDatos.DataBind();

            Session["datos"] = dt;
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Detalle Centro de Costos";
            }
        }
    }
}