using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Seguros
{
    public partial class SegurosDetalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GvDatos.DataBind();
            SeguroClass vSeg = new SeguroClass();
            int numse = vSeg.BuscaIdTipoSeguro(Convert.ToString(Session["Poliza"]));
            Session["TipoSeguro"] = numse;
            lblFac.Visible = false;
            txtNumFactura.Visible = false;
            lblPro.Visible = false;
            cboProveedor.Visible = false;

        }
        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Seguros Detalle";
            }
            if (e.Item.Name.Equals("Nuevo"))
            {
                PopNuevo.ShowOnPageLoad = true;

            }
        }

        //protected void cmdVolver_Click(object sender, ImageClickEventArgs e)
        //{
        //    Response.Redirect("Seguros.aspx");
        //}

        protected void cboMateriaAsegurada_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt32(cboMateriaAsegurada.Value) == 37)
            {
                lblFac.Visible = true;
                txtNumFactura.Visible = true;
                lblPro.Visible = true;
                cboProveedor.Visible = true;
            }
            else
            {
                lblFac.Visible = false;
                txtNumFactura.Visible = false;
                lblPro.Visible = false;
                cboProveedor.Visible = false;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            SeguroClass seg = new SeguroClass();
            CVT_Seguro_Detalle nuevo = new CVT_Seguro_Detalle();

            if (Convert.ToInt32(cboMateriaAsegurada.Value) != 36)
            {
                if (Convert.ToInt32(cboMateriaAsegurada.Value) != 37)
                {

                    nuevo.Poliza = Session["Poliza"].ToString();
                    nuevo.id_MateriaAsegurada = Convert.ToInt32(cboMateriaAsegurada.Value);
                    nuevo.Descripcion = txtDescripcion.Text;
                    nuevo.MontoAsegurado = Convert.ToDecimal(txtMontoAsegurado.Text);
                    bool res = seg.InsertaNuevoDetalleSeguo(nuevo);

                    if (res == true)
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('REGISTRADO');", true);
                        GvDatos.DataBind();
                        Limpiar();
                        PopNuevo.ShowOnPageLoad = false;
                        LogClass vLog = new LogClass();
                        vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 172, "Crea Registro");
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('NO SE PUEDE REGISTRAR');", true);
                        Limpiar();
                    }
                }
                else
                {


                    nuevo.Poliza = Session["Poliza"].ToString();
                    nuevo.id_MateriaAsegurada = Convert.ToInt32(cboMateriaAsegurada.Value);
                    nuevo.Descripcion = txtDescripcion.Text;
                    nuevo.MontoAsegurado = Convert.ToDecimal(txtMontoAsegurado.Text);
                    nuevo.NFactura = txtNumFactura.Text;
                    nuevo.CodProveedor = cboProveedor.Value.ToString();

                    bool res = seg.InsertaNuevoDetalleSeguo(nuevo);

                    if (res == true)
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('REGISTRADO');", true);
                        GvDatos.DataBind();
                        Limpiar();
                        PopNuevo.ShowOnPageLoad = false;
                        LogClass vLog = new LogClass();
                        vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 172, "Crea Registro");
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('NO SE PUEDE REGISTRAR');", true);
                        Limpiar();
                    }
                }

            }
            else
            {

                nuevo.Poliza = Session["Poliza"].ToString();
                nuevo.id_MateriaAsegurada = Convert.ToInt32(cboMateriaAsegurada.Value);
                nuevo.Descripcion = txtDescripcion.Text;
                nuevo.MontoAsegurado = Convert.ToDecimal(txtMontoAsegurado.Text);
                nuevo.NFactura = txtNumFactura.Text;
                nuevo.CodProveedor = cboProveedor.Value.ToString();

                bool res = seg.InsertaNuevoDetalleSeguo(nuevo);

                if (res == true)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('REGISTRADO');", true);
                    GvDatos.DataBind();
                    Limpiar();
                    PopNuevo.ShowOnPageLoad = false;
                    LogClass vLog = new LogClass();
                    vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 172, "Crea Registro");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('NO SE PUEDE REGISTRAR');", true);
                    Limpiar();
                }
            }
        }

        private void Limpiar()
        {
            cboMateriaAsegurada.SelectedIndex = -1;
            txtMontoAsegurado.Text = string.Empty;
            txtDescripcion.Text = string.Empty;
            txtNumFactura.Text = string.Empty;
            cboProveedor.SelectedIndex = -1;
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Limpiar();
            PopNuevo.ShowOnPageLoad = false;
        }

        protected void GvDatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 112, "Elimina Registro");
        }
    }
}
