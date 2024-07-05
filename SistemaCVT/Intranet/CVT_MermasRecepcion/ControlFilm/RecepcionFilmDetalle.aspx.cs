using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Web.UI;

namespace CVT_MermasRecepcion.ControlFilm
{
    public partial class RecepcionFilmDetalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int nRec = Convert.ToInt32(Session["RecepcionId"]);

            ControlFilmClass rf = new ControlFilmClass();

            List<CVT_FILM_RECEPCION> dt = rf.DatosRecepcionFilmEnc(nRec);
            foreach (var t in dt)
            {
                detalleRec.InnerText = "N° Recepcion: " + t.FolioRecep_Film;
                Session["Proveedor"] = t.Proveedor;
                Session["idBodRec"] = t.Bodega_Recep;
                int estadoRecep = Convert.ToInt32(t.Estado);

                if (estadoRecep != 1)
                {
                    btnGuardar.Enabled = false;
                }
                else { btnGuardar.Enabled = true; }


            }
        }

        protected void cmdVolver_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/ControlFilm/RecepcionFilm.aspx");
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 75, "Crea DetRecep.");

            WMSClass vWMS = new WMSClass();
            ControlFilmClass rf = new ControlFilmClass();

            CVT_FILM_BOBINA frd = new CVT_FILM_BOBINA();
            try
            {
                frd.NBobina = vWMS.getNewCorrelativo(rf.ObtieneSiteRecepcionFilm(Convert.ToInt32(Session["RecepcionId"])));
                frd.FolioRecep_Film = Convert.ToInt32(Session["RecepcionId"]);
                frd.Producto = cboProducto.Value.ToString();
                frd.LoteInterno = txtLoteInterno.Text.Trim();
                frd.LoteProveedor = txtLotProveedor.Text.Trim();
                frd.Fecha_Produc = dteFechaProd.Date;
                frd.Fecha_Venc = dteFechaVen.Date;
                frd.EstadoBobina = 1;
                frd.PesoBruto = Convert.ToDecimal(txtPesoBruto.Text);
                frd.PesoBrutoInicial = Convert.ToDecimal(txtPesoBruto.Text);
                frd.PesoCono = Convert.ToDecimal(txtPesoCono.Text);
                frd.IdBodega = Convert.ToInt32(Session["idBodRec"]);
                frd.CardCode = Session["Proveedor"].ToString();

                rf.InsertaDetRecepcion(frd);

                txtPesoBruto.Text = string.Empty;
                txtPesoCono.Text = string.Empty;
                GvDatos.DataBind();
            }
            catch
            {

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Faltan datos Favor verificar');", true);
            }


        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            ControlFilmClass rf = new ControlFilmClass();
            rf.ConfirmaPalletRecepcionFilm(Convert.ToInt32(e.KeyValue));
            GvDatos.DataBind();
        }

        protected void GvDatos_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {

            if (e.RowType != DevExpress.Web.GridViewRowType.Data) return;
            int Estado = (int)e.GetValue("EstadoBobina");
            if (Estado != 1)
            {
                System.Web.UI.WebControls.ImageButton imgAnula = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Confirma") as System.Web.UI.WebControls.ImageButton;
                imgAnula.Visible = false;
            }
        }

        private bool EvaluaEstadoPlan(DevExpress.Web.ASPxGridView grid, int visibleindex)
        {
            bool ret = true;
            int Estado = Convert.ToInt32(grid.GetRowValues(visibleindex, "EstadoBobina").ToString());
            if (Estado != 1)
            {
                ret = false;
            }
            return ret;
        }

        protected void GvDatos_CommandButtonInitialize(object sender, DevExpress.Web.ASPxGridViewCommandButtonEventArgs e)
        {

            if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Edit)
            {
                e.Visible = EvaluaEstadoPlan((DevExpress.Web.ASPxGridView)sender, e.VisibleIndex);
            }
            if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Delete)
            {
                e.Visible = EvaluaEstadoPlan((DevExpress.Web.ASPxGridView)sender, e.VisibleIndex);
            }
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Recepcion - " + Session["RecepcionId"].ToString();
            }
        }

        protected void GvDatos_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            e.NewValues["PesoBrutoInicial"] = e.NewValues["PesoBruto"];
        }
    }
}