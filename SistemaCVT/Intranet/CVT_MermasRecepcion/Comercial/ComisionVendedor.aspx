<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ComisionVendedor.aspx.cs" Inherits="CVT_MermasRecepcion.Comercial.ComisionVendedor" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Comercial</a></li>
            <li><span id="current">Comision Vendedor</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Comision Vendedor</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <br />
    <div>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDatosComision" KeyFieldName="ItemCode" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <ClientSideEvents ToolbarItemClick="function(s, e) {if (e.item.name == &quot;Nuevo&quot;) e.processOnServer = true; e.usePostBack=true;}" />
            <Settings AutoFilterCondition="Contains" />
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
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Comision" VisibleIndex="5">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="ItemCode" VisibleIndex="1" Caption="Producto">
                    <PropertiesComboBox DataSourceID="LinqDataSource2" ValueField="ItemCode">
                        <Columns>
                            <dx:ListBoxColumn Caption="CodProducto" FieldName="ItemCode">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Producto" FieldName="ItemName">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Familia" FieldName="ItemCode" ReadOnly="True" ShowInCustomizationForm="False" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="Familia" TextField="ItmsGrpNam" ValueField="ItemCode">
                    </PropertiesComboBox>
                    <Settings AutoFilterCondition="Contains" AllowAutoFilter="False" AllowAutoFilterTextInputTimer="False" ShowInFilterControl="False" />
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="TipoComision" VisibleIndex="4">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="MA" Value="MA" />
                            <dx:ListEditItem Text="MB" Value="MB" />
                            <dx:ListEditItem Text="MM" Value="MM" />
                            <dx:ListEditItem Text="NN" Value="NN" />
                            <dx:ListEditItem Text="ME" Value="ME" />
                        </Items>
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataComboBoxColumn>
            </Columns>
            <Toolbars>
                <dx:GridViewToolbar>
                    <Items>
                        <dx:GridViewToolbarItem Command="Custom" Name="Nuevo" Text="Nuevo" Image-Url="../../Images/pn-add-source-copy.gif">
                            <Image Url="../../Images/pn-add-source-copy.gif"></Image>
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
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDatosComision" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_ComisionVendedor">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" TableName="OSLP" Where="GroupCode == @GroupCode &amp;&amp; Active == @Active">
            <WhereParameters>
                <asp:Parameter DefaultValue="1" Name="GroupCode" Type="Int16" />
                <asp:Parameter DefaultValue="Y" Name="Active" Type="Char" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LinqDataSource2" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" TableName="OITM">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="Familia" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="VW_FAMILIA_PROD">
        </asp:LinqDataSource>
    </div>
    <dx:ASPxPopupControl ID="popNuevo" runat="server" AllowDragging="True" CloseAction="CloseButton" HeaderText="Nuevo" Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle" Width="500px">
        <ContentCollection>
            <dx:PopupControlContentControl>
                <br />
                <div>
                    <div>
                        <dx:ASPxComboBox ID="cboProducto" runat="server" ValueType="System.String" Height="30px" Theme="iOS" Width="453px" DataSourceID="LqsProducto" ValueField="ItemCode">
                            <Columns>
                                <dx:ListBoxColumn Caption="Cod Producto" FieldName="ItemCode" Width="150px">
                                </dx:ListBoxColumn>
                                <dx:ListBoxColumn Caption="Producto" FieldName="ItemName" Width="350px">
                                </dx:ListBoxColumn>
                            </Columns>
                        </dx:ASPxComboBox>
                        <asp:LinqDataSource ID="LqsProducto" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" TableName="OITM" Where="validFor == @validFor">
                            <WhereParameters>
                                <asp:Parameter DefaultValue="Y" Name="validFor" Type="Char" />
                            </WhereParameters>
                        </asp:LinqDataSource>
                    </div>
                    <br />
                    <div>
                        <dx:ASPxButton ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" Theme="iOS" ValidationGroup="a1" Height="36px" Width="128px"></dx:ASPxButton>
                    </div>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
</asp:Content>
