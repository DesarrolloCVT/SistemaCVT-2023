<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ToneladasMovidas.aspx.cs" Inherits="CVT_MermasRecepcion.Reporteria.ToneladasMovidas" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
<div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>Informes</a></li>
        <li><span id="current">Toneladas Movidad</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Toneladas Movidas</span>
    <span class="tab-end"></span>
    <div id="options">         
          <a><asp:ImageButton ID="cmdExcel" runat="server" 
              ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" onclick="cmdExcel_Click" 
              style="width: 20px"/> Exportar Excel</a>
    </div>
</div>
<div>
    <dx:ASPxPivotGrid ID="PvDatos" runat="server" ClientIDMode="AutoID" 
        DataSourceID="LqDsTON">
       
        <Fields>
            <dx:PivotGridField ID="fieldAO" Area="ColumnArea" AreaIndex="0" FieldName="AÑO" 
                Name="fieldAO">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldDIA" Area="ColumnArea" AreaIndex="2" 
                FieldName="DIA" Name="fieldDIA">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldMES" Area="ColumnArea" AreaIndex="1" 
                FieldName="MES" Name="fieldMES">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldDocNum" FieldName="DocNum" Name="fieldDocNum" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldDscription" FieldName="Dscription" 
                Name="fieldDscription" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldItemCode" FieldName="ItemCode" Name="fieldItemCode" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldItmsGrpNam" FieldName="ItmsGrpNam" 
                Name="fieldItmsGrpNam" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldPeso" FieldName="Peso" Name="fieldPeso" 
                Visible="False" CellFormat-FormatString="N2" 
                CellFormat-FormatType="Numeric">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldQuantity" FieldName="Quantity" Name="fieldQuantity" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldTIPO" Area="RowArea" AreaIndex="0" FieldName="TIPO" 
                Name="fieldTIPO">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldTON" Area="DataArea" AreaIndex="0" FieldName="TON" 
                Name="fieldTON" CellFormat-FormatString="N2" 
                CellFormat-FormatType="Numeric">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldTProducto" Area="RowArea" AreaIndex="1" 
                FieldName="TProducto" Name="fieldTProducto">
            </dx:PivotGridField>
        </Fields>
       
        <OptionsPager AlwaysShowPager="True" ColumnsPerPage="0" RowsPerPage="0">
        </OptionsPager>
    </dx:ASPxPivotGrid>
    <asp:LinqDataSource ID="LqDsTON" runat="server" 
        ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" 
        TableName="CVT_TONELADAS_MOVIDAS">
    </asp:LinqDataSource>
    <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" 
        ASPxPivotGridID="PvDatos">
    </dx:ASPxPivotGridExporter>
</div>
</asp:Content>
