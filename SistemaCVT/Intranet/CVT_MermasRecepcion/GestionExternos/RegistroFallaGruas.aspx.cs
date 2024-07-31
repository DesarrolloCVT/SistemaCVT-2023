using System;
using DBMermasRecepcion;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.GestionExternos
{
    public partial class RegistroFallaGruas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GVRegistroFallaGrua_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["FechaCreacion"]=DateTime.Now;
            e.NewValues["UsuarioCreacion"] = Convert.ToInt32(Session["IDCVTUsuario"]);

        }

        protected void GVRegistroFallaGrua_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdConfirma")
            {
                int ID = Convert.ToInt32(e.KeyValue);
                GestionClass vGestion =new GestionClass();
                vGestion.CierreFallaGrua(ID, Convert.ToInt32(Session["IDCVTUsuario"]));
                GVRegistroFallaGrua.DataBind();
            }
        }
    }
}