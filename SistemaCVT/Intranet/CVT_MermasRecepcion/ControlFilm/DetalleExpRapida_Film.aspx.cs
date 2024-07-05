using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.ControlFilm
{
    public partial class DetalleExpRapida_Film : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblFolio.Text = Session["ExpFilm_id"].ToString();
            ControlFilmClass pr = new ControlFilmClass();
            WMSClass vWMS = new WMSClass();
            List<CVT_FILM_EXPEDICION> dt = pr.ObtieneDatosDeExpedicionRapida_Film(Convert.ToInt32(Session["ExpFilm_id"]));
            foreach (var t in dt)
            {
                string nota = "";
                //lblObs.Text = t.Expedition_Note == null ? nota : t.Expedition_Note.ToString();
                lblNDoc.Text = t.ExpFilm_NumDocSap.ToString();
                Session["Site"] = t.SiteId;
                lblNombreBodega.Text = vWMS.ObtieneNombreCortoSitio(Convert.ToInt32(Session["Site"]));
                if (t.ExpFilm_Status == 2)
                {

                    Label3.Visible = false;
                    txtIdProd.Visible = false;
                }
            }
            txtIdProd.Focus();
        }

        protected void Atras_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Expedicion_Film.aspx");
        }

        protected void txtIdProd_TextChanged(object sender, EventArgs e)
        {
            ControlFilmClass cfc = new ControlFilmClass();
            CVT_FILM_EXPEDICION_DETALLE vExpd = new CVT_FILM_EXPEDICION_DETALLE();
            List<CVT_FILM_BOBINA> dt = cfc.ObtieneInfoPalletFilm(txtIdProd.Text);
            int idSite = Convert.ToInt32(Session["Site"]);

            WMSClass vWMS = new WMSClass();

            //int vResQt;

            if (dt.Count != 0) {
                foreach (var t in dt)
                {
                    //int Layoutid = Convert.ToInt32(t.Layout_Id);
                    //int Site = vWMS.ObtieneSiteLayout(Layoutid);
                    if (t.IdBodega != idSite)
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('bulto no existe en la bodega  " + lblNombreBodega.Text + "');", true);
                        txtIdProd.Text = string.Empty;
                        txtIdProd.Focus();

                    }
                    else if (t.Reserve_Quantity > 0)
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('El bulto ID: " + txtIdProd.Text + " contiene pallets en reserva');", true);
                    }
                    else if (t.EstadoBobina == 2)
                    {
                        int? gross = null;
                        int? net = null;
                        //int? tare = null;


                        vExpd.Site_id = idSite;
                        vExpd.ExpFilm_id = Convert.ToInt32(lblFolio.Text);
                        vExpd.NBobina = Convert.ToInt32(txtIdProd.Text);
                        vExpd.idUsuario = Convert.ToInt32(Session["IDCVTUsuario"]);
                        vExpd.ExpFilm_Quantity = t.PesoNeto;
                        vExpd.ExpFilm_Fech_Confirm = DateTime.Now;
                        vExpd.ExpFilm_Lote = t.LoteInterno;
                        vExpd.ExpFilm_Estado = 1;
                        cfc.InsertaRegistroDetalleExpRapida_film(vExpd);
                        GvDatos.DataBind();
                        txtIdProd.Text = string.Empty;
                        txtIdProd.Focus();
                    }

                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('El bulto N: " + txtIdProd.Text + " No existe');", true);
                GvDatos.DataBind();
                txtIdProd.Text = string.Empty;
                txtIdProd.Focus();
            }

          
        }
    }
}