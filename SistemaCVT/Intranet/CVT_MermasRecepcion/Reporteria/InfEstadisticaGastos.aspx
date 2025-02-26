﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="InfEstadisticaGastos.aspx.cs" Inherits="CVT_MermasRecepcion.Reporteria.InfEstadisticaGastos" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"    Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
<div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>Informes</a></li>
        <li><span id="current">Estadisticas de Gastos</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Gastos</span>
    <span class="tab-end"></span>
    <div id="options">         
          <a><asp:ImageButton ID="cmdExcel" runat="server" 
              ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" onclick="cmdExcel_Click" 
              style="width: 20px"/> Exportar Excel</a>
    </div>
</div>
<div>
    <dx:ASPxPivotGrid ID="PvDatos" runat="server" ClientIDMode="AutoID" 
        DataSourceID="LqDsPresupuesto">
        <Fields>
            <dx:PivotGridField ID="fieldAO" FieldName="AÑO" 
                Name="fieldAO" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldArea" FieldName="Area" Name="fieldArea" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldCCosto" FieldName="CCosto" 
                Name="fieldCCosto" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldCentroCosto" FieldName="Centro_Costo" 
                Name="fieldCentroCosto" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldClasificacion" FieldName="Clasificacion" 
                Name="fieldClasificacion" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldCodCuenta" FieldName="Cod_Cuenta" 
                Name="fieldCodCuenta" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldCuenta" FieldName="Cuenta" 
                Name="fieldCuenta" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldGastoItem" FieldName="Gasto_Item" 
                Name="fieldGastoItem" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldItem" FieldName="Item" Name="fieldItem" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldMes" FieldName="Mes" Name="fieldMes" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldValor" FieldName="Valor" Name="fieldValor" 
                Visible="False">
            </dx:PivotGridField>
        </Fields>
        <OptionsPager AlwaysShowPager="True" ColumnsPerPage="0" RowsPerPage="0">
        </OptionsPager>
    </dx:ASPxPivotGrid>
    <asp:LinqDataSource ID="LqDsPresupuesto" runat="server" 
        ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" 
        TableName="CVT_Estadistica_Gastos">
    </asp:LinqDataSource>
    <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" 
        ASPxPivotGridID="PvDatos">
    </dx:ASPxPivotGridExporter>
</div>
</asp:Content>
