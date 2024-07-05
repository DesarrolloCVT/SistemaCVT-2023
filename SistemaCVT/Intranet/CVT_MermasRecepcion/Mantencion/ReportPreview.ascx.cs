using DevExpress.Web.ASPxScheduler.Reporting;
using System;

namespace CVT_MermasRecepcion.Mantencion
{
    public partial class ReportPreview : System.Web.UI.UserControl
    {
        ASPxSchedulerControlPrintAdapter controlAdapter;
        public ASPxSchedulerControlPrintAdapter ControlAdapter { get { return controlAdapter; } set { controlAdapter = value; } }

        protected void Page_Load(object sender, EventArgs e)
        {
            RptAgenda rpt = new RptAgenda();
            rpt.SchedulerAdapter = ControlAdapter.SchedulerAdapter;
            DocumentViewer.Report = rpt;

        }
    }
}