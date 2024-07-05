using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.BloqueoProducto
{
    public partial class ProductoBloqueadoDetalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            BloqueoProductoClass bpc = new BloqueoProductoClass();
            int estadoBloq = bpc.TraeEstadoCabBloqueo(Convert.ToInt32(Session["IdProdBloqueado"]));

            if (estadoBloq != 1)
            {
                btnFiltrar.Enabled = false;
                btnAgregar.Enabled = false;
                btnQuitarTodos.Enabled = false;
            }
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            string lote = txtLote.Text;
            string producto = cboCodProd.Value == null ? string.Empty : Convert.ToString(cboCodProd.Value);
            int NRecepcion = txtRecepcion.Text == string.Empty ? 0 : Convert.ToInt32(txtRecepcion.Text);
            int npallet = txtNPallet.Text == string.Empty ? 0 : Convert.ToInt32(txtNPallet.Text);

            BloqueoProductoClass bpc = new BloqueoProductoClass();
            List<CVT_VW_FiltroDetProdBloqueado> dt = new List<CVT_VW_FiltroDetProdBloqueado>();
            dt = bpc.ObtieneFiltroBP(NRecepcion,npallet,producto,lote);
            GvFiltroBpDetalle.DataSource = dt;
            GvFiltroBpDetalle.DataBind();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            BloqueoProductoClass bpc = new BloqueoProductoClass();
            string[] param = new string[2];
            param[0] = "Package_Id";
            param[1] = "Layout_Id";

            var list = GvFiltroBpDetalle.GetSelectedFieldValues(param);

            int Id_BProducto = Convert.ToInt32(Session["IdProdBloqueado"]);
            int Id_TipoBloqueo = bpc.TraeTipoBloqueo(Id_BProducto);
            string CodCliBloqueo = bpc.TraeCodCliBloqueo(Id_BProducto);

            foreach (object[] a in list)
            {
                bpc.AgregaBultoPBDetalle(Id_BProducto,Id_TipoBloqueo, Convert.ToInt32(a[0]),CodCliBloqueo, Convert.ToInt32(Session["IDCVTUsuario"]));
            }
            txtNPallet.Text = "-1";
            btnFiltrar_Click(sender, EventArgs.Empty);
            GvDatosProdBloqDetalle.DataBind();

            Limpiar();
        }

        protected void btnQuitarTodos_Click(object sender, EventArgs e)
        {
            BloqueoProductoClass bpc = new BloqueoProductoClass();
            int IdBproducto = Convert.ToInt32(Session["IdProdBloqueado"]);
            List<CVT_Producto_Bloqueado_Detalle> dt = bpc.ObtieneDetalleBloqueoProducto(IdBproducto);
            foreach (var t in dt)
            {
                bpc.EliminaBultoDetableBloqueo(IdBproducto,Convert.ToInt32(t.Id_package));
            }
            GvDatosProdBloqDetalle.DataBind();
        }

        private void Limpiar()
        {
            txtLote.Text = string.Empty;
            txtRecepcion.Text = string.Empty;
            txtNPallet.Text = string.Empty;
            cboCodProd.SelectedIndex = -1;
        }

        protected void cmdVolver_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("ProductoBloqueado.aspx");
        }

        protected void GvDatosProdBloqDetalle_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdEliminar")
            {
                BloqueoProductoClass bpc = new BloqueoProductoClass();
                string[] ids = new string[2];
                ids = e.KeyValue.ToString().Split('|');
                bpc.EliminaBultoBloqueo(Convert.ToInt32(ids[0]), Convert.ToInt32(ids[1]));
                GvDatosProdBloqDetalle.DataBind();
            }
            if (e.CommandArgs.CommandName == "cmdLiberar")
            {
                BloqueoProductoClass bpc = new BloqueoProductoClass();
                string[] ids = new string[2];
                ids = e.KeyValue.ToString().Split('|');
                bpc.LiberaBultoBloqueo(Convert.ToInt32(ids[0]), Convert.ToInt32(ids[1]), Convert.ToInt32(Session["IdProdBloqueado"]), Convert.ToInt32(Session["IDCVTUsuario"]));
                GvDatosProdBloqDetalle.DataBind();
            }
        }

        protected void GvDatosProdBloqDetalle_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != DevExpress.Web.GridViewRowType.Data) return;
             BloqueoProductoClass bpc = new BloqueoProductoClass();
            string[] ids = new string[2];
            ids = e.KeyValue.ToString().Split('|');

            int estadot = bpc.TraeIdLibera(Convert.ToInt32(ids[0]));


            if (estadot>0)
            {
                System.Web.UI.WebControls.ImageButton imgAnula = GvDatosProdBloqDetalle.FindRowCellTemplateControl(e.VisibleIndex, null, "Eliminar") as System.Web.UI.WebControls.ImageButton;
                System.Web.UI.WebControls.ImageButton imgliberar = GvDatosProdBloqDetalle.FindRowCellTemplateControl(e.VisibleIndex, null, "liberar") as System.Web.UI.WebControls.ImageButton;
                imgAnula.Visible = false;
                imgliberar.Visible = false;


            }
            else
            {
                System.Web.UI.WebControls.ImageButton imgAnula = GvDatosProdBloqDetalle.FindRowCellTemplateControl(e.VisibleIndex, null, "Eliminar") as System.Web.UI.WebControls.ImageButton;
                System.Web.UI.WebControls.ImageButton imgliberar = GvDatosProdBloqDetalle.FindRowCellTemplateControl(e.VisibleIndex, null, "liberar") as System.Web.UI.WebControls.ImageButton;
                imgAnula.Visible = true;
                imgliberar.Visible = true;
            }
        }
    }
}