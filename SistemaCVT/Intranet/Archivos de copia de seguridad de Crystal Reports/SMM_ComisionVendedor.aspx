<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SMM_ComisionVendedor.aspx.cs" Inherits="CVT_MermasRecepcion.Comercial.SMM_ComisionVendedor" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Comercial</a></li>
            <li><span id="current">SMM Comision Vendedor </span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">SMM Comision Vendedor</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsComisionSMM" KeyFieldName="IdVendedor">
            <Settings ShowFilterRow="True" />
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            <SettingsBehavior AllowFocusedRow="True" />
            <SettingsPager PageSize="500">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings AutoFilterCondition="Contains" ShowFilterRow="True" />
            <SettingsBehavior ConfirmDelete="True" />

            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
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
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Comision" ShowInCustomizationForm="True" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Vendedor" FieldName="IdVendedor" ShowInCustomizationForm="True" VisibleIndex="1">
                    <PropertiesComboBox DataSourceID="Vendedor" TextField="SlpName" ValueField="SlpCode">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Categoria" FieldName="IdGrupoProd" ShowInCustomizationForm="True" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="Categoria" TextField="U_Categoria" ValueField="Code">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="SubCategoria" FieldName="IdSubFamilia" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="Categoria" TextField="U_SubCategoria" ValueField="U_CodSubCategoria">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsComisionSMM" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="SMM_ComisionVendedor">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="Vendedor" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTMMETRODataContext" EntityTypeName="" TableName="MMETRO_OSLP" Where="GroupCode == @GroupCode &amp;&amp; Active == @Active" Select="new (SlpCode, SlpName)">
            <WhereParameters>
                <asp:Parameter DefaultValue="1" Name="GroupCode" Type="Int16" />
                <asp:Parameter DefaultValue="Y" Name="Active" Type="Char" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="Categoria" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTMMETRODataContext" EntityTypeName="" TableName="_SCATEGORIA_PRODUCTO">
        </asp:LinqDataSource>
    </div>
</asp:Content>
