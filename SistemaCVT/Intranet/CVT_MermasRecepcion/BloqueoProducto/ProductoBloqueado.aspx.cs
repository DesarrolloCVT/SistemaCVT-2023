using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.BloqueoProducto
{
    public partial class ProductoBloqueado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GvDatosProdBloqueado_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
        //    e.NewValues["FechaCreacion"] = DateTime.Now;
        //    e.NewValues["IdUsuario"] =Convert.ToInt32(Session["IDCVTUsuario"]);
        //    GvDatosProdBloqueado.DataBind();
        }

        protected void GvDatosProdBloqueado_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                Session["IdProdBloqueado"] = e.KeyValue;
                Response.Redirect("~/BloqueoProducto/ProductoBloqueadoDetalle.aspx");
            }
            if (e.CommandArgs.CommandName == "cmdLiberar")
            {
                BloqueoProductoClass bpc = new BloqueoProductoClass();

                List<CVT_Producto_Bloqueado_Detalle> lpbd = bpc.ObtieneListaProdDetalle(Convert.ToInt32(e.KeyValue));

                if(lpbd.Count>0)
                {
                    foreach (var t in lpbd)
                    {
                        bpc.LiberaBultoBloqueo(Convert.ToInt32(t.Id_ProdBloqDetalle), Convert.ToInt32(t.Id_package), Convert.ToInt32(t.Id_ProdBloqueado), Convert.ToInt32(Session["IDCVTUsuario"]));
                    }
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Bultos liberados');", true);

                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registro no contiene Bultos');", true);
                }



               
                //string[] ids = new string[2];
                //ids = e.KeyValue.ToString().Split('|');
                //bpc.LiberaBultoBloqueo(Convert.ToInt32(ids[0]), Convert.ToInt32(ids[1]), Convert.ToInt32(Session["IdProdBloqueado"]), Convert.ToInt32(Session["IDCVTUsuario"]));
                //GvDatosProdBloqDetalle.DataBind();
            }
        }

        protected void GvDatosProdBloqueado_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (e.Item.Name.Equals("Nuevo"))
            {
                PopNuevo.ShowOnPageLoad = true;

            }
        }

        protected void cboTipoBloqueo_SelectedIndexChanged(object sender, EventArgs e)
        {
            int tp = Convert.ToInt32(cboTipoBloqueo.Value);
            if (tp == 6)
            {
                lblCliente.Visible = true;
                cboCliente.Visible = true;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                BloqueoProductoClass bpc = new BloqueoProductoClass();
                CVT_Producto_Bloqueado pb = new CVT_Producto_Bloqueado();
                int tp = Convert.ToInt32(cboTipoBloqueo.Value);
                if (tp != 6)
                {
                    pb.FechaCreacion = DateTime.Now;
                    pb.IdUsuario = Convert.ToInt32(Session["IDCVTUsuario"]);
                    pb.Id_TipoBloqueo = Convert.ToInt32(cboTipoBloqueo.Value);
                    pb.Observacion = txtComentarios.Text;
                    pb.Estado = 1;

                    string res=bpc.insertaRegBloqueo(pb);

                    if(res.Equals("Creado"))
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registrado');", true);
                        PopNuevo.ShowOnPageLoad = false;
                        Limpiar();
                        GvDatosProdBloqueado.DataBind();
                    }
                    else {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al crear : " + res + " ');", true);
                        PopNuevo.ShowOnPageLoad = false;
                        Limpiar();
                        GvDatosProdBloqueado.DataBind();
                    }
                }
                else
                {
                    pb.FechaCreacion = DateTime.Now;
                    pb.IdUsuario = Convert.ToInt32(Session["IDCVTUsuario"]);
                    pb.Id_TipoBloqueo = Convert.ToInt32(cboTipoBloqueo.Value);
                    pb.Observacion = txtComentarios.Text;
                    pb.CodCliente =Convert.ToString(cboCliente.Value);
                    pb.Estado = 1;

                    string res = bpc.insertaRegBloqueo(pb);

                    if (res.Equals("Creado"))
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registrado');", true);
                        Limpiar();
                        GvDatosProdBloqueado.DataBind();
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al crear : " + res + " ');", true);
                        Limpiar();
                        GvDatosProdBloqueado.DataBind();
                    }
                }          


            }
            catch (Exception ex)
            {

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al crear : " + ex.Message + " ');", true);
            }

            Limpiar();
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Limpiar();
        }

        private void Limpiar()
        {
            cboTipoBloqueo.SelectedIndex = -1;
            txtComentarios.Text = string.Empty;
            lblCliente.Visible = false;
            cboCliente.Visible = false;
            PopNuevo.ShowOnPageLoad = false;
        }

        protected void GvDatosProdBloqueado_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != DevExpress.Web.GridViewRowType.Data) return;
            BloqueoProductoClass bpc = new BloqueoProductoClass();            

            
            int estadot = bpc.TraeEstadoCabBloqueo(Convert.ToInt32(e.KeyValue));


            if (estadot ==2)
            {
                //System.Web.UI.WebControls.ImageButton imgAnula = GvDatosProdBloqDetalle.FindRowCellTemplateControl(e.VisibleIndex, null, "Eliminar") as System.Web.UI.WebControls.ImageButton;
                System.Web.UI.WebControls.ImageButton imgliberar = GvDatosProdBloqueado.FindRowCellTemplateControl(e.VisibleIndex, null, "liberar") as System.Web.UI.WebControls.ImageButton;
                //imgAnula.Visible = false;
                imgliberar.Visible = false;


            }
            else
            {
                //System.Web.UI.WebControls.ImageButton imgAnula = GvDatosProdBloqueado.FindRowCellTemplateControl(e.VisibleIndex, null, "Eliminar") as System.Web.UI.WebControls.ImageButton;
                System.Web.UI.WebControls.ImageButton imgliberar = GvDatosProdBloqueado.FindRowCellTemplateControl(e.VisibleIndex, null, "liberar") as System.Web.UI.WebControls.ImageButton;
                //imgAnula.Visible = true;
                imgliberar.Visible = true;
            }
        }
    }  
}