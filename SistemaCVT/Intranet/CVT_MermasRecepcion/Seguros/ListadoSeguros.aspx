<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ListadoSeguros.aspx.cs" Inherits="CVT_MermasRecepcion.Seguros.ListadoSeguros" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
       <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Seguro</a></li>
            <li><span id="current">Listado Seguro</span></li>
        </ul>
    </div>
    <div id="tableHeader">
        <span class="tableTitle">Listado Seguro</span>
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
                <dx:PivotGridField ID="fieldPoliza" FieldName="Poliza" Name="fieldPoliza" Area="RowArea" AreaIndex="4">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCodCompaia" FieldName="CodCompañia" Name="fieldCodCompaia" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCompaia" FieldName="Compañia" Name="fieldCompaia" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTipoSeguro" FieldName="TipoSeguro" Name="fieldTipoSeguro" Area="RowArea" AreaIndex="1">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldRUTEmpresa" FieldName="RUTEmpresa" Name="fieldRUTEmpresa" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldEmpresaAsegurada" FieldName="EmpresaAsegurada" Name="fieldEmpresaAsegurada" Area="RowArea" AreaIndex="0">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldPrimaAfecta" FieldName="PrimaAfecta" Name="fieldPrimaAfecta" Area="DataArea" AreaIndex="0" CellFormat-FormatString="N4" CellFormat-FormatType="Custom" ValueFormat-FormatString="N4" ValueFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldPrimaExenta" FieldName="PrimaExenta" Name="fieldPrimaExenta" Area="DataArea" AreaIndex="1" CellFormat-FormatString="N4" CellFormat-FormatType="Custom" ValueFormat-FormatString="N4" ValueFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldPrimaTotal" FieldName="PrimaTotal" Name="fieldPrimaTotal" Area="DataArea" AreaIndex="2" CellFormat-FormatString="N4" CellFormat-FormatType="Custom" ValueFormat-FormatString="N4" ValueFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldFechaInicio" FieldName="FechaInicio" Name="fieldFechaInicio" Area="RowArea" AreaIndex="2">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldFechaTermino" FieldName="FechaTermino" Name="fieldFechaTermino" Area="RowArea" AreaIndex="3">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCantidadCuotas" FieldName="CantidadCuotas" Name="fieldCantidadCuotas" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMateriaAsegurada" FieldName="MateriaAsegurada" Name="fieldMateriaAsegurada" Area="RowArea" AreaIndex="5">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMontoAsegurado" FieldName="MontoAsegurado" Name="fieldMontoAsegurado" Area="RowArea" AreaIndex="8">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldObservacion" FieldName="Observacio" Name="fieldObservacion" Caption="Observacion" Area="RowArea" AreaIndex="6">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldValorMensual" FieldName="ValorMensual" Name="fieldValorMensual" Area="DataArea" AreaIndex="3" CellFormat-FormatString="N4" CellFormat-FormatType="Custom" ValueFormat-FormatString="N4" ValueFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMoneda" FieldName="Moneda" Name="fieldMoneda" Area="RowArea" AreaIndex="7">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldNFactura" FieldName="NFactura" Name="fieldNFactura" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCodProveedor" FieldName="CodProveedor" Name="fieldCodProveedor" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldProveedor" FieldName="Proveedor" Name="fieldProveedor" Visible="False">
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
