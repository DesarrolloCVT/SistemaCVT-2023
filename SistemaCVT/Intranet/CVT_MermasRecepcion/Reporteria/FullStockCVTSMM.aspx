<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FullStockCVTSMM.aspx.cs" Inherits="CVT_MermasRecepcion.Reporteria.FullStockCVTSMM" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Produccion</a></li>Full Stock SMM WMS</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Full Stock SMM WMS</span>
        <span class="tab-end"></span>
        <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px;" Height="20px" />
                Exportar Excel</a>&nbsp;         
        </div>
    </div>
    <br />
    <div>
        <dx:ASPxPivotGrid ID="PvDatos" runat="server" ClientIDMode="AutoID" DataSourceID="LqsFullStock">
            <Fields>
                <dx:PivotGridField ID="fieldBodega" Area="ColumnArea" AreaIndex="1" FieldName="Bodega" Name="fieldBodega">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCodCliente" Area="RowArea" AreaIndex="1" Caption="CodProducto" FieldName="CodCliente" Name="fieldCodCliente">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldArticleProviderDescription" Area="RowArea" AreaIndex="2" Caption="Descripcion" FieldName="ArticleProvider_Description" Name="fieldArticleProviderDescription">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCantidad" Area="DataArea" AreaIndex="0" FieldName="Cantidad" Name="fieldCantidad" ValueFormat-FormatString="N3" ValueFormat-FormatType="Custom" CellFormat-FormatString="N3" CellFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldFVencimiento" Area="RowArea" AreaIndex="5" FieldName="FVencimiento" Name="fieldFVencimiento" CellFormat-FormatString="dd-MM-yyyy" CellFormat-FormatType="Custom" ValueFormat-FormatString="dd-MM-yyyy" ValueFormat-FormatType="Custom" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldAno" Area="RowArea" AreaIndex="3" Caption="Año" FieldName="Ano" Name="fieldAno">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMes" Area="RowArea" AreaIndex="4" FieldName="Mes" Name="fieldMes">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldSociedad" Area="ColumnArea" AreaIndex="0" FieldName="Sociedad" Name="fieldSociedad">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldPrecioPromedio" Area="RowArea" AreaIndex="5" CellFormat-FormatString="N3" CellFormat-FormatType="Custom" FieldName="PrecioPromedio" Name="fieldPrecioPromedio" ValueFormat-FormatString="N3" ValueFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldFamilia" Area="RowArea" AreaIndex="0" Caption="Grupo" FieldName="Familia" Name="fieldFamilia">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldValorizado" Area="DataArea" AreaIndex="1" CellFormat-FormatString="N0" CellFormat-FormatType="Custom" FieldName="Valorizado" Name="fieldValorizado" ValueFormat-FormatString="N0" ValueFormat-FormatType="Custom">
                </dx:PivotGridField>
            </Fields>
            <OptionsPager RowsPerPage="50">
            </OptionsPager>
        </dx:ASPxPivotGrid>
        <asp:LinqDataSource ID="LqsFullStock" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="VW_FULLSTOCK_CVT_SMM">
        </asp:LinqDataSource>
    <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server"
        ASPxPivotGridID="PvDatos">
    </dx:ASPxPivotGridExporter>
    </div>
</asp:Content>
