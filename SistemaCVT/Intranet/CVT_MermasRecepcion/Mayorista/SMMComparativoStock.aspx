<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SMMComparativoStock.aspx.cs" Inherits="CVT_MermasRecepcion.Mayorista.SMMComparativoStock" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
       <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Inventario</a></li>
            <%--  <li><a href="../Inventario/Inventario.aspx">Inventario</a></li>--%>
            <li><span id="current">Comparativo Stock WMS/SAP</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Comparativo Stock WMS/SAP</span>
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
        <dx:ASPxPivotGrid ID="PvDatos" runat="server" ClientIDMode="AutoID">
            <Fields>
                <dx:PivotGridField ID="fieldCodProducto" FieldName="CodProducto" Name="fieldCodProducto" Area="RowArea" AreaIndex="3">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldProducto" FieldName="Producto" Name="fieldProducto" Area="RowArea" AreaIndex="4">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldBodega" FieldName="Bodega" Name="fieldBodega" Area="RowArea" AreaIndex="5">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCantidadWMS" FieldName="CantidadWMS" Name="fieldCantidadWMS" Area="DataArea" AreaIndex="0" CellFormat-FormatString="N4" CellFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCantidadSAP" FieldName="CantidadSAP" Name="fieldCantidadSAP" Area="DataArea" AreaIndex="1" CellFormat-FormatString="N4" CellFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldDiferencia" Area="DataArea" AreaIndex="2" FieldName="Diferencia" Name="fieldDiferencia" CellFormat-FormatString="N4" CellFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldGrupo" Area="RowArea" AreaIndex="0" FieldName="Grupo" Name="fieldGrupo">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCuenta" Area="RowArea" AreaIndex="1" FieldName="Cuenta" Name="fieldCuenta">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldNombreCuenta" Area="RowArea" AreaIndex="2" FieldName="NombreCuenta" Name="fieldNombreCuenta">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldPrecioPromedio" Area="RowArea" AreaIndex="6" FieldName="PrecioPromedio" Name="fieldPrecioPromedio" ValueFormat-FormatString="N2" ValueFormat-FormatType="Custom">
                </dx:PivotGridField>
            </Fields>
            <OptionsPager RowsPerPage="100">
            </OptionsPager>
        </dx:ASPxPivotGrid>
    </div>
    <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server"
        ASPxPivotGridID="PvDatos">
    </dx:ASPxPivotGridExporter>
</asp:Content>
