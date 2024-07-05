using DBMermasRecepcion;
using System;
using System.Data;

namespace CVT_MermasRecepcion.Inventario
{
    public partial class ListadoTransferencias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                CargaGrilla();
            }

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            CargaGrilla();
        }

        private void CargaGrilla()
        {
            InventarioClass inv = new InventarioClass();
            DataTable dt = new DataTable();
            dt = inv.SP_ListadoTranferencias(dteFini.Date, dteFter.Date);
            GvDatos.DataSource = dt;
            GvDatos.DataBind();
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Listado Transferencias";
            }
        }
    }
}