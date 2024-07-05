using DBMermasRecepcion;
using System;

namespace CVT_MermasRecepcion.Produccion
{
    public partial class ControlPorLinea : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 45, "Ingreso");
            }
        }

        protected void btn_Generar_Click(object sender, EventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 45, "Boton");
            GvDatos.AddNewRow();
        }

        protected void cbo_of_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["OF"] = cbo_of.Value.ToString();
        }

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            WMSClass vWMS = new WMSClass();
            e.NewValues["OrdenFabricacion"] = Convert.ToInt32(Session["OF"]);
            e.NewValues["Staff_Id"] = vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString());
        }
    }
}