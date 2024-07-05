using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Web.UI;

namespace CVT_MermasRecepcion.ControlFilm
{
    public partial class DevolucionFilmDetalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblFolio.Text = Session["Devolucion_Id"].ToString();

            ControlFilmClass cfc = new ControlFilmClass();
            WMSClass vWMS = new WMSClass();

            List<CVT_FILM_DEVOLUCION> dt = cfc.ObtieneDatosDevolucion(Convert.ToInt32(Session["Devolucion_Id"]));
            foreach (var t in dt)
            {
                string nota = "";
                lblObs.Text = t.Comentarios == null ? nota : t.Comentarios.ToString();
                string mot = "";


                switch (t.Motivo)
                {
                    case "01":
                        mot = "Mal Embobinado";
                        break;
                    case "02":
                        mot = "Problemas de Impresion";
                        break;
                    case "03":
                        mot = "COF";
                        break;
                    default:
                        mot = " Sin Sincronizacion";
                        break;
                }

                lblMotivo.Text = mot;
                int site = Convert.ToInt32(t.idBodega);
                lblNombreBodega.Text = vWMS.ObtieneNombreCortoSitio(site);

                Session["IdSite"] = t.idBodega;
                if (t.Estado != 1)
                {

                    Label3.Visible = false;
                    txtNbobina.Visible = false;
                }
            }
            txtNbobina.Focus();
        }

        protected void cmdVolver_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("DevolucionFilm.aspx");
        }

        protected void txtNbobina_TextChanged(object sender, EventArgs e)
        {
            WMSClass vWMS = new WMSClass();

            CVT_FILM_DEVOLUCION_DETALLE DevDet = new CVT_FILM_DEVOLUCION_DETALLE();
            ControlFilmClass cfc = new ControlFilmClass();

            List<CVT_FILM_BOBINA> dt = cfc.ObtieneDatosDeBobina(Convert.ToInt32(txtNbobina.Text));

            int idSite = Convert.ToInt32(Session["IdSite"]);
            int nbobinaReg = cfc.VerificaBobinaEnDevolucion(Convert.ToInt32(txtNbobina.Text));

            if (dt.Count == 0)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('N° Bobina No Existe');", true);
                txtNbobina.Text = string.Empty;
                txtNbobina.Focus();
            }
            else
            {
                foreach (var t in dt)
                {
                    if (t.IdBodega != idSite)
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Bobina no existe en la bodega  " + lblNombreBodega.Text + "');", true);
                        txtNbobina.Text = string.Empty;
                        txtNbobina.Focus();

                    }
                    else if (t.Reserve_Quantity > 0)
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Bobina N°: " + txtNbobina.Text + " contiene reserva');", true);
                    }
                    else if (Convert.ToInt32(txtNbobina.Text) == nbobinaReg)
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Bobina N°: " + txtNbobina.Text + " ya se encuentra registrada');", true);
                    }
                    else if (t.EstadoBobina == 2)
                    {

                        SAPClass spc = new SAPClass();

                        DevDet.id_DevoFilm = Convert.ToInt32(Session["Devolucion_Id"]);
                        DevDet.Nbobina = t.NBobina;
                        DevDet.CodProducto = t.Producto;
                        DevDet.DescripcionProducto = spc.ObtieneNombreProducto(t.Producto);
                        DevDet.PesoBruto = t.PesoBruto;
                        cfc.InsertaRegistroDevolFilmDetalle(DevDet);
                        GvDatos.DataBind();
                        txtNbobina.Text = string.Empty;
                        txtNbobina.Focus();
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Bobina N°:  " + txtNbobina.Text + " No se encuentra , o se encuentra en una recepcion no Confirmada ');", true);
                    }
                }
            }


        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdEliminar")
            {
                int idNbobElim = Convert.ToInt32(e.KeyValue);

                ControlFilmClass cfc = new ControlFilmClass();

                bool res = cfc.EliminaBobinaDevolucion(idNbobElim);

                if (res == true)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Bobina Quitada ');", true);
                    txtNbobina.Text = string.Empty;
                    txtNbobina.Focus();
                    GvDatos.DataBind();
                }
                //LogClass vLog = new LogClass();
                //vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 161, "Elimina Registro DetExpRap");
                //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('El bulto ID: " + idBultoElim + " se a quitado');", true);
                //GvDatos.DataBind();
            }
        }

        protected void GvDatos_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            ControlFilmClass cfc = new ControlFilmClass();
            List<CVT_FILM_DEVOLUCION> dt = cfc.ObtieneDatosDevolucion(Convert.ToInt32(Session["Devolucion_Id"]));
            foreach (var t in dt)
            {
                if (e.RowType != DevExpress.Web.GridViewRowType.Data) return;
                if (t.Estado == 2)
                {

                    //System.Web.UI.WebControls.ImageButton imgAnula = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Anula") as System.Web.UI.WebControls.ImageButton;
                    System.Web.UI.WebControls.ImageButton imgElimina = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Eliminar") as System.Web.UI.WebControls.ImageButton;
                    //imgAnula.Visible = false;
                    imgElimina.Visible = false;
                }
            }
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Detalle Devolucion Film " + lblFolio.Text;
                GvDatos.SettingsExport.ExcelExportMode = default;
            }
        }
    }
}