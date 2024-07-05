using DBMermasRecepcion;
using System;
using System.Data;

namespace CVT_MermasRecepcion.Gestion
{
    public partial class BuscaLoteMP : System.Web.UI.Page
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
            WMSClass vWMS = new WMSClass();
            DataTable dt = new DataTable();

            dt = vWMS.Sp_BuscaLotePT(txtLotePT.Text);

            GvDatos.DataSource = dt;
            GvDatos.DataBind();
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {

            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Lotes MP_" + txtLotePT.Text;
            }
        }
    }
}