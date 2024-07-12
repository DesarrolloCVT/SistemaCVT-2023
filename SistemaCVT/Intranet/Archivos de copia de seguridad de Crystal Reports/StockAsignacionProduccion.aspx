<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="StockAsignacionProduccion.aspx.cs" Inherits="CVT_MermasRecepcion.WMS.StockAsignacionProduccion" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
     <div id="tableHeader">
        <span class="tableTitle">Stock Asignacion Produccion</span>
        <span class="tab-end"></span>
        <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px" />
                Exportar Excel</a>
            <%--<a>
                <asp:ImageButton ID="cmdNew" runat="server"
                    ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>
        </div>--%>
        </div>
    </div>
     <div>
        <table class="style1">
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Producto"></dx:ASPxLabel>
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
    <div>
        <dx:ASPxPivotGrid ID="PvStockAsigProd" runat="server" OptionsData-DataProcessingEngine="Optimized" OptionsFilter-FilterPanelMode="Filter" ClientIDMode="AutoID"  IsMaterialDesign="False" >
            <Fields>
                <dx:PivotGridField ID="fieldSSCC" FieldName="SSCC" Name="fieldSSCC" OLAPExpression="" Visible="True" Area="DataArea" AreaIndex="1" SummaryType="Count">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCod_Cliente" FieldName="Cod_Cliente" Name="fieldCod_Cliente" Visible="True">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldProducto" FieldName="Producto" Name="fieldProducto" Visible="True">
                </dx:PivotGridField>
                
                <dx:PivotGridField ID="fieldCantidad" FieldName="Cantidad" Name="fieldCantidad" Visible="True" Area="DataArea" AreaIndex="2">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldLote" FieldName="Lote" Name="fieldLote" Visible="True" Area="RowArea" AreaIndex="1">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldBodega" FieldName="Bodega" Name="fieldBodega" Visible="True" Area="ColumnArea" AreaIndex="1">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldUbicacion" FieldName="Ubicacion" Name="fieldUbicacion" Visible="True" Area="ColumnArea" AreaIndex="2">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldNRecepcion" FieldName="NRecepcion" Name="fieldNRecepcion" Visible="True" Area="RowArea" AreaIndex="2">
                </dx:PivotGridField>
               
            </Fields>
            <OptionsPager RowsPerPage="1000"></OptionsPager>
<OptionsData DataProcessingEngine="Optimized"></OptionsData>

<OptionsFilter FilterPanelMode="Filter"></OptionsFilter>
        </dx:ASPxPivotGrid>
        <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server"
        ASPxPivotGridID="PvStockAsigProd">
    </dx:ASPxPivotGridExporter>
    </div>

</asp:Content>
