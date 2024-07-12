<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Bodega.aspx.cs" Inherits="CVT_MermasRecepcion.KPI.Bodega" %>

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
        <li><span id="current">KPI Bodega</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">KPI Bodega</span>
    <span class="tab-end"></span>

</div>
<br />
    
    <div style="clear:both">
      <p style="font-size:large">  Tiempo Cierre Transferencias </p>
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
            <dx:ASPxGridView ID="Gv_TransTiempoCierre" runat="server" DataSourceID="LqDsTransTiempoCierre" AutoGenerateColumns="False">
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
                    <dx:GridViewDataTextColumn FieldName="Mes" ReadOnly="True" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="PromedioHoras" ReadOnly="True" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Año" ReadOnly="True" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:ASPxGridView>
            <asp:LinqDataSource ID="LqDsTransTiempoCierre" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" TableName="CVT_TransferenciaTiempoCierre" GroupBy="Mes" OrderGroupsBy="key" Select="new (key as Mes, Average(Horas) as PromedioHoras, it as CVT_TransferenciaTiempoCierre, Min(Año) as Año)" Where="Año == @Año">
                <WhereParameters>
                    <asp:ControlParameter ControlID="cbo_Año" DefaultValue="1990" Name="Año" PropertyName="Value" Type="Int32" />
                </WhereParameters>
            </asp:LinqDataSource>
        </td>

        <td>
            <dx:WebChartControl ID="Graf_TransTiempoCierre" runat="server" CrosshairEnabled="True" DataSourceID="LqDsTransTiempoCierre" Height="500px" Width="1000px" SeriesDataMember="Año">
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
                        <ViewSerializable>
                            <dx:LineSeriesView>
                            </dx:LineSeriesView>
                        </ViewSerializable>
                    </dx:Series>
                </SeriesSerializable>
                <SeriesTemplate SeriesPointsSortingKey="Value_1" ValueDataMembersSerializable="PromedioHoras" ArgumentDataMember="Mes" SeriesDataMember="Año">
                    <ViewSerializable>
                        <dx:LineSeriesView>
                        </dx:LineSeriesView>
                    </ViewSerializable>
                </SeriesTemplate>
            </dx:WebChartControl>
        </td>
    </tr>
    </table>
        <div style="clear:both">
      <p style="font-size:large">  Ton Movidas</p>
    </div>
    <div>
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Año"></dx:ASPxLabel>
                </td>
                <td>
    <dx:ASPxComboBox ID="cbo_añoton" runat="server" SelectedIndex="2">
        <Items>
            <dx:ListEditItem Text="2022" Value="2022" />
            <dx:ListEditItem Text="2023" Value="2023" />
            <dx:ListEditItem Text="2024" Value="2024" Selected="True" />
            <dx:ListEditItem Text="2025" Value="2025" />
            <dx:ListEditItem Text="2026" Value="2026" />
            <dx:ListEditItem Text="2027" Value="2027" />
        </Items>
    </dx:ASPxComboBox>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    <dx:ASPxComboBox ID="cbo_MesDesdeTon" runat="server" SelectedIndex="0">
                    <Items>
                        <dx:ListEditItem Text="1" Value="1" Selected="True" />
                        <dx:ListEditItem Text="2" Value="2" />
                        <dx:ListEditItem Text="3" Value="3" />
                        <dx:ListEditItem Text="4" Value="4" />
                        <dx:ListEditItem Text="5" Value="5" />
                        <dx:ListEditItem Text="6" Value="6" />
                        <dx:ListEditItem Text="7" Value="7" />
                        <dx:ListEditItem Text="8" Value="8" />
                        <dx:ListEditItem Text="9" Value="9" />
                        <dx:ListEditItem Text="10" Value="10" />
                        <dx:ListEditItem Text="11" Value="11" />
                        <dx:ListEditItem Text="12" Value="12" />
                    </Items>
                    </dx:ASPxComboBox>
                </td>
                <td>
    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Mes Hasta"></dx:ASPxLabel>
</td>
<td>
    <dx:ASPxComboBox ID="cbo_meshastaton" runat="server" SelectedIndex="11">
    <Items>
        <dx:ListEditItem Text="1" Value="1" />
<dx:ListEditItem Text="2" Value="2" />
<dx:ListEditItem Text="3" Value="3" />
<dx:ListEditItem Text="4" Value="4" />
<dx:ListEditItem Text="5" Value="5" />
<dx:ListEditItem Text="6" Value="6" />
<dx:ListEditItem Text="7" Value="7" />
<dx:ListEditItem Text="8" Value="8" />
<dx:ListEditItem Text="9" Value="9" />
<dx:ListEditItem Text="10" Value="10" />
<dx:ListEditItem Text="11" Value="11" />
<dx:ListEditItem Text="12" Value="12" Selected="True" />
    </Items>
    </dx:ASPxComboBox>
</td>
                <td>
    <dx:ASPxButton ID="btn_refrescarTon" runat="server" Text="REFRESCAR" OnClick="btn_refrescarTon_Click"></dx:ASPxButton>
                    </td>
</div>
   <table>
       <tr>
           <td>
        <dx:ASPxGridView ID="Gv_TonMovidas" runat="server" AutoGenerateColumns="False" DataSourceID="LqDsTonMovidas">
                            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
<SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
                            <SettingsPager PageSize="20">
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
                <dx:GridViewDataTextColumn FieldName="Familia" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MES" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="AÑO" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Entradas" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Salidas" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Factor" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsTonMovidas" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" TableName="CVT_TONMOVIDAS_FINAL" Where="MES &gt;= @MES &amp;&amp; MES &lt;= @MES1 &amp;&amp; AÑO == @AÑO">
            <WhereParameters>
                <asp:ControlParameter ControlID="cbo_MesDesdeTon" Name="MES" PropertyName="Value" Type="Int32" />
                <asp:ControlParameter ControlID="cbo_meshastaton" Name="MES1" PropertyName="Value" Type="Int32" />
                <asp:ControlParameter ControlID="cbo_añoton" Name="AÑO" PropertyName="Value" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </td>
           <td>
        <dx:WebChartControl ID="Graf_TonMovidas" runat="server" CrosshairEnabled="True" DataSourceID="LqDsTonMovidas" Height="500px" SeriesDataMember="Familia" Width="1000px">
            <DiagramSerializable>
                <dx:XYDiagram>
                    <AxisX VisibleInPanesSerializable="-1">
                    </AxisX>
                    <AxisY VisibleInPanesSerializable="-1">
                    </AxisY>
                </dx:XYDiagram>
            </DiagramSerializable>
            <SeriesSerializable>
                <dx:Series Name="Serie1">
                    <ViewSerializable>
                        <dx:LineSeriesView>
                        </dx:LineSeriesView>
                    </ViewSerializable>
                </dx:Series>
            </SeriesSerializable>
            <SeriesTemplate ArgumentDataMember="MES" SeriesDataMember="Familia" ValueDataMembersSerializable="Factor">
            </SeriesTemplate>
        </dx:WebChartControl>
    </td>
           </tr>
       </table>
<div style="clear:both">
</div>
            <div style="clear:both">
      <p style="font-size:large">  Tiempo Bajada Pedido</p>
    </div>
    <div>
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Año"></dx:ASPxLabel>
                </td>
                <td>
    <dx:ASPxComboBox ID="cbo_añobajadapedido" runat="server" SelectedIndex="2">
        <Items>
            <dx:ListEditItem Text="2022" Value="2022" />
            <dx:ListEditItem Text="2023" Value="2023" />
            <dx:ListEditItem Text="2024" Value="2024" Selected="True" />
            <dx:ListEditItem Text="2025" Value="2025" />
            <dx:ListEditItem Text="2026" Value="2026" />
            <dx:ListEditItem Text="2027" Value="2027" />
        </Items>
    </dx:ASPxComboBox>
                </td>
                <td>
    <dx:ASPxButton ID="btn_refrescartiempopedido" runat="server" Text="REFRESCAR" OnClick="btn_refrescartiempopedido_Click"></dx:ASPxButton>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
<td>
    &nbsp;</td>
</div>
   <table>
       <tr>
           <td>
        <dx:ASPxGridView ID="Gv_TiempoBajadaPedido" runat="server" AutoGenerateColumns="False" DataSourceID="LqDsTiempoBajadaPedido">
                            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
<SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
                            <SettingsPager PageSize="20">
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
                <dx:GridViewDataTextColumn FieldName="Mes" VisibleIndex="0" ReadOnly="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Año" VisibleIndex="1" ReadOnly="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PromedioMinutos" VisibleIndex="2" ReadOnly="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PromedioPorPallet" VisibleIndex="3" ReadOnly="True">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsTiempoBajadaPedido" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" TableName="CVT_TIEMPOBAJADAPEDIDO" GroupBy="Mes" Select="new (key as Mes, it as CVT_TIEMPOBAJADAPEDIDO, Min(Año) as Año, Average(TiempoMinutos) as PromedioMinutos, Average(TiempoPorPallet) as PromedioPorPallet)" Where="Año == @Año">
            <WhereParameters>
                <asp:ControlParameter ControlID="cbo_añobajadapedido" Name="Año" PropertyName="Value" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </td>
           <td>
               <dx:WebChartControl ID="Graf_TiempoPedido" runat="server" CrosshairEnabled="True" DataSourceID="LqDsTiempoBajadaPedido" Height="200px" Width="1000px" SeriesDataMember="Año">
                   <DiagramSerializable>
                       <dx:XYDiagram>
                           <AxisX VisibleInPanesSerializable="-1">
                           </AxisX>
                           <AxisY VisibleInPanesSerializable="-1">
                           </AxisY>
                       </dx:XYDiagram>
                   </DiagramSerializable>
                   <SeriesSerializable>
                       <dx:Series Name="Serie1">
                           <ViewSerializable>
                               <dx:LineSeriesView>
                               </dx:LineSeriesView>
                           </ViewSerializable>
                       </dx:Series>
                   </SeriesSerializable>
                   <SeriesTemplate ArgumentDataMember="Mes" SeriesDataMember="Año" ValueDataMembersSerializable="PromedioMinutos">
                       <ViewSerializable>
                           <dx:LineSeriesView>
                           </dx:LineSeriesView>
                       </ViewSerializable>
                   </SeriesTemplate>
               </dx:WebChartControl>
    </td>
           </tr>
       </table>
<div style="clear:both">
</div>
</asp:Content>
