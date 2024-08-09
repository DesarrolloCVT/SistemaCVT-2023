<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PendientesEntrega.aspx.cs" Inherits="CVT_MermasRecepcion.Logistica.PendientesEntrega" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Logistica</a></li>           
            <li><span id="current">Pendientes Entrega</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Pendientes Entrega</span>
        <span class="tab-end"></span>
           <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px; height: 20px;" />
                Exportar Excel</a>&nbsp;
             <%-- <a>
                  <asp:ImageButton ID="cmdNew" runat="server"
                      ImageUrl="~/Images/nuevo.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>--%>
        </div>
    </div>
    <br />
    <%--<div>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Fecha Inicio"></asp:Label>
                </td>
                <td>
                    <dx:ASPxDateEdit ID="dteFinicio" runat="server"></dx:ASPxDateEdit>
                </td>
                 <td>
                    &nbsp;  &nbsp;  &nbsp;
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Fecha Termino"></asp:Label>
                </td>
                <td>
                    <dx:ASPxDateEdit ID="dteFTermino" runat="server"></dx:ASPxDateEdit>
                </td>
                <td>
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="ver" OnClick="btnBuscar_Click"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>--%>
    <br />
    <br /> 
    <div>
    <dx1:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" 
        ASPxPivotGridID="PvDatos2">
    </dx1:ASPxPivotGridExporter>
    </div>
    <dx:ASPxPivotGrid ID="PvDatos2" runat="server" ClientIDMode="AutoID" Theme="Default">
        <Fields>
            <dx:PivotGridField ID="fieldCodCliente" FieldName="CodCliente" Name="fieldCodCliente" Area="RowArea" AreaIndex="1">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldCliente" FieldName="Cliente" Name="fieldCliente" Area="RowArea" AreaIndex="2">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldCodProducto" FieldName="CodProducto" Name="fieldCodProducto" Area="ColumnArea" AreaIndex="0">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldProducto" FieldName="Producto" Name="fieldProducto" Area="ColumnArea" AreaIndex="1">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldCantidad" FieldName="Cantidad" Name="fieldCantidad" Area="DataArea" AreaIndex="0">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldRegion" FieldName="Region" Name="fieldRegion" Area="RowArea" AreaIndex="0" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldCiudad" FieldName="Ciudad" Name="fieldCiudad" Area="RowArea" AreaIndex="4" Visible="False">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldComuna" FieldName="Comuna" Name="fieldComuna" Area="RowArea" AreaIndex="3">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldFechaEntrega" FieldName="FechaEntrega" Name="fieldFechaEntrega" Area="RowArea" AreaIndex="5" TotalsVisibility="None" ValueFormat-FormatString="dd-MM-yyyy" ValueFormat-FormatType="DateTime">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldNeto" FieldName="Neto" Name="fieldNeto" Area="RowArea" AreaIndex="6" RunningTotal="True">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldOC" FieldName="OC" Name="fieldOC" Area="RowArea" AreaIndex="7">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldLocal" Area="RowArea" AreaIndex="4" FieldName="Local" Name="fieldLocal">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fieldOrdenGeografico" Area="RowArea" AreaIndex="0" Caption="O.GEO" FieldName="Orden_Geografico" Name="fieldOrdenGeografico">
            </dx:PivotGridField>
        </Fields>
        <OptionsView ShowRowTotals="False" />
        <OptionsPager RowsPerPage="50">
        </OptionsPager>
    </dx:ASPxPivotGrid>
</asp:Content>
