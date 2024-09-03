<%@ Page Title="Intranet - Proveedores Nacionales" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ProveedoresNacionales.aspx.cs" Inherits="CVT_MermasRecepcion.Porteria.ProveedoresNacionales" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
     <div id="breadcrumbs">
     <ul>
         <li><a href="../Blank2.aspx">Inicio</a></li>
         <li><a>Porteria</a></li>
         <li><span id="current">Proveedores Nacionales</span></li>
     </ul>
 </div>

 <div id="tableHeader">
     <span class="tableTitle">Proveedores Nacionales</span>
     <span class="tab-end"></span>
 </div>
<div>
    <dx:ASPxGridView ID="GvProveedoresNacionales" runat="server" AutoGenerateColumns="False" DataSourceID="LqDsCAProveedoresNacionales" KeyFieldName="CA_PN_ID" OnHtmlRowCreated="GvProveedoresNacionales_HtmlRowCreated" OnRowCommand="GvProveedoresNacionales_RowCommand" OnRowInserting="GvProveedoresNacionales_RowInserting">
<SettingsPager PageSize="50">
</SettingsPager>
<SettingsEditing Mode="PopupEditForm">
</SettingsEditing>
<Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
<SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
<Toolbars>
    <dx:GridViewToolbar Position="Top">
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
            <dx:GridViewDataTextColumn Caption="Folio" FieldName="CA_PN_ID" ReadOnly="True" VisibleIndex="0">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="NumeroDocumento" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="FechaIngreso" VisibleIndex="6">
                <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy hh:mm tt">
                </PropertiesDateEdit>
                <EditFormSettings Visible="False" />
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataDateColumn FieldName="FechaSalida" VisibleIndex="7">
                <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy hh:mm tt">
                </PropertiesDateEdit>
                <EditFormSettings Visible="False" />
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Comentario" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Usuario" VisibleIndex="9">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn Caption="Proveedor" FieldName="CardCode" VisibleIndex="1">
                <PropertiesComboBox DataSourceID="LqDsProvNac" TextField="CardName" ValueField="CardCode">
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="OC" VisibleIndex="2">
                <PropertiesComboBox DataSourceID="LqDsOCAbiertas" ValueField="DocNum">
                    <Columns>
                        <dx:ListBoxColumn FieldName="Empresa">
                        </dx:ListBoxColumn>
                        <dx:ListBoxColumn Caption="Proveedor" FieldName="CardName" Width="200px">
                        </dx:ListBoxColumn>
                        <dx:ListBoxColumn Caption="OC" FieldName="DocNum">
                        </dx:ListBoxColumn>
                        <dx:ListBoxColumn Caption="Responsable" FieldName="SlpName" Width="200px">
                        </dx:ListBoxColumn>
                    </Columns>
                </PropertiesComboBox>
                <EditFormSettings ColumnSpan="4" />
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="Empresa" VisibleIndex="3">
                <PropertiesComboBox>
                    <Items>
                        <dx:ListEditItem Text="CV Trading" Value="CV Trading" />
                        <dx:ListEditItem Text="Santiago Trading" Value="Santiago Trading" />
                        <dx:ListEditItem Text="BMas" Value="BMas" />
                        <dx:ListEditItem Text="La Marina" Value="La Marina" />
                        <dx:ListEditItem Text="T Pia" Value="T Pia" />
                    </Items>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="TipoDocumento" VisibleIndex="4">
                <PropertiesComboBox>
                    <Items>
                        <dx:ListEditItem Text="Factura" Value="Factura" />
                        <dx:ListEditItem Text="Guia Despacho" Value="Guia Despacho" />
                    </Items>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataHyperLinkColumn Caption="Salida" VisibleIndex="14">
                <EditFormSettings Visible="False" />
                <DataItemTemplate>
                    <asp:ImageButton ID="Salida" CommandName="cmdSalida" runat="server"
                    ImageUrl="~/Images/confirm.png"  />
                </DataItemTemplate>
            </dx:GridViewDataHyperLinkColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:LinqDataSource ID="LqDsCAProveedoresNacionales" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" OrderBy="CA_PN_ID desc" TableName="CVT_CA_ProveedoresNacionales" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="LqDsProvNac" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" Select="new (CardCode, CardName)" TableName="OCRD" Where="GroupCode == @GroupCode &amp;&amp; validFor == @validFor">
        <WhereParameters>
            <asp:Parameter DefaultValue="106" Name="GroupCode" Type="Int16" />
            <asp:Parameter DefaultValue="Y" Name="validFor" Type="Char" />
        </WhereParameters>
    </asp:LinqDataSource>
    <asp:LinqDataSource ID="LqDsOCAbiertas" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_OCAbiertas_EERR">
    </asp:LinqDataSource>
</div>
</asp:Content>
