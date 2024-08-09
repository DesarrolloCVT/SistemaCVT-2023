<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="RotacionMerma.aspx.cs" Inherits="CVT_MermasRecepcion.WMS.RotacionMerma" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Merma </a></li>
            <li><span id="current">Merma</span></li>
        </ul>
    </div>
    <div id="tableHeader">
        <span class="tableTitle">Rotacion Mermas</span>
        <span class="tab-end"></span>
        <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="height: 20px;" />
                Exportar Excel</a>&nbsp;
           <%--   <a>
                  <asp:ImageButton ID="cmdNew" runat="server"
                      ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>--%>
        </div>
    </div>
    <br />
    <div>
        <dx:ASPxPivotGrid ID="PvDatos" runat="server" ClientIDMode="AutoID">
            <Fields>
                <dx:PivotGridField ID="fieldTipo" Area="ColumnArea" AreaIndex="2" FieldName="Tipo" Name="fieldTipo">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldFecha" FieldName="Fecha" Name="fieldFecha" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMes" Area="ColumnArea" AreaIndex="1" FieldName="Mes" Name="fieldMes">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldAo" Area="ColumnArea" AreaIndex="0" FieldName="Año" Name="fieldAo">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldNSAP" FieldName="NSAP" Name="fieldNSAP" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldBodOrigen" FieldName="BodOrigen" Name="fieldBodOrigen" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldBodDestino" FieldName="BodDestino" Name="fieldBodDestino" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldFamilia" Area="RowArea" AreaIndex="0" FieldName="Familia" Name="fieldFamilia">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldGrupo" FieldName="Grupo" Name="fieldGrupo" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCodProducto" FieldName="CodProducto" Name="fieldCodProducto" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldProducto" FieldName="Producto" Name="fieldProducto" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCantOP" FieldName="CantOP" Name="fieldCantOP" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldLote" FieldName="Lote" Name="fieldLote" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCantLote" Area="DataArea" AreaIndex="0" FieldName="CantLote" Name="fieldCantLote">
                </dx:PivotGridField>
            </Fields>
            <OptionsView ShowColumnGrandTotalHeader="False" ShowColumnGrandTotals="False" ShowColumnTotals="False" />
            <OptionsPager RowsPerPage="10000">
            </OptionsPager>
        </dx:ASPxPivotGrid>
    </div>


    <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" 
        ASPxPivotGridID="PvDatos">
    </dx:ASPxPivotGridExporter>
    
    
</asp:Content>
