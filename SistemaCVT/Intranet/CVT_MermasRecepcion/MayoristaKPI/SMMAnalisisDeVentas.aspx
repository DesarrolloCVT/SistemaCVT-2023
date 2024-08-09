<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="SMMAnalisisDeVentas.aspx.cs" Inherits="CVT_MermasRecepcion.MayoristaKPI.SMMAnalisisDeVentas" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Mayorista</a></li>
            <li><span id="current">Análisis de  Ventas</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Análisis de Ventas</span>
        <span class="tab-end"></span>
        <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="height: 20px;" />
                Exportar Excel</a>&nbsp;
             <%-- <a>
                  <asp:ImageButton ID="cmdNew" runat="server"
                      ImageUrl="~/Images/nuevo.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>--%>
        </div>
    </div>
    <br />
    <div style="margin-left: 20px">
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Fecha Inicio"></asp:Label>
                    <dx:ASPxDateEdit ID="dteFinicio" runat="server" Height="30px"></dx:ASPxDateEdit>
                </td>
                <td class="auto-style5">&nbsp;  &nbsp;  &nbsp;
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Fecha Termino"></asp:Label>
                    <dx:ASPxDateEdit ID="dteFTermino" runat="server" Height="30px"></dx:ASPxDateEdit>
                </td>
                <td class="auto-style5"></td>
                <td>&nbsp;</td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="ver" OnClick="btnBuscar_Click" Height="45px" Theme="iOS" Width="97px">
                        <Image IconID="print_preview_16x16">
                        </Image>
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>

        <dx:ASPxPivotGrid ID="PvDatos" runat="server" ClientIDMode="AutoID">
            <Fields>
                <dx:PivotGridField ID="fieldMontoVenta" FieldName="MontoVenta" Name="fieldMontoVenta" Area="DataArea" AreaIndex="0">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCostoVenta" FieldName="CostoVenta" Name="fieldCostoVenta" Area="DataArea" AreaIndex="1">
                    <Options ShowGrandTotal="False" />
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCantidad1" Area="DataArea" AreaIndex="3" FieldName="Cantidad" Name="fieldCantidad1">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTicketProm" FieldName="TicketProm" Name="fieldTicketProm" Area="DataArea" AreaIndex="4">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMargen" FieldName="Margen" Name="fieldMargen" Area="DataArea" AreaIndex="2">
                    <Options ShowGrandTotal="False" />
                    <CellFormat FormatString="N2" FormatType="Custom" />
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMes" FieldName="Mes" Name="fieldMes" Area="ColumnArea" AreaIndex="0">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldGrupoCliente" FieldName="GrupoCliente" Name="fieldGrupoCliente" Area="RowArea" AreaIndex="0">
                </dx:PivotGridField>
            </Fields>
        </dx:ASPxPivotGrid>
        <%--<dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False">
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings ShowGroupPanel="True" ShowFooter="True" ShowGroupFooter="VisibleAlways" />
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="MontoVenta" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CostoVenta" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TicketProm" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Margen" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Mes" VisibleIndex="5"  GroupIndex="1" SortIndex="0" SortOrder="Ascending">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="GrupoCliente" VisibleIndex="6" GroupIndex="0" SortIndex="0" SortOrder="Ascending">
                    
                </dx:GridViewDataTextColumn>
            </Columns>
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat=" &quot;Total MontVenta: {0:N0}&quot;" FieldName="MontoVenta" ShowInColumn="Monto Venta" SummaryType="Sum" />
            </TotalSummary>
        </dx:ASPxGridView>--%>
    </div>
    <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server"
        ASPxPivotGridID="PvDatos">
    </dx:ASPxPivotGridExporter>
</asp:Content>
