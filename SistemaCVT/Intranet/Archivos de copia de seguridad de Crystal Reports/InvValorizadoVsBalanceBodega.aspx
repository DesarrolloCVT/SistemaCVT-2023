<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InvValorizadoVsBalanceBodega.aspx.cs" Inherits="CVT_MermasRecepcion.Inventario.InvValorizadoVsBalanceBodega" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
        <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Inventario</a></li>
            <li><span id="current">Inventario Valorizado Vs Balance</span></li>
        </ul>
    </div>
    <div id="tableHeader">
        <span class="tableTitle">Inventario Valorizado Vs Balance</span>
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
    <div></div>
    <dx:ASPxPivotGrid ID="PvDatos" runat="server" ClientIDMode="AutoID">
        <Fields>
            <dx:PivotGridField ID="fieldCodCTA" Area="RowArea" AreaIndex="0" FieldName="CodCTA" Name="fieldCodCTA">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldCTA" Area="RowArea" AreaIndex="1" FieldName="CTA" Name="fieldCTA">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldGrupo" Area="RowArea" AreaIndex="2" FieldName="Grupo" Name="fieldGrupo">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldCodProd" Area="RowArea" AreaIndex="3" FieldName="CodProd" Name="fieldCodProd">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldProducto" Area="RowArea" AreaIndex="4" FieldName="Producto" Name="fieldProducto">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldBodega" Area="ColumnArea" AreaIndex="0" FieldName="Bodega" Name="fieldBodega">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldInvValorizado" Area="DataArea" AreaIndex="0" FieldName="InvValorizado" Name="fieldInvValorizado" CellFormat-FormatString="N2" CellFormat-FormatType="Custom">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldSaldoBalance" Area="RowArea" AreaIndex="5" FieldName="SaldoBalance" Name="fieldSaldoBalance" ValueFormat-FormatString="N0" ValueFormat-FormatType="Custom">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldStock" Area="DataArea" AreaIndex="1" FieldName="Stock" Name="fieldStock" CellFormat-FormatString="N2" CellFormat-FormatType="Custom">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldPrecioPromedio" Area="RowArea" AreaIndex="6" CellFormat-FormatString="N2" CellFormat-FormatType="Custom" FieldName="PrecioPromedio" Name="fieldPrecioPromedio" ValueFormat-FormatString="N2" ValueFormat-FormatType="Custom">
            </dx:PivotGridField>
        </Fields>
        </dx:ASPxPivotGrid>

    <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" 
        ASPxPivotGridID="PvDatos">
    </dx:ASPxPivotGridExporter>
    
    </asp:Content>
