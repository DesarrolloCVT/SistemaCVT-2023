<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CalendarioInsumos.aspx.cs" Inherits="CVT_MermasRecepcion.Insumos.CalendarioInsumos" %>

<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.XtraScheduler.v22.1.Core.Desktop, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraScheduler" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <dxwschs:ASPxScheduler ID="ASPxScheduler1" runat="server" ActiveViewType="Month" Theme="iOS">
        <Views>
<DayView ViewSelectorItemAdaptivePriority="2"><TimeRulers>
<cc1:TimeRuler></cc1:TimeRuler>
</TimeRulers>

<AppointmentDisplayOptions ColumnPadding-Left="2" ColumnPadding-Right="4"></AppointmentDisplayOptions>
</DayView>

<WorkWeekView ViewSelectorItemAdaptivePriority="6"><TimeRulers>
<cc1:TimeRuler></cc1:TimeRuler>
</TimeRulers>

<AppointmentDisplayOptions ColumnPadding-Left="2" ColumnPadding-Right="4"></AppointmentDisplayOptions>
</WorkWeekView>

            <WeekView Enabled="false"></WeekView>

<MonthView ViewSelectorItemAdaptivePriority="5"></MonthView>

<TimelineView ViewSelectorItemAdaptivePriority="3" Enabled="False"></TimelineView>

            <FullWeekView Enabled="true">
                <TimeRulers>
<cc1:TimeRuler></cc1:TimeRuler>
</TimeRulers>

<AppointmentDisplayOptions ColumnPadding-Left="2" ColumnPadding-Right="4"></AppointmentDisplayOptions>
            </FullWeekView>

<AgendaView ViewSelectorItemAdaptivePriority="1" Enabled="False"></AgendaView>
        </Views>

    </dxwschs:ASPxScheduler>
</asp:Content>
