<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CompEstadisticasDeVentasComerciales.aspx.cs" Inherits="CVT_MermasRecepcion.Comercial.CompEstadisticasDeVentasComerciales" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Comercial</a></li>
            <li><span id="current">Resumen Estadistica de Ventas Rapel</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Resumen Estadistica de Ventas Rapel</span>
        <span class="tab-end"></span>
        <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click1"
                    Style="height: 20px;" />
                Exportar Excel</a>&nbsp;

             
             <%-- <a>
                  <asp:ImageButton ID="cmdNew" runat="server"
                      ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>--%>
        </div>
    </div>
    <br />
    <div>
        <table>            
            <tr>
                <td>
                    <label>Fecha Inicio</label>
                </td>
                <td>
                    <dx:aspxdateedit id="dteInicio" runat="server"></dx:aspxdateedit>
                </td>
                <td>&nbsp;  &nbsp;  &nbsp;
                </td>
                <td>
                    <label>Fecha Termino</label>
                </td>
                <td>
                    <dx:aspxdateedit id="dteFtermino" runat="server"></dx:aspxdateedit>
                </td>
                <td>&nbsp;  &nbsp;  &nbsp;
                </td>
                        <td>
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="ver" OnClick="btnBuscar_Click"></dx:ASPxButton>
                </td>
        </table>
    </div>
    <br />
    <div>
        <dx:ASPxPivotGrid ID="PvDatos" runat="server" ClientIDMode="AutoID">
            <Fields>
                <dx:PivotGridField ID="fieldTipo" FieldName="Tipo" Name="fieldTipo" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMes" FieldName="Mes" Name="fieldMes" Area="ColumnArea" AreaIndex="1" Caption="mes">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldFechaContab" FieldName="Fecha_Contab" Name="fieldFechaContab" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldFecVencto" FieldName="Fec_Vencto" Name="fieldFecVencto" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCompContable" FieldName="CompContable" Name="fieldCompContable" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldFolio" FieldName="Folio" Name="fieldFolio" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldNumInterno" FieldName="Num_Interno" Name="fieldNumInterno" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCodCliente" FieldName="Cod_Cliente" Name="fieldCodCliente" Area="RowArea" AreaIndex="0">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldRazonSocial" FieldName="Razon_Social" Name="fieldRazonSocial" Area="RowArea" AreaIndex="1">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldItmsGrpCod" FieldName="ItmsGrpCod" Name="fieldItmsGrpCod" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldItmsGrpNam" FieldName="ItmsGrpNam" Name="fieldItmsGrpNam" Area="RowArea" AreaIndex="2">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldProducto" FieldName="Producto" Name="fieldProducto" Area="RowArea" AreaIndex="3">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldDescripcion" FieldName="Descripcion" Name="fieldDescripcion" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCantidad" FieldName="Cantidad" Name="fieldCantidad" Area="DataArea" AreaIndex="0" CellFormat-FormatString="N0" CellFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldPrecUnitario" FieldName="Prec_Unitario" Name="fieldPrecUnitario" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCosto" FieldName="Costo" Name="fieldCosto" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTotalLinea" FieldName="Total_Linea" Name="fieldTotalLinea" Area="DataArea" AreaIndex="1" CellFormat-FormatString="N0" CellFormat-FormatType="Custom" ValueFormat-FormatString="N0">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldNameIndica" FieldName="Name_Indica" Name="fieldNameIndica" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldPrcRapel" FieldName="Prc_Rapel" Name="fieldPrcRapel" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldRapelAplicado" FieldName="RapelAplicado" Name="fieldRapelAplicado" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldShipToCode" FieldName="ShipToCode" Name="fieldShipToCode" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldDireccion" FieldName="Direccion" Name="fieldDireccion" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCiudad" FieldName="Ciudad" Name="fieldCiudad" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTipoVenta" FieldName="TipoVenta" Name="fieldTipoVenta" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCostoTotal" FieldName="CostoTotal" Name="fieldCostoTotal" Area="DataArea" AreaIndex="2" CellFormat-FormatString="N0" CellFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldPeso" FieldName="Peso" Name="fieldPeso" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMarca" FieldName="Marca" Name="fieldMarca" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCanal" FieldName="Canal" Name="fieldCanal" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTipoNegocio" FieldName="TipoNegocio" Name="fieldTipoNegocio" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldVendedor" FieldName="Vendedor" Name="fieldVendedor" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldtipoMarca" FieldName="tipoMarca" Name="fieldtipoMarca" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldOCReferencia" FieldName="OC_Referencia" Name="fieldOCReferencia" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldVendedorDireccion" FieldName="VendedorDireccion" Name="fieldVendedorDireccion" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldDia" FieldName="Dia" Name="fieldDia" Area="ColumnArea" AreaIndex="2">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldano" FieldName="ano" Name="fieldano" Area="ColumnArea" AreaIndex="0" Caption="año">
                </dx:PivotGridField>
            </Fields>
            <OptionsPager RowsPerPage="100">
            </OptionsPager>
        </dx:ASPxPivotGrid>
    </div>

    <br />
    <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" 
        ASPxPivotGridID="PvDatos">
    </dx:ASPxPivotGridExporter>
    
    </asp:Content>

