using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.UtilidadCVT
{
    public partial class VerificacionOfEnv : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
             
                GvDatos.DataSource = Session["datos"];
            }
        }

        protected void BtnBuscar_Click(object sender, EventArgs e)
        {
            int of = txtOf.Text.Equals("") ? 0 : Convert.ToInt32(txtOf.Text);
            int mes =Convert.ToInt32(cboMes.Value);
            int ano = Convert.ToInt32(cboAno.Value);
           

            ProduccionClass Pr = new ProduccionClass();
            DataTable dt = new DataTable();
            dt = Pr.SP_ListadoControlEnvasadoPT(of,mes,ano);
            GvDatos.DataSource = dt;
            GvDatos.DataBind();
            Session["datos"] = dt;
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Verificacion Of" + txtOf.Text + "-" + cboMes.Text ;
            }
        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdVerifica")
            {
                Session["IdCont"] = e.KeyValue;
                popVerificar.ShowOnPageLoad = true;
            }
            if(e.CommandArgs.CommandName=="cmdReactiva")
            {
                int idIsn = Convert.ToInt32(e.KeyValue);
                ControlFilmClass cC = new ControlFilmClass();
                ProduccionClass pC = new ProduccionClass();

                bool res = cC.ReviveBobinaCierreFolio(idIsn);

                if (res == true)
                {
                    bool rs = pC.ActualizaEstadoControlEnv(idIsn, 1, Convert.ToInt32(Session["IDCVTUsuario"]));
                    if (rs == true)
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('OF SE ENCUENRA ACTIVA');", true);                     
                      
                    }
                    else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al Reactivar OF');", true); }

                }
            }
        }

        protected void btnVerificar_Click(object sender, EventArgs e)
        {
            LogClass lg = new LogClass();
            //encriptar la clave que ingresa el usuario para ser comparada en la bd
            string pass = lg.Encrypt(txtContrasena.Text, true);

            UsuarioClass us = new UsuarioClass();
            int idUser = us.TraeIdUsuarioVerificador(txtUsuario.Text, pass);


            if (idUser == 0)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Usuario no permitido para verificar');", true);
            }
            else
            {

                int idIsn = Convert.ToInt32(Session["IdCont"]);
                ControlFilmClass cC = new ControlFilmClass();
                ProduccionClass pC = new ProduccionClass();

                bool res = cC.CambiaEstadoBobinaCierreFolio(idIsn);

                if (res == true)
                {
                    bool rs = pC.ActualizaEstadoControlEnv(idIsn, 2, Convert.ToInt32(Session["IDCVTUsuario"]));
                    if (rs == true)
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('OF Cerrada');", true);
                        popVerificar.ShowOnPageLoad = false;
                        //BtnBuscar_Click(sender, EventArgs.Empty);
                        //GvDatos.DataBind();
                    }
                    else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al cerrar OF');", true); }

                }
            }
        }

        protected void GvDatos_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {

            if (e.RowType != DevExpress.Web.GridViewRowType.Data) return;
            int Estado = (int)e.GetValue("Estado");
            if (Estado != 1)
            {
                System.Web.UI.WebControls.ImageButton imgConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "detVerifica") as System.Web.UI.WebControls.ImageButton;
                System.Web.UI.WebControls.ImageButton imgReactiva = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "detReactiva") as System.Web.UI.WebControls.ImageButton;
                imgConfirma.Visible = false;
                imgReactiva.Visible = true;
            }
            else {
                System.Web.UI.WebControls.ImageButton imgConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "detVerifica") as System.Web.UI.WebControls.ImageButton;
                System.Web.UI.WebControls.ImageButton imgReactiva = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "detReactiva") as System.Web.UI.WebControls.ImageButton;
                imgConfirma.Visible = true;
                imgReactiva.Visible = false;
            }
        }
    }
}