<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SMMAcuerdo_Comercial.aspx.cs" Inherits="CVT_MermasRecepcion.MayoristaOP.SMMAcuerdo_Comercial" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>WMS</a></li>
            <li><span id="current">SMM Acuerdo Comercial</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">SMM Acuerdo Comercial</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="lqsAcuerdoComercial" KeyFieldName="Id_AcuerdoComercial" OnRowCommand="GvDatos_RowCommand" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsPager PageSize="100">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings AutoFilterCondition="Contains" ShowFilterRow="True" />
            <SettingsBehavior ConfirmDelete="True" />
            <Toolbars>
                <dx:GridViewToolbar  Position="Top">
                    <Items>
                        <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif">
                            <Image Url="../Images/pn-add-source-copy.gif"></Image>
                        </dx:GridViewToolbarItem>
                        <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXls" />
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                <dx:GridViewToolbarItem Command="ExportToCsv" />
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
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="Folio" FieldName="Id_AcuerdoComercial" ReadOnly="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="ListaDePrecio" VisibleIndex="3">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="CompraSemanal" VisibleIndex="4">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Detalle " VisibleIndex="10">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/menu.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataComboBoxColumn Caption="Proveedor" FieldName="Cod_Proveedor" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="LqsProveedor" ValueField="CardCode">
                        <Columns>
                            <dx:ListBoxColumn Caption="Codigo Proveedor" FieldName="CardCode">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="NombreProveedor" FieldName="CardName" Width="350px">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Tipo_Acuerdo" VisibleIndex="9">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Desc.Proveedor" Value="1" />
                            <dx:ListEditItem Text="Desc.Producto" Value="2" />
                            <dx:ListEditItem Text="Mixto" Value="3" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="Desc.Proveedor" FieldName="Descuesto_Proveedor" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="lqsAcuerdoComercial" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Acuerdo_Comercial" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsProveedor" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTMMETRODataContext" EntityTypeName="" Select="new (CardCode, CardName)" TableName="MMetro_OCRD" Where="CardType == @CardType">
            <WhereParameters>
                <asp:Parameter DefaultValue="S" Name="CardType" Type="Char" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
</asp:Content>
