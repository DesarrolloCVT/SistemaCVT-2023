using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Web.UI;

namespace CVT_MermasRecepcion.WMS
{
    public partial class RebajaPalletCV300 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            GvDatos.DataBind();
        }

        protected void btn_despachar_Click(object sender, EventArgs e)
        {
            try
            {
                WMSClass vWMS = new WMSClass();
                int staffid = vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString());
                int expid = vWMS.CreaExpedicionRapidaConsumo(5, staffid, Convert.ToInt32(txt_of.Text));
                List<CVT_VW_PalletTransferidosCV300> dt = vWMS.ObtienePalletConsumoOF(Convert.ToInt32(txt_of.Text));
                foreach (var d in dt)
                {
                    vWMS.AgregaDetalleExpedicion(expid, d.Package_Quantity, d.Package_Id, d.Package_SSCC, 5, staffid);
                    vWMS.DardeBajaPallet(d.Package_Id);
                }
                GvDatos.DataBind();
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Proceso Terminado Correctamente Expedicion N:" + expid.ToString() + "');", true);

                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 84, "Crea Registro");
            }
            catch
            {
            }
        }
    }
}