<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MaestroArticulos.aspx.cs" Inherits="CVT_MermasRecepcion.Mantencion.MaestroArticulos" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Mantencion</a></li>
            <li><span id="current">Articulos</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Articulos</span>
        <span class="tab-end"></span>
        <%--  <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" style="width: 20px" />
                Exportar Excel</a>
            <a>
                <asp:ImageButton ID="cmdNew" runat="server"
                    ImageUrl="~/Images/add.png" OnClick="cmdNew_Click"
                    Style="width: 16px; height: 16px;" />Nuevo</a>
        </div>--%>
    </div>
    <div>

        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqDsArticulos" KeyFieldName="Articulo_Id"
            EnableViewState="False" OnRowInserting="GvDatos_RowInserting" OnToolbarItemClick="GvDatos_ToolbarItemClick">
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
                <dx:GridViewDataTextColumn FieldName="Articulo_Id" ReadOnly="True"
                    Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Articulo_Codigo" VisibleIndex="2"
                    Caption="Codigo">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Nombre" FieldName="Articulo_Nombre"
                    VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Ubicacion" FieldName="Ariticulo_Ubicacion"
                    VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Stock" FieldName="Articulo_Stock"
                    VisibleIndex="6">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Stock Minimo" FieldName="Articulo_StockMin"
                    VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Proveedor" FieldName="Articulo_Proveedor"
                    VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Tipo_Articulo" Visible="False"
                    VisibleIndex="8">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsArticulos" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext"
            EnableInsert="True" EnableUpdate="True" EntityTypeName=""
            TableName="CVT_Articulo"
            OrderBy="Articulo_Codigo" Where="Tipo_Articulo == @Tipo_Articulo">
            <WhereParameters>
                <asp:Parameter DefaultValue="M" Name="Tipo_Articulo" Type="String" />
            </WhereParameters>
        </asp:LinqDataSource>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
        </dx:ASPxGridViewExporter>

    </div>
</asp:Content>

