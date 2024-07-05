<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ProyeccionDeCobranza.aspx.cs" Inherits="CVT_MermasRecepcion.Tesoreria.ProyeccionDeCobranza" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
       <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Tesoreria</a></li>
            <li><span id="current">Cierre Tesoreria</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Proyeccion de Cobranza</span>
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
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha Inicio"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteInicio" runat="server"></dx:ASPxDateEdit>
                </td>
                <td class="auto-style5">

                </td>
                    <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Fecha Termino"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteTermino" runat="server"></dx:ASPxDateEdit>
                </td>
                <td>

                </td>
                <td>
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" Theme="iOS" OnClick="btnBuscar_Click"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>
        <dx:ASPxPivotGrid ID="PvDatos" runat="server" ClientIDMode="AutoID">
            <Fields>
                <dx:PivotGridField ID="fieldIdentificador" FieldName="Identificador" Name="fieldIdentificador" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldNFactura" FieldName="NFactura" Name="fieldNFactura" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMoneda" FieldName="Moneda" Name="fieldMoneda" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldEstado" FieldName="Estado" Name="fieldEstado" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCodCliente" Area="RowArea" AreaIndex="0" FieldName="CodCliente" Name="fieldCodCliente">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldNomCliente" Area="RowArea" AreaIndex="1" FieldName="NomCliente" Name="fieldNomCliente">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldFContabilizacion" FieldName="F_Contabilizacion" Name="fieldFContabilizacion" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldFVencimiento" FieldName="F_Vencimiento" Name="fieldFVencimiento" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldFDocumento" FieldName="F_Documento" Name="fieldFDocumento" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTotalDoc" Area="DataArea" AreaIndex="0" FieldName="TotalDoc" Name="fieldTotalDoc" CellFormat-FormatString="N0" ValueFormat-FormatString="C" ValueFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTotalDocME" FieldName="TotalDocME" Name="fieldTotalDocME" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCondPago" Area="RowArea" AreaIndex="2" FieldName="CondPago" Name="fieldCondPago">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldDias" FieldName="Dias" Name="fieldDias" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldReferencia" FieldName="Referencia" Name="fieldReferencia" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldComentarios" FieldName="Comentarios" Name="fieldComentarios" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldComentarios2" FieldName="Comentarios2" Name="fieldComentarios2" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldDiaVencimiento" Area="ColumnArea" AreaIndex="2" FieldName="DiaVencimiento" Name="fieldDiaVencimiento">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMesVencimiento" Area="ColumnArea" AreaIndex="1" FieldName="MesVencimiento" Name="fieldMesVencimiento">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldAnoVencimiento" Area="ColumnArea" AreaIndex="0" FieldName="AnoVencimiento" Name="fieldAnoVencimiento">
                </dx:PivotGridField>
            </Fields>
        </dx:ASPxPivotGrid>
    </div>
    <br />
    <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" 
        ASPxPivotGridID="PvDatos">
    </dx:ASPxPivotGridExporter>
    
    </asp:Content>
