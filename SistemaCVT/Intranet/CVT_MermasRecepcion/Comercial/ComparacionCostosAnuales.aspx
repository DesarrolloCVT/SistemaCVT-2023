<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ComparacionCostosAnuales.aspx.cs" Inherits="CVT_MermasRecepcion.Comercial.ComparacionCostosAnuales" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Comex</a></li>
            <li><span id="current">Comparacion Costos Anuales</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Comparacion Costos Anuales</span>
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
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Año"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboAno" runat="server">
                        <Items>
                            <dx:ListEditItem Text="2019" Value="2019" />
                            <dx:ListEditItem Text="2020" Value="2020" />
                            <dx:ListEditItem Text="2021" Value="2021" />
                            <dx:ListEditItem Text="2022" Value="2022" />
                            <dx:ListEditItem Text="2023" Value="2023" />
                            <dx:ListEditItem Text="2024" Value="2024" />
                            <dx:ListEditItem Text="2025" Value="2025" />
                            <dx:ListEditItem Text="2026" Value="2026" />
                            <dx:ListEditItem Text="2027" Value="2027" />
                            <dx:ListEditItem Text="2028" Value="2028" />
                            <dx:ListEditItem Text="2029" Value="2029" />
                            <dx:ListEditItem Text="2030" Value="2030" />
                        </Items>
                    </dx:ASPxComboBox>
                </td>
                <td class="auto-style5">
                    
                </td>
                <td>
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" Theme="iOS" OnClick="btnBuscar_Click"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxPivotGrid ID="PvDatos" runat="server" ClientIDMode="AutoID">
            <Fields>
                <dx:PivotGridField ID="fieldAno" Area="ColumnArea" AreaIndex="0" FieldName="Ano" Name="fieldAno">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldAcctCode" Area="RowArea" AreaIndex="0" FieldName="AcctCode" Name="fieldAcctCode">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCuenta" Area="RowArea" AreaIndex="1" FieldName="Cuenta" Name="fieldCuenta">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldDivision" Area="RowArea" AreaIndex="2" FieldName="Division" Name="fieldDivision">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldUnAdm" Area="RowArea" AreaIndex="3" FieldName="UnAdm" Name="fieldUnAdm">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCenCosto" Area="RowArea" AreaIndex="4" FieldName="Cen_Costo" Name="fieldCenCosto">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCodItem" Area="RowArea" AreaIndex="6" FieldName="Cod_Item" Name="fieldCodItem" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldDescItem" Area="RowArea" AreaIndex="5" FieldName="Desc_Item" Name="fieldDescItem">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCentroCosto" Area="RowArea" AreaIndex="4" FieldName="Centro_Costo" Name="fieldCentroCosto" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldGastoItem" FieldName="Gasto_Item" Name="fieldGastoItem" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldClasificacion" Area="RowArea" AreaIndex="6" FieldName="Clasificacion" Name="fieldClasificacion">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldEnero" Area="DataArea" AreaIndex="0" FieldName="Enero" Name="fieldEnero">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldFebrero" Area="DataArea" AreaIndex="1" FieldName="Febrero" Name="fieldFebrero">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMarzo" Area="DataArea" AreaIndex="2" FieldName="Marzo" Name="fieldMarzo">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldAbril" Area="DataArea" AreaIndex="3" FieldName="Abril" Name="fieldAbril">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMayo" Area="DataArea" AreaIndex="4" FieldName="Mayo" Name="fieldMayo">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldJunio1" Area="DataArea" AreaIndex="5" FieldName="Junio" Name="fieldJunio1">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldJulio" Area="DataArea" AreaIndex="6" FieldName="Julio" Name="fieldJulio">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldAgosto" Area="DataArea" AreaIndex="7" FieldName="Agosto" Name="fieldAgosto">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldSeptiembre" Area="DataArea" AreaIndex="8" FieldName="Septiembre" Name="fieldSeptiembre">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldOctubre" Area="DataArea" AreaIndex="9" FieldName="Octubre" Name="fieldOctubre">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldNoviembre" Area="DataArea" AreaIndex="10" FieldName="Noviembre" Name="fieldNoviembre">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldDiciembre" Area="DataArea" AreaIndex="11" FieldName="Diciembre" Name="fieldDiciembre">
                </dx:PivotGridField>
            </Fields>
            <OptionsView ShowColumnGrandTotalHeader="False" ShowColumnGrandTotals="False" />
            <OptionsPager RowsPerPage="100">
            </OptionsPager>
        </dx:ASPxPivotGrid>
    </div>
    <br />
    <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" 
        ASPxPivotGridID="PvDatos">
    </dx:ASPxPivotGridExporter>
    
    <br />



</asp:Content>
