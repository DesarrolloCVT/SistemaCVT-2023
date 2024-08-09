<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="SMMDiferenciaInventario.aspx.cs" Inherits="CVT_MermasRecepcion.Mayorista.SMMDiferenciaInventario" %>

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
    <div style="margin-left: 100px">
        <dx:ASPxLabel ID="ASPxLabel6" runat="server" Font-Bold="True" Font-Size="Large"
            Text="Duplicados">
        </dx:ASPxLabel>
    </div>
    <div>
        <dx:ASPxGridView ID="GvDuplicados" runat="server" AutoGenerateColumns="False" DataSourceID="LqDsDuplicados" OnToolbarItemClick="GvDuplicados_ToolbarItemClick">
            <SettingsPager PageSize="50">
            </SettingsPager>
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
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
                <dx:GridViewDataTextColumn FieldName="Inventario_Id" VisibleIndex="0" Caption="Folio Inv">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NPallet" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="InventarioDet_Id" VisibleIndex="4" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodProducto" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaRegistro"
                    VisibleIndex="6">
                    <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy HH:mm:ss">
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="TipoEmpaque" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NombreUsuario" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsDuplicados" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName=""
            TableName="VW_SMM_DiferenciasDuplicados_inventario" OrderBy="Inventario_Id desc, NPallet">
        </asp:LinqDataSource>
    </div>
    <br />
    <br />
    <div style="margin-left: 100px">
        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Bold="True" Font-Size="Large"
            Text="Diferencias por Cantidad">
        </dx:ASPxLabel>
    </div>
    <div>

            <dx:ASPxGridView ID="GvCantidad" runat="server" AutoGenerateColumns="False" DataSourceID="LqDsCantidad" OnToolbarItemClick="GvCantidad_ToolbarItemClick">
                <SettingsPager PageSize="100">
                </SettingsPager>
                <Settings ShowFilterRow="True" />
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
                                    <dx:ASPxButtonEdit ID="tbToolbarSearch0" runat="server" NullText="Search..." Height="100%">
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
                    <dx:GridViewDataTextColumn FieldName="Inventario_Id" VisibleIndex="0" Caption="Folio Inv">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Package_SSCC" VisibleIndex="1" Caption="NPallet">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CantInvent" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CantSistema" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CodUbicacionInv" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BodegaInv" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="codUbicacionSist" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BodegaSist" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="TipoEmpaqueInv" VisibleIndex="8">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="TipoEmpSist" VisibleIndex="9">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CodProdInv" VisibleIndex="11">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CodProdSist" VisibleIndex="12">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CodBarInv" VisibleIndex="13">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CodBarSist" VisibleIndex="14">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="Fecha" VisibleIndex="15">
                        <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy HH:mm:ss">
                        </PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="CodProducto" VisibleIndex="16" Visible="False">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ItemName" VisibleIndex="10">
                    </dx:GridViewDataTextColumn>
                </Columns>
                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

                <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            </dx:ASPxGridView>
            <asp:LinqDataSource ID="LqDsCantidad" runat="server"
                ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName=""
                TableName="VW_SMM_InventarioCantidadDiferenteInf" OrderBy="Inventario_Id desc">
            </asp:LinqDataSource>

    </div>
</asp:Content>
