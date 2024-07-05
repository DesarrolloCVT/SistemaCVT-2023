<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RPTFefo.aspx.cs" Inherits="CVT_MermasRecepcion.Comercial.RPTFefo" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Informes</a></li>
            <li><span id="current">INFORME FEFO</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">FEFO</span>
        <span class="tab-end"></span>

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
                        TableName="ArticleProvider">
                    </asp:LinqDataSource>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Bodega">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbo_bodega" runat="server" DataSourceID="LqDsBodega"
                        ValueField="Site_ShortDescription" Width="230px">
                        <Columns>
                            <dx:ListBoxColumn FieldName="Site_ShortDescription" Name="Codigo" Caption="Codigo" />
                            <dx:ListBoxColumn FieldName="Site_Description" Name="Bodega" Caption="Bodega" Width="200px" />
                        </Columns>
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                    <asp:LinqDataSource ID="LqDsBodega" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
                        TableName="VW_sitios_fefo2">
                    </asp:LinqDataSource>
                </td>
                <td>
                    <dx:ASPxButton ID="btn_Generar" runat="server" OnClick="btn_Generar_Click"
                        Text="Generar">
                    </dx:ASPxButton>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    <a>
                        <asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" />
                        Exportar Excel</a></td>
            </tr>
            <tr>
                <td colspan="3">
                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"
                        DataSourceID="LqDsGvDatos" KeyFieldName="ArticleProvider_CodClient;Site_ShortDescription;Lote"
                        OnDetailRowExpandedChanged="ASPxGridView1_DetailRowExpandedChanged">
                        <SettingsDetail ShowDetailRow="True" AllowOnlyOneMasterRowExpanded="True" />
                        <Templates>
                            <DetailRow>
                                <table class="style1">
                                    <tr>
                                        <td>
                                            <a>
                                                <asp:ImageButton ID="cmdExcelDetalle" runat="server"
                                                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcelDetalle_Click" />
                                                Exportar Excel</a></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False"
                                                DataSourceID="LqDsDetalle">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="Almacen" VisibleIndex="3"
                                                        Caption="Almacen" Visible="False">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="ArticleProvider_CodClient"
                                                        VisibleIndex="0" Caption="Cod Producto">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="ArticleProvider_Description"
                                                        VisibleIndex="1" Caption="Producto">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataDateColumn FieldName="FProduccion" VisibleIndex="8">
                                                    </dx:GridViewDataDateColumn>
                                                    <dx:GridViewDataDateColumn FieldName="FVencimiento" VisibleIndex="9">
                                                    </dx:GridViewDataDateColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Lote" VisibleIndex="4">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="6">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Site_ShortDescription" VisibleIndex="2"
                                                        Caption="Bodega">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="SSCC" VisibleIndex="5">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Layout_Description" VisibleIndex="7"
                                                        Caption="Posicion">
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:ASPxGridView>
                                            <asp:LinqDataSource ID="LqDsDetalle" runat="server"
                                                ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
                                                TableName="CVT_VIEW_STOCKWMS_PROD_BODEGA_LOTE"
                                                Where="ArticleProvider_CodClient == @ArticleProvider_CodClient &amp;&amp; Site_ShortDescription == @Site_ShortDescription &amp;&amp; Lote == @Lote &amp;&amp; FProduccion == @FProduccion">
                                                <WhereParameters>
                                                    <asp:SessionParameter DefaultValue="0" Name="ArticleProvider_CodClient"
                                                        SessionField="Producto" Type="String" />
                                                    <asp:SessionParameter DefaultValue="0" Name="Site_ShortDescription"
                                                        SessionField="Bodega" Type="String" />
                                                    <asp:SessionParameter DefaultValue="0" Name="Lote" SessionField="Lote"
                                                        Type="String" />
                                                    <asp:SessionParameter DefaultValue="0" Name="FProduccion"
                                                        SessionField="FProduccion" Type="DateTime" />
                                                </WhereParameters>
                                            </asp:LinqDataSource>
                                            <dx:ASPxGridViewExporter ID="GridExporterDetalle" runat="server"
                                                GridViewID="ASPxGridView2">
                                            </dx:ASPxGridViewExporter>
                                        </td>
                                    </tr>
                                </table>
                            </DetailRow>
                        </Templates>
                        <SettingsPager PageSize="50">
                        </SettingsPager>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="Almacen" VisibleIndex="6" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="ArticleProvider_CodClient"
                                VisibleIndex="0" Caption="Cod. Producto">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="ArticleProvider_Description"
                                VisibleIndex="1" Caption="Producto">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn FieldName="FProduccion" VisibleIndex="7">
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataDateColumn FieldName="FVencimiento" VisibleIndex="8">
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn FieldName="Lote" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="5">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Site_ShortDescription" VisibleIndex="2"
                                Caption="Bodega">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Estado_Lote" VisibleIndex="4">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>
                    <asp:LinqDataSource ID="LqDsGvDatos" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
                        TableName="CVT_VIEW_STOCKWMS_PROD_BODEGA"
                        Where="ArticleProvider_CodClient == @ArticleProvider_CodClient &amp;&amp; Site_ShortDescription == @Site_ShortDescription"
                        OrderBy="FProduccion, FVencimiento">
                        <WhereParameters>
                            <asp:ControlParameter ControlID="cbo_producto" DefaultValue="0"
                                Name="ArticleProvider_CodClient" PropertyName="Value" Type="String" />
                            <asp:ControlParameter ControlID="cbo_bodega" DefaultValue="0"
                                Name="Site_ShortDescription" PropertyName="Value" Type="String" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                    <dx:ASPxGridViewExporter ID="GridExporter" runat="server" GridViewID="ASPxGridView1">
                    </dx:ASPxGridViewExporter>
                </td>
            </tr>
            <tr>
                <td colspan="3">&nbsp;</td>
            </tr>
        </table>

    </div>
</asp:Content>
