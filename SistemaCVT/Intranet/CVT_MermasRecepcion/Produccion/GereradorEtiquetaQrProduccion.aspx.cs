using DBMermasRecepcion;
using DevExpress.XtraReports.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.Produccion
{
    public partial class GereradorEtiquetaQrProduccion : System.Web.UI.Page
    {
        string LoteOF;
        string OF;

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
               
                LoteOF = "CVT000" + cbo_of.Value.ToString();
                OF = cbo_of.Value.ToString();
                lblLoteOFs.Text = LoteOF.ToString();
                lblOFs.Text = OF.ToString();


                WMSClass vWMS = new WMSClass();
                SAPClass vSAP = new SAPClass();
                lbl_lote.Text = "Lote:" + LoteOF;
                lbl_bultos.Text = "Pallets:" + vWMS.ObtieneCantidadBultosLote(LoteOF).ToString();
                lbl_cantidad.Text = "En Stock:" + vWMS.ObtieneEnvasesStockLote(LoteOF).ToString();
                lbl_producido.Text = "Producido:" + vWMS.ObtieneEnvasesProducidosLote(LoteOF).ToString();
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
                EtiquetaQr1 report = new EtiquetaQr1();

                if (Convert.ToInt32(txt_cantidad.Text) == 0)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert(' cantidad debe ser mayor a 0 ');", true);
                }
                else
                {

                        string ret = vsap.CreaReciboPorduccion(Convert.ToInt32(lblOFs.Text), lblLoteOFs.Text, DateTime.Now.AddDays(vWMS.ObtieneDiasVencimiento(lbl_codproducto.Text)), Convert.ToInt32(txt_cantidad.Text));
                        if (ret != "0")
                        {
                            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + ret + "');", true);
                        }
                        else
                        {

                            int SSCC = vWMS.getNewCorrelativo(1);
                            int RecepcionId = vWMS.ObtieneRecepcionProductivaLote(lblLoteOFs.Text);

                            int idPais = vWMS.TraePaisOFRecepcionPRod(Convert.ToInt32(lblOFs.Text));
                            if (RecepcionId == 0)
                            {
                                RecepcionId = vWMS.AgregaRecepcionProduccion(1, 9, vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString()), Convert.ToInt32(lblOFs.Text),idPais);
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
                            vNEW.Package_Lot = lblLoteOFs.Text;
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



                            PopEtiquetaNueva.ShowOnPageLoad = true;

                            report.Parameters["Num_Pallet"].Value = Convert.ToInt32(SSCC.ToString());
                            report.Parameters["Num_Recep"].Value = 0;
                            report.Parameters["Num_Ubicacion"].Value = 1;
                            ASPxWebDocumentViewer1.OpenReport(new CachedReportSourceWeb(report));

                            report.Parameters["Num_Pallet"].Visible = false;
                            report.Parameters["Num_Recep"].Visible = false;
                            report.Parameters["Num_Ubicacion"].Visible = false;


                            
                        }
                    

                }

                


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