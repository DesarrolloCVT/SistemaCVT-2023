using DBMermasRecepcion;
using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Mayorista
{
    public partial class SMM_CotizacionCajasDetalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GvDatos.DataBind();
                lblNCoti.Text = "Cotizacion N°:" + Session["Id_Cotizacion"].ToString();

                CVTWMSMetroClass mws = new CVTWMSMetroClass();

                int dir = mws.ObtieneDireccionFac(Convert.ToInt32(Session["Id_Cotizacion"]));
                int prec = mws.ObtienePrecioVenta(Convert.ToInt32(Session["Id_Cotizacion"]));
                string tip = mws.ObtieneTipoPago(Convert.ToInt32(Session["Id_Cotizacion"]));

                int estad = mws.TraeEstadoCotizacion(Convert.ToInt32(Session["Id_Cotizacion"]));

                //ASPxRoundPanel1.Collapsed = true;
                ASPxRoundPanel2.Collapsed = true;

                switch (estad)
                {
                    case 2:
                        btnGuardar.Visible = false;
                        btnGuardarDirEnvio.Visible = false;
                        btnGuardarDeterminado.Visible = false;
                        break;
                    case 3:
                        btnGuardar.Visible = false;
                        btnGuardarDirEnvio.Visible = false;
                        btnGuardarDeterminado.Visible = false;
                        break;
                    case 4:
                        btnGuardar.Visible = true;
                        btnGuardarDirEnvio.Visible = true;
                        btnGuardarDeterminado.Visible = false;
                        break;
                    case 5:
                        btnGuardar.Visible = false;
                        btnGuardarDirEnvio.Visible = false;
                        btnGuardarDeterminado.Visible = false;
                        break;
                    default:
                        btnGuardar.Visible = true;
                        btnGuardarDirEnvio.Visible = true;
                        break;
                }


                if (dir != 0)
                {
                    txtdireccionFact.Visible = false;
                    btnGuardarDireFac.Visible = false;
                    lblfac.Visible = false;
                }

                if (!IsPostBack)
                {
                    if (prec != 0)
                    {
                        txtPrecioVenta.Visible = false;
                        lblPrecVenta.Visible = false;
                    }
                    if (tip != "")
                    {
                        txtFormaDePago.Visible = false;
                        lblFormPago.Visible = false;
                    }
                    if (prec != 0 && tip != "")
                    {
                        txtFormaDePago.Visible = false;
                        lblFormPago.Visible = false;
                        txtPrecioVenta.Visible = false;
                        lblPrecVenta.Visible = false;
                        btnGuardar.Visible = false;
                    }
                }
            }         
            
            //if (!IsPostBack)
            //{
            //    Total();
            //}


            //int siValue = Convert.ToInt32(GvDatos.GetTotalSummaryValue(
            //   GvDatos.TotalSummary["CostoTotal", DevExpress.Data.SummaryItemType.Sum]));
            //    ASPxSummaryItem sum = new ASPxSummaryItem();

        }

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["Cotizacion_Id"] = Session["Id_Cotizacion"];
            GvDatos.DataBind();        
        }

        private double Total()
        {
            ASPxSummaryItem sumCosTotal = GvDatos.TotalSummary["CostoTotal", DevExpress.Data.SummaryItemType.Sum];
            int CosTotal = Convert.ToInt32(GvDatos.GetTotalSummaryValue(sumCosTotal));

            ASPxSummaryItem sumPrecioTotal = GvDatos.TotalSummary["PrecioTotal", DevExpress.Data.SummaryItemType.Sum];
            int PrecioTotal = Convert.ToInt32(GvDatos.GetTotalSummaryValue(sumPrecioTotal));

            double MargenTotal = 1 - ((Convert.ToDouble(CosTotal)) / (Convert.ToDouble(PrecioTotal)));

           return  MargenTotal;

        }
        protected void Atras_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("SMM_CotizacionCajas.aspx");
        }

        protected void GvDatos_CustomSummaryCalculate(object sender, DevExpress.Data.CustomSummaryEventArgs e)
        {
            e.TotalValue = Total();
        }

        protected void btnGuardarDireFac_Click(object sender, EventArgs e)
        {
            CVTWMSMetroClass mws = new CVTWMSMetroClass();
            SMM_Cotizacion_Cajas_Direccion dir = new SMM_Cotizacion_Cajas_Direccion();

            dir.Direccion = txtdireccionFact.Text;
            dir.TipoDireccion = "F";
            dir.Id_Cotizacion = Convert.ToInt32(Session["Id_Cotizacion"]);
            mws.CreaDireccionCotizacion(dir);
            GvDatosDireccion.DataBind();
            txtDirecEnvio.Focus();
            txtdireccionFact.Visible = false;
            btnGuardarDireFac.Visible = false;
            lblfac.Visible = false;
        }

        protected void btnGuardarDirEnvio_Click(object sender, EventArgs e)
        {
            CVTWMSMetroClass mws = new CVTWMSMetroClass();
            SMM_Cotizacion_Cajas_Direccion dir = new SMM_Cotizacion_Cajas_Direccion();

            dir.Direccion = txtDirecEnvio.Text;
            dir.CantCajas = Convert.ToInt32(txtCantidad.Text);
            dir.Id_Cotizacion = Convert.ToInt32(Session["Id_Cotizacion"]);
            dir.TipoDireccion = "E";
            mws.CreaDireccionCotizacion(dir);
            GvDatosDireccion.DataBind();
            txtDirecEnvio.Text = string.Empty;
            txtCantidad.Text = string.Empty;
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            CVTWMSMetroClass mws = new CVTWMSMetroClass();
            SMM_Cotizacion_Cajas co = new SMM_Cotizacion_Cajas();

            string tipo = txtFormaDePago.Text.ToUpper().Trim();
            
            //co.Nombre_Cliente = txtNombreCliente.Text;
            co.PrecioVenta = Convert.ToInt32(txtPrecioVenta.Text);
            co.FormaDePago =tipo;
            //co.Estado = 1;
            //co.Id_Usuario = Convert.ToInt32(Session["IDCVTUsuario"]);
            //co.FechaCotizacion = DateTime.Now;
            //int idCotizacion = mws.CreaNuevaCotizacion(co);

            mws.ActualizaCotizacion(Convert.ToInt32(Session["Id_Cotizacion"]), co);
            txtPrecioVenta.Visible = false;
            txtFormaDePago.Visible = false;
            lblFormPago.Visible = false;
            lblPrecVenta.Visible = false;
            btnGuardar.Visible = false;
        }

        protected void btnGuardarDeterminado_Click(object sender, EventArgs e)
        {
            string CodProPad = cboProducto.Value.ToString();
            CVTWMSMetroClass ms =new CVTWMSMetroClass();         


            List<VW_LISTA_MATERIALES_CAJAS_TIPO> ls = ms.ListaMaterialesCaja(CodProPad);


            if (ls.Count > 0)
            {
                foreach (var t in ls)
                {

                    SMM_Cotizacion_Cajas_Detalle ct = new SMM_Cotizacion_Cajas_Detalle();

                    ct.Cotizacion_Id = Convert.ToInt32(Session["Id_Cotizacion"]);
                    ct.CodigoKitPred = CodProPad;
                    ct.CodProducto = t.CodProducto;
                    ct.Cantidad = Convert.ToInt32(t.Cantidad);
                    //ct.Precio = Convert.ToInt32(t.Precio);
                    ct.CostoUnitario = Convert.ToInt32(t.Precio);
                    ms.AgregaProdListaCaja(ct);
                }               

            }
            else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('No se encuentran Productos Para esta Caja');", true); }
            GvDatos.DataBind();


            //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Aun no disponible');", true);
        }

        private bool EvaluaEstadoPlan(DevExpress.Web.ASPxGridView grid, int visibleindex)
        {
            CVTWMSMetroClass mws = new CVTWMSMetroClass();
            bool ret = true;
            int Estado = mws.TraeEstadoCotizacion(Convert.ToInt32(Session["Id_Cotizacion"]));
            if (Estado!=1 /*== 2 || (Estado== 5 || Estado==3)*/)
            {
                ret = false;               
            }
            return ret;
        }

        protected void GvDatos_CommandButtonInitialize(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Edit)
            {
                e.Visible = EvaluaEstadoPlan((DevExpress.Web.ASPxGridView)sender, e.VisibleIndex);
            }
            if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Delete)
            {
                e.Visible = EvaluaEstadoPlan((DevExpress.Web.ASPxGridView)sender, e.VisibleIndex);
            }
        }
    }
}