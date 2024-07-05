using DBMermasRecepcion;
using System;
using System.Data;

namespace CVT_MermasRecepcion.Produccion
{
    public partial class InfConsumidosOFLoteProducto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                CargaDatos();
            }

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            CargaDatos();
        }
        private void CargaDatos()
        {
            int of = txtOF.Text == string.Empty ? 0 : Convert.ToInt32(txtOF.Text);
            string codP = txtCodProd.Text == string.Empty ? "" : txtCodProd.Text;

            ProduccionClass pro = new ProduccionClass();
            DataTable td = pro.SP_ConsumidosLoteProducto(of, txtLote.Text, codP);
            GvDatos.DataSource = td;
            GvDatos.DataBind();
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Consumidos OF-Lote-Producto";
            }
        }
    }
}