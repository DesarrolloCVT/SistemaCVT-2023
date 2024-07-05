using DBMermasRecepcion;
using System;
using System.Data;
using System.Web.UI;

namespace CVT_MermasRecepcion.Inventario
{
    public partial class AuditoriaStock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtProducto.Visible = false;
            if (IsPostBack)
            {
                GvDatos.DataSource = Session["Opcion"];

            }
        }

        protected void cboInforme_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt32(cboInforme.Value) == 2)
            {
                txtProducto.Visible = true;
                txtProducto.ValidationSettings.RequiredField.IsRequired = true;
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            InventarioClass vInv = new InventarioClass();
            DataTable dt = new DataTable();

            DateTime fini = Convert.ToDateTime(dteDesde.Value);
            DateTime fter = Convert.ToDateTime(dteHasta.Value);

            int infor = Convert.ToInt32(cboInforme.Value);
            string codpro = txtProducto.Text;

            if (infor == 1)
            {
                dt = vInv.SP_AuditoriaStockGeneral(fini, fter);
                GvDatos.Columns.Clear();
                GvDatos.AutoGenerateColumns = true;
                GvDatos.DataSource = dt;
                GvDatos.DataBind();
                Session["opcion"] = dt;
                txtProducto.Text = string.Empty;
                lblTipInf.Text = "INFORME STOCK GENERAL";
            }
            if (infor == 2)
            {
                if (txtProducto.Text.Equals(""))
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error: Debe ingresar un Codigo de producto');", true);
                    txtProducto.Visible = true;
                }
                else
                {
                    dt = vInv.SP_AuditoriaStockXcodigo(fini, fter, codpro);
                    GvDatos.Columns.Clear();
                    GvDatos.AutoGenerateColumns = true;
                    GvDatos.DataSource = dt;
                    GvDatos.DataBind();
                    Session["opcion"] = dt;
                    txtProducto.Text = string.Empty;
                    txtProducto.Visible = true;
                    lblTipInf.Text = "INFORME POR CODIGO DE PRODUCTO";
                }
            }
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = lblTipInf.Text;
            }
        }
    }
}