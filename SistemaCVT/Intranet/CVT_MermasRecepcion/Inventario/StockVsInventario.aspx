<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="StockVsInventario.aspx.cs" Inherits="CVT_MermasRecepcion.Inventario.StockVsInventario" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style6 {
            width: 12px;
        }
        .auto-style7 {
            width: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Inventario</a></li>
            <%--  <li><a href="../Inventario/Inventario.aspx">Inventario</a></li>--%>
            <li><span id="current">Comparativo Stock Vs Inventario</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Comparativo Stock Vs Inventario</span>
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
    <div style="margin-left: 15px">
        <table>
            <tr>
                <td class="auto-style6">
                    <dx:ASPxLabel ID="CodProducto" runat="server" Text="Cod.Producto"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cbo_CodProducto" runat="server" DataSourceID="LqDsProductos" ValueField="CodProducto" ForceDataBinding="True">
                        <Columns>
                            <dx:ListBoxColumn Caption="codigo" FieldName="CodProducto">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Producto" FieldName="producto">
                            </dx:ListBoxColumn>
                        </Columns>
                        <Items>
                            <dx:ListEditItem Text="Todos" Value="Todos" />
                        </Items>
                    </dx:ASPxComboBox>
                </td>
                <td class="auto-style7"></td>
                <td>
                    <dx:ASPxLabel ID="Bodega" runat="server" Text="Bodega"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cbo_Bodega" runat="server">
                        <Items>
                            <dx:ListEditItem Text="Todas" Value="Todas" />
                            <dx:ListEditItem Text="CV 100 Producto Terminado" Value="CV100" />
                            <dx:ListEditItem Text="CV 101 Materia Prima" Value="CV101" />
                            <dx:ListEditItem Text="CV 200 Merma" Value="CV200" />
                            <dx:ListEditItem Text="CV 400 Materiales" Value="CV400" />
                            <dx:ListEditItem Text="CV 105 Picking" Value="CV105" />
                            <dx:ListEditItem Text="CV 750 Bodega Seguros" Value="CV750" />
                            <dx:ListEditItem Text="CV 410 NC INSUMOS" Value="CV410" />
                            <dx:ListEditItem Text="CV 120 Producto Terceros" Value="CV120" />
                            <dx:ListEditItem Text="CV 201 Merma N" Value="CV201" />
                        </Items>
                    </dx:ASPxComboBox>
                </td>
                  <td class="auto-style7"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Folio Inventario"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboFolioInventario" runat="server" DataSourceID="LqsFolioInv" TextField="Inventario_Id" ValueField="Inventario_Id">
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
                <td>
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" Height="40px" OnClick="btnBuscar_Click"></dx:ASPxButton>
                </td>
            </tr>
            <asp:LinqDataSource ID="LqDsProductos" runat="server" EntityTypeName=""
                ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext"
                TableName="VW_PRODUCTOS_INFINVENTARIO">
            </asp:LinqDataSource>
            <asp:LinqDataSource ID="LqDsBodega" runat="server"
                ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
                TableName="VW_sitios_fefo2">
            </asp:LinqDataSource>
                    <asp:LinqDataSource ID="LqsFolioInv" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" Select="new (Inventario_Id)" TableName="CVT_CabeceraInventario">
                    </asp:LinqDataSource>
                </table>
    </div>
    <br />
    <div>
        <dx:ASPxPivotGrid ID="PvDatos" runat="server" ClientIDMode="AutoID">
            <Fields>
                <dx:PivotGridField ID="fieldCodProducto" FieldName="CodProducto" Name="fieldCodProducto" Area="RowArea" AreaIndex="3">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldProducto" FieldName="Producto" Name="fieldProducto" Area="RowArea" AreaIndex="4">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldBodega" FieldName="Bodega" Name="fieldBodega" Area="RowArea" AreaIndex="5">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldLote" FieldName="Lote" Name="fieldLote" Area="RowArea" AreaIndex="6">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCantidadWMS" FieldName="CantidadWMS" Name="fieldCantidadWMS" Area="DataArea" AreaIndex="0">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCantidadSAP" FieldName="CantidadSAP" Name="fieldCantidadSAP" Area="DataArea" AreaIndex="1">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldDiferencia" Area="DataArea" AreaIndex="2" FieldName="Diferencia" Name="fieldDiferencia">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldGrupo" Area="RowArea" AreaIndex="0" FieldName="Grupo" Name="fieldGrupo">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCuenta" Area="RowArea" AreaIndex="1" FieldName="Cuenta" Name="fieldCuenta">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldNombreCuenta" Area="RowArea" AreaIndex="2" FieldName="NombreCuenta" Name="fieldNombreCuenta">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldAvgPrice" Area="RowArea" AreaIndex="7" FieldName="AvgPrice" Name="fieldAvgPrice" ValueFormat-FormatString="N2" ValueFormat-FormatType="Custom" Caption="Precio Promedio">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCantidadInventario" FieldName="CantidadInventario" Name="fieldCantidadInventario" Area="DataArea" AreaIndex="3" Caption="Cantidad Inventario">
                </dx:PivotGridField>
            </Fields>
            <OptionsPager RowsPerPage="100">
            </OptionsPager>
        </dx:ASPxPivotGrid>
    </div>
    <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server"
        ASPxPivotGridID="PvDatos">
    </dx:ASPxPivotGridExporter>
</asp:Content>
