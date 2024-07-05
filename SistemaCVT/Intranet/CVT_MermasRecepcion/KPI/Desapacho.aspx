<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Desapacho.aspx.cs" Inherits="CVT_MermasRecepcion.KPI.Desapacho" %>
<%@ Register Assembly="DevExpress.XtraCharts.v22.1.Web, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.XtraCharts.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
       <div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>KPI</a></li>
        <li><span id="current">KPI Despacho</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">KPI Despacho</span>
    <span class="tab-end"></span>

</div>
<br />
    
    <div style="clear:both">
      <p style="font-size:large"> Devoluciones </p>
    </div>
    <div>
    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Año"></dx:ASPxLabel>
    <dx:ASPxComboBox ID="cbo_Año" runat="server" SelectedIndex="2">
        <Items>
            <dx:ListEditItem Text="2022" Value="2022" />
            <dx:ListEditItem Text="2023" Value="2023" />
            <dx:ListEditItem Text="2024" Value="2024" Selected="True" />
            <dx:ListEditItem Text="2025" Value="2025" />
            <dx:ListEditItem Text="2026" Value="2026" />
            <dx:ListEditItem Text="2027" Value="2027" />
        </Items>
    </dx:ASPxComboBox>
     <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Mes"></dx:ASPxLabel>
 <dx:ASPxComboBox ID="cbo_mes" runat="server" SelectedIndex="2">
     <Items>
         <dx:ListEditItem Text="1" Value="1" />
         <dx:ListEditItem Text="2" Value="2" />
         <dx:ListEditItem Text="3" Value="3"  />
         <dx:ListEditItem Text="4" Value="4" Selected="True" />
         <dx:ListEditItem Text="5" Value="5" />
         <dx:ListEditItem Text="6" Value="6" />
         <dx:ListEditItem Text="7" Value="7" />
         <dx:ListEditItem Text="8" Value="8" />
         <dx:ListEditItem Text="9" Value="9"  />
         <dx:ListEditItem Text="10" Value="10" />
         <dx:ListEditItem Text="11" Value="11" />
         <dx:ListEditItem Text="12" Value="12" />
     </Items>
 </dx:ASPxComboBox>
    <dx:ASPxButton ID="btn_refrescar" runat="server" Text="REFRESCAR" OnClick="btn_refrescar_Click"></dx:ASPxButton>
</div>
    <table>
        <tr>
            <td>
                    <dx:ASPxGridView ID="GvKPIDevoluciones" runat="server" AutoGenerateColumns="False" DataSourceID="LqDevoluciones" >
                            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
<SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
                            <SettingsPager PageSize="15">
                            </SettingsPager>
                    <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            <SettingsBehavior AllowFocusedRow="True" />
            <Toolbars>
                <dx:GridViewToolbar >
                    <Items>
                       
                        <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXls" />
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                <dx:GridViewToolbarItem Command="ExportToDocx" />
                                <dx:GridViewToolbarItem Command="ExportToRtf" />
                                <dx:GridViewToolbarItem Command="ExportToCsv" />
                                <dx:GridViewToolbarItem Command="ExportToPdf" />
                            </Items>

<Image IconID="actions_download_16x16office2013"></Image>
                        </dx:GridViewToolbarItem>
                        <dx:GridViewToolbarItem Alignment="Left">
                            <Template>
                                <dx:ASPxButtonEdit ID="tbToolbarSearch" runat="server" NullText="Search..." Height="100%">
                                    <Buttons>
                                        <dx:SpinButtonExtended Image-IconID="find_find_16x16gray" />
                                    </Buttons>
                                </dx:ASPxButtonEdit>
                            </Template>
                        </dx:GridViewToolbarItem>
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="Mes" VisibleIndex="0">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Año" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="GrupoArticulo" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Ventas" VisibleIndex="3" PropertiesTextEdit-DisplayFormatString="n2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Devolucion" VisibleIndex="4" PropertiesTextEdit-DisplayFormatString="n2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Porc" VisibleIndex="5" PropertiesTextEdit-DisplayFormatString="n2">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>
                    <asp:LinqDataSource ID="LqDevoluciones" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" TableName="CVT_VW_Devoluciones_Ventas_KPI" Where="Año == @Año &amp;&amp; Mes == @Mes" OrderBy="Porc desc">
                        <WhereParameters>
                            <asp:ControlParameter ControlID="cbo_Año" Name="Año" PropertyName="Value" Type="Int32" />
                            <asp:ControlParameter ControlID="cbo_mes" DefaultValue="0" Name="Mes" PropertyName="Value" Type="Int32" />
                        </WhereParameters>
                    </asp:LinqDataSource>
        </td>

        <td>
                    <dx:WebChartControl ID="GrafDevoluciones" runat="server" CrosshairEnabled="True" DataSourceID="LqDevoluciones" Height="300px" Width="1000px">
                        <DiagramSerializable>
                            <dx:XYDiagram>
                                <AxisX VisibleInPanesSerializable="-1">
                                </AxisX>
                                <AxisY VisibleInPanesSerializable="-1">
                                </AxisY>
                            </dx:XYDiagram>
                        </DiagramSerializable>
                        <Legend Visibility="True" AlignmentHorizontal="Center" AlignmentVertical="TopOutside"><Title Text="Devoluciones sobre Ventas" Visible="True" WordWrap="True"></Title></Legend>
                        <SeriesSerializable>
                            <dx:Series ArgumentDataMember="GrupoArticulo" LabelsVisibility="True" Name="Porc Devoluciones sobre Ventas" ValueDataMembersSerializable="Porc">
                                <LabelSerializable>
                                    <dx:SideBySideBarSeriesLabel TextPattern="{V:N2}">
                                    </dx:SideBySideBarSeriesLabel>
                                </LabelSerializable>
                            </dx:Series>
                        </SeriesSerializable>
                    </dx:WebChartControl>
        </td>
    </tr>
    </table>
</asp:Content>
