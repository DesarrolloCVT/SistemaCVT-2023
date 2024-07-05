using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.WMS
{
    public partial class CorrigePallet : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdModPais")
            {
                Session["NPallet"] = e.KeyValue;
                PopEditaPais.ShowOnPageLoad = true;
            }
                if (e.CommandArgs.CommandName == "cmdAgregaUbicacion")
            {
                Session["NPallet"] = e.KeyValue;
                PopAddUbi.ShowOnPageLoad = true;
            }
            if (e.CommandArgs.CommandName == "cmdElimReserva")
            {
                Session["NPallet"] = e.KeyValue;

                WMSClass wms = new WMSClass();

                List<CVT_VW_BultoConReserva> ls = wms.TraeReservaTransPerd(Convert.ToInt32(Session["NPallet"]));

                if (ls.Count != 0)
                {
                    foreach (var t in ls)
                    {
                        if (t.Package_ReserveQuantity != 0)
                        {
                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Pallet con reserva en " + t.Operacion + " con numero de operacion " + t.ID + "');", true);

                        }
                        else
                        {

                            bool resp = wms.ActualizaReservaPackage(Convert.ToInt32(Session["NPallet"]));

                            if (resp == true)
                            {
                                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Actualizado favor verificar!');", true);
                                GvDatos.DataBind();

                            }
                            else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al actualizar favor verificar!');", true); }
                        }
                    }
                }
                else
                {

                    bool resp = wms.ActualizaReservaPackage(Convert.ToInt32(Session["NPallet"]));

                    if (resp == true)
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Actualizado favor verificar!');", true);
                        GvDatos.DataBind();

                    }
                    else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al actualizar favor verificar!');", true); }

                }            
            }
        }

        protected void btnGuardaUbi_Click(object sender, EventArgs e)
        {
            WMSClass wms = new WMSClass();

            int res = wms.VerificaCodUbicacion(Convert.ToInt32(txtCodUbicacion.Text));

            if (res != 0)
            {
                bool resp = wms.ActualizaUbicacionPackage(Convert.ToInt32(Session["NPallet"]), Convert.ToInt32(txtCodUbicacion.Text));
                if (resp == true)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Actualizado favor verificar!');", true);
                    GvDatos.DataBind();
                    txtCodUbicacion.Text = string.Empty;
                    PopAddUbi.ShowOnPageLoad = false;
                }
                else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al actualizar favor verificar!');", true); }
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Ubicacion no existe !');", true);
            }
        }

        protected void btnCancela_Click(object sender, EventArgs e)
        {
            PopAddUbi.ShowOnPageLoad = false;
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            GvDatos.DataBind();
        }

        protected void btnGuardaPais_Click(object sender, EventArgs e)
        {
            WMSClass wms = new WMSClass();
            bool resp = wms.ActualizaPaisOrigenPackage(Convert.ToInt32(Session["NPallet"]), Convert.ToInt32(cbo_pais.Value));
            if (resp == true)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Actualizado favor verificar!');", true);
                GvDatos.DataBind();
                txtCodUbicacion.Text = string.Empty;
                PopEditaPais.ShowOnPageLoad = false;
            }
            else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al actualizar favor verificar!');", true); }
        }

        protected void btnCancelaPais_Click(object sender, EventArgs e)
        {
            PopEditaPais.ShowOnPageLoad = false;
        }
    }
}