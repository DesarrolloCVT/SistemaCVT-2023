using DBMermasRecepcion;
using System;

namespace CVT_MermasRecepcion.Servicios
{
    public partial class BitacoraProyectos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UsuarioClass us = new UsuarioClass();

            Session["area"] = us.TraeIdArea(Convert.ToInt32(Session["IDCVTUsuario"]));
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {

        }
    }
}