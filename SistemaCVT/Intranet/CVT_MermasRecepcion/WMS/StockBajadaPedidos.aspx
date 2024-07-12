<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="StockBajadaPedidos.aspx.cs" Inherits="CVT_MermasRecepcion.WMS.StockBajadaPedidos" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>WMS</a></li>
            <li><span id="current">Stock Para bajada de Pedido</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Stock Para bajada de Pedido</span>
        <span class="tab-end"></span>
<%--        <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px" />
                Exportar Excel</a>
        </div>--%>
    </div>
    <br />
    <div>
        <table class="style1">
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Producto">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbo_producto" runat="server" DataSourceID="LqDsProductos"
                        ValueField="ArticleProvider_CodClient" Width="300px">
                        <Columns>
                            <dx:ListBoxColumn FieldName="ArticleProvider_CodClient" Name="Codigo"
                                Width="100px" />
                            <dx:ListBoxColumn FieldName="ArticleProvider_Description" Name="Producto"
                                Width="350px" />
                        </Columns>
                    </dx:ASPxComboBox>
                    <asp:LinqDataSource ID="LqDsProductos" runat="server" EntityTypeName=""
                        ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext"
                        TableName="ArticleProvider" OrderBy="ArticleProvider_CodClient">
                    </asp:LinqDataSource>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Lote">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txt_lote" runat="server" Width="170px">
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Bodega">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbo_bodega" runat="server" DataSourceID="LqDsBodega"
                        ValueField="Site_Id" Width="200px">
                        <Columns>
                            <dx:ListBoxColumn FieldName="Site_ShortDescription" Name="Codigo" />
                            <dx:ListBoxColumn FieldName="Site_Description" Name="Bodega" />
                        </Columns>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                    <asp:LinqDataSource ID="LqDsBodega" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
                        TableName="Site">
                    </asp:LinqDataSource>
                </td>
                <td>&nbsp;</td>
                <td>
                    <dx:ASPxButton ID="btn_Generar" runat="server" OnClick="btn_Generar_Click"
                        Text="Generar">
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDatos" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsPager PageSize="100">
            </SettingsPager>
            <SettingsBehavior />
            <Toolbars>
                <dx:GridViewToolbar>
                    <Items>
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
                <dx:GridViewDataTextColumn FieldName="Almacen" Visible="False" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cod.Producto" FieldName="ArticleProvider_CodClient" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Producto" FieldName="ArticleProvider_Description" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FProduccion" VisibleIndex="7">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="FVencimiento" VisibleIndex="8">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Lote" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Site_ShortDescription" Visible="False" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Estado_Lote" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Ubicacion" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="N° Pallet" FieldName="SSCC" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Site_Id" Visible="False" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDatos" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_VW_STOCK_DISPONIBLE_BAJADA_PEDIDO" Where="Site_Id == @Site_Id">
            <WhereParameters>
                <asp:ControlParameter ControlID="cbo_bodega" DefaultValue="0" Name="Site_Id" PropertyName="Value" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
</asp:Content>
