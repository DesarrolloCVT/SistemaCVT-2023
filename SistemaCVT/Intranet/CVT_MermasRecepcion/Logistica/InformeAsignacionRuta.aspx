<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InformeAsignacionRuta.aspx.cs" Inherits="CVT_MermasRecepcion.Logistica.InformeAsignacionRuta" %>
<%@ Register assembly="DevExpress.Web.ASPxScheduler.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxScheduler" tagprefix="dxwschs" %>
<%@ Register assembly="DevExpress.XtraScheduler.v22.1.Core.Desktop, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraScheduler" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>Logistica</a></li>
        <li><span id="current">Informe Asignacion Ruta</span></li>
    </ul>
</div>
<br />
<br />
<div id="tableHeader">
    <span class="tableTitle">Informe Asignacion Ruta</span>
    <span class="tab-end"></span>
   
    <br />
</div>
<div>

   
    <dxwschs:ASPxScheduler ID="ScResumenRuta" runat="server" AppointmentDataSourceID="LqDsResumenRuta" ClientIDMode="AutoID" Start="1753-01-01" ResourceDataSourceID="LqDsRecursos">
        <views>
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

            <weekview enabled="false">
            </weekview>

<MonthView ViewSelectorItemAdaptivePriority="5"></MonthView>

<TimelineView ViewSelectorItemAdaptivePriority="3"></TimelineView>

            <fullweekview enabled="true">
                <TimeRulers>
<cc1:TimeRuler></cc1:TimeRuler>
</TimeRulers>

<AppointmentDisplayOptions ColumnPadding-Left="2" ColumnPadding-Right="4"></AppointmentDisplayOptions>
            </fullweekview>

<AgendaView ViewSelectorItemAdaptivePriority="1"></AgendaView>
        </views>
        <Storage>
            <Appointments>
                <Mappings AppointmentId="Camion_ID" End="FechaEntregaAgendada" Location="Direccion" Start="FechaEntregaAgendada" Subject="Cliente" Description="Descripcion" ResourceId="Camion_ID" />
                <CustomFieldMappings>
                    <dxwschs:ASPxAppointmentCustomFieldMapping Member="DocNum" Name="NumeroPedido" ValueType="Integer" />
                    <dxwschs:ASPxAppointmentCustomFieldMapping Member="Hora" Name="Hora" ValueType="Integer" />
                    <dxwschs:ASPxAppointmentCustomFieldMapping Member="Minuto" Name="Minuto" ValueType="Integer" />
                    <dxwschs:ASPxAppointmentCustomFieldMapping Member="U_Agendamiento" Name="NumeroAgendamiento" ValueType="String" />
                    <dxwschs:ASPxAppointmentCustomFieldMapping Member="PesoPallet" Name="PesoPedido" ValueType="Integer" />
                    <dxwschs:ASPxAppointmentCustomFieldMapping Member="CantidadPallet" Name="CantidadPallet" />
                </CustomFieldMappings>
            </Appointments>
            <Resources>
                <Mappings Caption="NombreCorto" ResourceId="Patente" />
            </Resources>
        </Storage>
    </dxwschs:ASPxScheduler>
    <asp:LinqDataSource ID="LqDsResumenRuta" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_VW_AsignacionRutaAgenda">
</asp:LinqDataSource>
    <asp:LinqDataSource ID="LqDsRecursos" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_VW_AsignacionRutaAgendaRecursos">
    </asp:LinqDataSource>
</div>
</asp:Content>
