using DBMermasRecepcion;
using System;
using System.Data;
using System.Web.UI;

namespace CVT_MermasRecepcion.Mayorista
{
    public partial class ComprasMensual : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {

        }
        private void cargaGrid()
        {
            MMetroClass VLogis = new MMetroClass();
            DataTable dt = new DataTable();
            dt = VLogis.SP_ConsultaDocumento(Convert.ToInt32(cbo_mes.Value), Convert.ToInt32(cbo_Año.Value));
            GvDatos.DataSource = dt;
            GvDatos.DataBind();
        }
    }
}