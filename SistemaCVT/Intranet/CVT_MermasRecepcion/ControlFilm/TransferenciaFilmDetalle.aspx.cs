using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Web.UI;

namespace CVT_MermasRecepcion.ControlFilm
{
    public partial class TransferenciaFilmDetalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            det.InnerText = "Transferencia N°: " + Session["TransferId"].ToString();

            ControlFilmClass cfc = new ControlFilmClass();

            int estadot = cfc.ObtieneEstadoTransferenciaFilm(Convert.ToInt32(Session["TransferId"]));
            int idUserCreador = cfc.ObtieneIdUserTransfer(Convert.ToInt32(Session["TransferId"]));


            if ((estadot == 1 || estadot == 2) && (idUserCreador == Convert.ToInt32(Session["IDCVTUsuario"].ToString())))
            {
                BtnAgregar.Enabled = true;
                btnBuscar.Enabled = true;
                btnQuitarTodos.Enabled = true;


            }
            else /*(estadot == 4 || estadot == 5)*/
            {

                BtnAgregar.Enabled = false;
                btnBuscar.Enabled = false;
                btnQuitarTodos.Enabled = false;
            }
        }

        protected void cmdVolver_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/ControlFilm/TransferenciaFilm.aspx");
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {

            ControlFilmClass Cfc = new ControlFilmClass();
            int bodOrigen = Cfc.TraeBodegaOrigenFilm(Convert.ToInt32(Session["TransferId"]));
            

            string lote = txtLote.Text;
            string producto = cboProducto.Value == null ? string.Empty : Convert.ToString(cboProducto.Value);
            int Bodega = cboBodega.Value == null ? bodOrigen : Convert.ToInt32(cboBodega.Value);
            int Nbobona = txtNbobina.Text == string.Empty ? 0: Convert.ToInt32(txtNbobina.Text);
            int transID = Convert.ToInt32(Session["TransferId"]);                



            List<VW_FILTRO_TRANSFERENCIA_FILM> dt = new List<VW_FILTRO_TRANSFERENCIA_FILM>();
            dt = Cfc.ObtieneFiltroTransferenciaFilm(transID, producto, lote, Bodega, Nbobona);
            GvFiltro.DataSource = dt;
            GvFiltro.DataBind();
        }

        protected void BtnAgregar_Click(object sender, EventArgs e)
        {
            ControlFilmClass cfc = new ControlFilmClass();

            string[] param = new string[4];
            param[0] = "NBobina";
            param[1] = "PesoBruto";
            param[2] = "PesoNeto";
            param[3] = "PesoCono";
            //param[4] = "IdBodega";



            var list = GvFiltro.GetSelectedFieldValues(param);
            foreach (object[] a in list)
            {

                cfc.AgregaBobinaTransferencia(Convert.ToInt32(a[0]), Convert.ToDecimal(a[1]), Convert.ToInt32(Session["TransferId"]), Convert.ToDecimal(a[2]), Convert.ToDecimal(a[3]));
            }
            btnBuscar_Click(sender, EventArgs.Empty);
            GvDatos.DataBind();
        }

        protected void btnQuitarTodos_Click(object sender, EventArgs e)
        {
            ControlFilmClass cfc = new ControlFilmClass();
            int TransferId = Convert.ToInt32(Session["TransferId"]);
            List<CVT_FILM_TRANSFERENCIA_DETALLE> dt = cfc.ObtieneDetalleTransferenciaFilm(TransferId);
            foreach (var t in dt)
            {
                cfc.EliminaBultoTransferenciaFilm(TransferId, Convert.ToInt32(t.NBobina));
            }
            GvDatos.DataBind();
        }

        protected void GvDatos_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != DevExpress.Web.GridViewRowType.Data) return;

            ControlFilmClass cfc = new ControlFilmClass();

            int estadot = cfc.ObtieneEstadoTransferenciaFilm(Convert.ToInt32(Session["TransferId"]));
            int idUserCreador = cfc.ObtieneIdUserTransfer(Convert.ToInt32(Session["TransferId"]));

            if (estadot == 1 || estadot == 2 && (idUserCreador == Convert.ToInt32(Session["IDCVTUsuario"].ToString())))
            {
                System.Web.UI.WebControls.ImageButton imgAnula = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Eliminar") as System.Web.UI.WebControls.ImageButton;
                imgAnula.Visible = true;
            }
            else
            {
                System.Web.UI.WebControls.ImageButton imgAnula = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Eliminar") as System.Web.UI.WebControls.ImageButton;
                imgAnula.Visible = false;
            }
        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdEliminar")
            {
                ControlFilmClass cfc = new ControlFilmClass();
                string[] ids = new string[2];
                ids = e.KeyValue.ToString().Split('|');
                cfc.EliminaBultoTransferenciaFilm(Convert.ToInt32(ids[0]), Convert.ToInt32(ids[1]));
                GvDatos.DataBind();
            }
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Transferencia Folio-" + Session["TransferId"].ToString();
            }
        }
    }
}