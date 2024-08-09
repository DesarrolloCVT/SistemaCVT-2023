<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Recuperacion.aspx.cs" Inherits="CVT_MermasRecepcion.KPI.Recuperacion" %>
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
        <li><span id="current">KPI B Recuperacion</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">KPI B Recuperacion</span></div>
<br />
    
    <div style="clear:both">
      <p style="font-size:large">  Desecho por Grupo de producto </p>
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
            <dx:ASPxGridView ID="Gv_Desecho" runat="server" DataSourceID="LqDsDesecho" AutoGenerateColumns="False">
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
                    <dx:GridViewDataTextColumn FieldName="dia" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Mes" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Año" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="fecha" VisibleIndex="3">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="GrupoArticulo" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CodProducto" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Producto" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Kilos" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:ASPxGridView>
            <asp:LinqDataSource ID="LqDsDesecho" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" TableName="CVT_DESECHOSPORGRUPO" Where="Año == @Año">
                <WhereParameters>
                    <asp:ControlParameter ControlID="cbo_Año" Name="Año" PropertyName="Value" Type="Int32" />
                </WhereParameters>
            </asp:LinqDataSource>
        </td>

        <td>
            <dx:WebChartControl ID="Graf_Desecho" runat="server" CrosshairEnabled="True" DataSourceID="LqDsDesecho" Height="500px" Width="1000px" SeriesDataMember="GrupoArticulo">
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
                <SeriesTemplate SeriesPointsSortingKey="Value_1" ValueDataMembersSerializable="Kilos" ArgumentDataMember="Mes" SeriesDataMember="GrupoArticulo">
                </SeriesTemplate>
            </dx:WebChartControl>
        </td>
    </tr>
    </table>
</asp:Content>
