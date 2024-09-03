<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="DetalleInventario.aspx.cs" Inherits="CVT_MermasRecepcion.Inventario.DetalleInventario" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>INVENTARIO</a></li>
            <li><a href="../Inventario/Inventario.aspx">Inventario</a></li>
            <li><span id="current">Detalle Inventario</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Detalle Inventario</span>
        <span class="tab-end"></span>
        <div id="options">
            <%--<dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif" />--%>            <%--<dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif" />--%>
        </div>
    </div>
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqDsInventario" KeyFieldName="InventarioDet_Id" OnToolbarItemClick="GvDatos_ToolbarItemClick" OnRowDeleting="GvDatos_RowDeleting" OnRowUpdated="GvDatos_RowUpdated">
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            <Toolbars>
                <dx:GridViewToolbar >
                    <Items>
                        <%--<dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif" />--%>
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
                <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowEditButton="True"
                    VisibleIndex="0" ShowDeleteButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="InventarioDet_Id" ReadOnly="True"
                    VisibleIndex="1" Caption="ID Detalle">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Inventario_Id" VisibleIndex="2" Caption="ID Inventario">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NPallet" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodProducto" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Ubicacion" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FProduccion" VisibleIndex="9">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="FVencimiento" VisibleIndex="10">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Lote" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Usuario" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaRegistro" VisibleIndex="13">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataComboBoxColumn Caption="Producto" FieldName="CodProducto" ReadOnly="True" VisibleIndex="5">
                    <PropertiesComboBox DataSourceID="LqOITM" TextField="ItemName" ValueField="ItemCode">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Bodega" FieldName="Ubicacion" ReadOnly="True" VisibleIndex="8">
                    <PropertiesComboBox DataSourceID="LqBodegaUbicacion" TextField="Site_ShortDescription" ValueField="Layout_Id">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="UbicacionAnterior" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cantidad Sistema" FieldName="CantidadPallet" VisibleIndex="15">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsInventario" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext"
            EnableUpdate="True" EntityTypeName="" TableName="CVT_DetalleInventario"
            EnableDelete="True" Where="Inventario_Id == @Inventario_Id">
            <WhereParameters>
                <asp:SessionParameter Name="Inventario_Id" SessionField="Inventario_Id" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqOITM" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" Select="new (ItemCode, ItemName)" TableName="OITM">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqBodegaUbicacion" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" TableName="CVT_VW_BodegaUbicacion">
        </asp:LinqDataSource>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server"
            GridViewID="GvDatos">
        </dx:ASPxGridViewExporter>

    </div>
</asp:Content>
