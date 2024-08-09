<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="CompEstadisticaDeVentas.aspx.cs" Inherits="CVT_MermasRecepcion.Reporteria.CompEstadisticaDeVentas" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 15px;
        }

        .auto-style6 {
            margin-left: 80px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul class="auto-style6">
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Informes</a></li>
            <li><span id="current">Comparativo Estadisticas de Ventas</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Comparativo Estadisticas de Ventas</span>
        <span class="tab-end"></span>
        <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" />
                Exportar Excel</a>
        </div>
    </div>
    <br />
    <div>
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha Inicio"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteInicio" runat="server" Height="30px"></dx:ASPxDateEdit>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Fecha Termino"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteTermino" runat="server" Height="30px"></dx:ASPxDateEdit>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" Height="52px" Width="96px" OnClick="btnBuscar_Click"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>
        <dx:ASPxPivotGrid ID="PvDatos" runat="server" ClientIDMode="AutoID">
            <Fields>
                <dx:PivotGridField ID="fieldMes" Area="ColumnArea" AreaIndex="1" FieldName="Mes" Name="fieldMes">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldAo" Area="ColumnArea" AreaIndex="0" FieldName="Año" Name="fieldAo">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldItmsGrpCod" FieldName="ItmsGrpCod" Name="fieldItmsGrpCod" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldItmsGrpNam" Area="RowArea" AreaIndex="0" FieldName="ItmsGrpNam" Name="fieldItmsGrpNam">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldProducto" Area="RowArea" AreaIndex="1" FieldName="Producto" Name="fieldProducto">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldDescripcion" Area="RowArea" AreaIndex="2" FieldName="Descripcion" Name="fieldDescripcion">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCantidad" Area="DataArea" AreaIndex="0" FieldName="Cantidad" Name="fieldCantidad">
                    <CellFormat FormatString="N0" FormatType="Custom" />
                    <TotalCellFormat FormatString="N0" FormatType="Custom" />
                    <GrandTotalCellFormat FormatString="N0" FormatType="Custom" />
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldPrecUnitario" FieldName="Prec_Unitario" Name="fieldPrecUnitario" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCosto" FieldName="Costo" Name="fieldCosto" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTotalLinea1" Area="DataArea" AreaIndex="2" FieldName="Total_Linea" Name="fieldTotalLinea1">
                    <CellFormat FormatString="N0" FormatType="Custom" />
                    <TotalCellFormat FormatString="N0" FormatType="Custom" />
                    <GrandTotalCellFormat FormatString="N0" FormatType="Custom" />
                    <ValueFormat FormatString="N0" FormatType="Custom" />
                    <TotalValueFormat FormatString="N0" FormatType="Custom" />
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTipoVenta" FieldName="TipoVenta" Name="fieldTipoVenta" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCostoFinal" Area="DataArea" AreaIndex="1" FieldName="CostoFinal" Name="fieldCostoFinal">
                    <CellFormat FormatString="N0" FormatType="Custom" />
                    <TotalCellFormat FormatString="N0" FormatType="Custom" />
                    <GrandTotalCellFormat FormatString="N0" FormatType="Custom" />
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldPeso" FieldName="Peso" Name="fieldPeso" Visible="False">
                </dx:PivotGridField>
            </Fields>
            <OptionsView ShowCustomTotalsForSingleValues="True" ShowGrandTotalsForSingleValues="True" ShowTotalsForSingleValues="True" />
            <OptionsPager RowsPerPage="100">
            </OptionsPager>
        </dx:ASPxPivotGrid>
        <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server"
            ASPxPivotGridID="PvDatos">
        </dx:ASPxPivotGridExporter>
    </div>

</asp:Content>
