using DBMermasRecepcion;
using System;
using System.Data;

namespace CVT_MermasRecepcion.ControlCierreMensual.Transporte
{
    public partial class GastoCamion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                Cargadatos();
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            Cargadatos();
        }

        private void Cargadatos()
        {

            DateTime fini = dteInicio.Date;
            DateTime fter = dteTermino.Date;

            TransporteClass tr = new TransporteClass();
            DataTable td = tr.SP_GastoCamion(fini, fter);
            GvDatos.DataSource = td;
            GvDatos.DataBind();
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Gasto Camion desde " + dteInicio.ToString() + "-" + dteTermino.ToString();
            }
        }
    }
}