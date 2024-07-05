using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.ControlFilm
{
    public partial class Expedicion_Film : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dteDesde.Date = DateTime.Now.AddDays(-2);
                dteHasta.Date = DateTime.Now.AddDays(1);
            }
        }

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["idUsuario"] = Session["IDCVTUsuario"];
            e.NewValues["ExpFilm_Status"] = 1;
            e.NewValues["ExpFilm_DateIn"] = DateTime.Now;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            GvDatos.DataBind();
        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                Session["ExpFilm_id"] = e.KeyValue;
                Response.Redirect("~/ControlFilm/DetalleExpRapida_Film.aspx");
            }
            if (e.CommandArgs.CommandName == "cmdEliminar")
            {
                int val = Convert.ToInt32(e.KeyValue);
                WMSClass wms = new WMSClass();
                ControlFilmClass cfc = new ControlFilmClass();
                int verif = cfc.VerificaExisBultosDetExpedicion_Film(val);
                if (verif == 0)
                {
                    bool res = cfc.eliminaExpedicionRapida_Film(val);
                    if (res == true)
                    {
                        LogClass vLog = new LogClass();
                        vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 161, "Elimina Registro");

                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Expedicion Eliminada');", true);
                        GvDatos.DataBind();
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al Eliminar Expedicion');", true);
                        GvDatos.DataBind();
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Expedicion no se puede Eliminar contiene Bultos,Favor Eliminar Bultos Primero');", true);
                }

                //TicketClass vtic = new TicketClass();
                //vtic.eliminaRespuestas(val);

            }
            if (e.CommandArgs.CommandName == "cmdConfirma")
            {
                ControlFilmClass cfc = new ControlFilmClass();

              //  WMSClass vWms = new WMSClass();
                int idExp = Convert.ToInt32(e.KeyValue);

                int MotExp = cfc.ObtieneMotivoExpedicion_Film(idExp);

                if (MotExp == 00)
                {
                    int cConfir = cfc.TraeCantidadIncluidos_Film(idExp);
                    bool ac = cfc.ActualizaEstadoExpedicionRapida_film(idExp, 2, false, cConfir);
                    bool db = cfc.DardeBajaPalletExpedicionRapida_Film(idExp);
                    if (ac == true && db == true)
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Expedicion Confirmada');", true);

                    }
                }
                else
                {
                    SAPClass sp = new SAPClass();
                    string res = sp.CreaDevolucionProveedor(idExp, Session["CIDUsuario"].ToString());
                    if (res == "0")
                    {
                        int cConfir = cfc.TraeCantidadIncluidos_Film(idExp);
                        bool ac = cfc.ActualizaEstadoExpedicionRapida_film(idExp, 2, false, cConfir);
                        bool db = cfc.DardeBajaPalletExpedicionRapida_Film(idExp);

                        if (ac == true && db == true)
                        {
                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Expedicion Confirmada');", true);

                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + res + "');", true);
                    }
                }
            }
        }

        protected void GvDatos_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != DevExpress.Web.GridViewRowType.Data) return;
            int Estado = (int)e.GetValue("ExpFilm_Status");
            if (Estado != 1)
            {
             
                System.Web.UI.WebControls.ImageButton imgConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Confirma") as System.Web.UI.WebControls.ImageButton;
                System.Web.UI.WebControls.ImageButton imgElimina = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "eliminar") as System.Web.UI.WebControls.ImageButton;
       
                imgConfirma.Visible = false;
                imgElimina.Visible = false;
            }
        }
    }
}