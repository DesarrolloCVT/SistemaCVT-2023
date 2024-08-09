<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ComparativoVentas.aspx.cs" Inherits="CVT_MermasRecepcion.Reporteria.ComparativoVentas" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
<div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>Informes</a></li>
        <li><span id="current">Presupuesto de Ventas</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Presupuesto de Ventas</span>
    <span class="tab-end"></span>
    <div id="options">         
          <a><asp:ImageButton ID="cmdExcel" runat="server" 
              ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" onclick="cmdExcel_Click" 
              style="width: 20px"/> Exportar Excel</a>
    </div>
</div>
<div>
    <dx:ASPxPivotGrid ID="PvDatos" runat="server" ClientIDMode="AutoID" 
        DataSourceID="LqDsPresupuesto">
        <Fields>
            <dx:PivotGridField ID="fieldCanal" FieldName="Canal" 
                Name="fieldCanal" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldCantidad" FieldName="Cantidad" Name="fieldCantidad" 
                Area="DataArea" AreaIndex="0" CellFormat-FormatType="Numeric">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldCLP" FieldName="CLP" 
                Name="fieldCLP" Area="DataArea" AreaIndex="1" 
                CellFormat-FormatType="Numeric">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldCLPSRapel" FieldName="CLP_SRapel" 
                Name="fieldCLPSRapel" Area="DataArea" AreaIndex="2" 
                CellFormat-FormatType="Numeric">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldCodCliente" FieldName="CodCliente" 
                Name="fieldCodCliente" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldCodProducto" FieldName="CodProducto" 
                Name="fieldCodProducto" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldGrupo" FieldName="Grupo" 
                Name="fieldGrupo" Area="RowArea" AreaIndex="0">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldMarca" FieldName="Marca" Name="fieldMarca" 
                Area="RowArea" AreaIndex="1">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldMes" FieldName="Mes" Name="fieldMes" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldPerdiodo" FieldName="Perdiodo" Name="fieldPerdiodo" 
                Area="ColumnArea" AreaIndex="0" Caption="Periodo">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldProducto" FieldName="Producto" Name="fieldProducto" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldRazonSocial" FieldName="RazonSocial" 
                Name="fieldRazonSocial" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldTipoNegocio" FieldName="TipoNegocio" 
                Name="fieldTipoNegocio" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldVendedor" FieldName="Vendedor" Name="fieldVendedor" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldCostoTotal" Area="DataArea" AreaIndex="3" 
                FieldName="Costo_Total" Name="fieldCostoTotal" CellFormat-FormatType="Numeric">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldPrcRentabilidad" Area="DataArea" AreaIndex="4" 
                CellFormat-FormatType="Numeric" FieldName="Prc_Rentabilidad" 
                Name="fieldPrcRentabilidad">
            </dx:PivotGridField>
        </Fields>
        <OptionsPager AlwaysShowPager="True" ColumnsPerPage="0" RowsPerPage="0">
        </OptionsPager>
    </dx:ASPxPivotGrid>
    <asp:LinqDataSource ID="LqDsPresupuesto" runat="server" 
        ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" 
        TableName="CVT_Comparativo_Ventas">
    </asp:LinqDataSource>
    <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" 
        ASPxPivotGridID="PvDatos">
    </dx:ASPxPivotGridExporter>
</div>
</asp:Content>
