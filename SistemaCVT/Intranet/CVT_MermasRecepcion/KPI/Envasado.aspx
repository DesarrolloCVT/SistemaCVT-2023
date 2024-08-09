 <%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Envasado.aspx.cs" Inherits="CVT_MermasRecepcion.KPI.Envasado" %>
<%@ Register Assembly="DevExpress.XtraCharts.v22.1.Web, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.XtraCharts.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
           <div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>KPI</a></li>
        <li><span id="current">KPI </span>Produccion</li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">KPI Produccion</span></div>
<br />
    
           <div style="clear:both">
               <p style="font-size:large">  &nbsp;Control Peso Pallet</p>
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
    <dx:ASPxButton ID="btn_refrescar" runat="server" Text="REFRESCAR" OnClick="btn_refrescar_Click"></dx:ASPxButton>
</div>
    <table>
        <tr>
            <td>
            <dx:ASPxGridView ID="Gv_PesoPallet" runat="server" DataSourceID="LqDsPesoPallet" AutoGenerateColumns="False">
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
                    <dx:GridViewDataTextColumn FieldName="Dia" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="MES" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="AÑO" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="Fecha" VisibleIndex="3">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="NLinea" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Grupo" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CodProducto" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Producto" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="SSCC" VisibleIndex="8">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="PesoPallet" VisibleIndex="9">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CantidadCreado" VisibleIndex="10">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="PesoUM" VisibleIndex="11">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="PesoIdeal" VisibleIndex="12">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="PesoPromedioFILM" VisibleIndex="13">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="PesoAproximadoMP" VisibleIndex="14">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="DosificadoPromedioContenedora" VisibleIndex="15">
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:ASPxGridView>
            <asp:LinqDataSource ID="LqDsPesoPallet" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_ControlPesoPallet" Where="Año == @Año">
                <WhereParameters>
                    <asp:ControlParameter ControlID="cbo_Año" Name="Año" PropertyName="Value" Type="Int32" />
                </WhereParameters>
            </asp:LinqDataSource>
        </td>

        <td>
            <dx:WebChartControl ID="Graf_PesoPallet" runat="server" CrosshairEnabled="True" DataSourceID="LqDsPesoPallet" Height="500px" Width="1000px" SeriesDataMember="Grupo">
                <DiagramSerializable>
                    <dx:XYDiagram>
                        <AxisX VisibleInPanesSerializable="-1">
                        </AxisX>
                        <AxisY VisibleInPanesSerializable="-1">
                        </AxisY>
                    </dx:XYDiagram>
                </DiagramSerializable>
                <SeriesSerializable>
                    <dx:Series Name="Serie1" Visible="False">
                    </dx:Series>
                </SeriesSerializable>
                <SeriesTemplate SeriesPointsSortingKey="Value_1" ValueDataMembersSerializable="PesoPallet" ArgumentDataMember="MES" SeriesDataMember="Grupo">
                </SeriesTemplate>
            </dx:WebChartControl>
        </td>
    </tr>
    </table>
               <div style="clear:both">
               <p style="font-size:large">  &nbsp;Metas Produccion</p>
    </div>
    <div>
    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Año"></dx:ASPxLabel>
    <dx:ASPxComboBox ID="cbo_añoMetas" runat="server" SelectedIndex="2">
        <Items>
            <dx:ListEditItem Text="2022" Value="2022" />
            <dx:ListEditItem Text="2023" Value="2023" />
            <dx:ListEditItem Text="2024" Value="2024" Selected="True" />
            <dx:ListEditItem Text="2025" Value="2025" />
            <dx:ListEditItem Text="2026" Value="2026" />
            <dx:ListEditItem Text="2027" Value="2027" />
        </Items>
    </dx:ASPxComboBox>
    <dx:ASPxButton ID="btn_RefrescarMetas" runat="server" Text="REFRESCAR" OnClick="btn_RefrescarMetas_Click"></dx:ASPxButton>
</div>
    <table>
        <tr>
            <td>
            <dx:ASPxGridView ID="Gv_MetasProduccion" runat="server" DataSourceID="LqDsMetasProduccion" AutoGenerateColumns="False">
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
                    <dx:GridViewDataTextColumn FieldName="MES" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="AÑO" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="GRUPO" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="SumaMeta" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="SumaProducidoReal" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="PromedioCumplimiento" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Cumplimiento" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:ASPxGridView>
            <asp:LinqDataSource ID="LqDsMetasProduccion" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" TableName="CVT_VW_PRODUCCION_KPI" Where="AÑO == @AÑO1">
                <WhereParameters>
                    <asp:ControlParameter ControlID="cbo_añoMetas" Name="AÑO1" PropertyName="Value" Type="Int32" />
                </WhereParameters>
            </asp:LinqDataSource>
        </td>

        <td>
            <dx:WebChartControl ID="Graf_MetasProduccion" runat="server" CrosshairEnabled="True" DataSourceID="LqDsMetasProduccion" Height="500px" Width="1000px" SeriesDataMember="Grupo">
                <DiagramSerializable>
                    <dx:XYDiagram>
                        <AxisX VisibleInPanesSerializable="-1">
                        </AxisX>
                        <AxisY VisibleInPanesSerializable="-1">
                        </AxisY>
                    </dx:XYDiagram>
                </DiagramSerializable>
                <SeriesSerializable>
                    <dx:Series Name="Serie1" Visible="False">
                    </dx:Series>
                </SeriesSerializable>
                <SeriesTemplate SeriesPointsSortingKey="Value_1" ValueDataMembersSerializable="PromedioCumplimiento" ArgumentDataMember="MES" SeriesDataMember="Grupo">
                </SeriesTemplate>
            </dx:WebChartControl>
        </td>
    </tr>
    </table>
                   <div style="clear:both">
               <p class="auto-style5">  Detenciones</p>
    </div>
    <div>
    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Año"></dx:ASPxLabel>
    <dx:ASPxComboBox ID="Cbo_añodetenciones" runat="server" SelectedIndex="2">
        <Items>
            <dx:ListEditItem Text="2022" Value="2022" />
            <dx:ListEditItem Text="2023" Value="2023" />
            <dx:ListEditItem Text="2024" Value="2024" Selected="True" />
            <dx:ListEditItem Text="2025" Value="2025" />
            <dx:ListEditItem Text="2026" Value="2026" />
            <dx:ListEditItem Text="2027" Value="2027" />
        </Items>
    </dx:ASPxComboBox>
    <dx:ASPxButton ID="btn_RefrescarDetenciones" runat="server" Text="REFRESCAR" OnClick="btn_RefrescarDetenciones_Click"></dx:ASPxButton>
</div>
    <table>
        <tr>
            <td>
                    <dx:ASPxGridView ID="GvDetenciones" runat="server" AutoGenerateColumns="False" DataSourceID="LqDsDetenciones">
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="Mes" VisibleIndex="0">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Ano" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Categoria_Nombre" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Detencion_Motivo" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="ItmsGrpNam" VisibleIndex="4">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="ItemCode" VisibleIndex="5">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="ItemName" VisibleIndex="6">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="MinDetencion" VisibleIndex="7">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="MinutosTotales" VisibleIndex="8">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Golpes" VisibleIndex="9">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Kilos" VisibleIndex="10">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>
                    <asp:LinqDataSource ID="LqDsDetenciones" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" TableName="CVT_VW_ProduccionDetencionesKPI" Where="Ano == @Ano">
                        <WhereParameters>
                            <asp:ControlParameter ControlID="Cbo_añodetenciones" Name="Ano" PropertyName="Value" Type="Int32" />
                        </WhereParameters>
                    </asp:LinqDataSource>
        </td>

        <td>
                    <dx:WebChartControl ID="GrafDetenciones" runat="server" CrosshairEnabled="True" DataSourceID="LqDsDetenciones" Height="600px" SeriesDataMember="Detencion_Motivo" Width="1500px">
                        <DiagramSerializable>
                            <dx:XYDiagram>
                                <AxisX VisibleInPanesSerializable="-1">
                                </AxisX>
                                <AxisY VisibleInPanesSerializable="-1">
                                </AxisY>
                            </dx:XYDiagram>
                        </DiagramSerializable>
                        <SeriesTemplate ArgumentDataMember="ItmsGrpNam" SeriesDataMember="Detencion_Motivo" SeriesPointsSortingKey="Value_1" ValueDataMembersSerializable="Kilos">
                        </SeriesTemplate>
                    </dx:WebChartControl>
        </td>
    </tr>
    </table>
</asp:Content>

