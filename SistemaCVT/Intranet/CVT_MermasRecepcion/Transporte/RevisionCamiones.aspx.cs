using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using DBMermasRecepcion;
using System;
using System.Web.UI;

namespace CVT_MermasRecepcion.Transporte
{
    public partial class RevisionCamiones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (IsPostBack)
            {


            }
            else { dteFechaini.Date = Convert.ToDateTime(Session["FechaCrea"]); }

        }

        protected void cmdNew_Click(object sender, ImageClickEventArgs e)
        {
            Gvdatos.AddNewRow();
        }

        protected void Gvdatos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            if (e.CommandArgs.CommandName == "cmdDetalle")
            {

                Session["Id_RevisionCamion"] = e.KeyValue;
                Response.Redirect("~/Transporte/RevisionCamionFactura.aspx");
            }
            if (e.CommandArgs.CommandName == "cmdDetallePdf")
            {
                int id = Convert.ToInt32(e.KeyValue);
                ReportDocument Info = new ReportDocument();
                Info.Load(Server.MapPath("~/R.OP.25.01.rpt"));
                Info.SetDatabaseLogon("sa", "cvt.vdp22$");
                Info.SetParameterValue(0, id);
                ExportOptions op = new ExportOptions();
                Response.Buffer = false;
                Response.Clear();
                // Info.ExportToDisk(ExportFormatType.PortableDocFormat, @"C:\Users\mrivero\Desktop\report.pdf");
                Info.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "report.pdf");
            }
        }

        protected void Gvdatos_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            e.NewValues["IdUsuario"] = Session["IDCVTUsuario"];
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 137, "Crea Registro");
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            Gvdatos.DataBind();

        }

        protected void Gvdatos_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != DevExpress.Web.GridViewRowType.Data) return;
            int totaldc = (int)e.GetValue("TotalDoc");
            if (totaldc != 0)
            {
                System.Web.UI.WebControls.ImageButton imgAlert = Gvdatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Alerta") as System.Web.UI.WebControls.ImageButton;
                imgAlert.Visible = false;

            }
            else
            {
                System.Web.UI.WebControls.ImageButton imgAlert = Gvdatos.FindRowCellTemplateControl(e.VisibleIndex, null, "Alerta") as System.Web.UI.WebControls.ImageButton;
                imgAlert.Visible = true;
            }
        }

        protected void Gvdatos_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 137, "Elimina Registro");
        }

        protected void Gvdatos_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            LogClass vLog = new LogClass();
            vLog.LOGUsabilidad(Convert.ToInt32(Session["IDCVTUsuario"]), 137, "Actualiza Registro");
        }
    }
}