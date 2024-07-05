using DBMermasRecepcion;
using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CVT_MermasRecepcion.MayoristaKPI
{
    public partial class SMMAnalisisDeVentas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack)
            {
                //GvDatosV.DataSource = Session["Datos"];

                PvDatos.DataSource = Session["Datos"];
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            CargaDatos();
        }

        private void CargaDatos()
        {
            //MMetroClass mc = new MMetroClass();
            //DataTable dt = new DataTable();

            //dt = mc.SP_AnalisisDeVentas(dteFinicio.Date, dteFTermino.Date,cboGrupoCliente.Value.ToString());

            //GvDatosV.DataSource = dt;
            //GvDatosV.DataBind();
            //Session["Datos"] = dt;


            MMetroClass mme = new MMetroClass();
            DataTable dt = new DataTable();
            dt = mme.SP_AnalisisdeVentas(dteFinicio.Date, dteFTermino.Date);
            PvDatos.DataSource = dt;
            Session["Datos"] = dt;

            //GvDatos.Settings.ShowFooter = true;

            //ASPxSummaryItem groupSummary = new ASPxSummaryItem();
            //groupSummary.FieldName = "MontoVenta";
            //groupSummary.DisplayFormat = "Total MontVenta: {0:N0}";
            //groupSummary.ShowInGroupFooterColumn = "MontoVenta";
            //groupSummary.SummaryType = DevExpress.Data.SummaryItemType.Sum;
            //GvDatos.GroupSummary.Add(groupSummary);

            //ASPxSummaryItem groupSummary2 = new ASPxSummaryItem();
            //groupSummary2.FieldName = "Cantidad";
            //groupSummary2.DisplayFormat = "Total Cantidad: {0:N0}";
            //groupSummary2.ShowInGroupFooterColumn = "Cantidad";
            //groupSummary2.SummaryType = DevExpress.Data.SummaryItemType.Sum;
            //GvDatos.GroupSummary.Add(groupSummary2);

            //ASPxSummaryItem groupSummary3 = new ASPxSummaryItem();
            //groupSummary3.FieldName = "TicketProm";
            //groupSummary3.DisplayFormat = "Total Ticket: {0:N0}";
            //groupSummary3.ShowInGroupFooterColumn = "TicketProm";
            //groupSummary3.SummaryType = DevExpress.Data.SummaryItemType.Sum;
            //GvDatos.GroupSummary.Add(groupSummary3);




            PvDatos.DataBind();

        }

        protected void cmdExcel_Click(object sender, ImageClickEventArgs e)
        {
            DevExpress.Export.ExportSettings.DefaultExportType = DevExpress.Export.ExportType.WYSIWYG;
            ASPxPivotGridExporter1.ExportXlsToResponse("Analisis de ventas.xlsx");
        }
    }
}