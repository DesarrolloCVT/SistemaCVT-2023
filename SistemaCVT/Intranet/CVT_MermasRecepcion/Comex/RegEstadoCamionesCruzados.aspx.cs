using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Comex
{
    public partial class RegEstadoCamionesCruzados : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbOC.Visible = false;
            lbNCamion.Visible = false;
            lbProd.Visible = false;
            lbProve.Visible = false;
        }

        protected void txtReferencia_TextChanged(object sender, EventArgs e)
        {
            ComexClass cC = new ComexClass();
            string nRef = txtReferencia.Text;

            int vOC = cC.BuscaOC(nRef);
            int vNCamiones = cC.BuscaNCamiones(nRef);
            int vDocEntry = cC.BuscaDocEntry(nRef);
            string vCodProd = cC.BuscaProducto(vDocEntry);
            string vCodProveed = cC.BuscaTraeProveedor(nRef);
            string vNombreProducto = cC.TraeNombreProducto(vDocEntry);
            string vNombreProveedor = cC.TraeNombreProveedor(nRef);

            if (vOC == 0)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Referencia n°: " + nRef + "  no tiene OC asociada');", true);
            }
            else
            {

                lbOC.Visible = true;
                lbNCamion.Visible = true;
                lbProd.Visible = true;
                lbProve.Visible = true;

                txOC.Text = vOC.ToString();
                txNCamiones.Text = vNCamiones.ToString();
                txProducto.Text = vCodProd.ToString() + " " + vNombreProducto.ToString();
                txProveedor.Text = vNombreProveedor.ToString();
            }


        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            ComexClass cC = new ComexClass();
            string nRef = txtReferencia.Text;

            int vOC = cC.BuscaOC(nRef);
            int vNCamiones = cC.BuscaNCamiones(nRef);
            int vDocEntry = cC.BuscaDocEntry(nRef);
            string vCodProd = cC.BuscaProducto(vDocEntry);
            string vCodProveed = cC.BuscaTraeProveedor(nRef);
            string vNombreProducto = cC.TraeNombreProducto(vDocEntry);
            string vNombreProveedor = cC.TraeNombreProveedor(nRef);

            CVT_RegEstadoCamionesCruzados rcc = new CVT_RegEstadoCamionesCruzados();

            rcc.Fercha = DateTime.Now;
            rcc.Referencia = nRef;
            rcc.Informados = txtInformados.Text == string.Empty ? 0 : Convert.ToInt32(txtInformados.Text);
            rcc.Cruzados = txtCruzados.Text == string.Empty ? 0 : Convert.ToInt32(txtCruzados.Text);
            rcc.Liberados = txtCruzados.Text == string.Empty ? 0 : Convert.ToInt32(txtLiberados.Text);
            rcc.Llegados = txtCruzados.Text == string.Empty ? 0 : Convert.ToInt32(txtllegados.Text);
            rcc.Recepcionados = txtRecepcionados.Text == string.Empty ? 0 : Convert.ToInt32(txtRecepcionados.Text);
            rcc.OC = vOC;
            rcc.NCamiones = vNCamiones;
            rcc.Producto = vCodProd;
            rcc.Proveedor = vCodProveed;

            bool result = cC.InsertaRegCamionCruzado(rcc);
            if (result == true)
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 233, "Crea Registro");

                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registro Guardado');", true);
                GvDatos.DataBind();
                PopRegistro.ShowOnPageLoad = false;
                Limpiar();

            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al Registrar Contactar con Administrador');", true);
                Limpiar();
            }

        }

        protected void Limpiar()
        {
            lbOC.Visible = false;
            lbNCamion.Visible = false;
            lbProd.Visible = false;
            lbProve.Visible = false;

            txOC.Text = string.Empty;
            txNCamiones.Text = string.Empty;
            txProducto.Text = string.Empty;
            txProveedor.Text = string.Empty;

            txtReferencia.Text = string.Empty;
            txtInformados.Text = string.Empty;
            txtCruzados.Text = string.Empty;
            txtLiberados.Text = string.Empty;
            txtllegados.Text = string.Empty;
            txtRecepcionados.Text = string.Empty;

        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (e.Item.Name.Equals("Nuevo"))
            {
                PopRegistro.ShowOnPageLoad = true;
            }
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Estado Camiones";
            }

        }

        protected void GvDatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 233, "Elimina Registro");
        }

        protected void GvDatos_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 233, "Actualiza Registro");
        }
    }
}