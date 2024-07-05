using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Produccion
{
    public partial class GeneradorEtiquetas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    LogClass vLog = new LogClass();
                    vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 32, "Ingreso");
                }
                GvDatos.DataBind();
            }
            catch
            {
            }
        }

        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 32, "Boton");
        }

        protected void cbo_of_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                Session["LoteOF"] = "CVT000" + cbo_of.Value.ToString();
                Session["OF"] = cbo_of.Value.ToString();
                WMSClass vWMS = new WMSClass();
                SAPClass vSAP = new SAPClass();
                lbl_lote.Text = "Lote:" + Session["LoteOF"].ToString();
                lbl_bultos.Text = "Pallets:" + vWMS.ObtieneCantidadBultosLote(Session["LoteOF"].ToString()).ToString();
                lbl_cantidad.Text = "En Stock:" + vWMS.ObtieneEnvasesStockLote(Session["LoteOF"].ToString()).ToString();
                lbl_producido.Text = "Producido:" + vWMS.ObtieneEnvasesProducidosLote(Session["LoteOF"].ToString()).ToString();
                lbl_codproducto.Text = vSAP.ObtieneCodProductoOF(Convert.ToInt32(cbo_of.Value));
                lbl_producto.Text = "Producto:" + vSAP.ObtieneProductoOF(Convert.ToInt32(cbo_of.Value));
                txt_cantidad.Text = vWMS.ObtienePaletizadoProducto(vSAP.ObtieneCodProductoOF(Convert.ToInt32(cbo_of.Value))).ToString();
                GvDatos.DataBind();
            }
            catch
            {

            }
        }



        protected void btn_generar_Click(object sender, EventArgs e)
        {
            try
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 32, "Agrega Etiquetas");
                WMSClass vWMS = new WMSClass();
                Package vNEW = new Package();
                SAPClass vsap = new SAPClass();
                MermasClass vMerma = new MermasClass();

                if (Convert.ToInt32(txt_cantidad.Text) == 0)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert(' cantidad debe ser mayor a 0 ');", true);
                }
                else
                {

                    if (vMerma.OFModificadas(Convert.ToInt32(Session["OF"])) == 0)
                    {
                        string ret = vsap.CreaReciboPorduccion(Convert.ToInt32(Session["OF"]), Session["LoteOF"].ToString(), DateTime.Now.AddDays(vWMS.ObtieneDiasVencimiento(lbl_codproducto.Text)), Convert.ToInt32(txt_cantidad.Text));
                        if (ret != "0")
                        {
                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + ret + "');", true);
                        }
                        else
                        {

                            int SSCC = vWMS.getNewCorrelativo(1);
                            int RecepcionId = vWMS.ObtieneRecepcionProductivaLote(Session["LoteOF"].ToString());

                            int idPais = vWMS.TraePaisOFRecepcionPRod(Convert.ToInt32(Session["OF"]));
                            if (RecepcionId == 0)
                            {
                                RecepcionId = vWMS.AgregaRecepcionProduccion(1, 9, vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString()), Convert.ToInt32(Session["OF"]),idPais);
                            }                      

                            vNEW.Company_Id = 1;
                            vNEW.Supportive_Id =Convert.ToInt32(cboTipoPallet.Value);
                            vNEW.Reception_Id = RecepcionId;
                            vNEW.Layout_Id = 1463;
                            vNEW.ArticleProvider_Id = vWMS.ObtieneIdProduct(lbl_codproducto.Text);
                            vNEW.ArticleProvider_GrossWeight = 1;
                            vNEW.Package_Barcode = cbo_turno.Value.ToString();
                            vNEW.Package_QuantityInitial = Convert.ToInt32(txt_cantidad.Text);
                            vNEW.Package_Quantity = Convert.ToInt32(txt_cantidad.Text);
                            vNEW.Package_NetWeight = Convert.ToDecimal(txt_cantidad.Text);
                            vNEW.Package_NetWeightInitial = Convert.ToDecimal(txt_cantidad.Text);
                            vNEW.Package_GrossWeight = Convert.ToDecimal(txt_cantidad.Text);
                            vNEW.Package_GrossWeightInitial = Convert.ToDecimal(txt_cantidad.Text);
                            vNEW.Package_Height = 100;
                            vNEW.Package_Status = 2;
                            vNEW.Package_QualityStatus = 1;
                            vNEW.Package_Owner = "19";
                            vNEW.Package_SSCC = SSCC.ToString();
                            vNEW.Package_SSCCParent = string.Empty;
                            vNEW.Package_Lot = Session["LoteOF"].ToString();
                            vNEW.Package_ProductionDate = DateTime.Now;
                            vNEW.Package_ExpiresDate = DateTime.Now.AddDays(vWMS.ObtieneDiasVencimiento(lbl_codproducto.Text));
                            vNEW.Package_Mixed = 0;
                            vNEW.Package_InDate = DateTime.Now;
                            vNEW.Package_SN = string.Empty;
                            vNEW.Package_PN = string.Empty;
                            vNEW.Package_Data1 = string.Empty;
                            vNEW.Package_Data2 = "Generado por Etiquetado WEB";
                            vNEW.PackageState_Id = 1;
                            vNEW.Accounts_Id = 0;
                            vNEW.Package_FoilPP = string.Empty;
                            vNEW.EntryType = 0;
                            vNEW.Package_Origin = idPais;
                            vNEW.Package_Destination = 1;
                            vNEW.Package_CrossDocking = 0;
                            vNEW.PackageState_Id_Initial = 1;
                            int PKId = vWMS.AgregaBultoProduccion(vNEW);
                            vWMS.AddMovement(1, 1, Convert.ToInt32(txt_cantidad.Text), 1, vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString()), Convert.ToInt32(txt_cantidad.Text), Convert.ToInt32(txt_cantidad.Text), Convert.ToInt32(txt_cantidad.Text), PKId);
                            vWMS.AddLocation(PKId, 1463, vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString()));
                            GvDatos.DataBind();



                            ReportDocument Info = new ReportDocument();
                            Info.Load(Server.MapPath("~/EtiquetaPallet_Vertical.rpt"));
                            Info.SetDatabaseLogon("sa", "cvt.vdp22$");
                            Info.SetParameterValue(0, SSCC.ToString());
                            Info.SetParameterValue(1, 0);
                            Info.SetParameterValue(2, 1);


                            //CrystalReportViewer1.PrintMode = CrystalDecisions.Web.PrintMode.ActiveX;

                            Response.Buffer = false;
                            Response.Clear();

                            // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");

                            Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
                            //Info.ExportToStream(ExportFormatType.PortableDocFormat);
                        }
                    }
                    else
                    {
                        int SSCC = vWMS.getNewCorrelativo(1);
                        int RecepcionId = vWMS.ObtieneRecepcionProductivaLote(Session["LoteOF"].ToString());
                        int idPais = vWMS.TraePaisOFRecepcionPRod(Convert.ToInt32(Session["OF"]));

                        if (RecepcionId == 0)
                        {
                            RecepcionId = vWMS.AgregaRecepcionProduccion(1, 9, vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString()), Convert.ToInt32(Session["OF"]),idPais);
                        }
                        vNEW.Company_Id = 1;
                        vNEW.Supportive_Id = Convert.ToInt32(cboTipoPallet.Value);
                        vNEW.Reception_Id = RecepcionId;
                        vNEW.Layout_Id = 1463;
                        vNEW.ArticleProvider_Id = vWMS.ObtieneIdProduct(lbl_codproducto.Text);
                        vNEW.ArticleProvider_GrossWeight = 1;
                        vNEW.Package_Barcode = cbo_turno.Value.ToString();
                        vNEW.Package_QuantityInitial = Convert.ToInt32(txt_cantidad.Text);
                        vNEW.Package_Quantity = Convert.ToInt32(txt_cantidad.Text);
                        vNEW.Package_NetWeight = Convert.ToDecimal(txt_cantidad.Text);
                        vNEW.Package_NetWeightInitial = Convert.ToDecimal(txt_cantidad.Text);
                        vNEW.Package_GrossWeight = Convert.ToDecimal(txt_cantidad.Text);
                        vNEW.Package_GrossWeightInitial = Convert.ToDecimal(txt_cantidad.Text);
                        vNEW.Package_Height = 100;
                        vNEW.Package_Status = 2;
                        vNEW.Package_QualityStatus = 1;
                        vNEW.Package_Owner = "19";
                        vNEW.Package_SSCC = SSCC.ToString();
                        vNEW.Package_SSCCParent = string.Empty;
                        vNEW.Package_Lot = Session["LoteOF"].ToString();
                        vNEW.Package_ProductionDate = DateTime.Now;
                        vNEW.Package_ExpiresDate = DateTime.Now.AddDays(vWMS.ObtieneDiasVencimiento(lbl_codproducto.Text));
                        vNEW.Package_Mixed = 0;
                        vNEW.Package_InDate = DateTime.Now;
                        vNEW.Package_SN = string.Empty;
                        vNEW.Package_PN = string.Empty;
                        vNEW.Package_Data1 = string.Empty;
                        vNEW.Package_Data2 = "Generado por Etiquetado WEB";
                        vNEW.PackageState_Id = 1;
                        vNEW.Accounts_Id = 0;
                        vNEW.Package_FoilPP = string.Empty;
                        vNEW.EntryType = 0;
                        vNEW.Package_Origin = idPais;
                        vNEW.Package_Destination = 1;
                        vNEW.Package_CrossDocking = 0;
                        vNEW.PackageState_Id_Initial = 1;
                        int PKId = vWMS.AgregaBultoProduccion(vNEW);
                        vWMS.AddMovement(1, 1, Convert.ToInt32(txt_cantidad.Text), 1, vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString()), Convert.ToInt32(txt_cantidad.Text), Convert.ToInt32(txt_cantidad.Text), Convert.ToInt32(txt_cantidad.Text), PKId);
                        vWMS.AddLocation(PKId, 1463, vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString()));
                        GvDatos.DataBind();



                        ReportDocument Info = new ReportDocument();
                        Info.Load(Server.MapPath("~/EtiquetaPallet_Vertical.rpt"));
                        Info.SetDatabaseLogon("sa", "cvt.vdp22$");
                        Info.SetParameterValue(0, SSCC.ToString());
                        Info.SetParameterValue(1, 0);
                        Info.SetParameterValue(2, 1);


                        //CrystalReportViewer1.PrintMode = CrystalDecisions.Web.PrintMode.ActiveX;

                        Response.Buffer = false;
                        Response.Clear();

                        // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");

                        Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
                        //Info.ExportToStream(ExportFormatType.PortableDocFormat);
                    }

                }

                //PrintOptions vop;
                //vop.PrinterName=@"\\digitacion\Datamax-O'Neil M-4206 Mark II";
                //Info.PrintOptions.PrinterName = @"\\\\digitacion\\Datamax-O'Neil M-4206 Mark II";
                ////Info.PrintOptions
                //Info.PrintToPrinter(3, false, 1, 1);
            }
            catch (Exception ex)
            {
                GvDatos.DataBind();
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + ex.Message.ToString() + "');", true);
            }

        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Etiquetas";
            }
        }
    }
}