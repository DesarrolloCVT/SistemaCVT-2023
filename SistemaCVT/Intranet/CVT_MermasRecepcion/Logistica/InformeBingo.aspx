<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="InformeBingo.aspx.cs" Inherits="CVT_MermasRecepcion.Logistica.InformeBingo" %>
<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>Logistica</a></li>
        <li><span id="current">Informe Rutas</span></li>
    </ul>
</div>
<br />
<br />
<div id="tableHeader">
    <span class="tableTitle">Informe Rutas</span>
    <span class="tab-end"></span>
   
    <br />
</div>
<div>

    <dx:ASPxPivotGrid ID="PvBingo" runat="server" ClientIDMode="AutoID" DataSourceID="LqDsBingo" IsMaterialDesign="False" OptionsData-DataProcessingEngine="Optimized" OptionsFilter-FilterPanelMode="Filter">
        <Fields>
            <dx:PivotGridField ID="fieldDescripcion"  FieldName="Descripcion" Area="DataArea" AreaIndex="0" Name="field" SummaryType="Max">
                <Options AllowExpand="True" />
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldFechaEntrega" FieldName="FechaEntrega" Area="RowArea" AreaIndex="0" Name="fieldFechaEntrega">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldCamion_ID" FieldName="Camion_ID" Area="ColumnArea" AreaIndex="0" Name="fieldCamion_ID">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldCamion" FieldName="Camion" Area="ColumnArea" AreaIndex="1" Name="fieldCamion">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldHorario" FieldName="Horario" Area="RowArea" AreaIndex="1" Name="fieldHorario" SummaryType="Max" SortMode="DisplayText">
            </dx:PivotGridField>
        </Fields>
        <OptionsView ShowColumnGrandTotalHeader="False" ShowColumnGrandTotals="False" ShowColumnTotals="False" ShowRowGrandTotalHeader="False" ShowRowGrandTotals="False" ShowRowTotals="False" />
        <OptionsPager ColumnsPerPage="10000" RowsPerPage="100000">
        </OptionsPager>
<OptionsData DataProcessingEngine="Optimized"></OptionsData>

<OptionsFilter FilterPanelMode="Filter"></OptionsFilter>
    </dx:ASPxPivotGrid>
    <asp:LinqDataSource ID="LqDsBingo" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_VW_AsignacionRutaAgenda">
    </asp:LinqDataSource>

</div>
</asp:Content>
