using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Web.UI;

namespace CVT_MermasRecepcion.Transformaciones
{
    public partial class Transformaciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        //{
        //    GvDatos.AddNewRow();
        //}

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //    this.ASPxGridViewExporter1.FileName = "Transformaciones";
        //    this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        //}

        protected void GvDatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 46, "Crea Registro");

            e.NewValues["Estado"] = 1;
            WMSClass vWMS = new WMSClass();
            e.NewValues["Staff_Id"] = vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString());
            e.NewValues["Fecha"] = DateTime.Now;
        }

        protected void GvDatos_RowInserted(object sender, DevExpress.Web.Data.ASPxDataInsertedEventArgs e)
        {
            TransformacionesClass vT = new TransformacionesClass();
            int tipo = Convert.ToInt32(e.NewValues["Tipo"]);
            int TId = vT.ObtieneMaxTransformacionId();
            if (tipo == 1)
            {
                int subtipo = Convert.ToInt32(e.NewValues["SubTipo"]);
                int entidad = Convert.ToInt32(e.NewValues["Entidad"]);
                int folio = Convert.ToInt32(e.NewValues["Folio"]);

                if (subtipo == 0)
                {
                    if (entidad == 8)
                    {
                        List<CVT_Transformacion_ExpUnidades> dt = new List<CVT_Transformacion_ExpUnidades>();
                        dt = vT.ObtieneExpedicionUnidades(folio);
                        vT.CreaDetalleTransformacionAutomacita(TId, dt);
                    }
                    else
                    {
                        List<CVT_Transformacion_TransUnidades> dt = new List<CVT_Transformacion_TransUnidades>();
                        dt = vT.ObtieneTransferenciaUnidades(folio);
                        vT.CreaDetalleTransformacionAutomacita(TId, dt);
                    }
                }
                if (subtipo == 1)
                {
                    if (entidad == 8)
                    {
                        List<CVT_Transformacion_ExpDesecho> dt = new List<CVT_Transformacion_ExpDesecho>();
                        dt = vT.ObtieneExpedicionDesecho(folio);
                        vT.CreaDetalleTransformacionAutomacita(TId, dt);
                    }
                    else
                    {
                        List<CVT_Transformacion_TransDesecho> dt = new List<CVT_Transformacion_TransDesecho>();
                        dt = vT.ObtieneTransferenciaDesecho(folio);
                        vT.CreaDetalleTransformacionAutomacita(TId, dt);
                    }
                }
                if (subtipo == 2)
                {
                    if (entidad == 8)
                    {
                        List<CVT_Transformacion_ExpReproceso> dt = new List<CVT_Transformacion_ExpReproceso>();
                        dt = vT.ObtieneExpedicionReproceso(folio);
                        vT.CreaDetalleTransformacionAutomacita(TId, dt);
                    }
                    else
                    {
                        List<CVT_Transformacion_TransReproceso> dt = new List<CVT_Transformacion_TransReproceso>();
                        dt = vT.ObtieneTransferenciaReproceso(folio);
                        vT.CreaDetalleTransformacionAutomacita(TId, dt);
                    }
                }
            }
        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {
                Session["TransformacionId"] = e.KeyValue;
                TransformacionesClass vTr = new TransformacionesClass();
                int tipo = vTr.ObtieneTipoTransformacion(Convert.ToInt32(e.KeyValue));
                if (tipo == 0)
                {
                    Response.Redirect("~/Transformaciones/TransformacionManual.aspx");
                }
                else
                {
                    Response.Redirect("~/Transformaciones/TransformacionAutomatica.aspx");
                }
            }
            if (e.CommandArgs.CommandName == "cmdAnula")
            {
                WMSClass vWMS = new WMSClass();

                TransformacionesClass vTra = new TransformacionesClass();
                int TransforId = Convert.ToInt32(e.KeyValue);
                int CantDet = vTra.CuentaDetalleTransformacion(TransforId);
                if (CantDet > 0)
                {
                    vTra.CambiaEstadoTransformacion(TransforId, 3);
                    List<CVT_TransformacionDetalle> dt = vTra.ObtieneDetalleTransformacion(TransforId);
                    foreach (var t in dt)
                    {
                        vTra.EliminaBultoTransformacion(TransforId, t.Package_Id);
                    }
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Transformacion Anulada Correctamente');", true);
                }
                else
                {
                    vTra.CambiaEstadoTransformacion(TransforId, 3);
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('Transformacion Anulada Correctamente');", true);
                }
            }
            if (e.CommandArgs.CommandName == "cmdConfirma")
            {
                TransformacionesClass vTr = new TransformacionesClass();
                WMSClass vWMS = new WMSClass();
                SAPClass vSAP = new SAPClass();
                ControlClass vControl = new ControlClass();
                int tipo = vTr.ObtieneTipoTransformacion(Convert.ToInt32(e.KeyValue));
                List<CVT_Transformacion> TR = new List<CVT_Transformacion>();
                TR = vTr.ObtieneTransformacion(Convert.ToInt32(e.KeyValue));
                List<CVT_View_TransformacionDetalle> TD = new List<CVT_View_TransformacionDetalle>();
                TD = vTr.ObtieneTransformacionDetalle(Convert.ToInt32(e.KeyValue));
                int staffid = vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString());
                if (tipo == 0)
                {
                    string errors = "0";
                    if (vSAP.ExisteSalidaTransformacion(Convert.ToInt32(e.KeyValue)) == 0)
                    {
                        errors = vSAP.CreaSalidaTransformacion(Convert.ToInt32(e.KeyValue), Session["CIDUsuario"].ToString());
                        if (errors == "0")
                        {
                            if (vSAP.ExisteEntradaTransformacion(Convert.ToInt32(e.KeyValue)) == 0)
                            {
                                errors = vSAP.CreaEntradaTransformacion(Convert.ToInt32(e.KeyValue), Session["CIDUsuario"].ToString());
                                if (errors == "0")
                                {
                                    foreach (var t in TR)
                                    {
                                        int expid = vWMS.CreaExpedicionRapida(t.Site_Id, staffid, Convert.ToInt32(e.KeyValue));
                                        vWMS.ActualizaEstadoExpedicion(expid, 2, false);
                                        int recid = vWMS.AgregaRecepcionTransformacion(t.Site_Id, vWMS.ObtieneSectorPF(t.Site_Id), staffid, Convert.ToInt32(e.KeyValue));
                                        vWMS.AgregaDetalleExpedicionTransformacion(expid, t.Site_Id, staffid, t.Transformacion_Id);
                                        vWMS.DardeBajaPalletTransformacion(t.Transformacion_Id);
                                        foreach (var d in TD)
                                        {
                                            WMSClass vWMS2 = new WMSClass();
                                            vWMS2.AgregaProductoRecepcionReported(recid, (int)d.ArticleProviderDestiny_Id, t.Site_Id);
                                            List<Package> pkOr = vWMS.ObtieneInfoPalletCE(d.Package_Id);
                                            foreach (var n in pkOr)
                                            {
                                                Package vNEW = new Package();
                                                WMSClass vWMS1 = new WMSClass();
                                                int SSCC = vWMS1.getNewCorrelativo(t.Site_Id);
                                                if (SSCC == 0)
                                                {
                                                    SSCC = vWMS1.getNewCorrelativo(t.Site_Id);
                                                }
                                                vNEW.Company_Id = 1;
                                                vNEW.Supportive_Id = 1;
                                                vNEW.Reception_Id = recid;
                                                vNEW.Layout_Id = n.Layout_Id;
                                                vNEW.ArticleProvider_Id = (int)d.ArticleProviderDestiny_Id;
                                                vNEW.ArticleProvider_GrossWeight = 1;
                                                vNEW.Package_Barcode = string.Empty;
                                                vNEW.Package_QuantityInitial = (int)d.Cantidad_Destino;
                                                vNEW.Package_Quantity = Convert.ToInt32(d.Cantidad_Destino);
                                                vNEW.Package_NetWeight = Convert.ToDecimal(d.Cantidad_Destino);
                                                vNEW.Package_NetWeightInitial = Convert.ToDecimal(d.Cantidad_Destino);
                                                vNEW.Package_GrossWeight = Convert.ToDecimal(d.Cantidad_Destino);
                                                vNEW.Package_GrossWeightInitial = Convert.ToDecimal(d.Cantidad_Destino);
                                                vNEW.Package_Height = 100;
                                                vNEW.Package_Status = 2;
                                                vNEW.Package_QualityStatus = 1;
                                                vNEW.Package_Owner = "19";
                                                vNEW.Package_SSCC = SSCC.ToString();
                                                vNEW.Package_SSCCParent = string.Empty;
                                                vNEW.Package_Lot = d.Package_Lot;
                                                vNEW.Package_ProductionDate = n.Package_ProductionDate;
                                                vNEW.Package_ExpiresDate = n.Package_ExpiresDate;
                                                vNEW.Package_Mixed = 0;
                                                vNEW.Package_InDate = n.Package_InDate;
                                                vNEW.Package_SN = string.Empty;
                                                vNEW.Package_PN = string.Empty;
                                                vNEW.Package_Data1 = string.Empty;
                                                vNEW.Package_Data2 = "Generado por Modulo Transformaciones";
                                                vNEW.PackageState_Id = 1;
                                                vNEW.Accounts_Id = 0;
                                                vNEW.Package_FoilPP = string.Empty;
                                                vNEW.EntryType = 0;
                                                vNEW.Package_Origin =n.Package_Origin;
                                                vNEW.Package_Destination = 1;
                                                vNEW.Package_CrossDocking = 0;
                                                vNEW.PackageState_Id_Initial = 1;

                                                int PKId = vWMS1.AgregaBultoProduccion(vNEW);
                                                vTr.AgregaIdPackageTransformado(d.TransformacionDet_Id, PKId);
                                                vWMS1.AddMovement(1, 1, Convert.ToInt32(d.Cantidad_Destino), 1, vWMS.ObtieneIdStaff (Session["CIDUsuario"].ToString()), Convert.ToInt32(d.Cantidad_Destino), Convert.ToInt32(d.Cantidad_Destino), Convert.ToInt32(d.Cantidad_Destino), PKId);
                                                vWMS1.AddLocation(PKId, (int)n.Layout_Id, vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString()));
                                                vWMS1.Dispose();
                                            }
                                            GvDatos.DataBind();
                                            vWMS2.Dispose();
                                        }

                                        vTr.CierraTransformacion(Convert.ToInt32(e.KeyValue));
                                        vWMS.Dispose();
                                    }
                                }
                                else
                                {
                                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + errors + "');", true);
                                }
                            }
                            else
                            {
                                if (errors == "0")
                                {
                                    foreach (var t in TR)
                                    {
                                        int expid = vWMS.CreaExpedicionRapida(t.Site_Id, staffid, Convert.ToInt32(e.KeyValue));
                                        vWMS.ActualizaEstadoExpedicion(expid, 2, false);
                                        int recid = vWMS.AgregaRecepcionTransformacion(t.Site_Id, vWMS.ObtieneSectorPF(t.Site_Id), staffid, Convert.ToInt32(e.KeyValue));
                                        vWMS.AgregaDetalleExpedicionTransformacion(expid, t.Site_Id, staffid, t.Transformacion_Id);
                                        vWMS.DardeBajaPalletTransformacion(t.Transformacion_Id);
                                        foreach (var d in TD)
                                        {
                                            WMSClass vWMS2 = new WMSClass();
                                            vWMS2.AgregaProductoRecepcionReported(recid, (int)d.ArticleProviderDestiny_Id, t.Site_Id);
                                            List<Package> pkOr = vWMS.ObtieneInfoPalletCE(d.Package_Id);
                                            foreach (var n in pkOr)
                                            {
                                                Package vNEW = new Package();
                                                WMSClass vWMS1 = new WMSClass();
                                                int SSCC = vWMS1.getNewCorrelativo(t.Site_Id);
                                                if (SSCC == 0)
                                                {
                                                    SSCC = vWMS1.getNewCorrelativo(t.Site_Id);
                                                }
                                                vNEW.Company_Id = 1;
                                                vNEW.Supportive_Id = 1;
                                                vNEW.Reception_Id = recid;
                                                vNEW.Layout_Id = n.Layout_Id;
                                                vNEW.ArticleProvider_Id = (int)d.ArticleProviderDestiny_Id;
                                                vNEW.ArticleProvider_GrossWeight = 1;
                                                vNEW.Package_Barcode = string.Empty;
                                                vNEW.Package_QuantityInitial = (int)d.Cantidad_Destino;
                                                vNEW.Package_Quantity = Convert.ToInt32(d.Cantidad_Destino);
                                                vNEW.Package_NetWeight = Convert.ToDecimal(d.Cantidad_Destino);
                                                vNEW.Package_NetWeightInitial = Convert.ToDecimal(d.Cantidad_Destino);
                                                vNEW.Package_GrossWeight = Convert.ToDecimal(d.Cantidad_Destino);
                                                vNEW.Package_GrossWeightInitial = Convert.ToDecimal(d.Cantidad_Destino);
                                                vNEW.Package_Height = 100;
                                                vNEW.Package_Status = 2;
                                                vNEW.Package_QualityStatus = 1;
                                                vNEW.Package_Owner = "19";
                                                vNEW.Package_SSCC = SSCC.ToString();
                                                vNEW.Package_SSCCParent = string.Empty;
                                                vNEW.Package_Lot = d.Package_Lot;
                                                vNEW.Package_ProductionDate = n.Package_ProductionDate;
                                                vNEW.Package_ExpiresDate = n.Package_ExpiresDate;
                                                vNEW.Package_Mixed = 0;
                                                vNEW.Package_InDate = n.Package_InDate;
                                                vNEW.Package_SN = string.Empty;
                                                vNEW.Package_PN = string.Empty;
                                                vNEW.Package_Data1 = string.Empty;
                                                vNEW.Package_Data2 = "Generado por Modulo Transformaciones";
                                                vNEW.PackageState_Id = 1;
                                                vNEW.Accounts_Id = 0;
                                                vNEW.Package_FoilPP = string.Empty;
                                                vNEW.EntryType = 0;
                                                vNEW.Package_Origin = n.Package_Origin;
                                                vNEW.Package_Destination = 1;
                                                vNEW.Package_CrossDocking = 0;
                                                vNEW.PackageState_Id_Initial = 1;

                                                int PKId = vWMS1.AgregaBultoProduccion(vNEW);
                                                vTr.AgregaIdPackageTransformado(d.TransformacionDet_Id, PKId);
                                                vWMS1.AddMovement(1, 1, Convert.ToInt32(d.Cantidad_Destino), 1, vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString()), Convert.ToInt32(d.Cantidad_Destino), Convert.ToInt32(d.Cantidad_Destino), Convert.ToInt32(d.Cantidad_Destino), PKId);
                                                vWMS1.AddLocation(PKId, (int)n.Layout_Id, vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString()));
                                                vWMS1.Dispose();
                                            }
                                            GvDatos.DataBind();
                                            vWMS2.Dispose();
                                        }

                                        vTr.CierraTransformacion(Convert.ToInt32(e.KeyValue));
                                        vWMS.Dispose();
                                    }
                                }
                                else
                                {
                                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + errors + "');", true);
                                }
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + errors + "');", true);
                        }
                    }
                    else
                    {
                        //errors = vSAP.CreaSalidaTransformacion(Convert.ToInt32(e.KeyValue), Session["CIDUsuario"].ToString());
                        //if (errors == "0")
                        //{
                        if (vSAP.ExisteEntradaTransformacion(Convert.ToInt32(e.KeyValue)) == 0)
                        {
                            errors = vSAP.CreaEntradaTransformacion(Convert.ToInt32(e.KeyValue), Session["CIDUsuario"].ToString());
                            if (errors == "0")
                            {
                                foreach (var t in TR)
                                {
                                    int expid = vWMS.CreaExpedicionRapida(t.Site_Id, staffid, Convert.ToInt32(e.KeyValue));
                                    vWMS.ActualizaEstadoExpedicion(expid, 2, false);
                                    int recid = vWMS.AgregaRecepcionTransformacion(t.Site_Id, vWMS.ObtieneSectorPF(t.Site_Id), staffid, Convert.ToInt32(e.KeyValue));
                                    vWMS.AgregaDetalleExpedicionTransformacion(expid, t.Site_Id, staffid, t.Transformacion_Id);
                                    vWMS.DardeBajaPalletTransformacion(t.Transformacion_Id);
                                    foreach (var d in TD)
                                    {
                                        WMSClass vWMS2 = new WMSClass();
                                        vWMS2.AgregaProductoRecepcionReported(recid, (int)d.ArticleProviderDestiny_Id, t.Site_Id);
                                        List<Package> pkOr = vWMS.ObtieneInfoPalletCE(d.Package_Id);
                                        foreach (var n in pkOr)
                                        {
                                            Package vNEW = new Package();
                                            WMSClass vWMS1 = new WMSClass();
                                            int SSCC = vWMS1.getNewCorrelativo(t.Site_Id);
                                            if (SSCC == 0)
                                            {
                                                SSCC = vWMS1.getNewCorrelativo(t.Site_Id);
                                            }
                                            vNEW.Company_Id = 1;
                                            vNEW.Supportive_Id = 1;
                                            vNEW.Reception_Id = recid;
                                            vNEW.Layout_Id = n.Layout_Id;
                                            vNEW.ArticleProvider_Id = (int)d.ArticleProviderDestiny_Id;
                                            vNEW.ArticleProvider_GrossWeight = 1;
                                            vNEW.Package_Barcode = string.Empty;
                                            vNEW.Package_QuantityInitial = (int)d.Cantidad_Destino;
                                            vNEW.Package_Quantity = Convert.ToInt32(d.Cantidad_Destino);
                                            vNEW.Package_NetWeight = Convert.ToDecimal(d.Cantidad_Destino);
                                            vNEW.Package_NetWeightInitial = Convert.ToDecimal(d.Cantidad_Destino);
                                            vNEW.Package_GrossWeight = Convert.ToDecimal(d.Cantidad_Destino);
                                            vNEW.Package_GrossWeightInitial = Convert.ToDecimal(d.Cantidad_Destino);
                                            vNEW.Package_Height = 100;
                                            vNEW.Package_Status = 2;
                                            vNEW.Package_QualityStatus = 1;
                                            vNEW.Package_Owner = "19";
                                            vNEW.Package_SSCC = SSCC.ToString();
                                            vNEW.Package_SSCCParent = string.Empty;
                                            vNEW.Package_Lot = d.Package_Lot;
                                            vNEW.Package_ProductionDate = n.Package_ProductionDate;
                                            vNEW.Package_ExpiresDate = n.Package_ExpiresDate;
                                            vNEW.Package_Mixed = 0;
                                            vNEW.Package_InDate = n.Package_InDate;
                                            vNEW.Package_SN = string.Empty;
                                            vNEW.Package_PN = string.Empty;
                                            vNEW.Package_Data1 = string.Empty;
                                            vNEW.Package_Data2 = "Generado por Modulo Transformaciones";
                                            vNEW.PackageState_Id = 1;
                                            vNEW.Accounts_Id = 0;
                                            vNEW.Package_FoilPP = string.Empty;
                                            vNEW.EntryType = 0;
                                            vNEW.Package_Origin = n.Package_Origin;
                                            vNEW.Package_Destination = 1;
                                            vNEW.Package_CrossDocking = 0;
                                            vNEW.PackageState_Id_Initial = 1;

                                            int PKId = vWMS1.AgregaBultoProduccion(vNEW);
                                            vTr.AgregaIdPackageTransformado(d.TransformacionDet_Id, PKId);
                                            vWMS1.AddMovement(1, 1, Convert.ToInt32(d.Cantidad_Destino), 1, vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString()), Convert.ToInt32(d.Cantidad_Destino), Convert.ToInt32(d.Cantidad_Destino), Convert.ToInt32(d.Cantidad_Destino), PKId);
                                            vWMS1.AddLocation(PKId, (int)n.Layout_Id, vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString()));
                                            vWMS1.Dispose();
                                        }
                                        GvDatos.DataBind();
                                        vWMS2.Dispose();
                                    }

                                    vTr.CierraTransformacion(Convert.ToInt32(e.KeyValue));
                                    vWMS.Dispose();
                                }
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + errors + "');", true);
                            }
                        }
                        else
                        {
                            if (errors == "0")
                            {
                                foreach (var t in TR)
                                {
                                    int expid = vWMS.CreaExpedicionRapida(t.Site_Id, staffid, Convert.ToInt32(e.KeyValue));
                                    vWMS.ActualizaEstadoExpedicion(expid, 2, false);
                                    int recid = vWMS.AgregaRecepcionTransformacion(t.Site_Id, vWMS.ObtieneSectorPF(t.Site_Id), staffid, Convert.ToInt32(e.KeyValue));
                                    vWMS.AgregaDetalleExpedicionTransformacion(expid, t.Site_Id, staffid, t.Transformacion_Id);
                                    vWMS.DardeBajaPalletTransformacion(t.Transformacion_Id);
                                    foreach (var d in TD)
                                    {
                                        WMSClass vWMS2 = new WMSClass();
                                        vWMS2.AgregaProductoRecepcionReported(recid, (int)d.ArticleProviderDestiny_Id, t.Site_Id);
                                        List<Package> pkOr = vWMS.ObtieneInfoPalletCE(d.Package_Id);
                                        foreach (var n in pkOr)
                                        {
                                            Package vNEW = new Package();
                                            WMSClass vWMS1 = new WMSClass();
                                            int SSCC = vWMS1.getNewCorrelativo(t.Site_Id);
                                            if (SSCC == 0)
                                            {
                                                SSCC = vWMS1.getNewCorrelativo(t.Site_Id);
                                            }
                                            vNEW.Company_Id = 1;
                                            vNEW.Supportive_Id = 1;
                                            vNEW.Reception_Id = recid;
                                            vNEW.Layout_Id = n.Layout_Id;
                                            vNEW.ArticleProvider_Id = (int)d.ArticleProviderDestiny_Id;
                                            vNEW.ArticleProvider_GrossWeight = 1;
                                            vNEW.Package_Barcode = string.Empty;
                                            vNEW.Package_QuantityInitial = (int)d.Cantidad_Destino;
                                            vNEW.Package_Quantity = Convert.ToInt32(d.Cantidad_Destino);
                                            vNEW.Package_NetWeight = Convert.ToDecimal(d.Cantidad_Destino);
                                            vNEW.Package_NetWeightInitial = Convert.ToDecimal(d.Cantidad_Destino);
                                            vNEW.Package_GrossWeight = Convert.ToDecimal(d.Cantidad_Destino);
                                            vNEW.Package_GrossWeightInitial = Convert.ToDecimal(d.Cantidad_Destino);
                                            vNEW.Package_Height = 100;
                                            vNEW.Package_Status = 2;
                                            vNEW.Package_QualityStatus = 1;
                                            vNEW.Package_Owner = "19";
                                            vNEW.Package_SSCC = SSCC.ToString();
                                            vNEW.Package_SSCCParent = string.Empty;
                                            vNEW.Package_Lot = d.Package_Lot;
                                            vNEW.Package_ProductionDate = n.Package_ProductionDate;
                                            vNEW.Package_ExpiresDate = n.Package_ExpiresDate;
                                            vNEW.Package_Mixed = 0;
                                            vNEW.Package_InDate = n.Package_InDate;
                                            vNEW.Package_SN = string.Empty;
                                            vNEW.Package_PN = string.Empty;
                                            vNEW.Package_Data1 = string.Empty;
                                            vNEW.Package_Data2 = "Generado por Modulo Transformaciones";
                                            vNEW.PackageState_Id = 1;
                                            vNEW.Accounts_Id = 0;
                                            vNEW.Package_FoilPP = string.Empty;
                                            vNEW.EntryType = 0;
                                            vNEW.Package_Origin =n.Package_Origin;
                                            vNEW.Package_Destination = 1;
                                            vNEW.Package_CrossDocking = 0;
                                            vNEW.PackageState_Id_Initial = 1;

                                            int PKId = vWMS1.AgregaBultoProduccion(vNEW);
                                            vTr.AgregaIdPackageTransformado(d.TransformacionDet_Id, PKId);
                                            vWMS1.AddMovement(1, 1, Convert.ToInt32(d.Cantidad_Destino), 1, vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString()), Convert.ToInt32(d.Cantidad_Destino), Convert.ToInt32(d.Cantidad_Destino), Convert.ToInt32(d.Cantidad_Destino), PKId);
                                            vWMS1.AddLocation(PKId, (int)n.Layout_Id, vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString()));
                                            vWMS1.Dispose();
                                        }
                                        GvDatos.DataBind();
                                        vWMS2.Dispose();
                                    }

                                    vTr.CierraTransformacion(Convert.ToInt32(e.KeyValue));
                                    vWMS.Dispose();
                                }
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + errors + "');", true);
                            }
                        }
                        //}
                        //else
                        //{
                        //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + errors + "');", true);
                        //}
                    }
                }
                if (tipo == 1)
                {
                    int entidad = vTr.ObtieneEntidadTransformacion(Convert.ToInt32(e.KeyValue));

                    //Expedicion
                    if (entidad == 8)
                    {
                        string errors = "0";
                        errors = vSAP.CreaSalidaTransformacion(Convert.ToInt32(e.KeyValue), Session["CIDUsuario"].ToString());
                        if (errors == "0")
                        {
                            errors = vSAP.CreaEntradaTransformacion(Convert.ToInt32(e.KeyValue), Session["CIDUsuario"].ToString());
                            if (errors == "0")
                            {
                                foreach (var t in TR)
                                {
                                    // int expid = vWMS.CreaExpedicionRapida(t.Site_Id, staffid, Convert.ToInt32(e.KeyValue));
                                    int recid = vWMS.AgregaRecepcionTransformacion(t.Site_Id, vWMS.ObtieneSectorPF(t.Site_Id), staffid, Convert.ToInt32(e.KeyValue));
                                    foreach (var d in TD)
                                    {
                                        // vWMS.AgregaDetalleExpedicion(expid, d.Cantidad, d.Package_Id, d.NPallet, t.Site_Id, staffid);
                                        vWMS.AgregaProductoRecepcionReported(recid, (int)d.ArticleProviderDestiny_Id, t.Site_Id);
                                        Package vNEW = new Package();
                                        int SSCC = vWMS.getNewCorrelativo(t.Site_Id);
                                        vNEW.Company_Id = 1;
                                        vNEW.Supportive_Id = 1;
                                        vNEW.Reception_Id = recid;
                                        vNEW.Layout_Id = vControl.ObtieneUbicacionDefecto(t.Site_Id, 1);
                                        vNEW.ArticleProvider_Id = (int)d.ArticleProviderDestiny_Id;
                                        vNEW.ArticleProvider_GrossWeight = 1;
                                        vNEW.Package_Barcode = string.Empty;
                                        vNEW.Package_QuantityInitial = (int)d.Cantidad_Destino;
                                        vNEW.Package_Quantity = Convert.ToInt32(d.Cantidad_Destino);
                                        vNEW.Package_NetWeight = Convert.ToDecimal(d.Cantidad_Destino);
                                        vNEW.Package_NetWeightInitial = Convert.ToDecimal(d.Cantidad_Destino);
                                        vNEW.Package_GrossWeight = Convert.ToDecimal(d.Cantidad_Destino);
                                        vNEW.Package_GrossWeightInitial = Convert.ToDecimal(d.Cantidad_Destino);
                                        vNEW.Package_Height = 100;
                                        vNEW.Package_Status = 2;
                                        vNEW.Package_QualityStatus = 1;
                                        vNEW.Package_Owner = "19";
                                        vNEW.Package_SSCC = SSCC.ToString();
                                        vNEW.Package_SSCCParent = string.Empty;
                                        vNEW.Package_Lot = d.Package_Lot;
                                        vNEW.Package_ProductionDate = DateTime.Now;
                                        vNEW.Package_ExpiresDate = DateTime.Now.AddDays(vWMS.ObtieneDiasVencimiento(d.Codigo));
                                        vNEW.Package_Mixed = 0;
                                        vNEW.Package_InDate = DateTime.Now;
                                        vNEW.Package_SN = string.Empty;
                                        vNEW.Package_PN = string.Empty;
                                        vNEW.Package_Data1 = string.Empty;
                                        vNEW.Package_Data2 = "Generado por Modulo Transformaciones";
                                        vNEW.PackageState_Id = 1;
                                        vNEW.Accounts_Id = 0;
                                        vNEW.Package_FoilPP = string.Empty;
                                        vNEW.EntryType = 0;
                                        vNEW.Package_Origin = 1;
                                        vNEW.Package_Destination = 1;
                                        vNEW.Package_CrossDocking = 0;
                                        vNEW.PackageState_Id_Initial = 1;
                                        int PKId = vWMS.AgregaBultoProduccion(vNEW);
                                        vWMS.AddMovement(t.Site_Id, 1, Convert.ToInt32(d.Cantidad_Destino), 1, vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString()), Convert.ToInt32(d.Cantidad_Destino), Convert.ToInt32(d.Cantidad_Destino), Convert.ToInt32(d.Cantidad_Destino), PKId);
                                        vWMS.AddLocation(PKId, vControl.ObtieneUbicacionDefecto(t.Site_Id, 1), vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString()));
                                        vTr.AgregaIdPackageTransformado(d.TransformacionDet_Id, PKId);
                                        GvDatos.DataBind();
                                    }
                                    vWMS.Dispose();
                                    vTr.CierraTransformacion(Convert.ToInt32(e.KeyValue));
                                }
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + errors + "');", true);
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + errors + "');", true);
                        }
                    }
                    //Transferencia
                    if (entidad == 13)
                    {
                        string errors = "0";
                        errors = vSAP.CreaSalidaTransformacion(Convert.ToInt32(e.KeyValue), Session["CIDUsuario"].ToString());
                        if (errors == "0")
                        {
                            errors = vSAP.CreaEntradaTransformacion(Convert.ToInt32(e.KeyValue), Session["CIDUsuario"].ToString());
                            if (errors == "0")
                            {
                                foreach (var t in TR)
                                {
                                    int expid = vWMS.CreaExpedicionRapida(t.Site_Id, staffid, Convert.ToInt32(e.KeyValue));
                                    int recid = vWMS.AgregaRecepcionTransformacion(t.Site_Id, vWMS.ObtieneSectorPF(t.Site_Id), staffid, Convert.ToInt32(e.KeyValue));
                                    vWMS.AgregaDetalleExpedicionTransformacion(expid, t.Site_Id, staffid, t.Transformacion_Id);
                                    vWMS.DardeBajaPalletTransformacion(t.Transformacion_Id);
                                    foreach (var d in TD)
                                    {

                                        vWMS.AgregaProductoRecepcionReported(recid, (int)d.ArticleProviderDestiny_Id, t.Site_Id);
                                        Package vNEW = new Package();
                                        int SSCC = vWMS.getNewCorrelativo(t.Site_Id);
                                        vNEW.Company_Id = 1;
                                        vNEW.Supportive_Id = 1;
                                        vNEW.Reception_Id = recid;
                                        vNEW.Layout_Id = vControl.ObtieneUbicacionDefecto(t.Site_Id, 1);
                                        vNEW.ArticleProvider_Id = (int)d.ArticleProviderDestiny_Id;
                                        vNEW.ArticleProvider_GrossWeight = 1;
                                        vNEW.Package_Barcode = string.Empty;
                                        vNEW.Package_QuantityInitial = (int)d.Cantidad_Destino;
                                        vNEW.Package_Quantity = Convert.ToInt32(d.Cantidad_Destino);
                                        vNEW.Package_NetWeight = Convert.ToDecimal(d.Cantidad_Destino);
                                        vNEW.Package_NetWeightInitial = Convert.ToDecimal(d.Cantidad_Destino);
                                        vNEW.Package_GrossWeight = Convert.ToDecimal(d.Cantidad_Destino);
                                        vNEW.Package_GrossWeightInitial = Convert.ToDecimal(d.Cantidad_Destino);
                                        vNEW.Package_Height = 100;
                                        vNEW.Package_Status = 2;
                                        vNEW.Package_QualityStatus = 1;
                                        vNEW.Package_Owner = "19";
                                        vNEW.Package_SSCC = SSCC.ToString();
                                        vNEW.Package_SSCCParent = string.Empty;
                                        vNEW.Package_Lot = d.Package_Lot;
                                        vNEW.Package_ProductionDate = DateTime.Now;
                                        vNEW.Package_ExpiresDate = DateTime.Now.AddDays(vWMS.ObtieneDiasVencimiento(d.Codigo));
                                        vNEW.Package_Mixed = 0;
                                        vNEW.Package_InDate = DateTime.Now;
                                        vNEW.Package_SN = string.Empty;
                                        vNEW.Package_PN = string.Empty;
                                        vNEW.Package_Data1 = string.Empty;
                                        vNEW.Package_Data2 = "Generado por Modulo Transformaciones";
                                        vNEW.PackageState_Id = 1;
                                        vNEW.Accounts_Id = 0;
                                        vNEW.Package_FoilPP = string.Empty;
                                        vNEW.EntryType = 0;
                                        vNEW.Package_Origin = 1;
                                        vNEW.Package_Destination = 1;
                                        vNEW.Package_CrossDocking = 0;
                                        vNEW.PackageState_Id_Initial = 1;
                                        int PKId = vWMS.AgregaBultoProduccion(vNEW);
                                        vWMS.AddMovement(t.Site_Id, 1, Convert.ToInt32(d.Cantidad_Destino), 1, vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString()), Convert.ToInt32(d.Cantidad_Destino), Convert.ToInt32(d.Cantidad_Destino), Convert.ToInt32(d.Cantidad_Destino), PKId);
                                        vWMS.AddLocation(PKId, vControl.ObtieneUbicacionDefecto(t.Site_Id, 1), vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString()));
                                        vTr.AgregaIdPackageTransformado(d.TransformacionDet_Id, PKId);
                                        GvDatos.DataBind();
                                    }
                                    vWMS.ActualizaEstadoExpedicion(expid, 2, false);
                                    vTr.CierraTransformacion(Convert.ToInt32(e.KeyValue));
                                    vWMS.Dispose();
                                }
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + errors + "');", true);
                            }
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + errors + "');", true);
                        }
                    }
                }

            }
            GvDatos.DataBind();
        }

        protected void GvDatos_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != DevExpress.Web.GridViewRowType.Data) return;
            int Estado = (int)e.GetValue("Estado");
            if (Estado != 1)
            {
                System.Web.UI.WebControls.ImageButton imgAnula = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Anula") as System.Web.UI.WebControls.ImageButton;
                System.Web.UI.WebControls.ImageButton imgConfirma = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Confirma") as System.Web.UI.WebControls.ImageButton;
                imgAnula.Visible = false;
                imgConfirma.Visible = false;
            }
        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Transformaciones";
            }
        }
    }
}