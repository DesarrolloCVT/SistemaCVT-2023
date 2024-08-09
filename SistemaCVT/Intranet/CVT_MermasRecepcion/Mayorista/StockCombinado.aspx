<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="StockCombinado.aspx.cs" Inherits="CVT_MermasRecepcion.Mayorista.StockCombinado" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
       <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Mayorista</a></li>
            <li><span id="current">Stock Combinado</span></li>
        </ul>
    </div>
    <div id="tableHeader">
        <span class="tableTitle">Stock Combinado</span>
        <span class="tab-end"></span>
        <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px;" />
                Exportar Excel</a>&nbsp;
         <%--     <a>
                  <asp:ImageButton ID="cmdNew" runat="server"
                      ImageUrl="~/Images/nuevo.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>--%>
        </div>
    </div>
    <div>
        <dx:ASPxPivotGrid ID="PvDatos" runat="server" ClientIDMode="AutoID">
            <Fields>
                <dx:PivotGridField ID="fieldItmsGrpNam" FieldName="ItmsGrpNam" Name="fieldItmsGrpNam" Area="RowArea" AreaIndex="2" Caption="Grupo Producto">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldItemCode" Area="RowArea" AreaIndex="3" Caption="Cod.Producto" FieldName="ItemCode" Name="fieldItemCode">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldItemName" Area="RowArea" AreaIndex="4" Caption="Producto" FieldName="ItemName" Name="fieldItemName">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldWhsCode" Area="ColumnArea" AreaIndex="0" Caption="Bodega" FieldName="WhsCode" Name="fieldWhsCode">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldOnHand" Area="DataArea" AreaIndex="0" Caption="Stock" CellFormat-FormatString="N0" CellFormat-FormatType="Custom" FieldName="OnHand" Name="fieldOnHand">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCardCode" Area="RowArea" AreaIndex="0" Caption="Cod.Proveedor" FieldName="CardCode" Name="fieldCardCode">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCardName" Area="RowArea" AreaIndex="1" Caption="Proveedor" FieldName="CardName" Name="fieldCardName">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldPPRomSMM" Area="RowArea" AreaIndex="5" CellFormat-FormatString="N4" CellFormat-FormatType="Custom" FieldName="PPRomSMM" Name="fieldPPRomSMM" ValueFormat-FormatString="N4" ValueFormat-FormatType="Custom" Caption="PProm SMM">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldUltCompraSMM" Area="RowArea" AreaIndex="6" CellFormat-FormatString="N4" CellFormat-FormatType="Custom" FieldName="UltCompraSMM" Name="fieldUltCompraSMM" ValueFormat-FormatString="N4" ValueFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldPPromCVT" Area="RowArea" AreaIndex="7" FieldName="PPromCVT" Name="fieldPPromCVT">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldUltCompraCVT" Area="RowArea" AreaIndex="8" FieldName="UltCompraCVT" Name="fieldUltCompraCVT">
                </dx:PivotGridField>
            </Fields>
            <OptionsView ShowRowTotals="False" />
            <OptionsPager RowsPerPage="10000">
            </OptionsPager>
        </dx:ASPxPivotGrid>
    </div>
    <br />

    <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" 
        ASPxPivotGridID="PvDatos">
    </dx:ASPxPivotGridExporter>  
</asp:Content>
