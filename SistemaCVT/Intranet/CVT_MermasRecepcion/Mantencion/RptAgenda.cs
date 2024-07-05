public class RptAgenda : DevExpress.XtraScheduler.Reporting.XtraSchedulerReport
{
    private DevExpress.XtraReports.UI.DetailBand Detail;
    private DevExpress.XtraScheduler.Reporting.DayOfWeekHeaders dayOfWeekHeaders1;
    private DevExpress.XtraScheduler.Reporting.HorizontalWeek horizontalWeek1;
    private DevExpress.XtraScheduler.Reporting.ReportMonthView reportMonthView1;
    private DevExpress.XtraScheduler.Reporting.TimeIntervalInfo timeIntervalInfo1;
    private DevExpress.XtraReports.UI.XRControlStyle xrControlStyle1;

    /// <summary>
    /// Required designer variable.
    /// </summary>
    private System.ComponentModel.IContainer components = null;

    public RptAgenda()
    {
        InitializeComponent();
    }

    /// <summary> 
    /// Clean up any resources being used.
    /// </summary>
    /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
    protected override void Dispose(bool disposing)
    {
        if (disposing && (components != null))
        {
            components.Dispose();
        }
        base.Dispose(disposing);
    }
    #region Designer generated code

    /// <summary>
    /// Required method for Designer support - do not modify
    /// the contents of this method with the code editor.
    /// </summary>
    private void InitializeComponent()
    {
        this.Detail = new DevExpress.XtraReports.UI.DetailBand();
        this.dayOfWeekHeaders1 = new DevExpress.XtraScheduler.Reporting.DayOfWeekHeaders();
        this.horizontalWeek1 = new DevExpress.XtraScheduler.Reporting.HorizontalWeek();
        this.reportMonthView1 = new DevExpress.XtraScheduler.Reporting.ReportMonthView();
        this.timeIntervalInfo1 = new DevExpress.XtraScheduler.Reporting.TimeIntervalInfo();
        this.xrControlStyle1 = new DevExpress.XtraReports.UI.XRControlStyle();
        ((System.ComponentModel.ISupportInitialize)(this.reportMonthView1)).BeginInit();
        ((System.ComponentModel.ISupportInitialize)(this)).BeginInit();
        // 
        // Detail
        // 
        this.Detail.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.dayOfWeekHeaders1,
            this.timeIntervalInfo1,
            this.horizontalWeek1});
        this.Detail.Font = new System.Drawing.Font("Times New Roman", 9.75F);
        this.Detail.HeightF = 859.125F;
        this.Detail.Name = "Detail";
        this.Detail.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
        this.Detail.SnapLinePadding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
        this.Detail.StylePriority.UseFont = false;
        this.Detail.StylePriority.UsePadding = false;
        this.Detail.StylePriority.UseTextAlignment = false;
        this.Detail.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopJustify;
        // 
        // dayOfWeekHeaders1
        // 
        this.dayOfWeekHeaders1.LocationFloat = new DevExpress.Utils.PointFloat(12.50003F, 132.2917F);
        this.dayOfWeekHeaders1.Name = "dayOfWeekHeaders1";
        this.dayOfWeekHeaders1.SizeF = new System.Drawing.SizeF(650F, 25F);
        this.dayOfWeekHeaders1.TimeCells = this.horizontalWeek1;
        this.dayOfWeekHeaders1.View = this.reportMonthView1;
        // 
        // horizontalWeek1
        // 
        this.horizontalWeek1.AppointmentDisplayOptions.AppointmentAutoHeight = true;
        this.horizontalWeek1.BorderColor = System.Drawing.Color.Black;
        this.horizontalWeek1.BorderDashStyle = DevExpress.XtraPrinting.BorderDashStyle.Solid;
        this.horizontalWeek1.CanGrow = true;
        this.horizontalWeek1.CanShrink = true;
        this.horizontalWeek1.CompressWeekend = false;
        this.horizontalWeek1.LocationFloat = new DevExpress.Utils.PointFloat(12.50003F, 157.2917F);
        this.horizontalWeek1.Name = "horizontalWeek1";
        this.horizontalWeek1.PrintColorSchemas.Appointment = DevExpress.XtraScheduler.Reporting.PrintColorSchema.BlackAndWhite;
        this.horizontalWeek1.PrintColorSchemas.Content = DevExpress.XtraScheduler.Reporting.PrintColorSchema.FullColor;
        this.horizontalWeek1.SizeF = new System.Drawing.SizeF(822.9167F, 685.5F);
        this.horizontalWeek1.View = this.reportMonthView1;
        // 
        // reportMonthView1
        // 
        this.reportMonthView1.GroupType = DevExpress.XtraScheduler.SchedulerGroupType.Date;
        // 
        // timeIntervalInfo1
        // 
        this.timeIntervalInfo1.Font = new System.Drawing.Font("Arial", 12.75F, System.Drawing.FontStyle.Bold);
        this.timeIntervalInfo1.FormatType = DevExpress.XtraScheduler.Reporting.TimeIntervalFormatType.Monthly;
        this.timeIntervalInfo1.LocationFloat = new DevExpress.Utils.PointFloat(312.5F, 10.08333F);
        this.timeIntervalInfo1.Name = "timeIntervalInfo1";
        this.timeIntervalInfo1.SizeF = new System.Drawing.SizeF(233F, 92F);
        this.timeIntervalInfo1.TimeCells = this.horizontalWeek1;
        // 
        // xrControlStyle1
        // 
        this.xrControlStyle1.Name = "xrControlStyle1";
        // 
        // RptAgenda
        // 
        this.Bands.AddRange(new DevExpress.XtraReports.UI.Band[] {
            this.Detail});
        this.Margins = new System.Drawing.Printing.Margins(0, 0, 100, 100);
        this.StyleSheet.AddRange(new DevExpress.XtraReports.UI.XRControlStyle[] {
            this.xrControlStyle1});
        this.Version = "18.2";
        this.Views.AddRange(new DevExpress.XtraScheduler.Reporting.ReportViewBase[] {
            this.reportMonthView1});
        ((System.ComponentModel.ISupportInitialize)(this.reportMonthView1)).EndInit();
        ((System.ComponentModel.ISupportInitialize)(this)).EndInit();

    }

    #endregion
}
