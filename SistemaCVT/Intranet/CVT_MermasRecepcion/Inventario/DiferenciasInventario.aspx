<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DiferenciasInventario.aspx.cs" Inherits="CVT_MermasRecepcion.Inventario.DiferenciasInventario" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>INVENTARIO</a></li>
            <li><span id="current">Diferencias Inventario</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Diferencias Inventario</span>
        <span class="tab-end"></span>

    </div>
    <br />
    <br />
    <div>
        <dx:ASPxLabel ID="ASPxLabel6" runat="server" Font-Bold="True" Font-Size="Large"
            Text="Duplicados">
        </dx:ASPxLabel>
        <br />
        <div>
            <dx:ASPxGridView ID="GvDuplicados" runat="server" AutoGenerateColumns="False" DataSourceID="LqDsDuplicados" OnToolbarItemClick="GvDuplicados_ToolbarItemClick" EnableViewState="False">
                <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
                <Toolbars>
                    <dx:GridViewToolbar>
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
                    <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="InventarioDet_Id" VisibleIndex="1" Visible="False">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Inventario_Id" VisibleIndex="2" Caption="Folio">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="NPallet" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CodProducto" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Ubicacion" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="FProduccion" Visible="False"
                        VisibleIndex="7">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataDateColumn FieldName="FVencimiento" Visible="False"
                        VisibleIndex="8">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="Lote" VisibleIndex="9">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Usuario" VisibleIndex="10">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="FechaRegistro" VisibleIndex="11">
                    </dx:GridViewDataDateColumn>
                </Columns>
                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />

                <SettingsPopup>
                    <FilterControl AutoUpdatePosition="False"></FilterControl>
                </SettingsPopup>

                <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            </dx:ASPxGridView>
            <asp:LinqDataSource ID="LqDsDuplicados" runat="server"
                ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
                TableName="CVT_VW_DiferenciasDuplicados">
            </asp:LinqDataSource>
            <dx:ASPxGridViewExporter runat="server" GridViewID="GvDuplicados" ExportedRowType="All" ID="ASPxGridViewExporter1">
            </dx:ASPxGridViewExporter>
        </div>
        <br />
      
        <br />
        <div>
            <dx:ASPxLabel ID="ASPxLabel2" runat="server" Font-Bold="True" Font-Size="Large"
                Text="Diferencias Producto">
            </dx:ASPxLabel>
        </div>
        <div>
            <dx:ASPxGridView ID="GvProducto" runat="server" AutoGenerateColumns="False" KeyFieldName="NPallet"
                OnRowCommand="GvProducto_RowCommand" DataSourceID="LqDsProducto" OnToolbarItemClick="GvProducto_ToolbarItemClick">
                <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
                <Toolbars>
                    <dx:GridViewToolbar>
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
                    <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="Inventario_Id" VisibleIndex="1" Caption="Folio">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Usuario" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BodegaPistoleo" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="UbicacionPistoleo" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="RackPistoleo" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BodegaSistema" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="UbicacionSistema" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="RackSistema" VisibleIndex="8">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="NPallet" VisibleIndex="9">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Estado" VisibleIndex="10">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CodProducto" VisibleIndex="11">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Producto" VisibleIndex="12">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CodProductoSistema" VisibleIndex="13">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ProductoSistema" VisibleIndex="14">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Lote" VisibleIndex="15">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="LoteSistema" VisibleIndex="16">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="17">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CantidadSistema" VisibleIndex="18">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="FechaRegistro" VisibleIndex="19">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataHyperLinkColumn Caption="C. WMS" VisibleIndex="20">
                        <EditFormSettings Visible="False" />
                        <DataItemTemplate>
                            <asp:ImageButton ID="Corregir" CommandName="cmdCorregir" runat="server" ImageUrl="~/Images/check-box.png" />
                        </DataItemTemplate>
                    </dx:GridViewDataHyperLinkColumn>
                </Columns>
                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
                <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            </dx:ASPxGridView>
            <asp:LinqDataSource ID="LqDsProducto" runat="server"
                ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
                TableName="CVT_VW_InventarioProductoDiferente">
            </asp:LinqDataSource>
            <dx:ASPxGridViewExporter runat="server" GridViewID="GvProducto" ExportedRowType="All" ID="ASPxGridViewExporter3">
            </dx:ASPxGridViewExporter>
        </div>
        <br />
        <br />
        <div>
            <dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Bold="True" Font-Size="Large"
                Text="Diferencias Lote">
            </dx:ASPxLabel>
        </div>
        <div>
            <dx:ASPxGridView ID="GvLote" runat="server" AutoGenerateColumns="False"
                OnRowCommand="GvLote_RowCommand" DataSourceID="LqDsLote" OnToolbarItemClick="GvLote_ToolbarItemClick">
                <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
                <Toolbars>
                    <dx:GridViewToolbar>
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
                    <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="Inventario_Id" VisibleIndex="1" Caption="Folio">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Usuario" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BodegaPistoleo" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="UbicacionPistoleo" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="RackPistoleo" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BodegaSistema" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="UbicacionSistema" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="RackSistema" VisibleIndex="8">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="NPallet" VisibleIndex="9">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Estado" VisibleIndex="10">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CodProducto" VisibleIndex="11">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Producto" VisibleIndex="12">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CodProductoSistema" VisibleIndex="13">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ProductoSistema" VisibleIndex="14">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Lote" VisibleIndex="15">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="LoteSistema" VisibleIndex="16">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="17">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CantidadSistema" VisibleIndex="18">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="FechaRegistro" VisibleIndex="19">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataHyperLinkColumn Caption="C. WMS" VisibleIndex="20">
                        <EditFormSettings Visible="False" />
                        <DataItemTemplate>
                            <asp:ImageButton ID="Corregir" CommandName="cmdCorregir" runat="server" ImageUrl="~/Images/check-box.png" />
                        </DataItemTemplate>
                    </dx:GridViewDataHyperLinkColumn>
                </Columns>
                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />

                <SettingsPopup>
                    <FilterControl AutoUpdatePosition="False"></FilterControl>
                </SettingsPopup>

                <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            </dx:ASPxGridView>
            <asp:LinqDataSource ID="LqDsLote" runat="server"
                ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
                TableName="CVT_VW_InventarioLoteDiferente">
            </asp:LinqDataSource>
            <dx:ASPxGridViewExporter runat="server" GridViewID="GvLote" ExportedRowType="All" ID="ASPxGridViewExporter4">
            </dx:ASPxGridViewExporter>
        </div>
        <br />
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel7" runat="server" Font-Bold="True" Font-Size="Large"
                        Text="Diferencias Bodegas">
                    </dx:ASPxLabel>
                </td>
            </tr>
        </table>
        <div>
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="LqDsBodega" KeyFieldName="NPallet" OnToolbarItemClick="ASPxGridView1_ToolbarItemClick">
                <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
                <Toolbars>
                    <dx:GridViewToolbar>
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
                    <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="Inventario_Id" VisibleIndex="1" Caption="Folio">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Usuario" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BodegaPistoleo" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="UbicacionPistoleo" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="RackPistoleo" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BodegaSistema" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="UbicacionSistema" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="RackSistema" VisibleIndex="8">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="NPallet" VisibleIndex="9">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Estado" VisibleIndex="10">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CodProducto" VisibleIndex="11">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Producto" VisibleIndex="12">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CodProductoSistema" VisibleIndex="13">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ProductoSistema" VisibleIndex="14">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Lote" VisibleIndex="15">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="LoteSistema" VisibleIndex="16">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="17">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CantidadSistema" VisibleIndex="18">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="FechaRegistro" VisibleIndex="19">
                    </dx:GridViewDataDateColumn>
                </Columns>
                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
                <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            </dx:ASPxGridView>
            <asp:LinqDataSource ID="LqDsBodega" runat="server"
                ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
                TableName="CVT_VW_InventarioSiteDiferente">
            </asp:LinqDataSource>
            <dx:ASPxGridViewExporter runat="server" GridViewID="ASPxGridView1" ExportedRowType="All" ID="ASPxGridViewExporter5">
            </dx:ASPxGridViewExporter>
        </div>
        <br />
        <br />
        <div>
            <dx:ASPxLabel ID="ASPxLabel5" runat="server" Font-Bold="True" Font-Size="Large"
                Text="Pallet Dados de Baja">
            </dx:ASPxLabel>
        </div>
        <div>
            <dx:ASPxGridView ID="GvDadosBaja" runat="server" AutoGenerateColumns="False" KeyFieldName="NPallet"
                OnRowCommand="GvDadosBaja_RowCommand" DataSourceID="LqDsDadosBaja" OnToolbarItemClick="GvDadosBaja_ToolbarItemClick">
                <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
                <Toolbars>
                    <dx:GridViewToolbar>
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
                    <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="Inventario_Id" VisibleIndex="1" Caption="Folio">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Usuario" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BodegaPistoleo" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="UbicacionPistoleo" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="RackPistoleo" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BodegaSistema" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="UbicacionSistema" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="RackSistema" VisibleIndex="8">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="NPallet" VisibleIndex="9">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Estado" VisibleIndex="10">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CodProducto" VisibleIndex="11">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Producto" VisibleIndex="12">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CodProductoSistema" VisibleIndex="13">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ProductoSistema" VisibleIndex="14">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Lote" VisibleIndex="15">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="LoteSistema" VisibleIndex="16">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="17">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CantidadSistema" VisibleIndex="18">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="FechaRegistro" VisibleIndex="19">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataHyperLinkColumn Caption="C. WMS" VisibleIndex="20">
                        <EditFormSettings Visible="False" />
                        <DataItemTemplate>
                            <asp:ImageButton ID="Corregir" CommandName="cmdCorregir" runat="server" ImageUrl="~/Images/check-box.png" />
                        </DataItemTemplate>
                    </dx:GridViewDataHyperLinkColumn>
                </Columns>
                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
                <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            </dx:ASPxGridView>
            <asp:LinqDataSource ID="LqDsDadosBaja" runat="server"
                ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
                TableName="CVT_VW_InventarioPalletInventariadosEstadoDespachado">
            </asp:LinqDataSource>
            <dx:ASPxGridViewExporter runat="server" GridViewID="GvDadosBaja" ExportedRowType="All" ID="ASPxGridViewExporter6">
            </dx:ASPxGridViewExporter>
        </div>
        <br />
        <br />
     <%--   <div>
            <dx:ASPxLabel ID="ASPxLabel4" runat="server" Font-Bold="True" Font-Size="Large"
                Text="Pallet no Inventariados">
            </dx:ASPxLabel>
        </div>
        <div>
            <dx:ASPxGridView ID="GvNoInventariados" runat="server"
                AutoGenerateColumns="False" DataSourceID="LqDsNoInventariados" OnRowCommand="GvNoInventariados_RowCommand" OnToolbarItemClick="GvNoInventariados_ToolbarItemClick">
                <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
                <Toolbars>
                    <dx:GridViewToolbar>
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
                    <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="Inventario_Id" VisibleIndex="1" Caption="Folio">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Usuario" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BodegaPistoleo" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="UbicacionPistoleo" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="RackPistoleo" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BodegaSistema" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="UbicacionSistema" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="RackSistema" VisibleIndex="8">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="NPallet" VisibleIndex="9">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Estado" VisibleIndex="10">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CodProducto" VisibleIndex="11">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Producto" VisibleIndex="12">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CodProductoSistema" VisibleIndex="13">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ProductoSistema" VisibleIndex="14">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Lote" VisibleIndex="15">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="LoteSistema" VisibleIndex="16">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="17">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CantidadSistema" VisibleIndex="18">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="FechaRegistro" VisibleIndex="19">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataHyperLinkColumn Caption="C. WMS" VisibleIndex="20">
                        <EditFormSettings Visible="False" />
                        <DataItemTemplate>
                            <asp:ImageButton ID="Corregir" CommandName="cmdCorregir" runat="server" ImageUrl="~/Images/check-box.png" />
                        </DataItemTemplate>
                    </dx:GridViewDataHyperLinkColumn>
                </Columns>
                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />

                <SettingsPopup>
                    <FilterControl AutoUpdatePosition="False"></FilterControl>
                </SettingsPopup>

                <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            </dx:ASPxGridView>
            <asp:LinqDataSource ID="LqDsNoInventariados" runat="server"
                ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
                TableName="CVT_VW_InventarioPalletVivosNoInventariados">
            </asp:LinqDataSource>
            <dx:ASPxGridViewExporter runat="server" GridViewID="GvNoInventariados" ExportedRowType="All" ID="ASPxGridViewExporter7">
            </dx:ASPxGridViewExporter>
        </div>--%>
        <br />

    </div>
</asp:Content>
