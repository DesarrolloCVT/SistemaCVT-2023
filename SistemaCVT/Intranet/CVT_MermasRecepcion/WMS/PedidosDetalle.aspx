<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PedidosDetalle.aspx.cs" Inherits="CVT_MermasRecepcion.WMS.PedidosDetalle" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>WMS</a></li>
            <li><span id="current">PEDIDO</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">
            <dx:ASPxLabel ID="lbl_Encabezado" runat="server" Text="" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
        </span>

        <span class="tab-end"></span>
      <%--  <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" />
                Exportar Excel</a>

        </div>--%>
    </div>
    <div>
        <a>Consolidado</a>

        <dx:ASPxGridView ID="GvConsolidado" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqDsProform">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Order_Id" Visible="False"
                    VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cod Producto"
                    FieldName="ArticleProvider_CodClient" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Producto"
                    FieldName="ArticleProvider_Description" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cant Solicitada"
                    FieldName="OrderProForm_Quantity" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cant Bultos" FieldName="Cant_Bultos"
                    VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cant Completada"
                    FieldName="Cant_Completada" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>

        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server"
            GridViewID="GvDetalle">
        </dx:ASPxGridViewExporter>

        <dx:ASPxButton ID="btn_refrescar" runat="server" OnClick="btn_refrescar_Click"
            Text="Actualizar" ToolTip="Revisa cambios en SAP para este pedido">
            <Image Url="~/Images/checklist.png">
            </Image>
        </dx:ASPxButton>
        <asp:LinqDataSource ID="LqDsProform" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
            TableName="VIEW_ORDERPROFORM" Where="Order_Id == @Order_Id">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="Order_Id" SessionField="OrderId"
                    Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>

    </div>
    <br />
    <br />
    <div style="margin-left:50PX">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="lbl1" runat="server" Text="Cant. Pallet Blancos" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtCantPallBlancos" runat="server" Width="110px" Height="30px">
                        <ValidationSettings Display="Dynamic" ValidationGroup="a5">
                            <RegularExpression ValidationExpression="\d+" />
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="lbl2" runat="server" Text="Cant.Pallet CHEP" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtCantPallChep" runat="server" Width="110px" Height="30px">
                        <ValidationSettings Display="Dynamic" ValidationGroup="a5">
                            <RegularExpression ValidationExpression="\d+" />
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Cant.Blanco tipo Chep" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtCantBlanChep" runat="server" Width="110px" Height="30px">
                        <ValidationSettings Display="Dynamic" ValidationGroup="a5">
                            <RegularExpression ValidationExpression="\d+" />
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td></td>
                <td>
                    <dx:ASPxButton ID="btnGuardarPall" runat="server" Text="Guardar" Height="46px" OnClick="btnGuardarPall_Click" ValidationGroup="a5" Width="79px"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server"
            ShowCollapseButton="true" Width="200px" HeaderText="FILTROS">

            <PanelCollection>
                <dx:PanelContent runat="server">
                    <table class="dxeBinImgCPnlSys">
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Lote">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="txt_lote" runat="server" Width="170px">
                                </dx:ASPxTextBox>
                            </td>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Producto">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxComboBox ID="cb_producto" runat="server"
                                    ClientInstanceName="cbo_producto" DataSourceID="LqDsProducto"
                                    ValueField="ArticleProvider_Id">
                                    <Columns>
                                        <dx:ListBoxColumn Caption="Codigo" FieldName="ArticleProvider_CodClient">
                                        </dx:ListBoxColumn>
                                        <dx:ListBoxColumn Caption="Producto" FieldName="ArticleProvider_Description">
                                        </dx:ListBoxColumn>
                                    </Columns>
                                </dx:ASPxComboBox>
                                <dx:ASPxButton ID="btn_limpiarproducto" runat="server" AutoPostBack="False"
                                    OnClick="btn_limpiarproducto_Click" Text="Limpiar Producto"
                                    RenderMode="Link">
                                    <ClientSideEvents Click="function(s, e) {
cbo_producto.SetSelectedIndex(-1);
	
}" />
                                    <ClientSideEvents Click="function(s, e) {
cbo_producto.SetSelectedIndex(-1);
	
}"></ClientSideEvents>
                                </dx:ASPxButton>
                                <asp:LinqDataSource ID="LqDsProducto" runat="server"
                                    ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
                                    TableName="ArticleProvider" Where="ArticleProvider_Status == @ArticleProvider_Status">
                                    <WhereParameters>
                                        <asp:Parameter DefaultValue="1" Name="ArticleProvider_Status" Type="Int32" />
                                    </WhereParameters>
                                </asp:LinqDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Ubicacion">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="txt_ubicacion" runat="server" Width="170px">
                                </dx:ASPxTextBox>
                            </td>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="N Pallet">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="txt_npallet" runat="server" Width="170px">
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>
                                <dx:ASPxButton ID="btn_Filtrar" runat="server" OnClick="btn_Filtrar_Click"
                                    Text="Filtrar">
                                </dx:ASPxButton>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                    <dx:ASPxGridView ID="GvFiltros" runat="server" AutoGenerateColumns="False"
                        EnableTheming="True" KeyFieldName="Package_Id" Theme="BlackGlass">
                        <SettingsPager AlwaysShowPager="True" PageSize="1000" Visible="False">
                        </SettingsPager>
                        <Settings ShowGroupPanel="True" />
                        <Columns>
                            <dx:GridViewCommandColumn SelectAllCheckboxMode="Page"
                                ShowInCustomizationForm="True" ShowSelectCheckbox="True" VisibleIndex="0">
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn FieldName="Package_Id"
                                ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Cod Ubicacion" FieldName="Layout_Id"
                                ShowInCustomizationForm="True" VisibleIndex="11">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="ArticleProvider_Id"
                                ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Codigo Producto"
                                FieldName="ArticleProvider_CodClient" ShowInCustomizationForm="True"
                                VisibleIndex="6">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Producto"
                                FieldName="ArticleProvider_Description" GroupIndex="0"
                                ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending"
                                VisibleIndex="7">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="N Pallet" FieldName="Package_SSCC"
                                ShowInCustomizationForm="True" VisibleIndex="4">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Site_Id" ShowInCustomizationForm="True"
                                Visible="False" VisibleIndex="9">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Posicion"
                                FieldName="Layout_ShortDescription" ShowInCustomizationForm="True"
                                VisibleIndex="10">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Bodega" FieldName="Site_ShortDescription"
                                ShowInCustomizationForm="True" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Cantidad" FieldName="Package_Quantity"
                                ShowInCustomizationForm="True" VisibleIndex="8">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Lote" FieldName="Package_Lot"
                                ShowInCustomizationForm="True" VisibleIndex="5">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>
                    <dx:ASPxButton ID="btn_agregar" runat="server" OnClick="btn_agregar_Click"
                        Text="Agregar">
                    </dx:ASPxButton>
                </dx:PanelContent>
            </PanelCollection>

        </dx:ASPxRoundPanel>
        &nbsp;
    </div>
    <br />

    <div>
        <a>Bultos Cargados</a>
        <dx:ASPxGridView ID="GvDetalle" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqDsOrderDetail" KeyFieldName="Order_Id;Package_Id"
            OnHtmlRowCreated="GvDetalle_HtmlRowCreated" OnRowCommand="GvDetalle_RowCommand" OnToolbarItemClick="GvDetalle_ToolbarItemClick">
            <Toolbars>
                <dx:GridViewToolbar>
                    <Items>
                        <%--  <dx:GridViewToolbarItem Command="New" />--%>
                        <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXls" />
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                <dx:GridViewToolbarItem Command="ExportToDocx" />
                                <dx:GridViewToolbarItem Command="ExportToRtf" />
                                <dx:GridViewToolbarItem Command="ExportToCsv" />
                                <dx:GridViewToolbarItem Command="ExportToPdf" />
                            </Items>
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
                <dx:GridViewDataTextColumn FieldName="Order_Id" VisibleIndex="0"
                    Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Package_SSCC" VisibleIndex="1"
                    Caption="SSCC">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Package_Lot" VisibleIndex="2"
                    Caption="Lote">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Package_ProductionDate" VisibleIndex="3"
                    Caption="F. Produccion">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="Package_ExpiresDate" VisibleIndex="4"
                    Caption="F. Vencimiento">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="ArticleProvider_CodClient"
                    VisibleIndex="5" Caption="Cod. Producto">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ArticleProvider_Description"
                    VisibleIndex="6" Caption="Producto">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="OrderDetail_Quantity" VisibleIndex="7"
                    Caption="Cantidad">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Package_Id" VisibleIndex="8"
                    Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Eliminar" VisibleIndex="9">
                    <DataItemTemplate>
                        <asp:ImageButton ID="Eliminar" CommandName="cmdEliminar" runat="server" ImageUrl="~/Images/eliminar.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsOrderDetail" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
            TableName="VIEW_ORDERDETAIL" Where="Order_Id == @Order_Id">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="Order_Id" SessionField="OrderId"
                    Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
</asp:Content>
