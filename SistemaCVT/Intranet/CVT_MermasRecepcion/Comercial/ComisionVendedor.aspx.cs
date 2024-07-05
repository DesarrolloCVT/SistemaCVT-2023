using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Comercial
{
    public partial class ComisionVendedor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (e.Item.Name.Equals("Nuevo"))
            {
                popNuevo.ShowOnPageLoad = true;
            }
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Comision Vendedor";
                GvDatos.SettingsExport.ExcelExportMode = default;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            SAPClass spClass = new SAPClass();
            CVT_ComisionVendedor cp = new CVT_ComisionVendedor();

            List<VW_ComicionProductos_CVT> ls = spClass.ObtieneDatosProdComiCVT(cboProducto.Value.ToString());
            List<CVT_ComisionVendedor> lscom = spClass.verificaRegistroComiCVT(cboProducto.Value.ToString());

            if (lscom.Count != 0)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Producto ya existe');", true);
            }
            else
            {
                foreach (var t in ls)
                {
                    cp.ItemCode = cboProducto.Value.ToString();
                    cp.TipoComision = t.tipoComi;
                    cp.Comision = t.Comision;                   

                }

                int rest = spClass.InsertaNuevoComisionProd(cp);

                if (rest != 0)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registrado');", true);
                    GvDatos.DataBind();
                    cboProducto.SelectedIndex = -1;
                    popNuevo.ShowOnPageLoad = false;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al Registrar producto , favor verificar ');", true);
                }
            }
        }
    }
}