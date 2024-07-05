using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Web.UI;

namespace CVT_MermasRecepcion.Comex
{
    public partial class DetalleCostoImportacion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 61, "Ingreso");
            }
        }

        protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        {
            //LogClass vLog = new LogClass();
            //vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 61, "Boton");
            //PopUpNuevo.ShowOnPageLoad = true;
            //cb_oc.SelectedIndex = -1;
            //cb_item.SelectedIndex = -1;
            //cb_imputacion.SelectedIndex = -1;
            //txt_valor.Text = string.Empty;
            //lbl_error.Visible = false;
        }

        protected void cb_oc_SelectedIndexChanged(object sender, EventArgs e)
        {
            GvProductos.DataBind();
            SAPClass vSAP = new SAPClass();
            ComexClass vComex = new ComexClass();
            List<OPOR> dt = vSAP.ObtieneDatosOC(Convert.ToInt32(cb_oc.Value));
            foreach (var d in dt)
            {
                lbl_proveedor.Text = d.CardName;
                lbl_factura.Text = d.NumAtCard;
                lbl_cantcamiones.Text = d.U_CantCamiones.ToString();
            }
            int cpe = vComex.ValidaExistenPreciosEntrega(Convert.ToInt32(cb_oc.Value));
            if (cpe == 0)
                lbl_advertencia.Visible = false;
            else
            {
                lbl_advertencia.Text = "ATENCION, Esta Orden de Compra ya posee Precios de Entrega, de agregar un nuevo items solo se reflejara en los nuevos Precios de Entrega";
                lbl_advertencia.Visible = true;
            }
        }

        protected void btn_grabar_Click(object sender, EventArgs e)
        {
            try
            {

                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 61, "Crea Registro");
                int OC = Convert.ToInt32(cb_oc.Value);
                string item = cb_item.Value.ToString();
                string imputacion = cb_imputacion.Value.ToString();
                decimal valor = Convert.ToDecimal(txt_valor.Text);
                CVT_DetalleCostosImportacion vNuevo = new CVT_DetalleCostosImportacion();
                vNuevo.OC = OC;
                vNuevo.Codigo_PrecioEntrega = item;
                vNuevo.Imputacion = imputacion;
                vNuevo.Valor = valor;
                vNuevo.Proveedor = cb_Proveedor.Value.ToString();
                ComexClass vComex = new ComexClass();
                bool ret = vComex.InsertaDetalleCostos(vNuevo);
                if (ret == false)
                {
                    lbl_error.Visible = true;
                    lbl_error.Text = "Registro no agregado, Revise que el registro no exista";
                }
                else
                {
                    lbl_error.Visible = false;
                }
                GvDatos.DataBind();
            }
            catch
            {
            }

        }

        protected void btn_cancelar_Click(object sender, EventArgs e)
        {
            PopUpNuevo.ShowOnPageLoad = false;
        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    LogClass vLog = new LogClass();
        //    vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 61, "Boton");
        //    DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //    this.ASPxGridViewExporter1.FileName = "Costo Importacion";
        //    this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        //}

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Costo Importacion";
            }
            if (e.Item.Name.Equals("Nuevo"))
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 61, "Boton");
                PopUpNuevo.ShowOnPageLoad = true;
                cb_oc.SelectedIndex = -1;
                cb_item.SelectedIndex = -1;
                cb_imputacion.SelectedIndex = -1;
                txt_valor.Text = string.Empty;
                lbl_error.Visible = false;
            }
        }

        protected void GvDatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 62, "Elimina Registro");
        }

        protected void GvDatos_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 62, "Actualiza Registro");
        }
    }
}