using DBMermasRecepcion;
using System;
using System.Data;

namespace CVT_MermasRecepcion.Mayorista
{
    public partial class ListaPrecioPadreHijo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargaGrilla();
        }
        private void CargaGrilla()
        {
            MMetroClass mme = new MMetroClass();
            DataTable dt = new DataTable();
            dt = mme.SP_ListadoPreciosPadreHijo();
            GvDatos.DataSource = dt;
            GvDatos.DataBind();
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Listado Precios padre hijo";
            }
        }
    }
}