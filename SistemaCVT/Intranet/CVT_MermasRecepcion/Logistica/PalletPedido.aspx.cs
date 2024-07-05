using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;

namespace CVT_MermasRecepcion.Logistica
{
    public partial class PalletPedido : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GvDatos.DataSource = Session["Opcion"];

            lblNpedido.Text = Convert.ToString(Session["DocEntry"]);

        }


        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDesarmar")
            {
                int cont = Convert.ToInt32(e.KeyValue);
                LogisticaClass logC = new LogisticaClass();
                List<CVT_ContenedorCarga> dt = logC.ObtieneDatosContenedorCarga(cont);
                int id = 0;
                string equipo = "";
                string usuario = "";
                string ipad = "";
                foreach (var t in dt)
                {
                    id = t.IdUsuario;
                    equipo = t.Equipo;
                    usuario = t.EqUsuario;
                    ipad = t.IpAddress;
                }

                logC.eliminaPallets(cont, id, equipo, usuario, ipad);
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Pallet se ha desarmado');", true);
                CargaGrilla();

            }

        }

        protected void btnVer_Click(object sender, EventArgs e)
        {
            CargaGrilla();

        }

        private void CargaGrilla()
        {
            int doc = Convert.ToInt32(Session["DocEntry"]);
            LogisticaClass LogC = new LogisticaClass();
            DataTable dt = new DataTable();
            dt = LogC.SP_PalletPedido(doc);
            GvDatos.DataSource = dt;
            GvDatos.DataBind();
            Session["Opcion"] = dt;
        }

        protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("/Logistica/SeleccionPedidos.aspx");
        }
    }
}