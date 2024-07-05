using DBMermasRecepcion;
using System;
using System.Data;

namespace CVT_MermasRecepcion.Inventario
{
    public partial class InvValorizadoVsBalance : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargaGrilla();
        }

        protected void btnbuscar_Click(object sender, EventArgs e)
        {
            CargaGrilla();
        }


        private void CargaGrilla()
        {
            string opc = Convert.ToString(cboBodef.Value);
            InventarioClass inv = new InventarioClass();
            DataTable dt = new DataTable();
            dt = inv.SP_InvValorizadoVsBalance(opc);
            GvDatos.DataSource = dt;
            GvDatos.DataBind();
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Inventario Valorizado Vs Balance" + cboBodef.Text;
            }
        }

    }
}