using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Web.UI;

namespace CVT_MermasRecepcion.MayoristaOP
{
    public partial class SMMTransferenciasDetalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                CVTWMSMetroClass vWMS = new CVTWMSMetroClass();
                List<SMM_Transfer> dt = vWMS.ObtieneInfoTransferenciaSMM(Convert.ToInt32(Session["TransferId"]));
                int estadot = 0;
                foreach (var t in dt)
                {
                    string so = vWMS.ObtieneNombreCortoSitioSMM(t.Site_Id);
                    string sd = vWMS.ObtieneNombreCortoSitioSMM(t.Site_Id_Destiny);
                    lbl_Encabezado.Text = "Detalle Transferencia N:" + t.Transfer_Id.ToString() + " Origen:" + so + " Destino:" + sd;
                    estadot = t.Status;
                }


                if (estadot == 3 || estadot == 1)
                {

                    btnFiltrar.Enabled = true;
                    btnAgregar.Enabled = true;
                    btnQuitarTodos.Enabled = true;


                }
                else /*(estadot == 4 || estadot == 5)*/
                {

                    btnFiltrar.Enabled = false;
                    btnAgregar.Enabled = false;
                    btnQuitarTodos.Enabled = false;
                }
            }
        }

        protected void cmdVolver_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/MayoristaOP/SMMTransferencias.aspx");
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            string lote = txtLote.Text;
            string producto = cboProducto.Value == null ? string.Empty : Convert.ToString(cboProducto.Value);
            int posicion = txtUbicacion.Text == string.Empty ? 0 : Convert.ToInt32(txtUbicacion.Text);
            int npallet = txtNumPallet.Text == string.Empty ? 0 : Convert.ToInt32(txtNumPallet.Text);
            CVTWMSMetroClass vWMS = new CVTWMSMetroClass();
            List<CVT_VW_FiltroTransferenciasSMM> dt = new List<CVT_VW_FiltroTransferenciasSMM>();
            dt = vWMS.ObtieneFiltroTransferenciaSMM(Convert.ToInt32(Session["TransferId"]), producto, npallet, lote, posicion);
            GvFiltro.DataSource = dt;
            GvFiltro.DataBind();

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 241, "Agrega Registro Det.Tranf.SMM");

            CVTWMSMetroClass vWMS = new CVTWMSMetroClass();
            string[] param = new string[4];
            param[0] = "Site_Id";
            param[1] = "Package_Id";
            param[2] = "Layout_Id";
            param[3] = "Package_Quantity";

            var list = GvFiltro.GetSelectedFieldValues(param);
            foreach (object[] a in list)
            {
                vWMS.AgregaBultoTransferenciaSMM(Convert.ToInt32(a[0]), Convert.ToInt32(a[1]), Convert.ToInt32(a[2]), Convert.ToInt32(Session["IDCVTUsuario"]), Convert.ToInt32(Session["TransferId"]), Convert.ToDecimal(a[3]));

            }
            btnFiltrar_Click(sender, EventArgs.Empty);
            GvDetalle.DataBind();
        }

        protected void GvDetalle_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdEliminar")
            {
                CVTWMSMetroClass vWMS = new CVTWMSMetroClass();
                string[] ids = new string[2];
                ids = e.KeyValue.ToString().Split('|');
                vWMS.EliminaBultoTransferenciaSMM(Convert.ToInt32(ids[0]), Convert.ToInt32(ids[1]));
                GvDetalle.DataBind();
            }
        }

        protected void GvDetalle_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != DevExpress.Web.GridViewRowType.Data) return;
            CVTWMSMetroClass vWMS = new CVTWMSMetroClass();

            int estadot = vWMS.ObtieneEstadoTransferenciaSMM(Convert.ToInt32(Session["TransferId"]));


            if (estadot == 1 || estadot == 3)
            {
                System.Web.UI.WebControls.ImageButton imgAnula = GvDetalle.FindRowCellTemplateControl(e.VisibleIndex, null, "Eliminar") as System.Web.UI.WebControls.ImageButton;
                imgAnula.Visible = true;
            }
            else
            {
                System.Web.UI.WebControls.ImageButton imgAnula = GvDetalle.FindRowCellTemplateControl(e.VisibleIndex, null, "Eliminar") as System.Web.UI.WebControls.ImageButton;
                imgAnula.Visible = false;
            }
        }

        protected void btnQuitarTodos_Click(object sender, EventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 241, "Elimina Registro Det.Tranf.SMM");

            CVTWMSMetroClass vWMS = new CVTWMSMetroClass();
            int TransferId = Convert.ToInt32(Session["TransferId"]);
            List<SMM_Transfer_Detail> dt = vWMS.ObtieneDetalleTransferenciaSMM(TransferId);
            foreach (var t in dt)
            {
                vWMS.EliminaBultoTransferenciaSMM(TransferId, t.Package_Id);
            }
            GvDetalle.DataBind();
        }
    }
}