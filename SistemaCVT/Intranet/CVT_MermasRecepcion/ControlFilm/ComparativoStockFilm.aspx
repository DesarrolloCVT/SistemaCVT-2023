<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ComparativoStockFilm.aspx.cs" Inherits="CVT_MermasRecepcion.ControlFilm.ComparativoStockFilm" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            height: 81px;
        }
        .auto-style6 {
            width: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Inventario</a></li>
            <%--  <li><a href="../Inventario/Inventario.aspx">Inventario</a></li>--%>
            <li><span id="current">Comparativo Stock FILM</span></li>
        </ul>
    </div>
    <div id="tableHeader">
        <span class="tableTitle">Comparativo Stock FILM</span>
        <span class="tab-end"></span>
        <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px" />
                Exportar Excel</a>
            <%--<a>
                <asp:ImageButton ID="cmdNew" runat="server"
                    ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>
        </div>--%>
        </div>
    </div>
    <br />
    <div style="margin-left: 30px">
        <table>
            <tr>
                <td class="auto-style5">
                    <dx:ASPxLabel ID="CodProducto" runat="server" Text="Cod.Producto"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboProducto" runat="server" DataSourceID="LqsProducto" Height="30px" Width="400px" ValueField="CodProducto">
                        <Columns>
                            <dx:ListBoxColumn FieldName="CodProducto" Width="150px">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn FieldName="Producto" Width="300px">
                            </dx:ListBoxColumn>
                        </Columns>
                    </dx:ASPxComboBox>
                    <asp:LinqDataSource ID="LqsProducto" runat="server" EntityTypeName="" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" TableName="VW_PRODUCTOS_FILM">
                    </asp:LinqDataSource>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 30px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Bodega"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboBodega" runat="server" Height="30px">
                        <Items>
                            <dx:ListEditItem Text="Todas" Value="Todas" />
                            <dx:ListEditItem Text="CV 400 Materiales" Value="CV400" />
                            <dx:ListEditItem Text="CV 300	Producción" Value="CV300" />
                            <dx:ListEditItem Text="CV 410 NC INSUMOS" Value="CV410" />
                        </Items>
                    </dx:ASPxComboBox>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Lote"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtLote" runat="server" Width="170px" Height="30px"></dx:ASPxTextBox>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" Height="50px" Width="100px" OnClick="btnBuscar_Click"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>
        <dx:ASPxPivotGrid ID="PvDatos" runat="server" ClientIDMode="AutoID">
            <Fields>
                <dx:PivotGridField ID="fieldGrupo" Area="RowArea" AreaIndex="0" FieldName="Grupo" Name="fieldGrupo">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCuenta" Area="RowArea" AreaIndex="1" FieldName="Cuenta" Name="fieldCuenta">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldNombreCuenta" Area="RowArea" AreaIndex="2" FieldName="NombreCuenta" Name="fieldNombreCuenta">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCodProducto" Area="RowArea" AreaIndex="3" FieldName="CodProducto" Name="fieldCodProducto">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldProducto" Area="RowArea" AreaIndex="4" FieldName="Producto" Name="fieldProducto">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldPrecioPromedio" Area="RowArea" AreaIndex="7" FieldName="PrecioPromedio" Name="fieldPrecioPromedio">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldBodega" Area="RowArea" AreaIndex="5" FieldName="Bodega" Name="fieldBodega">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldLote" Area="RowArea" AreaIndex="6" FieldName="Lote" Name="fieldLote">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCantidadWMS" Area="DataArea" AreaIndex="0" Caption="Cantidad" FieldName="CantidadWMS" Name="fieldCantidadWMS" CellFormat-FormatString="N4" CellFormat-FormatType="Custom" ValueFormat-FormatString="N4" ValueFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCantidadSAP" Area="DataArea" AreaIndex="1" FieldName="CantidadSAP" Name="fieldCantidadSAP" CellFormat-FormatString="N4" CellFormat-FormatType="Custom" ValueFormat-FormatString="N4" ValueFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldDiferencia" Area="DataArea" AreaIndex="2" FieldName="Diferencia" Name="fieldDiferencia" CellFormat-FormatString="N4" CellFormat-FormatType="Custom" ValueFormat-FormatString="N4" ValueFormat-FormatType="Custom">
                </dx:PivotGridField>
            </Fields>
            <OptionsPager RowsPerPage="150">
            </OptionsPager>
        </dx:ASPxPivotGrid>
        <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server">
        </dx:ASPxPivotGridExporter>
    </div>

</asp:Content>
