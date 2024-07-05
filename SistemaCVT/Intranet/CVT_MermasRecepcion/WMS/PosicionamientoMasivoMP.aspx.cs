using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.WMS
{
    public partial class PosicionamientoMasivoMP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            WMSClass Wmsc = new WMSClass();

            int site = Wmsc.TraeSiteIdRecepcion(Convert.ToInt32(txtNRecepcion.Text));
         

            if (site == 2 || site==1)
            {
                Session["Bodegarecepcion"] = site;
                Session["nrep"] = txtNRecepcion.Text;
                GvDatos.DataBind();
                Div1.Visible = true;
                btnPosicionar.Enabled = true;
            }
            else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Recepcion no se encuentra en bodega CV101');", true);
            }      

        }

        protected void btnPosicionar_Click(object sender, EventArgs e)
        {
            WMSClass Wmsc = new WMSClass();

            int lay = Wmsc.VerificaLayoutIdPos(Convert.ToInt32(txtNPosicion.Text), Convert.ToInt32(Session["Bodegarecepcion"]));

            if (lay != 0)
            {
                int staffid = Wmsc.ObtieneIdStaff(Session["CIDUsuario"].ToString());
                int idRecep = Convert.ToInt32(txtNRecepcion.Text);

                int CantReg = Wmsc.ActualizaLayoutPosMasivo(idRecep, lay, staffid);

                if (CantReg != 0)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Se han posicionado: " + CantReg.ToString() + " Bultos, en la Posicion "+lay.ToString()+"');", true);
                    Div1.Visible = false;
                    txtNPosicion.Text = string.Empty;
                    btnPosicionar.Enabled = false;
                }
                else {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Bultos no se pueden posicionar favor verificar');", true);
                    Div1.Visible = false;
                    txtNPosicion.Text = string.Empty;
                    btnPosicionar.Enabled = false;
                }
            }
            else {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Posicion No existe en la Bodega CV101');", true);
            }
        }
    }
}