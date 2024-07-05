using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Mayorista
{
    public partial class SMMComisionProductos : System.Web.UI.Page
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
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            CVTWMSMetroClass cvwms = new CVTWMSMetroClass();
            SMM_ComisionProductos cp = new SMM_ComisionProductos();

            List<VW_SMM_ComisionProductos> ls = cvwms.ObtieneDatosProdComi(cboProducto.Value.ToString());
            List<SMM_ComisionProductos> lscom = cvwms.verificaRegistroComi(cboProducto.Value.ToString());

            if(lscom.Count!=0)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Producto ya existe');", true);
            }
            else 
            {
                foreach (var t in ls)
                {
                    cp.CodProducto = cboProducto.Value.ToString();
                    cp.Cod_Sub_Categoria = t.U_SubCategoria;
                    cp.PrcComision = t.prcComision;
                    cp.TipoComision = t.TipoComision;
                    cp.Cod_Categoria = t.ItmsGrpCod;
                    cp.NombreProducto = t.ItemName;
                    cp.U_MarcaProducto = t.U_MarcaProducto;

                }

                int rest = cvwms.InsertaNuevoComisionProd(cp);

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