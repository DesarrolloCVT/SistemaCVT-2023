<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InformeSemana.aspx.cs" Inherits="CVT_MermasRecepcion.Comex.InformeSemana" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
      <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Comex</a></li>
            <li><span id="current">Informe Compras internacionales</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Informe Compras internacionales</span>
        <span class="tab-end"></span>
        <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click1"
                    Style="height: 20px;" />
                Exportar Excel</a>&nbsp;

             
             <%-- <a>
                  <asp:ImageButton ID="cmdNew" runat="server"
                      ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>--%>
        </div>
    </div>
    <br />
    <div>
        <table>            
            <tr>
                <td>
                    <label>Fecha Inicio</label>
                </td>
                <td>
                    <dx:aspxdateedit id="dteInicio" runat="server"></dx:aspxdateedit>
                </td>
                <td>&nbsp;  &nbsp;  &nbsp;
                </td>
                <td>
                    <label>Fecha Termino</label>
                </td>
                <td>
                    <dx:aspxdateedit id="dteFtermino" runat="server"></dx:aspxdateedit>
                </td>
                <td>&nbsp;  &nbsp;  &nbsp;
                </td>
                        <td>
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="ver" OnClick="btnBuscar_Click"></dx:ASPxButton>
                </td>
        </table>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxPivotGrid ID="PvDatos" runat="server" ClientIDMode="AutoID">
            <Fields>
                <dx:PivotGridField ID="fieldTTransporte" Area="RowArea" AreaIndex="0" FieldName="TTransporte" Name="fieldTTransporte">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldNomProveedor" Area="RowArea" AreaIndex="1" FieldName="NomProveedor" Name="fieldNomProveedor">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldFacturaProv" Area="RowArea" AreaIndex="2" FieldName="FacturaProv" Name="fieldFacturaProv">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldFamProducto" Area="RowArea" AreaIndex="3" FieldName="Fam_Producto" Name="fieldFamProducto">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCantCont" Area="RowArea" AreaIndex="4" FieldName="CantCont" Name="fieldCantCont">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldLlegados" Area="RowArea" AreaIndex="5" FieldName="Llegados" Name="fieldLlegados">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldPendientes" Area="RowArea" AreaIndex="6" FieldName="Pendientes" Name="fieldPendientes">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldEstado" Area="RowArea" AreaIndex="7" FieldName="Estado" Name="fieldEstado">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldPagoTesorero" Area="RowArea" AreaIndex="8" FieldName="PagoTesorero" Name="fieldPagoTesorero">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldNomTransporte" Area="RowArea" AreaIndex="9" FieldName="Nom_Transporte" Name="fieldNomTransporte">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTotalFacturas" Area="DataArea" AreaIndex="0" CellFormat-FormatString="C" FieldName="Total_Facturas" Name="fieldTotalFacturas" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTotalPagos" Area="DataArea" AreaIndex="1" CellFormat-FormatString="C" FieldName="Total_Pagos" Name="fieldTotalPagos" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldNC" Area="DataArea" AreaIndex="2" CellFormat-FormatString="C" FieldName="NC" Name="fieldNC">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldSaldo" Area="DataArea" AreaIndex="2" CellFormat-FormatString="C" FieldName="Saldo" Name="fieldSaldo" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldNumAcuerdo" FieldName="NumAcuerdo" Name="fieldNumAcuerdo" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCodProveedor" FieldName="CodProveedor" Name="fieldCodProveedor" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldNumFactura" FieldName="NumFactura" Name="fieldNumFactura" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldReferencia" FieldName="Referencia" Name="fieldReferencia" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMoneda" FieldName="Moneda" Name="fieldMoneda" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTotalFacturasFC" CellFormat-FormatString="C" FieldName="Total_FacturasFC" Name="fieldTotalFacturasFC" Area="DataArea" AreaIndex="0">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTotalPagosFC" CellFormat-FormatString="C" FieldName="Total_PagosFC" Name="fieldTotalPagosFC" Area="DataArea" AreaIndex="1">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldNumeroNC" AreaIndex="0" FieldName="NumeroNC" Name="fieldNumeroNC" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldNCFC" AreaIndex="0" CellFormat-FormatString="C" FieldName="NCFC" Name="fieldNCFC" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldSaldoFC" AreaIndex="3" CellFormat-FormatString="C" FieldName="SaldoFC" Name="fieldSaldoFC" Area="DataArea">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldAnticipo" AreaIndex="0" CellFormat-FormatString="C" FieldName="Anticipo" Name="fieldAnticipo" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldFlete" AreaIndex="0" CellFormat-FormatString="C" FieldName="Flete" Name="fieldFlete" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCodTransporte" AreaIndex="0" FieldName="Cod_Transporte" Name="fieldCodTransporte" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldFCarga" AreaIndex="0" FieldName="F_Carga" Name="fieldFCarga" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldFLlegada" AreaIndex="0" FieldName="F_Llegada" Name="fieldFLlegada" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldNumPedido" FieldName="NumPedido" Name="fieldNumPedido" Visible="False">
                </dx:PivotGridField>
            </Fields>
            <OptionsPager AlwaysShowPager="True" RowsPerPage="10000">
            </OptionsPager>
        </dx:ASPxPivotGrid>
    </div>
    <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" 
        ASPxPivotGridID="PvDatos">
    </dx:ASPxPivotGridExporter>
    
</asp:Content>
