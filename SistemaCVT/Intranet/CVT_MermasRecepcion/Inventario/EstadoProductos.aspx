<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="EstadoProductos.aspx.cs" Inherits="CVT_MermasRecepcion.Inventario.EstadoProductos" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Inventario</a></li>
            <li><span id="current">Estado Producto</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Estado Productos</span>
        <span class="tab-end"></span>
        <%--     <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" />
                Exportar Excel</a>
            <a>
                <asp:ImageButton ID="cmdNew" runat="server"
                    ImageUrl="~/Images/add.png" OnClick="cmdNew_Click"
                    Style="height: 16px;" />Nuevo</a>
        </div>--%>
    </div>
    <br />
    <div>
        <table>
            <tr>
                <td>&nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;
                </td>
                <td>
                    <label>Folio </label>
                    &nbsp;
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbo_folio" runat="server" ValueType="System.Int32" DataSourceID="LqsFolio" TextField="Inventario_Id" ValueField="Inventario_Id"></dx:ASPxComboBox>
                    <asp:LinqDataSource ID="LqsFolio" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_CabeceraInventario">
                    </asp:LinqDataSource>
                </td>
                <td>
                    <dx:ASPxButton ID="btn_buscar" runat="server" Text="Buscar" OnClick="btn_buscar_Click"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>

        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqDsEstado" KeyFieldName="InventarioEstado_Id"
            EnableViewState="False"
            OnRowCommand="GvDatos_RowCommand" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsPager PageSize="25">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            <SettingsDataSecurity AllowDelete="False" />
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
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True"
                    VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Inventario_Id" ReadOnly="True"
                    VisibleIndex="2" Caption="Folio">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="InventarioEstado_Id"
                    VisibleIndex="1" Caption="ID">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CantInventariada" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CantWMS" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CantSAP" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Estado" VisibleIndex="4">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Pendiente" Value="1" />
                            <dx:ListEditItem Text="En Curso" Value="2" />
                            <dx:ListEditItem Text="Cerrado" Value="3" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="CodProducto" ReadOnly="True"
                    VisibleIndex="3" Caption="Cod Producto">
                    <PropertiesComboBox DataSourceID="LqDsProducto"
                        ValueField="ArticleProvider_CodClient">
                        <Columns>
                            <dx:ListBoxColumn Caption="Codigo" FieldName="ArticleProvider_CodClient">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Producto" FieldName="ArticleProvider_Description">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Supervisor" VisibleIndex="5">
                    <PropertiesComboBox DataSourceID="LqDsUsuarios" TextField="NombreUsuario"
                        ValueField="UsuarioSistema">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Contador" VisibleIndex="6">
                    <PropertiesComboBox DataSourceID="LqDsUsuarios" TextField="NombreUsuario"
                        ValueField="UsuarioSistema">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Detalle" VisibleIndex="10">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/boxadd.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsEstado" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext"
            EnableInsert="True" EnableUpdate="True" EntityTypeName=""
            TableName="CVT_InventarioEstadoProducto"
            EnableDelete="True" Where="Inventario_Id == @Inventario_Id">
            <WhereParameters>
                <asp:ControlParameter ControlID="cbo_folio" DefaultValue="0" Name="Inventario_Id" PropertyName="Value" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqDsProducto" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
            Select="new (ArticleProvider_CodClient, ArticleProvider_Description)"
            TableName="ArticleProvider">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqDsUsuarios" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
            Select="new (UsuarioSistema, NombreUsuario)" TableName="CVT_Usuarios">
        </asp:LinqDataSource>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
        </dx:ASPxGridViewExporter>

    </div>
</asp:Content>


