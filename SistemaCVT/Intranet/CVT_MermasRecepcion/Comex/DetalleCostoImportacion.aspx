<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="DetalleCostoImportacion.aspx.cs" Inherits="CVT_MermasRecepcion.Comex.DetalleCostoImportacion" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1 {
            width: 100%;
        }

        .auto-style1 {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>COMEX</a></li>
            <li><span id="current">Costos Importacion</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Detalle Costos Importacion</span>
        <span class="tab-end"></span>
        <div id="options">
            <%--           <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px" />
                Exportar Excel</a>--%>
            <%--           <a>
                <asp:ImageButton ID="cmdNew" runat="server"
                    ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>--%>
        </div>
    </div>
    <br />  
    <div>

        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqDsCostoImportacion" KeyFieldName="OC;Codigo_PrecioEntrega" OnToolbarItemClick="GvDatos_ToolbarItemClick" OnRowDeleting="GvDatos_RowDeleting" OnRowUpdating="GvDatos_RowUpdating">
            <ClientSideEvents ToolbarItemClick="function(s, e) {
	if (e.item.name == &quot;Nuevo&quot;) e.processOnServer = true; e.usePostBack=true;
 

}" />
            <SettingsPager PageSize="25">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            <SettingsBehavior ConfirmDelete="True" />
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
                <dx:GridViewCommandColumn ShowEditButton="True" ShowInCustomizationForm="True"
                    VisibleIndex="0" ShowDeleteButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="DetalleCostoImportacion_Id" VisibleIndex="1" Caption="ID"
                    ShowInCustomizationForm="True">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Valor" ShowInCustomizationForm="True"
                    VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Codigo_PrecioEntrega" ReadOnly="True"
                    ShowInCustomizationForm="True" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="LqDsPrecioEntrega" ValueField="AlcCode">
                        <Columns>
                            <dx:ListBoxColumn Caption="Cod" FieldName="AlcCode">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Nombre" FieldName="AlcName">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Imputacion"
                    ShowInCustomizationForm="True" VisibleIndex="4">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Cantidad" Value="Q" />
                            <dx:ListEditItem Text="Peso" Value="W" />
                            <dx:ListEditItem Text="Volumen" Value="V" />
                            <dx:ListEditItem Text="Valor monetario c/derechos importacion" Value="F" />
                            <dx:ListEditItem Text="Valor monetario s/derechos importacion" Value="C" />
                            <dx:ListEditItem Text="Igual a" Value="A" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Proveedor" FieldName="Proveedor"
                    VisibleIndex="6">
                    <PropertiesComboBox DataSourceID="Proveedor" ValueField="CardCode">
                        <Columns>
                            <dx:ListBoxColumn FieldName="CardCode">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn FieldName="CardName">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="OC" FieldName="OC" ReadOnly="True"
                    VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="LqDsOC0" TextField="DocNum"
                        ValueField="DocEntry">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="Observaciones" FieldName="Obs" VisibleIndex="7">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
            </Columns>
            <Settings ShowFooter="true" />
            <TotalSummary>
                <dx:ASPxSummaryItem FieldName="Valor" SummaryType="Sum" />
            </TotalSummary>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />

            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>

            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>



        <asp:LinqDataSource ID="LqDsCostoImportacion" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext"
            EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName=""
            TableName="CVT_DetalleCostosImportacion" OrderBy="OC desc">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqDsPrecioEntrega" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName=""
            TableName="OALC">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="Proveedor" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName=""
            Select="new (CardCode, CardName)" TableName="OCRD"
            Where="CardType == @CardType">
            <WhereParameters>
                <asp:Parameter DefaultValue="S" Name="CardType" Type="Char" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqDsOC0" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName=""
            TableName="OPOR">
        </asp:LinqDataSource>
        <dx:ASPxPopupControl ID="PopUpNuevo" runat="server" AllowDragging="True"
            CloseAction="CloseButton" DragElement="Window" HeaderText="Nuevo"
            Height="239px" PopupHorizontalAlign="WindowCenter"
            PopupVerticalAlign="WindowCenter" Width="596px">
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <table class="style1">
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="OC">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxComboBox ID="cb_oc" runat="server" AutoPostBack="True"
                                    DataSourceID="LqDsOC" OnSelectedIndexChanged="cb_oc_SelectedIndexChanged"
                                    TextField="DocNum" ValueField="DocEntry">
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                            </td>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Proveedor">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxLabel ID="lbl_proveedor" runat="server">
                                </dx:ASPxLabel>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Factura">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxLabel ID="lbl_factura" runat="server">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Cant Camiones">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxLabel ID="lbl_cantcamiones" runat="server">
                                </dx:ASPxLabel>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <dx:ASPxLabel ID="lbl_advertencia" runat="server" ForeColor="Red"
                                    Visible="False">
                                </dx:ASPxLabel>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <dx:ASPxGridView ID="GvProductos" runat="server" AutoGenerateColumns="False"
                                    DataSourceID="LqDsDetalleOC">
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Codigo" FieldName="ItemCode"
                                            ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Producto" FieldName="Dscription"
                                            ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Cantidad" FieldName="Quantity"
                                            ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:ASPxGridView>
                                <asp:LinqDataSource ID="LqDsDetalleOC" runat="server"
                                    ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName=""
                                    Select="new (ItemCode, Dscription, Quantity)" TableName="POR1"
                                    Where="DocEntry == @DocEntry">
                                    <WhereParameters>
                                        <asp:ControlParameter ControlID="cb_oc" DefaultValue="0" Name="DocEntry"
                                            PropertyName="Value" Type="Int32" />
                                    </WhereParameters>
                                </asp:LinqDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Item Costeo">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxComboBox ID="cb_item" runat="server" DataSourceID="LqDsPrecioEntrega"
                                    TextField="AlcName" ValueField="AlcCode">
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                            </td>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Tipo Imputacion">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxComboBox ID="cb_imputacion" runat="server">
                                    <Items>
                                        <dx:ListEditItem Text="Cantidad" Value="Q" />
                                        <dx:ListEditItem Text="Peso" Value="W" />
                                        <dx:ListEditItem Text="Volumen" Value="V" />
                                        <dx:ListEditItem Text="Valor Monetario c/derechos importacion" Value="F" />
                                        <dx:ListEditItem Text="Valor Monetario s/derechos importacion" Value="C" />
                                        <dx:ListEditItem Text="Igual A" Value="A" />
                                    </Items>
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Valor">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="txt_valor" runat="server" Width="170px">
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Proveedor">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxComboBox ID="cb_Proveedor" runat="server" DataSourceID="Proveedor"
                                    ValueField="CardCode">
                                    <Columns>
                                        <dx:ListBoxColumn Caption="Codigo" FieldName="CardCode" Width="100px">
                                        </dx:ListBoxColumn>
                                        <dx:ListBoxColumn Caption="Proveedor" FieldName="CardName" Width="300px">
                                        </dx:ListBoxColumn>
                                    </Columns>
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1"></td>
                            <td class="auto-style1"></td>
                            <td class="auto-style1"></td>
                            <td class="auto-style1">
                                <dx:ASPxLabel ID="lbl_error" runat="server" ForeColor="Red" Visible="False">
                                </dx:ASPxLabel>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>
                                <dx:ASPxButton ID="btn_grabar" runat="server" OnClick="btn_grabar_Click"
                                    Text="Grabar">
                                </dx:ASPxButton>
                            </td>
                            <td>
                                <dx:ASPxButton ID="btn_cancelar" runat="server" OnClick="btn_cancelar_Click"
                                    Text="Cancelar" CausesValidation="False">
                                </dx:ASPxButton>
                            </td>
                        </tr>
                    </table>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
        <asp:LinqDataSource ID="LqDsOC" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName=""
            TableName="CVT_VW_ComprasImportAbiertas">
        </asp:LinqDataSource>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
        </dx:ASPxGridViewExporter>

    </div>
</asp:Content>

