using DBMermasRecepcion;
using System;
using System.Data;

namespace CVT_MermasRecepcion.Logistica
{
    public partial class ArmadoPedido : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            GvDatos.DataSource = Session["Opcion"];

        }

        //protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        //{
        //    if (e.CommandArgs.CommandName == "cmdDetalle")
        //    {
        //        Session["DocEntry"] = e.KeyValue;
        //        //Session["PedSAP"] = e.KeyValue;
        //        Response.Redirect("~/Logistica/DetallePedidoSeleccionado.aspx");
        //    }
        //}

        protected void btn_Buscar_Click(object sender, EventArgs e)
        {
            DateTime fecha = Convert.ToDateTime(ASPxDateEdit1.Value);
            int id = Convert.ToInt32(Session["IDCVTUsuario"]);

            DataTable dt = new DataTable();
            LogisticaClass Lo = new LogisticaClass();
            dt = Lo.SP_GrillaPedidos(fecha, id);
            GvDatos.DataSource = dt;
            GvDatos.DataBind();
            Session["Opcion"] = dt;
        }

        protected void GvDatos_RowCommand1(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                Session["DocEntry"] = e.KeyValue;
                //Session["PedSAP"] = e.KeyValue;
                Response.Redirect("~/Logistica/DetallePedidoSeleccionado.aspx");

            }
        }

        protected void btnOrden_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Logistica/OrdenDeCargaPorPedido.aspx");
        }
    }
}