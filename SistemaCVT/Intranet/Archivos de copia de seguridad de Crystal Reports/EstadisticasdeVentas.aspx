<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EstadisticasdeVentas.aspx.cs" Inherits="CVT_MermasRecepcion.Mayorista.EstadisticasdeVentas" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
       <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Mayorista</a></li>
            <li><span id="current">Estadisticas de Ventas</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Estadisticas de Ventas</span>
        <span class="tab-end"></span>
        <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="height: 20px;" />
                Exportar Excel</a>&nbsp;
             <%-- <a>
                  <asp:ImageButton ID="cmdNew" runat="server"
                      ImageUrl="~/Images/nuevo.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>--%>
        </div>
    </div>
    <br />
    <div>
          <table>
            <tr>                
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Fecha Inicio"></asp:Label>
                </td>
                <td>
                    <dx:ASPxDateEdit ID="dteFinicio" runat="server"></dx:ASPxDateEdit>
                </td>
                 <td>
                    &nbsp;  &nbsp;  &nbsp;
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Fecha Termino"></asp:Label>
                </td>
                <td>
                    <dx:ASPxDateEdit ID="dteFTermino" runat="server"></dx:ASPxDateEdit>
                </td>
                <td>
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="ver" OnClick="btnBuscar_Click"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>
            <dx:ASPxPivotGrid ID="PvDatos" runat="server" ClientIDMode="AutoID">
                <Fields>
                    <dx:PivotGridField ID="fieldTipo" FieldName="Tipo" Name="fieldTipo" Visible="False">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldMes" FieldName="Mes" Name="fieldMes" Visible="False">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldFechaContab" Area="RowArea" AreaIndex="5" FieldName="Fecha_Contab" Name="fieldFechaContab">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldFecVencto" FieldName="Fec_Vencto" Name="fieldFecVencto" Visible="False">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldCompContable" FieldName="Comp_Contable" Name="fieldCompContable" Visible="False">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldFolio" FieldName="Folio" Name="fieldFolio" Visible="False">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldNumInterno" FieldName="Num_Interno" Name="fieldNumInterno" Visible="False">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldCodCliente" FieldName="Cod_Cliente" Name="fieldCodCliente" Visible="False">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldRazonSocial" FieldName="Razon_Social" Name="fieldRazonSocial" Visible="False">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldTelefono" FieldName="Telefono" Name="fieldTelefono" Visible="False">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldEMail" FieldName="E_Mail" Name="fieldEMail" Visible="False">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldItmsGrpCod" FieldName="ItmsGrpCod" Name="fieldItmsGrpCod" Visible="False">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldItmsGrpNam" Area="RowArea" AreaIndex="0" FieldName="ItmsGrpNam" Name="fieldItmsGrpNam">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldProducto" FieldName="Producto" Name="fieldProducto" Visible="False">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldDescripcion" Area="RowArea" AreaIndex="3" FieldName="Descripcion" Name="fieldDescripcion">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldCantidad" Area="DataArea" AreaIndex="0" CellFormat-FormatString="N0" CellFormat-FormatType="Custom" FieldName="Cantidad" Name="fieldCantidad">
<CellFormat FormatString="N0" FormatType="Custom"></CellFormat>
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldPrecUnitario" Area="DataArea" AreaIndex="3" FieldName="Prec_Unitario" Name="fieldPrecUnitario" CellFormat-FormatString="N0" CellFormat-FormatType="Custom">
<CellFormat FormatString="N0" FormatType="Custom"></CellFormat>
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldCosto" Area="DataArea" AreaIndex="1" FieldName="Costo" Name="fieldCosto" CellFormat-FormatString="N0" CellFormat-FormatType="Custom">
<CellFormat FormatString="N0" FormatType="Custom"></CellFormat>
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldTotalLinea" Area="DataArea" AreaIndex="4" FieldName="Total_Linea" Name="fieldTotalLinea" CellFormat-FormatString="N0" CellFormat-FormatType="Custom">
<CellFormat FormatString="N0" FormatType="Custom"></CellFormat>
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldNameIndica" FieldName="Name_Indica" Name="fieldNameIndica" Visible="False">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldPrcRapel" FieldName="Prc_Rapel" Name="fieldPrcRapel" Visible="False">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldPrecSinRapel" FieldName="Prec_SinRapel" Name="fieldPrecSinRapel" Visible="False">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldShipToCode" FieldName="ShipToCode" Name="fieldShipToCode" Visible="False">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldDireccion" FieldName="Direccion" Name="fieldDireccion" Visible="False">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldCiudad" FieldName="Ciudad" Name="fieldCiudad" Visible="False">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldTipoVenta" AreaIndex="0" FieldName="TipoVenta" Name="fieldTipoVenta">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldCostoFinal" Area="DataArea" AreaIndex="2" FieldName="CostoFinal" Name="fieldCostoFinal" CellFormat-FormatString="N0" CellFormat-FormatType="Custom">
<CellFormat FormatString="N0" FormatType="Custom"></CellFormat>
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
                    <dx:PivotGridField ID="fieldTipoMarca" FieldName="TipoMarca" Name="fieldTipoMarca" Visible="False">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldProveedorPred" Area="RowArea" AreaIndex="0" FieldName="ProveedorPred" Name="fieldProveedorPred" Visible="False">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldNombreProveedor" Area="RowArea" AreaIndex="0" FieldName="NombreProveedor" Name="fieldNombreProveedor" Visible="False">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldGrupoCliente" FieldName="GrupoCliente" Name="fieldGrupoCliente" Visible="False">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldUSubCategoria" Area="RowArea" AreaIndex="1" FieldName="U_SubCategoria" Name="fieldUSubCategoria">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldUMarcaProducto" Area="RowArea" AreaIndex="2" FieldName="U_MarcaProducto" Name="fieldUMarcaProducto">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldcodum" Area="RowArea" AreaIndex="4" FieldName="codum" Name="fieldcodum">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldFolioRefFC" AreaIndex="0" FieldName="FolioRefFC" Name="fieldFolioRefFC" Visible="False">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldComentariosNC" AreaIndex="0" FieldName="ComentariosNC" Name="fieldComentariosNC" Visible="False">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldPrecUnidad" FieldName="Prec_Unidad" Name="fieldPrecUnidad" Visible="False">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldCantidadUnid" AreaIndex="0" FieldName="CantidadUnid" Name="fieldCantidadUnid" Visible="False">
                    </dx:PivotGridField>
                    <dx:PivotGridField ID="fieldBaseUM" AreaIndex="0" FieldName="BaseUM" Name="fieldBaseUM" Visible="False">
                    </dx:PivotGridField>
                </Fields>
                <OptionsPager RowsPerPage="100">
                </OptionsPager>
            </dx:ASPxPivotGrid>
        <br />
    <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" 
        ASPxPivotGridID="PvDatos">
    </dx:ASPxPivotGridExporter>
    
    </div>
</asp:Content>
