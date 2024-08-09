<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="AnalisisCompra.aspx.cs" Inherits="CVT_MermasRecepcion.Comercial.AnalisisCompra" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Comercial</a></li>
            <li><span id="current">Analisis Compras</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Analisis Compras</span>
        <span class="tab-end"></span>
        <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click1" Height="30px" Width="32px" />
                Exportar Excel</a>&nbsp;
                
             
             <%-- <a>
                  <asp:ImageButton ID="cmdNew" runat="server"
                      ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>--%>
        </div>
    </div>
    <br />
    <div style="margin-left:50px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Grupo Proveedor" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboProveedor" runat="server" DataSourceID="LqsProveedores" ValueField="CodGrupProv">
                        <Columns>
                            <dx:ListBoxColumn FieldName="CodGrupProv" Width="100px">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn FieldName="Proveedor" Width="250px">
                            </dx:ListBoxColumn>
                        </Columns>
                    </dx:ASPxComboBox>
                    <asp:LinqDataSource ID="LqsProveedores" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="VW_GRUPO_PROVEEDOR_ANALISIS_COMPRA">
                    </asp:LinqDataSource>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Grupo Articulo" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboArticulo" runat="server" DataSourceID="LqsFamiliaProd" ValueField="CodGrupoProd">
                        <Columns>
                            <dx:ListBoxColumn FieldName="CodGrupoProd" Width="100px">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn FieldName="Producto" Width="250px">
                            </dx:ListBoxColumn>
                        </Columns>
                    </dx:ASPxComboBox>
                    <asp:LinqDataSource ID="LqsFamiliaProd" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="VW_GRUPO_PRODUCTOS_ANALISIS_COMPRA">
                    </asp:LinqDataSource>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left:50px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Mes" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboMes" runat="server">
                        <Items>
                            <dx:ListEditItem Text="Todos" Value="0" />
                            <dx:ListEditItem Text="Enero" Value="1" />
                            <dx:ListEditItem Text="Febrero" Value="2" />
                            <dx:ListEditItem Text="Marzo" Value="3" />
                            <dx:ListEditItem Text="Abril" Value="4" />
                            <dx:ListEditItem Text="Mayo" Value="5" />
                            <dx:ListEditItem Text="Junio" Value="6" />
                            <dx:ListEditItem Text="Julio" Value="7" />
                            <dx:ListEditItem Text="Agosto" Value="8" />
                            <dx:ListEditItem Text="Septiembre" Value="9" />
                            <dx:ListEditItem Text="Octubre" Value="10" />
                            <dx:ListEditItem Text="Noviembre" Value="11" />
                            <dx:ListEditItem Text="Diciembre" Value="12" />
                        </Items>
                    </dx:ASPxComboBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Año" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboAno" runat="server">
                        <Items>
                            <dx:ListEditItem Text="Todos" Value="0" />
                            <dx:ListEditItem Text="2017" Value="2017" />
                            <dx:ListEditItem Text="2018" Value="2018" />
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
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" Height="33px" OnClick="btnBuscar_Click"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>
        <dx:ASPxPivotGrid ID="PvDatos" runat="server" ClientIDMode="AutoID">
            <Fields>
                <dx:PivotGridField ID="fieldCodProveedor" Area="RowArea" AreaIndex="1" FieldName="CodProveedor" Name="fieldCodProveedor">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldProveedor" Area="RowArea" AreaIndex="2" FieldName="Proveedor" Name="fieldProveedor">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCodGrupoProveedor" Area="RowArea" AreaIndex="1" FieldName="CodGrupoProveedor" Name="fieldCodGrupoProveedor" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldGrupoProveedor" Area="RowArea" AreaIndex="0" FieldName="GrupoProveedor" Name="fieldGrupoProveedor">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldAO" Area="ColumnArea" AreaIndex="0" FieldName="AÑO" Name="fieldAO">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMES" Area="ColumnArea" AreaIndex="1" FieldName="MES" Name="fieldMES">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldGrupoProducto1" Area="RowArea" AreaIndex="3" FieldName="GrupoProducto" Name="fieldGrupoProducto1">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCodProducto" Area="RowArea" AreaIndex="4" FieldName="CodProducto" Name="fieldCodProducto">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldProducto" Area="RowArea" AreaIndex="5" FieldName="Producto" Name="fieldProducto">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCantidad" Area="DataArea" AreaIndex="0" CellFormat-FormatString="N0" CellFormat-FormatType="Custom" FieldName="Cantidad" Name="fieldCantidad">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTotalCL" Area="DataArea" AreaIndex="1" FieldName="TotalCL"  CellFormat-FormatString="N0" CellFormat-FormatType="Custom" Name="fieldTotalCL">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTotalFC" Area="DataArea" AreaIndex="2" FieldName="TotalFC"  CellFormat-FormatString="N3" CellFormat-FormatType="Custom" Name="fieldTotalFC">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldPrecioUnitCL" FieldName="PrecioUnitCL" Name="fieldPrecioUnitCL" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldPrecioUnitFC" FieldName="PrecioUnitFC" Name="fieldPrecioUnitFC" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMoneda" FieldName="Moneda" Name="fieldMoneda" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldPaisOrigen" Area="RowArea" AreaIndex="6" FieldName="PaisOrigen" Name="fieldPaisOrigen">
                </dx:PivotGridField>
            </Fields>
            <OptionsPager RowsPerPage="50">
            </OptionsPager>
        </dx:ASPxPivotGrid>
    </div>
       <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server" 
        ASPxPivotGridID="PvDatos">
    </dx:ASPxPivotGridExporter>
</asp:Content>
