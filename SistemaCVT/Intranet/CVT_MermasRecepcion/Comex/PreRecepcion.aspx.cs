using DBMermasRecepcion;
using System;
using System.Collections.Generic;

namespace CVT_MermasRecepcion.Comex
{
    public partial class PreRecepcion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 62, "Ingreso");
            }
        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    LogClass vLog = new LogClass();
        //    vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 62, "Boton");
        //    DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //    this.ASPxGridViewExporter1.FileName = "Pre Recepciones";
        //    this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        //}

        //protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        //{
        //    LogClass vLog = new LogClass();
        //    vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 62, "Boton");
        //    PopUpNuevo.ShowOnPageLoad = true;
        //    cb_oc.SelectedIndex = -1;
        //    cb_producto.SelectedIndex = -1;
        //    txt_ncontenedor.Text = string.Empty;
        //    lbl_error.Visible = false;
        //}

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
        }

        protected void btn_grabar_Click(object sender, EventArgs e)
        {
            try
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 62, "Boton");
                CVT_PreRecepcion vNuevo = new CVT_PreRecepcion();
                vNuevo.OC = Convert.ToInt32(cb_oc.Value);
                vNuevo.NContenedor = txt_ncontenedor.Text;
                vNuevo.Lote_Proveedor = txt_lote.Text;
                vNuevo.CodProducto = cb_producto.Value.ToString();
                vNuevo.FProduccion = cb_fproduccion.Date;
                vNuevo.Cantidad = Convert.ToInt32(txt_cantidad.Text);
                vNuevo.FVencimiento = cb_fvencimiento.Date;
                vNuevo.ETA = cb_eta.Date;
                vNuevo.TContenedor = Convert.ToInt32(cb_tcontenedor.Value);
                vNuevo.ETD = cb_etd.Date;
                ComexClass vComex = new ComexClass();
                int ret = vComex.InsertaPreRecepcion(vNuevo);
                if (ret != 0)
                {
                    GvDatos.DataBind();
                    lbl_error.Visible = false;
                    WMSClass vWMS = new WMSClass();
                    SAPClass vSAP = new SAPClass();
                    if (vWMS.VerificaAgendamiento(txt_ncontenedor.Text, Convert.ToInt32(cb_oc.Value)) != 0)
                    {
                        string SiteDsc = vSAP.ObtieneWHSDefectoProducto(cb_producto.Value.ToString());
                        int siteid = vWMS.ObtieneSitioByNombreCorto(SiteDsc);
                        Scheduler Nuevo = new Scheduler();
                        Nuevo.Company_Id = 1;
                        Nuevo.Site_Id = siteid;
                        Nuevo.Scheduler_StartDate = cb_eta.Date.AddHours(7);
                        Nuevo.Scheduler_EndDate = cb_eta.Date.AddHours(12);
                        Nuevo.Scheduler_Status = 1;
                        Nuevo.Scheduler_Subject = lbl_proveedor.Text + " -  OC " + cb_oc.Value.ToString();
                        Nuevo.Scheduler_Description = "Creado Automaticamente SistemaCVT PreRecepcion " + ret;
                        Nuevo.Scheduler_AllDay = false;
                        Nuevo.Scheduler_ContactInfo = "86";
                        Nuevo.Business_Partner_Id = "19";
                        Nuevo.Scheduler_Type = 0;
                        Nuevo.InputType_Id = 1;
                        Nuevo.Worktype_Id = 1;
                        Nuevo.PackageState_Id = 3;
                        Nuevo.Scheduler_SendStat = 1;
                        Nuevo.Scheduler_Order_Id = 0;
                        Nuevo.Scheduler_CrossDocking = 0;
                        Nuevo.Scheduler_USE = Convert.ToInt32(cb_oc.Value);
                        Nuevo.Scheduler_Note = txt_ncontenedor.Text;
                        vWMS.AgregaAgendamiento(Nuevo);
                    }

                }
                else
                {
                    lbl_error.Text = "Registro no pudo ser creado, Favor revisar que no exista";
                    lbl_error.Visible = true;
                }

            }
            catch
            {
            }
        }

        protected void btn_cancelar_Click(object sender, EventArgs e)
        {
            PopUpNuevo.ShowOnPageLoad = false;
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Pre Recepciones";
            }
            if (e.Item.Name.Equals("Nuevo"))
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 61, "Boton");
                PopUpNuevo.ShowOnPageLoad = true;
                cb_oc.SelectedIndex = -1;
                cb_producto.SelectedIndex = -1;
                txt_ncontenedor.Text = string.Empty;
                lbl_error.Visible = false;
            }
        }
    }
}