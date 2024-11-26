<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PedidoAsignacion.aspx.cs" Inherits="CVT_MermasRecepcion.WMS.PedidoAsignacion" %>
<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
        <div id="breadcrumbs">
        <ul>
         <li><a href="../Blank.aspx">Inicio</a></li>
         <li><a>WMS</a></li>
            <li><span id="current">Asignacion de Producto - Lote </span></li>
        </ul>
    </div>
    <div>
        <dx:ASPxGridView ID="GvPedidoAsignacion" runat="server" AutoGenerateColumns="False" DataSourceID="LqDsAsignacion" KeyFieldName="Order_ID" OnRowInserting="GvOrderAsignacion_RowInserting">
<SettingsEditing Mode="PopupEditForm">
</SettingsEditing>
<Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
<SettingsBehavior AllowFocusedRow="True" />
<Toolbars>
    <dx:GridViewToolbar>
        <Items>
            <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif">
                <Image Url="../Images/pn-add-source-copy.gif"></Image>
            </dx:GridViewToolbarItem>
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

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Order_ID" Visible="False" VisibleIndex="1" ReadOnly="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Lote" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Producto" FieldName="Itemcode" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="LqDsProducto" ValueField="ItemCode">
                        <Columns>
                            <dx:ListBoxColumn Caption="Codigo" FieldName="ItemCode">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Producto" FieldName="ItemName">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsAsignacion" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_OrderAsignacion" Where="Order_ID == @Order_ID">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="Order_ID" SessionField="OrderID" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqDsProducto" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" Select="new (ItemCode, ItemName)" TableName="OITM" Where="validFor == @validFor">
            <WhereParameters>
                <asp:Parameter DefaultValue="Y" Name="validFor" Type="Char" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
</asp:Content>
