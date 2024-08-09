<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="InfResumenProduccion.aspx.cs" Inherits="CVT_MermasRecepcion.Reporteria.InfResumenProduccion" %>
<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"    Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
<div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>Informes</a></li>
        <li><span id="current">Resumen Produccion</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Resumen Produccion</span>
    <span class="tab-end"></span>
    <div id="options">         
          <a><asp:ImageButton ID="cmdExcel" runat="server" 
              ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" onclick="cmdExcel_Click" 
              style="width: 20px"/> Exportar Excel</a>
    </div>
</div>
<div>
    <dx:ASPxPivotGrid ID="PvResumen" runat="server" ClientIDMode="AutoID" 
        DataSourceID="LqDsResumen">
        <Fields>
            <dx:PivotGridField ID="fieldAo" FieldName="Año" Name="fieldAo" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldBarrido" FieldName="Barrido" Name="fieldBarrido" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldCantPTReal" FieldName="CantPTReal" 
                Name="fieldCantPTReal" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldCategoriaNombre" FieldName="Categoria_Nombre" 
                Name="fieldCategoriaNombre" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldCodProducto" FieldName="CodProducto" 
                Name="fieldCodProducto" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldComentario" FieldName="Comentario" 
                Name="fieldComentario" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldDetencionMotivo" FieldName="Detencion_Motivo" 
                Name="fieldDetencionMotivo" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldDia" FieldName="Dia" Name="fieldDia" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldFamilia" FieldName="Familia" Name="fieldFamilia" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldFecha" FieldName="Fecha" Name="fieldFecha" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldLinea" FieldName="Linea" Name="fieldLinea" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldMaquina" FieldName="Maquina" Name="fieldMaquina" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldMes" FieldName="Mes" Name="fieldMes" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldMETA" FieldName="META" Name="fieldMETA" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldOF" FieldName="OF" Name="fieldOF" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldOperador" FieldName="Operador" Name="fieldOperador" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldPORCCUMPLIMIENTO" FieldName="PORC_CUMPLIMIENTO" 
                Name="fieldPORCCUMPLIMIENTO" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldProducto" FieldName="Producto" Name="fieldProducto" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldReproceso" FieldName="Reproceso" 
                Name="fieldReproceso" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldSala" FieldName="Sala" Name="fieldSala" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldTotalDetenciones" FieldName="TotalDetenciones" 
                Name="fieldTotalDetenciones" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldTotalMinutosDetencion" 
                FieldName="TotalMinutosDetencion" Name="fieldTotalMinutosDetencion" 
                Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldTurno" FieldName="Turno" Name="fieldTurno" 
                Visible="False">
            </dx:PivotGridField>
        </Fields>
        <OptionsPager AlwaysShowPager="True" ColumnsPerPage="0" RowsPerPage="0">
        </OptionsPager>
    </dx:aspxpivotgrid>
    <asp:LinqDataSource ID="LqDsResumen" runat="server" 
        ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" 
        TableName="CVT_VW_ResumenProduccion" EnableDelete="True" 
        EnableInsert="True" EnableUpdate="True">
    </asp:LinqDataSource>
        <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" 
        ASPxPivotGridID="PvResumen">
    </dx:ASPxPivotGridExporter>
</div>
</asp:Content>
