﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="IndProduccionPV.aspx.cs" Inherits="CVT_MermasRecepcion.Reporteria.IndProduccionPV" %>
<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
<div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>Informes</a></li>
        <li><span id="current">Indicador Produccion</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Indicador Produccion</span>
    <span class="tab-end"></span>
    <div id="options">         
          <a><asp:ImageButton ID="cmdExcel" runat="server" 
              ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" onclick="cmdExcel_Click" 
              style="width: 20px"/> Exportar Excel</a>
    </div>
</div>
<div>
    <dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientIDMode="AutoID" 
        DataSourceID="LqDsIndProduccion">
        <Fields>
            <dx:PivotGridField ID="fieldAo" FieldName="Año" Name="fieldAo" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldBarrido" FieldName="Barrido" Name="fieldBarrido" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldCantidad" FieldName="Cantidad" Name="fieldCantidad" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldCODIGO" FieldName="CODIGO" Name="fieldCODIGO" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldDia" FieldName="Dia" Name="fieldDia" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldFECHA" FieldName="FECHA" Name="fieldFECHA" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldGRUPO" FieldName="GRUPO" Name="fieldGRUPO" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldMes" FieldName="Mes" Name="fieldMes" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldOF" FieldName="OF" Name="fieldOF" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldPRODUCTO" FieldName="PRODUCTO" Name="fieldPRODUCTO" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldReproceso" FieldName="Reproceso" 
                Name="fieldReproceso" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldSEMANA" FieldName="SEMANA" Name="fieldSEMANA" 
                Visible="False">
            </dx:PivotGridField>
        </Fields>
    </dx:ASPxPivotGrid>
    <asp:LinqDataSource ID="LqDsIndProduccion" runat="server" 
        ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" 
        TableName="VW_CVT_IndProduccion">
    </asp:LinqDataSource>
</div>
</asp:Content>
