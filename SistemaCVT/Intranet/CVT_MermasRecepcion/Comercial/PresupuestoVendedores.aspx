<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PresupuestoVendedores.aspx.cs" Inherits="CVT_MermasRecepcion.Comercial.PresupuestoVendedores" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <dx:ASPxGridView ID="GVPresupuestoEnc" runat="server" AutoGenerateColumns="False" DataSourceID="LqDsPresupuesto" KeyFieldName="Presupuesto_Id" OnRowCommand="GVPresupuestoEnc_RowCommand">
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
                                <SettingsEditing Mode="PopupEditForm">
                        </SettingsEditing>
                        <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
                        <SettingsBehavior AllowFocusedRow="True" />
                        <Toolbars>
                            <dx:GridViewToolbar >
                                <Items>
                                    <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif" >
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
        <Columns>
            <dx:GridViewDataTextColumn Caption="Folio" FieldName="Presupuesto_Id" ReadOnly="True" VisibleIndex="0">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Año" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn FieldName="Vendedor" VisibleIndex="2">
                <PropertiesComboBox DataSourceID="LqDsVendedor" TextField="SlpName" ValueField="SlpCode">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataHyperLinkColumn Caption="Detalle" VisibleIndex="51">
                <EditFormSettings Visible="False" />
                <DataItemTemplate>
                    <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/boxadd.png" />
                </DataItemTemplate>
            </dx:GridViewDataHyperLinkColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:LinqDataSource ID="LqDsPresupuesto" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_PresupuestoVendedor"></asp:LinqDataSource>
    <asp:LinqDataSource ID="LqDsVendedor" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" Select="new (SlpCode, SlpName)" TableName="OSLP" Where="Active == @Active &amp;&amp; GroupCode == @GroupCode">
        <WhereParameters>
            <asp:Parameter DefaultValue="Y" Name="Active" Type="Char" />
            <asp:Parameter DefaultValue="1" Name="GroupCode" Type="Int16" />
        </WhereParameters>
    </asp:LinqDataSource>
</asp:Content>
