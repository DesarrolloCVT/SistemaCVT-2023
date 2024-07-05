<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AgendaMantencion.aspx.cs" Inherits="CVT_MermasRecepcion.Mantencion.AgendaMantencion" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>

<%@ Register Assembly="DevExpress.XtraScheduler.v22.1.Core, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraScheduler" TagPrefix="cc1" %>
<%@ Register Assembly="DevExpress.XtraScheduler.v22.1.Core.Desktop, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraScheduler" TagPrefix="cc1" %>

<%@ Register assembly="DevExpress.Web.ASPxScheduler.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxScheduler.Reporting" tagprefix="dxwschsc" %>

<%@ Register Src="~/Mantencion/ReportPreview.ascx" TagName="ReportPreview" TagPrefix="rp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script language="javascript" type="text/javascript">
        function GeneraCallback(s, e) {
            var id = e.appointmentId;
            //scheduler.RaiseCallback("MNUAPT" + ";" + id);
            e.handled = true;
            PopVer.PerformCallback(id);
            PopVer.Show();
        }
        function btnShowPreview_Click(s, e) {
                ASPxPopupControl1.Show();
                ASPxCallbackPanel1.PerformCallback();
            }
    </script>
    <style type="text/css">
        
        .auto-style6 {
            height: 48px;
        }

        .auto-style11 {
            width: 157px;
            height: 48px;
        }
        .auto-style13 {
            float: left;
            width: 294px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Mantencion</a></li>
            <li><span id="current">Agenda Mantencion</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Agenda</span>
        <span class="tab-end"></span>

<%--         <div id="options"> 
    <a>             <asp:ImageButton ID="cmdNuevo"    runat="server" 
         ImageUrl="~/App_Themes/IDA/ui/ico-agregar3.png" 
         onclick="cmdNuevo_Click"  /> </a>
 </div>--%>
    </div>
    <div style="margin-left:150px">
            <dx:ASPxButton ID="btnPreview" runat="server" Text="Exportar Agenda" AutoPostBack="False"
                UseSubmitBehavior="False" ClientInstanceName="btnShowPreview" EnableClientSideAPI="true">
                <ClientSideEvents Click="btnShowPreview_Click"></ClientSideEvents>
            </dx:ASPxButton>
    </div>

    <br />
    <div>
        <dx:ASPxGlobalEvents ID="ASPxGlobalEvents1" runat="server">
               <ClientSideEvents BeginCallback="function(s, e) { btnShowPreview.SetEnabled(false); }"
            EndCallback="function(s, e) { btnShowPreview.SetEnabled(true); }" />
    </dx:ASPxGlobalEvents>
    <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" Modal="True" ClientInstanceName="ASPxPopupControl1" Theme="Metropolis"
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="1000px"
        Height="600px" HeaderText="Print Preview" AllowDragging="true" PopupAnimationType="None">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server" ID="PCC">
                <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" OnCallback="ASPxCallbackPanel1_Callback"
                    ClientInstanceName="ASPxCallbackPanel1">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <asp:Panel ID="PreviewPanel" runat="server" Visible="false">
                            </asp:Panel>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxCallbackPanel>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    </div>
    <br />
    <div>
        <dxwschs:ASPxScheduler ID="AspxAgenda" runat="server" Theme="Aqua" ClientIDMode="AutoID" ResourceDataSourceID="lqsRec" Start="1753-01-01" ActiveViewType="Month" OnAppointmentFormShowing="AspxAgenda_AppointmentFormShowing" OnPopupMenuShowing="AspxAgenda_PopupMenuShowing">
            <ClientSideEvents AppointmentDoubleClick="function(s, e) {
	GeneraCallback(s,e);
}" />
            <OptionsCustomization AllowAppointmentCopy="None" AllowAppointmentCreate="None" AllowAppointmentDelete="None" AllowAppointmentDrag="None" AllowAppointmentDragBetweenResources="None" AllowAppointmentEdit="None" AllowAppointmentMultiSelect="False" />
            <OptionsBehavior ShowFloatingActionButton="False" />
            <Storage>
                <Appointments>
                    <Mappings
                        AppointmentId="Folio"
                        Description="Observaciones"
                        End="FechaTermino"
                        Start="FechaInicio"
                        Status="Estado"
                        Subject="Datos" />
                </Appointments>
            </Storage>
            <Views>
                <DayView>
                    <TimeRulers>
                        <cc1:TimeRuler></cc1:TimeRuler>
                    </TimeRulers>

                    <AppointmentDisplayOptions ColumnPadding-Left="2" ColumnPadding-Right="4"></AppointmentDisplayOptions>
                </DayView>
                <WorkWeekView>
                    <TimeRulers>
                        <cc1:TimeRuler></cc1:TimeRuler>
                    </TimeRulers>

                    <AppointmentDisplayOptions ColumnPadding-Left="2" ColumnPadding-Right="4"></AppointmentDisplayOptions>
                </WorkWeekView>

                <WeekView Enabled="false"></WeekView>
                <MonthView>
                    <CellAutoHeightOptions Mode="FitToContent" />
                </MonthView>
                <TimelineView></TimelineView>
                <FullWeekView Enabled="true" ShortDisplayName="Semana">
                    <TimeRulers>
                        <cc1:TimeRuler></cc1:TimeRuler>
                    </TimeRulers>

                    <AppointmentDisplayOptions ColumnPadding-Left="2" ColumnPadding-Right="4"></AppointmentDisplayOptions>
                </FullWeekView>

                <AgendaView ViewSelectorItemAdaptivePriority="1"></AgendaView>
            </Views>

        </dxwschs:ASPxScheduler>
        <dxwschsc:ASPxSchedulerControlPrintAdapter ID="ASPxSchedulerControlPrintAdapter1" runat="server" SchedulerControlID="AspxAgenda">
        </dxwschsc:ASPxSchedulerControlPrintAdapter>
        <asp:LinqDataSource ID="lqsRec" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_PlanMantencion_Maquina">
        </asp:LinqDataSource>
     
    </div>
    <div>
        <dx:ASPxPopupControl ID="PopUp_VerDatos" runat="server" ClientInstanceName="PopVer" AllowDragging="True" HeaderText="Datos Agenda" MinWidth="990px" PopupAction="None" PopupHorizontalAlign="Center" PopupVerticalAlign="WindowCenter" OnWindowCallback="PopUp_VerDatos_WindowCallback" MaxWidth="1250px" Width="1152px">
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <br />
                    <br />                  
                        <div style="float: left; margin-right: 10px">
                            <dx:ASPxGridView ID="GvMaquina" runat="server" AutoGenerateColumns="False" DataSourceID="LqsMaquinas" KeyFieldName="id_Maquina_PlanMantencion" EnableTheming="True" Theme="Office2010Blue" Width="300px">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="id_Maquina_PlanMantencion" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="CodMaquina" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Descripcion" ShowInCustomizationForm="True" VisibleIndex="2" Caption=" Maquinas">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Id_PlanMantencion" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:ASPxGridView>
                            <asp:LinqDataSource ID="LqsMaquinas" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_PlanMantencion_Maquina" Where="Id_PlanMantencion == @Id_PlanMantencion">
                                <WhereParameters>
                                    <asp:SessionParameter DefaultValue="0" Name="Id_PlanMantencion" SessionField="IdAppoinment" Type="Int32" />
                                </WhereParameters>
                            </asp:LinqDataSource>
                        </div>
                        <div style="float: left; margin-right: 10px">
                            <dx:ASPxGridView ID="GvPartes" runat="server" AutoGenerateColumns="False" DataSourceID="LqsPartes" EnableTheming="True" KeyFieldName="id_PartePlanMantencion" Theme="Office2010Blue" Width="300px">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="id_PartePlanMantencion" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="CodParte" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption=" Partes" FieldName="Descripcion" ShowInCustomizationForm="True" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Id_PlanMantencion" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:ASPxGridView>
                            <asp:LinqDataSource ID="LqsPartes" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_PlanMantencion_Parte" Where="Id_PlanMantencion == @Id_PlanMantencion">
                                <WhereParameters>
                                    <asp:SessionParameter DefaultValue="0" Name="Id_PlanMantencion" SessionField="IdAppoinment" Type="Int32" />
                                </WhereParameters>
                            </asp:LinqDataSource>
                        </div>
                        <div style="margin-right:25px">
                            <dx:ASPxGridView ID="GvPiezas" runat="server" AutoGenerateColumns="False" DataSourceID="LqsPiezas" EnableTheming="True" KeyFieldName="id_Pieza_PlanMantencion" Theme="Office2010Blue" Width="300px">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="id_Pieza_PlanMantencion" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="CodPieza" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption=" Desglose" FieldName="Descripcion" ShowInCustomizationForm="True" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Id_PlanMantencion" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:ASPxGridView>
                            <asp:LinqDataSource ID="LqsPiezas" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_PlanMantencion_Pieza" Where="Id_PlanMantencion == @Id_PlanMantencion">
                                <WhereParameters>
                                    <asp:SessionParameter DefaultValue="0" Name="Id_PlanMantencion" SessionField="IdAppoinment" Type="Int32" />
                                </WhereParameters>
                            </asp:LinqDataSource>
                        </div>     
                    <table>
                        <tr>
                            <td class="auto-style6"></td>
                            <td class="auto-style11"></td>
                        </tr>
                    </table>
             
                        <div style="margin-right: 25px;" class="auto-style13">
                            <dx:ASPxGridView ID="GvHerramientas" runat="server" AutoGenerateColumns="False" DataSourceID="LqsHerramientas" EnableTheming="True" KeyFieldName="id_HerramientaPlanMantencion" Theme="Office2010Blue" Width="300px">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="id_HerramientaPlanMantencion" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Descripcion" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Herramientas">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Id_PlanMantencion" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:ASPxGridView>
                            <asp:LinqDataSource ID="LqsHerramientas" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_PlanMantencion_Herramienta" Where="Id_PlanMantencion == @Id_PlanMantencion">
                                <WhereParameters>
                                    <asp:SessionParameter DefaultValue="0" Name="Id_PlanMantencion" SessionField="IdAppoinment" Type="Int32" />
                                </WhereParameters>
                            </asp:LinqDataSource>
                        </div>
                        <div style="float:left">
                            <dx:ASPxGridView ID="GvRepuestos" runat="server" AutoGenerateColumns="False" DataSourceID="lqsRepuestos" KeyFieldName="Id_RepuestoPlanMantencion" Theme="Office2010Blue" Width="300px">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="Id_RepuestoPlanMantencion" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Visible="False">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Descripcion" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Repuestos">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Id_PlanMantencion" ShowInCustomizationForm="True" VisibleIndex="2" Visible="False">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:ASPxGridView>
                            <asp:LinqDataSource ID="lqsRepuestos" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_PlanMantencion_Repuesto" Where="Id_RepuestoPlanMantencion == @Id_RepuestoPlanMantencion">
                                <WhereParameters>
                                    <asp:SessionParameter DefaultValue="0" Name="Id_RepuestoPlanMantencion" SessionField="IdAppoinment" Type="Int32" />
                                </WhereParameters>
                            </asp:LinqDataSource>

                        </div>               
                    <div style="float:left;margin-left:25px">                        
<%--                        <asp:Label ID="Label1" runat="server" Text="RRHH"></asp:Label>--%>
                
                                    <dx:ASPxGridView ID="GvRRHH" runat="server" AutoGenerateColumns="False" DataSourceID="LqsRRHH" EnableTheming="True" KeyFieldName="id_RHHPlanMantencion" Theme="Office2010Blue" Width="450px">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="id_RHHPlanMantencion" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                                <EditFormSettings Visible="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Run" ShowInCustomizationForm="True" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Nombre" ShowInCustomizationForm="True" VisibleIndex="2">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Apellido" ShowInCustomizationForm="True" VisibleIndex="3">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Id_PlanMantencion" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:ASPxGridView>
                                    <asp:LinqDataSource ID="LqsRRHH" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_PlanMantencion_RRHH" Where="Id_PlanMantencion == @Id_PlanMantencion">
                                        <WhereParameters>
                                            <asp:SessionParameter DefaultValue="0" Name="Id_PlanMantencion" SessionField="IdAppoinment" Type="Int32" />
                                        </WhereParameters>
                                    </asp:LinqDataSource>                 

                    </div>
                    <br />
                    <br />
                    <br />

                </dx:PopupControlContentControl>
                
            </ContentCollection>
        </dx:ASPxPopupControl>
   
    </div>

   
   
</asp:Content>
