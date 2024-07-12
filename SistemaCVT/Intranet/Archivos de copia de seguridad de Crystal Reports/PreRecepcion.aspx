<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PreRecepcion.aspx.cs" Inherits="CVT_MermasRecepcion.Comex.PreRecepcion" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>COMEX</a></li>
            <li><span id="current">PreRecepcion</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Pre Recepcion</span>
        <span class="tab-end"></span>
      <%--  <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px" />
                Exportar Excel</a>
            <a>
                <asp:ImageButton ID="cmdNew" runat="server"
                    ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>
        </div>--%>
    </div>
    <br />
    <div>

        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqDsPreRecepcion" KeyFieldName="OC" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <ClientSideEvents ToolbarItemClick="function(s, e) {
	if (e.item.name == &quot;Nuevo&quot;) e.processOnServer = true; e.usePostBack=true;
 

}" />

            <SettingsPager PageSize="25">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            <SettingsBehavior AllowFocusedRow="True" />
            <Toolbars>
                <dx:GridViewToolbar >
                    <Items>
                        <dx:GridViewToolbarItem Command="Custom" Name="Nuevo" Text="Nuevo" Image-Url="../../Images/pn-add-source-copy.gif" >
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
                <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="PreRecepcion_Id"
                    Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NContenedor" ReadOnly="True"
                    VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodProducto" ReadOnly="True"
                    VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FProduccion" ReadOnly="True"
                    VisibleIndex="5">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Lote_Proveedor" ReadOnly="True"
                    VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FVencimiento" VisibleIndex="8">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Cant_Pallets" VisibleIndex="9">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TContenedor" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="ETA" VisibleIndex="11">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataComboBoxColumn FieldName="OC" ReadOnly="True" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="LqDsOC0" TextField="DocNum"
                        ValueField="DocEntry">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataDateColumn FieldName="ETD" VisibleIndex="12">
                    <PropertiesDateEdit DisplayFormatString="">
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
            </Columns>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsPreRecepcion" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext"
            EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName=""
            TableName="CVT_PreRecepcion">
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
                <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
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
                            <td colspan="4">&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <dx:ASPxGridView ID="GvProductos" runat="server" AutoGenerateColumns="False"
                                    DataSourceID="LqDsDetalleOC">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Codigo" FieldName="ItemCode"
                                            ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Producto" FieldName="Dscription"
                                            ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Cant Pendiente" FieldName="OpenQty"
                                            ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:ASPxGridView>
                                <asp:LinqDataSource ID="LqDsDetalleOC" runat="server"
                                    ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName=""
                                    Select="new (ItemCode, Dscription, OpenQty)" TableName="POR1"
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
                                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Producto">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxComboBox ID="cb_producto" runat="server" DataSourceID="LqDsDetalleOC"
                                    TextField="Dscription" ValueField="ItemCode">
                                </dx:ASPxComboBox>
                            </td>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Fecha Produccion">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxDateEdit ID="cb_fproduccion" runat="server">
                                </dx:ASPxDateEdit>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Cantidad">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="txt_cantidad" runat="server" Width="170px">
                                </dx:ASPxTextBox>
                            </td>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Fecha Vencimiento">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxDateEdit ID="cb_fvencimiento" runat="server">
                                </dx:ASPxDateEdit>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Lote Proveedor">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="txt_lote" runat="server" Width="170px">
                                </dx:ASPxTextBox>
                            </td>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="N Contenetor">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="txt_ncontenedor" runat="server" Width="170px">
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="ETA">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxDateEdit ID="cb_eta" runat="server">
                                </dx:ASPxDateEdit>
                            </td>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel14" runat="server" Text="Tamaño Contenedor">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxComboBox ID="cb_tcontenedor" runat="server" SelectedIndex="0">
                                    <Items>
                                        <dx:ListEditItem Selected="True" Text="No Aplica" Value="0" />
                                        <dx:ListEditItem Text="20" Value="20" />
                                        <dx:ListEditItem Text="40" Value="40" />
                                    </Items>
                                </dx:ASPxComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel15" runat="server" Text="ETD">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxDateEdit ID="cb_etd" runat="server">
                                </dx:ASPxDateEdit>
                            </td>
                            <td colspan="2">
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
                                    Text="Cancelar">
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

