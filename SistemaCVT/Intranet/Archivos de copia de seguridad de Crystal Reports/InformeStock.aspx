<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InformeStock.aspx.cs" Inherits="CVT_MermasRecepcion.Reporteria.InformeStock" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Informes</a></li>
            <li><span id="current">Informe Stock</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Informe Stock</span>
        <span class="tab-end"></span>
        <%--        <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px" />
                Exportar Excel</a>
        </div>--%>
    </div>
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
                        TableName="VW_SITIOS_TODOS">
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

        <dx:ASPxGridView ID="GvDatosInfStock" runat="server" AutoGenerateColumns="False" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsPager PageSize="50">
            </SettingsPager>
            <Settings ShowFooter="True" />
            <SettingsBehavior />
            <Toolbars>
                <dx:GridViewToolbar>
                    <Items>
                        <%--                        <dx:GridViewToolbarItem Command="New" />--%>
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
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Producto"
                    VisibleIndex="3" Caption="Producto" Width="300px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cod_Cliente"
                    VisibleIndex="1" Caption="Cod Producto">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FolioDocumento"
                    VisibleIndex="12" Caption="Folio Documento">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FProduccion" VisibleIndex="14">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="FRecepcion" VisibleIndex="13">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="FVencimiento" VisibleIndex="15">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Info1" VisibleIndex="16">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Lote" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NRecepcion"
                    VisibleIndex="10" Caption="N. Recepcion">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Bodega"
                    VisibleIndex="7" Caption="Bodega">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="N Pallet" FieldName="SSCC" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TipoDocumento" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Ubicacion" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Pais Origen" FieldName="PaisOrigen" VisibleIndex="4">
                    <PropertiesComboBox DataSourceID="LqsPaisOrigen" TextField="Name" ValueField="Code">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="Reserva" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="EstadoPallet" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
            </Columns>
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="Cantidad Total : {0}" FieldName="Cantidad" ShowInColumn="Cantidad" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="Total Pallets: {0}" FieldName="SSCC" ShowInColumn="N Pallet" SummaryType="Count" />
            </TotalSummary>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsStock" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
            TableName="ViewStock" Where="Site_Id == @Site_Id">
            <WhereParameters>
                <asp:Parameter DefaultValue="0" Name="Site_Id" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>

        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server"
            GridViewID="GvDatos">
        </dx:ASPxGridViewExporter>

        <asp:LinqDataSource ID="LqsPaisOrigen" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" TableName="_PAIS_ORIGENPROD">
        </asp:LinqDataSource>

    </div>
</asp:Content>
