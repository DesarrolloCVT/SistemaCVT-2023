using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DBMermasRecepcion;
using System.Data;

namespace CVT_MermasRecepcion.Reporteria
{
    public partial class InformeTransferenciasxConfirmar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {


                GvTransferXRecep.DataSource = Session["datosGvTransferXRecep"];
                GvTransferXRecep.DataBind();
            }
        }

        protected void btn_Generar_Click(object sender, EventArgs e)
        {
            
            int sitioid = Convert.ToInt32(cbo_bodega.Value);
            WMSClass vSMM = new WMSClass();
            DataTable dt = new DataTable();
            dt = vSMM.SP_TransferenciasXRecepcionar(sitioid);
            GvTransferXRecep.DataSource = dt;
            Session["datosGvTransferXRecep"] = dt;
            GvTransferXRecep.DataBind();
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvTransferXRecep.SettingsExport.FileName = "Informe Transferencias x recepcionar " + DateTime.Now.ToShortDateString();
            }
        }
    }
}