<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InfEstadisticasVentas.aspx.cs" Inherits="CVT_MermasRecepcion.Reporteria.InfEstadisticasVentas" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
<div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>Informes</a></li>
        <li><span id="current">Estadisticas de Ventas</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Estadisticas de Ventas</span>
    <span class="tab-end"></span>
    <div id="options">         
          <a><asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" onclick="cmdExcel_Click"/> Exportar Excel</a>
    </div>
</div>
<div>
    <dx:ASPxPivotGrid ID="PvDatos" runat="server" ClientIDMode="AutoID" 
        DataSourceID="LqDsEstVentas">
        <Fields>
            <dx:PivotGridField ID="fieldAo2" FieldName="Año" Name="fieldAo2" 
                Area="ColumnArea" AreaIndex="0">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldCanal1" FieldName="Canal" Name="fieldCanal1" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldCantidad" FieldName="Cantidad" Name="fieldCantidad" 
                Area="DataArea" AreaIndex="0" CellFormat-FormatString="N2" CellFormat-FormatType="Custom" ValueFormat-FormatString="N2" ValueFormat-FormatType="Custom">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldCiudad" FieldName="Ciudad" Name="fieldCiudad" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldCodCliente" FieldName="Cod_Cliente" 
                Name="fieldCodCliente" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldCompContable" FieldName="Comp_Contable" 
                Name="fieldCompContable" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldCosto" FieldName="Costo" Name="fieldCosto" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldCostoFinal" FieldName="Costo_Final" 
                Name="fieldCostoFinal" Area="DataArea" AreaIndex="2" CellFormat-FormatString="N2" CellFormat-FormatType="Custom" ValueFormat-FormatString="N2" ValueFormat-FormatType="Custom">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldDescripcion" FieldName="Descripcion" 
                Name="fieldDescripcion" Area="RowArea" AreaIndex="3">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldDireccionEnvio" FieldName="Direccion_Envio" 
                Name="fieldDireccionEnvio" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldFechaContab" FieldName="Fecha_Contab" 
                Name="fieldFechaContab" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldFechaVenc" FieldName="Fecha_Venc" 
                Name="fieldFechaVenc" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldFolio" FieldName="Folio" Name="fieldFolio" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldGrupoProducto1" FieldName="Grupo_Producto" 
                Name="fieldGrupoProducto1" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldIndicador" FieldName="Indicador" 
                Name="fieldIndicador" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldMarca1" FieldName="Marca" Name="fieldMarca1" 
                Area="RowArea" AreaIndex="1">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldMes2" FieldName="Mes" Name="fieldMes2" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldNombreGrupoProducto1" 
                FieldName="Nombre_Grupo_Producto" Name="fieldNombreGrupoProducto1" 
                Area="RowArea" AreaIndex="2">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldNumInterno" FieldName="Num_Interno" 
                Name="fieldNumInterno" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldPeso" FieldName="Peso" Name="fieldPeso" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldPrecioSinRapel" FieldName="Precio_Sin_Rapel" 
                Name="fieldPrecioSinRapel" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldPrecioUnitario" FieldName="Precio_Unitario" 
                Name="fieldPrecioUnitario" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldProcentajeRAPEL" FieldName="Procentaje_RAPEL" 
                Name="fieldProcentajeRAPEL" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldProducto1" FieldName="Producto" 
                Name="fieldProducto1" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldRazonSocial" FieldName="Razon_Social" 
                Name="fieldRazonSocial" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldTipo1" FieldName="Tipo" Name="fieldTipo1" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldTipoMarca1" FieldName="Tipo_Marca" 
                Name="fieldTipoMarca1" Area="RowArea" AreaIndex="0">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldTipoNegocio1" FieldName="Tipo_Negocio" 
                Name="fieldTipoNegocio1" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldTipoVenta" FieldName="Tipo_Venta" 
                Name="fieldTipoVenta" AreaIndex="0">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldTotalLinea" FieldName="Total_Linea" 
                Name="fieldTotalLinea" Area="DataArea" AreaIndex="1" CellFormat-FormatString="N2" CellFormat-FormatType="Custom" ValueFormat-FormatString="N2" ValueFormat-FormatType="Custom">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldVendedor1" FieldName="Vendedor" 
                Name="fieldVendedor1" Visible="False">
            </dx:PivotGridField>
        </Fields>
        <OptionsPager AlwaysShowPager="True" Visible="False">
        </OptionsPager>
    </dx:ASPxPivotGrid>
    <asp:LinqDataSource ID="LqDsEstVentas" runat="server" 
        ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" 
        TableName="Estadistica_Ventas">
    </asp:LinqDataSource>
    <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" 
        ASPxPivotGridID="PvDatos">
    </dx:ASPxPivotGridExporter>
</div>
</asp:Content>
