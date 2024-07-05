using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.ControlFilm
{
    public partial class DevolucionFilm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                dteDesde.Date = DateTime.Now.AddDays(-9);
                dteHasta.Date = DateTime.Now.AddDays(1);
            }
        }

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["FechaInicio"] = DateTime.Now;
            e.NewValues["Estado"] = 1;
            e.NewValues["IdUsuario"] = Session["IDCVTUsuario"];
            GvDatos.DataBind();
        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                Session["Devolucion_Id"] = e.KeyValue;
                Response.Redirect("~/ControlFilm/DevolucionFilmDetalle.aspx");
            }
            if (e.CommandArgs.CommandName == "cmdConfirma")
            {
                ControlFilmClass cfc = new ControlFilmClass();

                int idDevo = Convert.ToInt32(e.KeyValue);
                string MotDev = cfc.ObtieneMotivoDevolucion(idDevo);


                //if (MotDev.Equals("00"))
                //{
                    int cConfir = cfc.TraeCantidadBobinas(idDevo);
                    bool ac = cfc.ActualizaEstadoDevolucion(idDevo, cConfir);
                    bool db = cfc.DardeBajaBobinasDevolucion(idDevo);
                    if (ac == true && db == true)
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Devolucion Confirmada');", true);

                    }
                //}
                //else
                //{
                //    SAPClass sp = new SAPClass();
                //    string res = sp.CreaSalidaExpedicionRapida(idDevo, Session["CIDUsuario"].ToString());//Crear en sap
                //    if (res == "0")
                //    {
                //        int cConfir = cfc.TraeCantidadBobinas(idDevo);
                //        bool ac = cfc.ActualizaEstadoDevolucion(idDevo, cConfir);
                //        bool db = cfc.DardeBajaBobinasDevolucion(idDevo);

                //        if (ac == true && db == true)
                //        {
                //            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Devolucion Confirmada');", true);

                //        }
                //    }
                //    else
                //    {
                //        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + res + "');", true);
                //    }


                //}
            }
            if (e.CommandArgs.CommandName == "cmdEliminar")
            {
                int idDevo = Convert.ToInt32(e.KeyValue);

                ControlFilmClass cfc = new ControlFilmClass();

                int verif = cfc.VerificaExisBobinasDetDevolucion(idDevo);
                if (verif == 0)
                {
                    bool res = cfc.eliminaDevolucionFilm(idDevo);
                    if (res == true)
                    {
                        //LogClass vLog = new LogClass();
                        //vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 161, "Elimina Registro");

                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Devolucion Eliminada');", true);
                        GvDatos.DataBind();
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al Eliminar Devolucion');", true);
                        GvDatos.DataBind();
                    }

                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Devolucion no se puede Eliminar contiene Bultos,Favor Eliminar Bultos Primero');", true);
                }

            }
        }

        protected void GvDatos_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {

            if (e.RowType != DevExpress.Web.GridViewRowType.Data) return;
            int Estado = (int)e.GetValue("Estado");
            if (Estado != 1)
            {
                System.Web.UI.WebControls.ImageButton imgConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Confirma") as System.Web.UI.WebControls.ImageButton;
                System.Web.UI.WebControls.ImageButton imgElimina = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "eliminar") as System.Web.UI.WebControls.ImageButton;
                imgConfirma.Visible = false;
                imgElimina.Visible = false;
            }
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Devolucion Film";
            }
        }
    }
}