using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Web.UI;

namespace CVT_MermasRecepcion.MayoristaOP
{
    public partial class SMMRecepcionDetalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cboProdcutoVenta.Visible = false;
            cboProductoCompra.Visible = false;
            lbl_recepcion.Text = Session["RecepcionId"].ToString();

            CVTWMSMetroClass wmsM = new CVTWMSMetroClass();

            Session["NumDocSap"] = wmsM.obtieneNumDocSAPRecepcion(Convert.ToInt32(Session["RecepcionId"]));
            Session["Prove"] = wmsM.obtieneProveedorRecepcion(Convert.ToInt32(Session["RecepcionId"]));

            int tipo = wmsM.obtieneTipoRecepcion(Convert.ToInt32(Session["RecepcionId"]));

            int stadoRecep = wmsM.obtieneEstadoRecepcion(Convert.ToInt32(Session["RecepcionId"]));

            if (stadoRecep != 1)
            {
                btn_agregarbulto.Visible = false;
            }
            else { btn_agregarbulto.Visible = true; }

            if (tipo == 1)
            {
                cboProductoCompra.Visible = true;

            }
            else
            {
                cboProdcutoVenta.Visible = true;
            }
        }

        protected void btn_agregarbulto_Click(object sender, EventArgs e)
        {
            CVTWMSMetroClass wmsM = new CVTWMSMetroClass();
            SMM_Package vNuevo = new SMM_Package();

            int tipo = wmsM.obtieneTipoRecepcion(Convert.ToInt32(Session["RecepcionId"]));
            int Numd = Convert.ToInt32(Session["NumDocSap"]);
            int bodegaRese = wmsM.obtieneBodegaRecepcion(Convert.ToInt32(Session["RecepcionId"]));

            #region CalculaDiasUti      
            DateTime fecha;
            int Tdias = 0;

            DateTime fechaProduccion = new DateTime();
            DateTime fechaVencimiento = new DateTime();
            int diasUtilEfec = 0;
            string textErr = "";

            if (cb_fproduccion.Value != null && cb_fvencimiento.Value == null)
            {
                if (DateTime.Compare(cb_fproduccion.Date, DateTime.Now) > 0)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Fecha de produccion no puede ser superior a la fecha actual');", true);
                }
                else
                {

                    int dDif = 0;

                    if (tipo == 1)
                    {
                        diasUtilEfec = wmsM.diasUtilesEfec(Convert.ToString(cboProductoCompra.Value));

                        fechaVencimiento = Convert.ToDateTime(cb_fproduccion.Value).AddDays(diasUtilEfec);
                        fechaProduccion = Convert.ToDateTime(cb_fproduccion.Value);
                        fecha = Convert.ToDateTime(fechaVencimiento);
                        TimeSpan tsp = fecha.AddDays(1) - DateTime.Now;
                        dDif = tsp.Days;
                        textErr = "Fecha de vencimiento calculada en base a Fecha de produccion y dias maximos utiles , fecha de vencimiento estimada " + fechaVencimiento;
                    }
                    else
                    {
                        diasUtilEfec = wmsM.diasUtilesEfec(Convert.ToString(cboProdcutoVenta.Value));

                        fechaVencimiento = Convert.ToDateTime(cb_fproduccion.Value).AddDays(diasUtilEfec);
                        fechaProduccion = Convert.ToDateTime(cb_fproduccion.Value);
                        fecha = Convert.ToDateTime(fechaVencimiento);
                        TimeSpan tsp = fecha.AddDays(1) - DateTime.Now;
                        dDif = tsp.Days;
                        textErr = "Fecha de vencimiento calculada en base a Fecha de produccion y dias maximos utiles , fecha de vencimiento estimada " + fechaVencimiento;
                    }

                    Tdias = dDif;
                }
            }
            else if (cb_fvencimiento.Value != null && cb_fproduccion.Value == null)
            {
                if (DateTime.Compare(cb_fvencimiento.Date, DateTime.Now) < 0)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Fecha de vencimiento no puede ser menor a la fecha actual');", true);
                }
                else
                {

                    int dDif = 0;

                    if (tipo == 1)
                    {
                        diasUtilEfec = wmsM.diasUtilesEfec(Convert.ToString(cboProductoCompra.Value));

                        fechaProduccion = Convert.ToDateTime(cb_fvencimiento.Value).AddDays(-diasUtilEfec);
                        fechaVencimiento = Convert.ToDateTime(cb_fvencimiento.Value);
                        fecha = Convert.ToDateTime(cb_fvencimiento.Value);
                        TimeSpan tsp = fecha.AddDays(1) - DateTime.Now;
                        dDif = tsp.Days;
                        textErr = "Fecha de Produccion calculada en base a Fecha de Vencimiento y dias maximos utiles , fecha de Produccion estimada " + fechaProduccion;
                    }
                    else
                    {
                        diasUtilEfec = wmsM.diasUtilesEfec(Convert.ToString(cboProdcutoVenta.Value));

                        fechaProduccion = Convert.ToDateTime(cb_fvencimiento.Value).AddDays(diasUtilEfec);
                        fechaVencimiento = Convert.ToDateTime(cb_fvencimiento.Value);
                        fecha = Convert.ToDateTime(cb_fvencimiento.Value);
                        TimeSpan tsp = fecha.AddDays(1) - DateTime.Now;
                        dDif = tsp.Days;
                        textErr = "Fecha de Produccion calculada en base a Fecha de Vencimiento y dias maximos utiles , fecha de Produccion estimada " + fechaProduccion;
                    }

                    Tdias = dDif;
                }
            }
            else
            {
                fechaProduccion = Convert.ToDateTime(cb_fproduccion.Value);
                fechaVencimiento = Convert.ToDateTime(cb_fvencimiento.Value);
                fecha = cb_fvencimiento.Date.AddDays(1);
                TimeSpan tsp = fecha - DateTime.Now;

                if (tipo == 1)
                {
                    diasUtilEfec = wmsM.diasUtilesEfec(Convert.ToString(cboProductoCompra.Value));                  
                }
                else
                {
                    diasUtilEfec = wmsM.diasUtilesEfec(Convert.ToString(cboProdcutoVenta.Value));                   
                }

                Tdias = tsp.Days;
            }
            #endregion



            if (bodegaRese == 1)
            {
                if (tipo == 1)
                {
                    List<VW_MMETRO_PRODUCTOS_RECEPCIONXCOMPRA> ret1 = wmsM.ObtieneDetosProdRecepcionxCompra(Convert.ToString(cboProductoCompra.Value), txt_dun14.Text);

                    int diasUtil = wmsM.diasUtil(Convert.ToString(cboProductoCompra.Value));

                    if (Tdias >= diasUtil)
                    {
                        if (ret1.Count != 0)
                        {
                            List<SMM_VW_DATO_PROD_RECEPCION> ret = wmsM.ObtieneDetosProdRecepcion(Convert.ToString(cboProductoCompra.Value), txt_dun14.Text);

                            int uMed = wmsM.UMedidaRecepcion(Convert.ToString(cboProductoCompra.Value), txt_dun14.Text);

                            decimal cant=0;

                            if (ret.Count != 0)
                            {
                                //if(uMed==1 || uMed==-1)
                                //{
                                //    cant = wmsM.CantidadUnidadesEnOC(Numd, Convert.ToString(cboProductoCompra.Value));
                                //}
                                //else {

                                 cant = wmsM.CantidadEnOC(Numd, Convert.ToString(cboProductoCompra.Value), txt_dun14.Text);
                                //}
                              



                                if (Convert.ToDecimal(txt_cantidad.Text) > cant)
                                {
                                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Esta registrando una cantidad mayor a la que se encuentra en la OC Actual');", true);
                                }
                                else
                                {
                                    foreach (var t in ret)
                                    {
                                        vNuevo.UnMedida = t.UgpName;
                                        vNuevo.BaseUnMed = Convert.ToInt32(t.BaseQty);
                                        vNuevo.UgpEntry = t.UgpEntry;
                                        vNuevo.UomEntry = t.UomEntry;
                                        vNuevo.UomCode = t.UomCode;
                                    }
                                    vNuevo.Reception_Id = Convert.ToInt32(Session["RecepcionId"]);
                                    vNuevo.ItemCode = Convert.ToString(cboProductoCompra.Value);
                                    vNuevo.Package_QuantityInitial = Convert.ToDecimal(txt_cantidad.Text);
                                    vNuevo.Package_Quantity = Convert.ToDecimal(txt_cantidad.Text);
                                    vNuevo.Package_Lot = txt_lote.Text;
                                    vNuevo.Package_ExpiresDate = fechaVencimiento;
                                    vNuevo.Package_ProductionDate = fechaProduccion;// cb_fproduccion.Date;
                                    vNuevo.Package_InDate = DateTime.Now;
                                    vNuevo.Package_SN = txt_dun14.Text;
                                    vNuevo.Package_Data1 = txt_loteproveedor.Text;
                                    vNuevo.Package_Data2 = txt_comentario.Text;
                                    // vNuevo.Package_SSCC = wmsM.CreaNewCorrelativo().ToString();
                                    vNuevo.Package_Status = 1;
                                    wmsM.InsertaPackageReception(vNuevo);
                                    GvDatos.DataBind();

                                    LogClass vLog = new LogClass();
                                    vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 239, "Crea Registro");
                                }
                            }
                            else
                            {

                                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Producto o dun no encontrado en sap , favor verificar');", true);
                            }

                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Codigo de barras no corresponde al producto, favor verificar');", true);
                        }
                    }
                    else
                    {

                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Vida util del producto es menor al porcentaje de aceptación,  minimo " + diasUtil + " dias util . Dias utiles maximos " + diasUtilEfec + ".  vida util actual " + Tdias + " días ," + textErr + "' );", true);
                    }

                }
                else
                {
                    int diasUtil = wmsM.diasUtil(Convert.ToString(cboProdcutoVenta.Value));

                    if (Tdias >= diasUtil)
                    {
                        List<SMM_VW_DATO_PROD_RECEPCION> ret = wmsM.ObtieneDetosProdRecepcion(Convert.ToString(cboProdcutoVenta.Value), txt_dun14.Text);

                        if (ret.Count != 0)
                        {

                            foreach (var t in ret)
                            {
                                vNuevo.UnMedida = t.UgpName;
                                vNuevo.BaseUnMed = Convert.ToInt32(t.BaseQty);
                                vNuevo.UgpEntry = t.UgpEntry;
                                vNuevo.UomEntry = t.UomEntry;
                                vNuevo.UomCode = t.UomCode;
                            }

                            vNuevo.Reception_Id = Convert.ToInt32(Session["RecepcionId"]);
                            vNuevo.ItemCode = Convert.ToString(cboProdcutoVenta.Value);
                            vNuevo.Package_QuantityInitial = Convert.ToDecimal(txt_cantidad.Text);
                            vNuevo.Package_Quantity = Convert.ToDecimal(txt_cantidad.Text);
                            vNuevo.Package_Lot = txt_lote.Text;
                            vNuevo.Package_ExpiresDate = fechaVencimiento;//cb_fvencimiento.Value == null ? DateTime.Now.AddDays(Tdias) : cb_fvencimiento.Date;
                            vNuevo.Package_ProductionDate = fechaProduccion;// cb_fproduccion.Date;
                            vNuevo.Package_InDate = DateTime.Now;
                            vNuevo.Package_SN = txt_dun14.Text;
                            vNuevo.Package_Data1 = txt_loteproveedor.Text;
                            vNuevo.Package_Data2 = txt_comentario.Text;
                            // vNuevo.Package_SSCC = wmsM.CreaNewCorrelativo().ToString();
                            vNuevo.Package_Status = 1;
                            wmsM.InsertaPackageReception(vNuevo);
                            GvDatos.DataBind();
                            LogClass vLog = new LogClass();
                            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 239, "Crea Registro");

                        }
                        else
                        {

                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Producto o dun no encontrado en sap , favor verificar');", true);
                        }
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Vida util del producto es menor al porcentaje de aceptación, dias util minimo " + diasUtil + ", vida util actual " + Tdias + " días "+textErr+"' );", true);
                    }
                }
            }
            else if (tipo == 1)
            {
                List<VW_MMETRO_PRODUCTOS_RECEPCIONXCOMPRA> ret1 = wmsM.ObtieneDetosProdRecepcionxCompra(Convert.ToString(cboProductoCompra.Value), txt_dun14.Text);

                int diasUtil = wmsM.diasUtil(Convert.ToString(cboProductoCompra.Value));

                if (Tdias >= diasUtil)
                {
                    if (ret1.Count != 0)
                    {
                        List<SMM_VW_DATO_PROD_RECEPCION> ret = wmsM.ObtieneDetosProdRecepcion(Convert.ToString(cboProductoCompra.Value), txt_dun14.Text);

                        int uMed = wmsM.UMedidaRecepcion(Convert.ToString(cboProductoCompra.Value), txt_dun14.Text);

                        decimal cant = 0;

                        

                            cant = wmsM.CantidadEnOC(Numd, Convert.ToString(cboProductoCompra.Value), txt_dun14.Text);
                        

                       

                        if (ret.Count != 0)
                        {
                          
                            if (Convert.ToDecimal(txt_cantidad.Text) > cant)
                            {
                                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Esta registrando una cantidad mayor a la que se encuentra en la OC Actual');", true);
                            }
                            else
                            {
                                foreach (var t in ret)
                                {
                                    vNuevo.UnMedida = t.UgpName;
                                    vNuevo.BaseUnMed = Convert.ToInt32(t.BaseQty);
                                    vNuevo.UgpEntry = t.UgpEntry;
                                    vNuevo.UomEntry = t.UomEntry;
                                    vNuevo.UomCode = t.UomCode;
                                }

                                vNuevo.Reception_Id = Convert.ToInt32(Session["RecepcionId"]);
                                vNuevo.ItemCode = Convert.ToString(cboProductoCompra.Value);
                                vNuevo.Package_QuantityInitial = Convert.ToDecimal(txt_cantidad.Text);
                                vNuevo.Package_Quantity = Convert.ToDecimal(txt_cantidad.Text);
                                vNuevo.Package_Lot = txt_lote.Text;
                                vNuevo.Package_ExpiresDate = fechaVencimiento; /*cb_fvencimiento.Value == null ? DateTime.Now.AddDays(Tdias) : cb_fvencimiento.Date;*/
                                vNuevo.Package_ProductionDate = fechaProduccion;//cb_fproduccion.Date;
                                vNuevo.Package_InDate = DateTime.Now;
                                vNuevo.Package_SN = txt_dun14.Text;
                                vNuevo.Package_Data1 = txt_loteproveedor.Text;
                                vNuevo.Package_Data2 = txt_comentario.Text;
                                vNuevo.Package_SSCC = wmsM.CreaNewCorrelativo().ToString();
                                vNuevo.Package_Status = 1;
                                wmsM.InsertaPackageReception(vNuevo);
                                GvDatos.DataBind();

                                LogClass vLog = new LogClass();
                                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 239, "Crea Registro");
                            }
                        }
                        else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Producto o dun no encontrado en sap , favor verificar');", true); }

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Codigo de barras no corresponde al producto, favor verificar');", true);
                    }

                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Vida util del producto es menor al porcentaje de aceptación, dias util minimo " + diasUtil + ", vida util actual " + Tdias + " días"+textErr+" ' );", true);
                }
            }
            else
            {


                int diasUtil = wmsM.diasUtil(Convert.ToString(cboProdcutoVenta.Value));

                if (Tdias >= diasUtil)
                {
                    List<SMM_VW_DATO_PROD_RECEPCION> ret = wmsM.ObtieneDetosProdRecepcion(Convert.ToString(cboProdcutoVenta.Value), txt_dun14.Text);

                    if (ret.Count != 0)
                    {
                        foreach (var t in ret)
                        {
                            vNuevo.UnMedida = t.UgpName;
                            vNuevo.BaseUnMed = Convert.ToInt32(t.BaseQty);
                            vNuevo.UgpEntry = t.UgpEntry;
                            vNuevo.UomEntry = t.UomEntry;
                            vNuevo.UomCode = t.UomCode;
                        }

                        vNuevo.Reception_Id = Convert.ToInt32(Session["RecepcionId"]);
                        vNuevo.ItemCode = Convert.ToString(cboProdcutoVenta.Value);
                        vNuevo.Package_QuantityInitial = Convert.ToDecimal(txt_cantidad.Text);
                        vNuevo.Package_Quantity = Convert.ToDecimal(txt_cantidad.Text);
                        vNuevo.Package_Lot = txt_lote.Text;
                        vNuevo.Package_ExpiresDate = fechaVencimiento;//cb_fvencimiento.Value == null ? DateTime.Now.AddDays(Tdias) : cb_fvencimiento.Date;
                        vNuevo.Package_ProductionDate = fechaProduccion;//cb_fproduccion.Date;
                        vNuevo.Package_InDate = DateTime.Now;
                        vNuevo.Package_SN = txt_dun14.Text;
                        vNuevo.Package_Data1 = txt_loteproveedor.Text;
                        vNuevo.Package_Data2 = txt_comentario.Text;
                        vNuevo.Package_SSCC = wmsM.CreaNewCorrelativo().ToString();
                        vNuevo.Package_Status = 1;
                        wmsM.InsertaPackageReception(vNuevo);
                        GvDatos.DataBind();
                        LogClass vLog = new LogClass();
                        vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 239, "Crea Registro");
                    }
                    else { ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Producto o dun no encontrado en sap , favor verificar');", true); }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Vida util del producto es menor al porcentaje de aceptación, dias util minimo " + diasUtil + ", vida util actual " + Tdias + " días "+textErr+" ' );", true);
                }

            }
        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdConfirma")
            {
                CVTWMSMetroClass vWms = new CVTWMSMetroClass();
                int PKID = Convert.ToInt32(e.KeyValue);
                int siteid = vWms.obtieneSiteIDRecepcion(Convert.ToInt32(Session["RecepcionId"]));
                int layoutid = vWms.ObtieneUbicacionDefecto(siteid, "Y");
                int idUsuario = Convert.ToInt32(Session["IDCVTUsuario"]);
                vWms.AgregaLocation
                                                                                                                                                                                                         (PKID, layoutid, idUsuario);
                vWms.ConfirmaPalletRecepcionSMM(PKID, layoutid);
                GvDatos.DataBind();

                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 239, "Confirma Registro");
            }
        }

        protected void GvDatos_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != DevExpress.Web.GridViewRowType.Data) return;
            int Estado = (int)e.GetValue("Package_Status");
            if (Estado != 1)
            {
                System.Web.UI.WebControls.ImageButton imgAnula = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Confirma") as System.Web.UI.WebControls.ImageButton;
                imgAnula.Visible = false;
            }
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Recepcion - " + Session["RecepcionId"].ToString();
            }
        }



        protected void cmdVolver_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/MayoristaOP/SMMRecepcion.aspx");
        }

        protected void GvDatos_CommandButtonInitialize(object sender, DevExpress.Web.ASPxGridViewCommandButtonEventArgs e)
        {

            if (e.ButtonType == DevExpress.Web.ColumnCommandButtonType.Delete)
            {
                e.Visible = EvaluaEstadoPlan((DevExpress.Web.ASPxGridView)sender, e.VisibleIndex);
            }
        }
        private bool EvaluaEstadoPlan(DevExpress.Web.ASPxGridView grid, int visibleindex)
        {
            bool ret = true;
            int Estado = Convert.ToInt32(grid.GetRowValues(visibleindex, "Package_Status").ToString());
            if (Estado != 1)
            {
                ret = false;
            }
            return ret;
        }

        protected void btnImprimirRecepcion_Click(object sender, EventArgs e)
        {
            int NRecep = Convert.ToInt32(Session["RecepcionId"]);

            ReportDocument Info = new ReportDocument();
            Info.Load(Server.MapPath("/EtiquetaPallet_SMM.rpt"));
            Info.SetDatabaseLogon("sa", "cvt.vdp22$");

            Info.SetParameterValue(0, "0");
            Info.SetParameterValue(1, Convert.ToInt32(NRecep));
            Info.SetParameterValue(2, 1);

            Response.Buffer = false;
            Response.Clear();

            Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
        }
    }
}