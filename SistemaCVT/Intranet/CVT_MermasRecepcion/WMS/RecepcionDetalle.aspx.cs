using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using DBMermasRecepcion;
using DevExpress.XtraReports.Web;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.WMS
{
    public partial class RecepcionDetalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_recepcion.Text = Session["RecepcionId"].ToString();
        }

        protected void GvDatos_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != DevExpress.Web.GridViewRowType.Data) return;
            int Estado = (int)e.GetValue("Package_Status");
            Label label = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "N") as Label;
            label.Text = (e.VisibleIndex+1).ToString();
            if (Estado != 1)
            {
                System.Web.UI.WebControls.ImageButton imgAnula = GvDatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Confirma") as System.Web.UI.WebControls.ImageButton;
                imgAnula.Visible = false;
            }
        }

        //protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        //{
        //    DevExpress.XtraPrinting.XlsExportOptions Options = new DevExpress.XtraPrinting.XlsExportOptions();
        //    this.ASPxGridViewExporter1.FileName = "Recepcion - "+ Session["RecepcionId"].ToString();
        //    Options.SheetName = this.ASPxGridViewExporter1.FileName;
        //    this.ASPxGridViewExporter1.WriteXlsToResponse(Options);
        //}

        protected void btn_agregar_Click(object sender, EventArgs e)
        {
            WMSClass vWms = new WMSClass();
            ReceptionReported Vnuevo = new ReceptionReported();
            Vnuevo.Reception_Id = Convert.ToInt32(Session["RecepcionId"]);
            Vnuevo.ArticleProvider_Id = Convert.ToInt32(cbo_producto.Value);
            Vnuevo.Company_Id = 1;
            Vnuevo.ReceptionReported_Quantity = 10000;
            Vnuevo.ReceptionReported_Weigth = 10000;
            Vnuevo.Site_Id = vWms.ObtieneSiteRecepcion(Convert.ToInt32(Session["RecepcionId"]));
            vWms.InsertaReceptionReported(Vnuevo);
            cbo_producto.SelectedIndex = -1;
            cb_producto.DataBind();
        }

        protected void btn_cerrarpopup_Click(object sender, EventArgs e)
        {
            cb_producto.DataBind();
            popup_reported.ShowOnPageLoad = false;
        }

        protected void btn_reported_Click(object sender, EventArgs e)
        {
            popup_reported.ShowOnPageLoad = true;
        }

        protected void btn_agregarbulto_Click(object sender, EventArgs e)
        {

            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 75, "Crea DetRecep.");
            WMSClass vWMS = new WMSClass();


            int CodOrigen = vWMS.ObtieneOrigenPackage(Convert.ToInt32(Session["RecepcionId"]));
            ControlClass vControl = new ControlClass();
            Package vNuevo = new Package();

            vNuevo.Company_Id = 1;
            vNuevo.Supportive_Id =Convert.ToInt32(cboTipoPallet.Value);
            vNuevo.Reception_Id = Convert.ToInt32(Session["RecepcionId"]);
            //vNuevo.Layout_Id = 0;//vControl.ObtieneUbicacionDefecto(vWMS.ObtieneSiteRecepcion(Convert.ToInt32(Session["RecepcionId"])), 1);
            vNuevo.ArticleProvider_Id = Convert.ToInt32(cb_producto.Value);
            vNuevo.ArticleProvider_GrossWeight = 1;
            vNuevo.Package_QuantityInitial = Convert.ToInt32(txt_cantidad.Text);
            vNuevo.Package_Quantity = Convert.ToInt32(txt_cantidad.Text);
            vNuevo.Package_NetWeight = 1000;
            vNuevo.Package_NetWeightInitial = 1000;
            vNuevo.Package_GrossWeight = 1025;
            vNuevo.Package_GrossWeightInitial = 1025;
            vNuevo.Package_Height = 1000;
            vNuevo.Package_Status = 1;
            vNuevo.Package_QualityStatus = 1;
            vNuevo.Package_Owner = "19";
            vNuevo.Package_SSCC = vWMS.getNewCorrelativo(vWMS.ObtieneSiteRecepcion(Convert.ToInt32(Session["RecepcionId"]))).ToString();
            vNuevo.Package_Lot = txt_lote.Text.Trim();
            vNuevo.Package_ExpiresDate = cb_fvencimiento.Date;
            vNuevo.Package_ProductionDate = cb_fproduccion.Date;
            vNuevo.Package_Mixed = 0;
            vNuevo.Package_InDate = DateTime.Now;
            vNuevo.Package_SN = txt_dun14.Text;
            vNuevo.Package_Data1 = txt_loteproveedor.Text;
            vNuevo.Package_Data2 = txt_comentario.Text;
            vNuevo.Package_Origin = CodOrigen;
            vNuevo.Package_Destination = 1;
            vNuevo.EntryType = 2;
            vNuevo.PackageState_Id = 1;
            vNuevo.PackageState_Id_Initial = 1;
            vNuevo.Package_CrossDocking = 0;
            vWMS.InsertaPackageReception(vNuevo);
            GvDatos.DataBind();
            GvResumen.DataBind();
        }

        protected void GvDatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdConfirma")
            {
                WMSClass vWms = new WMSClass();
                ControlClass vControl = new ControlClass();
                int PKID = Convert.ToInt32(e.KeyValue);
                int siteid = vWms.ObtieneSiteRecepcion(Convert.ToInt32(Session["RecepcionId"]));
                int layoutid = vControl.ObtieneUbicacionDefecto(siteid, 3);
                int staffid = vWms.ObtieneIdStaff(Session["CIDUsuario"].ToString());
                vWms.AddMovement(siteid, 1, 0, 2, staffid, 0, 1000, 1000, PKID);
                vWms.AddLocation(PKID, layoutid, staffid);
                vWms.ConfirmaPalletRecepcion(PKID, layoutid);
                GvDatos.DataBind();
            }
        }

        protected void cmdImprimir_Click(object sender, ImageClickEventArgs e)
        {
            WMSClass vWMS = new WMSClass();
            LogClass vLog = new LogClass();

            EtiquetaQr1 report = new EtiquetaQr1();

            int usuario = vWMS.ObtieneIdStaff(Session["CIDUsuario"].ToString());
            //ReportDocument Info = new ReportDocument();
            //Info.Load(Server.MapPath("~/EtiquetaPallet_Vertical.rpt"));
            //Info.SetDatabaseLogon("sa", "cvt.vdp22$");

            //Info.SetParameterValue(0, "0");
            //Info.SetParameterValue(1, Convert.ToInt32(Session["RecepcionId"].ToString()));
            //Info.SetParameterValue(2, 1);
            vLog.InsertaRegistroImpresion(usuario, Convert.ToInt32(Session["RecepcionId"].ToString()), 2);
            //Response.Buffer = false;
            //Response.Clear();

            ////////////////////////////// Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");

            //Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");

            PopEtiquetaNueva.ShowOnPageLoad = true;


            report.Parameters["Num_Pallet"].Value = 0;
            report.Parameters["Num_Recep"].Value = Convert.ToInt32(Convert.ToInt32(Session["RecepcionId"].ToString()));
            report.Parameters["Num_Ubicacion"].Value = 1;
            ASPxWebDocumentViewer1.OpenReport(new CachedReportSourceWeb(report));

            report.Parameters["Num_Pallet"].Visible = false;
            report.Parameters["Num_Recep"].Visible = false;
            report.Parameters["Num_Ubicacion"].Visible = false;

        }

        protected void GvDatos_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (((DevExpress.Web.MenuItem)e.Item.Owner).Name.Equals("Export"))
            {
                GvDatos.SettingsExport.FileName = "Recepcion - " + Session["RecepcionId"].ToString();
            }
        }

        protected void btn_agregarbultomasivo_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < Convert.ToInt32(cbo_cantpallet.Value); i++) 
            {
                LogClass vLog = new LogClass();
                vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 75, "Crea DetRecep.");
                WMSClass vWMS = new WMSClass();


                int CodOrigen = vWMS.ObtieneOrigenPackage(Convert.ToInt32(Session["RecepcionId"]));
                ControlClass vControl = new ControlClass();
                Package vNuevo = new Package();

                vNuevo.Company_Id = 1;
                vNuevo.Supportive_Id = Convert.ToInt32(cboTipoPallet.Value);
                vNuevo.Reception_Id = Convert.ToInt32(Session["RecepcionId"]);
                //vNuevo.Layout_Id = 0;//vControl.ObtieneUbicacionDefecto(vWMS.ObtieneSiteRecepcion(Convert.ToInt32(Session["RecepcionId"])), 1);
                vNuevo.ArticleProvider_Id = Convert.ToInt32(cb_producto.Value);
                vNuevo.ArticleProvider_GrossWeight = 1;
                vNuevo.Package_QuantityInitial = Convert.ToInt32(txt_cantidad.Text);
                vNuevo.Package_Quantity = Convert.ToInt32(txt_cantidad.Text);
                vNuevo.Package_NetWeight = 1000;
                vNuevo.Package_NetWeightInitial = 1000;
                vNuevo.Package_GrossWeight = 1025;
                vNuevo.Package_GrossWeightInitial = 1025;
                vNuevo.Package_Height = 1000;
                vNuevo.Package_Status = 1;
                vNuevo.Package_QualityStatus = 1;
                vNuevo.Package_Owner = "19";
                vNuevo.Package_SSCC = vWMS.getNewCorrelativo(vWMS.ObtieneSiteRecepcion(Convert.ToInt32(Session["RecepcionId"]))).ToString();
                vNuevo.Package_Lot = txt_lote.Text.Trim();
                vNuevo.Package_ExpiresDate = cb_fvencimiento.Date;
                vNuevo.Package_ProductionDate = cb_fproduccion.Date;
                vNuevo.Package_Mixed = 0;
                vNuevo.Package_InDate = DateTime.Now;
                vNuevo.Package_SN = txt_dun14.Text;
                vNuevo.Package_Data1 = txt_loteproveedor.Text;
                vNuevo.Package_Data2 = txt_comentario.Text;
                vNuevo.Package_Origin = CodOrigen;
                vNuevo.Package_Destination = 1;
                vNuevo.EntryType = 2;
                vNuevo.PackageState_Id = 1;
                vNuevo.PackageState_Id_Initial = 1;
                vNuevo.Package_CrossDocking = 0;
                vWMS.InsertaPackageReception(vNuevo);
            }
            GvDatos.DataBind();
            GvResumen.DataBind();
        }

        protected void GvResumen_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {

        }
    }
}