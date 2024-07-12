<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FlujoProductos.aspx.cs" Inherits="CVT_MermasRecepcion.Mayorista.FlujoProductos" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Mayorista</a></li>
            <li><span id="current">Flujo Productos</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Flujo Productos</span>
        <span class="tab-end"></span>
        <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px; height: 20px;" />
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
                    <dx:ASPxDateEdit ID="dteFinicio" runat="server" DisplayFormatString="dd-MM-yyyy" EditFormat="Custom"></dx:ASPxDateEdit>
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
                <dx:PivotGridField ID="fieldQuantity" Area="DataArea" AreaIndex="0" Caption="Cantidad" CellFormat-FormatString="N0" CellFormat-FormatType="Custom" FieldName="Quantity" Name="fieldQuantity" TotalsVisibility="None">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldItemCode" Area="RowArea" AreaIndex="2" Caption="Cod.Producto" FieldName="ItemCode" Name="fieldItemCode">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldItemName" Area="RowArea" AreaIndex="3" Caption="Producto" FieldName="ItemName" Name="fieldItemName">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTipo" Area="ColumnArea" AreaIndex="0" Caption="Tipo" FieldName="Tipo" Name="fieldTipo">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCodigoPadre" Area="RowArea" AreaIndex="1" FieldName="CodigoPadre" Name="fieldCodigoPadre">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldGrupoProducto" Area="RowArea" AreaIndex="0" FieldName="GrupoProducto" Name="fieldGrupoProducto">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCodProveedor" FieldName="CodProveedor" Name="fieldCodProveedor" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldProveedor" AreaIndex="0" FieldName="Proveedor" Name="fieldProveedor" Visible="False">
                </dx:PivotGridField>
            </Fields>
            <OptionsView ShowColumnGrandTotalHeader="False" ShowColumnGrandTotals="False" ShowColumnTotals="False" ShowRowGrandTotalHeader="False" ShowRowGrandTotals="False" ShowRowTotals="False" ShowTotalsForSingleValues="True" />
        </dx:ASPxPivotGrid>
    <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" 
        ASPxPivotGridID="PvDatos">
    </dx:ASPxPivotGridExporter>
    </div>
</asp:Content>
