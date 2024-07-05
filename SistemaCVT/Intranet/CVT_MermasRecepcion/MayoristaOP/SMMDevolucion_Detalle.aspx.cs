using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using DBMermasRecepcion;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.MayoristaOP
{
    public partial class SMMDevolucion_Detalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_recepcion.Text = Session["RecepcionId"].ToString();
            CVTWMSMetroClass wmsM = new CVTWMSMetroClass();

            int stadoRecep = wmsM.obtieneEstadoRecepcion(Convert.ToInt32(Session["RecepcionId"]));

            if (stadoRecep != 1)
            {
                btn_agregarbulto.Visible = false;
            }
            else { btn_agregarbulto.Visible = true; }

        }

        protected void cmdVolver_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/MayoristaOP/SMMDevolucion.aspx");
        }

        protected void btn_agregarbulto_Click(object sender, EventArgs e)
        {
            CVTWMSMetroClass wmsM = new CVTWMSMetroClass();
            SMM_Package vNuevo = new SMM_Package();

            vNuevo.Reception_Id = Convert.ToInt32(Session["RecepcionId"]);
            vNuevo.ItemCode = Convert.ToString(cboProdcutoVenta.Value);
            vNuevo.Package_QuantityInitial = Convert.ToDecimal(txt_cantidad.Text);
            vNuevo.Package_Quantity = Convert.ToDecimal(txt_cantidad.Text);
            vNuevo.Package_Lot = txt_lote.Text;
            vNuevo.Package_ExpiresDate = cb_fvencimiento.Date;
            vNuevo.Package_ProductionDate = cb_fproduccion.Date;
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

            GvDatoResumen.DataBind();
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
                vWms.AgregaLocation(PKID, layoutid, idUsuario);
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