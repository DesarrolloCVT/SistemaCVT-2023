using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.MayoristaProduccion
{
    public partial class SMMGeneradorEtiquetas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    LogClass vLog = new LogClass();
                    vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 32, "Ingreso");
                    GvDatos.DataBind();
                }
                else
                {
                    GvDatos.DataBind();
                }
                GvDatos.DataBind();
            }
            catch
            {
            }
        }

        protected void cbo_of_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                Session["LoteOF"] = "SMM" + cbo_of.Value.ToString();
                Session["OF"] = cbo_of.Value.ToString();
                CVTWMSMetroClass vWMS = new CVTWMSMetroClass();
                MMetroClass vMetro = new MMetroClass();
                lbl_lote.Text = "Lote:" + Session["LoteOF"].ToString();
                lbl_bultos.Text = "Pallets:" + vWMS.ObtieneCantidadBultosLoteSMM(Session["LoteOF"].ToString()).ToString();//crear
                lbl_cantidad.Text = "En Stock:" + vWMS.ObtieneEnvasesStockLoteSMM(Session["LoteOF"].ToString()).ToString();//Crear
                lbl_producido.Text = "Producido:" + vWMS.ObtieneEnvasesProducidosLoteSMM(Session["LoteOF"].ToString()).ToString();//Crear
                lbl_codproducto.Text = vMetro.ObtieneCodProductoOFSMM(Convert.ToInt32(cbo_of.Value));
                lbl_producto.Text = "Producto:" + vMetro.ObtieneProductoOFSMM(Convert.ToInt32(cbo_of.Value));
                //txt_cantidad.Text = vWMS.ObtienePaletizadoProducto(vSAP.ObtieneCodProductoOF(Convert.ToInt32(cbo_of.Value))).ToString();
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

                CVTWMSMetroClass vWMS = new CVTWMSMetroClass();
                SMM_Package vNEW = new SMM_Package();
                SAPSMM vsap = new SAPSMM();//Tocar
                // MermasClass vMerma = new MermasClass();

                if (Convert.ToInt32(txt_cantidad.Text) == 0)
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert(' cantidad debe ser mayor a 0 ');", true);
                }
                else
                {
                    string ret = vsap.CreaReciboPorduccionSMM(Convert.ToInt32(Session["OF"]), Session["LoteOF"].ToString(), DateTime.Now.AddMonths(6), Convert.ToInt32(txt_cantidad.Text));
                    if (ret != "0")
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "Aviso", "alert('" + ret + "');", true);
                    }
                    else
                    {
                        int SSCC = vWMS.CreaNewCorrelativo();

                        int RecepcionId = vWMS.ObtieneRecepcionProductivaLoteSMM(Session["LoteOF"].ToString());
                        string proveedor = "P77047926-6"; //vWMS.TraeProveedorSMM(lbl_codproducto.Text);
                        if (RecepcionId == 0)
                        {
                            RecepcionId = vWMS.AgregaRecepcionProduccionSMM(1, Convert.ToInt32(Session["IDCVTUsuario"]), Convert.ToInt32(Session["OF"]), proveedor);
                        }

                        vNEW.Reception_Id = RecepcionId;
                        vNEW.Layout_Id = 1030;//????
                        vNEW.ItemCode = lbl_codproducto.Text;
                        vNEW.Package_SN = vWMS.TraeBarCodeProductoSMM(lbl_codproducto.Text);
                        vNEW.Package_QuantityInitial = Convert.ToInt32(txt_cantidad.Text);
                        vNEW.Package_Quantity = Convert.ToInt32(txt_cantidad.Text);
                        vNEW.Package_Status = 2;
                        vNEW.Package_SSCC = SSCC.ToString();
                        vNEW.Package_Lot = Session["LoteOF"].ToString();
                        vNEW.Package_ProductionDate = DateTime.Now;
                        vNEW.Package_ExpiresDate = DateTime.Now.AddMonths(6);
                        vNEW.Package_InDate = DateTime.Now;
                        vNEW.Package_Data1 = string.Empty;
                        vNEW.Package_Data2 = "Generado por Etiquetado WEB";
                        vNEW.Linea =Convert.ToInt32(cboLinea.Value);
                        
                        int PKId = vWMS.AgregaBultoProduccionSMM(vNEW);
                        //vWMS.AddMovement(1, 1, Convert.ToInt32(txt_cantidad.Text), 1, vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString()), Convert.ToInt32(txt_cantidad.Text), Convert.ToInt32(txt_cantidad.Text), Convert.ToInt32(txt_cantidad.Text), PKId);
                        vWMS.AgregaLocation(PKId, 3, Convert.ToInt32(Session["IDCVTUsuario"]));
                        GvDatos.DataBind();



                        ReportDocument Info = new ReportDocument();
                        Info.Load(Server.MapPath("~/EtiquetaPallet_SMM.rpt"));
                        Info.SetDatabaseLogon("sa", "cvt.vdp22$");
                        Info.SetParameterValue(0, SSCC.ToString());
                        Info.SetParameterValue(1, 0);
                        Info.SetParameterValue(2, 1);
                        Response.Buffer = false;
                        Response.Clear();

                        LogClass vLog = new LogClass();
                        vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 254, "Generador etiqueta SMM");
                        Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");

                    }
                }
            }
            //PrintOptions vop;
            //vop.PrinterName=@"\\digitacion\Datamax-O'Neil M-4206 Mark II";
            //Info.PrintOptions.PrinterName = @"\\\\digitacion\\Datamax-O'Neil M-4206 Mark II";
            ////Info.PrintOptions
            //Info.PrintToPrinter(3, false, 1, 1);       
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