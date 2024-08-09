<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="CompromisoStockSMM.aspx.cs" Inherits="CVT_MermasRecepcion.Produccion.CompromisoStockSMM" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Inventario</a></li>       
            <li><span id="current">Compromiso Stock SMM</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Compromiso Stock SMM</span>
        <span class="tab-end"></span>
        <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px; height: 20px;" />
                Exportar Excel</a>            
        </div>
    </div>
    <div>
        <dx:ASPxPivotGrid ID="PvDatos" runat="server" ClientIDMode="AutoID">
            <Fields>
                <dx:PivotGridField ID="fieldItmsGrpNam" Area="RowArea" AreaIndex="1" Caption="Grupo Producto" FieldName="ItmsGrpNam" Name="fieldItmsGrpNam">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldItemCode" Area="RowArea" AreaIndex="2" Caption="Cod.Producto" FieldName="ItemCode" Name="fieldItemCode">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldItemName" Area="RowArea" AreaIndex="3" Caption="Producto" FieldName="ItemName" Name="fieldItemName">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldWhsCode" Area="ColumnArea" AreaIndex="0" Caption="Bodega" FieldName="WhsCode" Name="fieldWhsCode">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldOnHand" Area="DataArea" AreaIndex="0" Caption="Stock" FieldName="OnHand" Name="fieldOnHand" CellFormat-FormatString="N0" CellFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldClienteNombre" Area="RowArea" AreaIndex="0" Caption="Nombre C‪liente" FieldName="ClienteNombre" Name="fieldClienteNombre">
                </dx:PivotGridField>
            </Fields>
        </dx:ASPxPivotGrid>
    </div>
        <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" 
        ASPxPivotGridID="PvDatos">
    </dx:ASPxPivotGridExporter>
</asp:Content>
