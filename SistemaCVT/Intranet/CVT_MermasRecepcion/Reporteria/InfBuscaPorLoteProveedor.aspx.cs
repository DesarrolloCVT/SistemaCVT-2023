using System;

namespace CVT_MermasRecepcion.Reporteria
{
    public partial class InfBuscaPorLoteProveedor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_buscar_Click(object sender, EventArgs e)
        {
            ASPxGridView1.DataBind();
        }
    }
}