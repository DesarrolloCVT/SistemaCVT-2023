using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.MayoristaOP
{
    public partial class SMMAcuerdo_Comercial_Detalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Detalle Acuerdo Comerciale N-" + Session["idAcuerdo"].ToString();
            }
            if (e.Item.Name.Equals("Nuevo"))
            {
                PopDetNuevo.ShowOnPageLoad = true;
                MMetroClass mMetro = new MMetroClass();
                Session["CodPro"] = mMetro.TraeCodProveedorAcuerdo(Convert.ToInt32(Session["idAcuerdo"]));
            }
        }

        //protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        //{
        //    e.NewValues["Id_AcuerdoComercial"] = Session["idAcuerdo"];
        //    string n =e.NewValues["Sell_int"].ToString();
        //    if (n == "")
        //    {
        //        e.NewValues["Sell_int"] = 0;
        //    }
        //}

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            decimal sInt = txtSellInt.Text == string.Empty ? 0 : Convert.ToDecimal(txtSellInt.Text);
            decimal sOut= txtShellOut.Text == string.Empty ? 0 : Convert.ToDecimal(txtShellOut.Text);
            decimal rap= txtRapel.Text == string.Empty ? 0 : Convert.ToDecimal(txtRapel.Text);
            decimal mer = txtMerma.Text == string.Empty ? 0 : Convert.ToDecimal(txtMerma.Text);
            decimal ret = txtRetiro.Text == string.Empty ? 0 : Convert.ToDecimal(txtRetiro.Text);
            decimal cen = txtCentralizado.Text == string.Empty ? 0 : Convert.ToDecimal(txtCentralizado.Text);
            int apor = txtAporteFijo.Text == string.Empty ? 0 : Convert.ToInt32(txtAporteFijo.Text);
            decimal pronPag = txtProntoPago.Text == string.Empty ? 0 : Convert.ToDecimal(txtProntoPago.Text);

            MMetroClass mMetro = new MMetroClass();
            CVT_Acuerdo_Comercial_Detalle aDt = new CVT_Acuerdo_Comercial_Detalle();

            aDt.Id_AcuerdoComercial =Convert.ToInt32(Session["idAcuerdo"]);
            aDt.CodProducto = cboProducto.Value.ToString();
            aDt.Sell_Int = sInt;
            aDt.Sell_Out = sOut;
            aDt.Rapel = rap;
            aDt.Merma = mer;
            aDt.Retiro = ret;
            aDt.Centralizado = cen;
            aDt.ProntoPago = pronPag;
            aDt.FechDesde = dteInicio.Date;
            aDt.FechHasta = dteTermino.Date;
            aDt.AporteFijo = apor;
            bool res=mMetro.InsertaDetalleAcuerdo(aDt);

            if (res != false)
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Registrado');", true);

                cboProducto.SelectedIndex = -1;
                txtSellInt.Text = string.Empty;
                txtShellOut.Text = string.Empty;
                txtRapel.Text = string.Empty;
                txtMerma.Text = string.Empty;
                txtRetiro.Text = string.Empty;
                txtCentralizado.Text = string.Empty;
                txtProntoPago.Text = string.Empty;
                PopDetNuevo.ShowOnPageLoad = false;
                GvDatos.DataBind();
            }
            else {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Error al registrar Favor Verificar');", true);
            }




        }
    }
}