<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Rentabilidad.aspx.cs" Inherits="CVT_MermasRecepcion.MayoristaReportes.Rentabilidad" %>

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
            <li><a>Mayorista</a></li>
            <li><span id="current">Rentabilidad</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Rentabilidad</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <br />
    <div style="margin-left: 25px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha Inicio "></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteFInicio" runat="server" Height="30px"></dx:ASPxDateEdit>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Fecha Termino"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteFTermino" runat="server" Height="30px"></dx:ASPxDateEdit>
                </td>
                <td class="auto-style5"></td>
                <td style="padding-top: 10px">
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" Height="30px" Theme="iOS" OnClick="btnBuscar_Click"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Rentabilidad Mensual" Font-Bold="true" Font-Size="Large"></dx:ASPxLabel>
    </div>
    <br />
    <div>
        <dx:ASPxButton ID="BtnExpotar1" runat="server" Text="Exportar Excel" Theme="MaterialCompact" OnClick="BtnExpotar1_Click">
            <Image IconID="export_exporttoxls_16x16">
            </Image>
        </dx:ASPxButton>
        <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server"
            ASPxPivotGridID="GvDatosA">
        </dx:ASPxPivotGridExporter>

    </div>
    <div>
        <dx:ASPxPivotGrid ID="GvDatosA" runat="server" ClientIDMode="AutoID">
            <Fields>
                <dx:PivotGridField ID="fieldMes" FieldName="Mes" Name="fieldMes" Area="ColumnArea" AreaIndex="0">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldGrupo" FieldName="Grupo" Name="fieldGrupo" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCodProducto" FieldName="CodProducto" Name="fieldCodProducto" Area="RowArea" AreaIndex="0">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldProducto" FieldName="Producto" Name="fieldProducto" Area="RowArea" AreaIndex="1">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldQ" FieldName="Q" Name="fieldQ" Area="DataArea" AreaIndex="0" CellFormat-FormatString="N0" CellFormat-FormatType="Custom" ValueFormat-FormatString="N0" ValueFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldPrecioUnitarioVentaPromedio" FieldName="PrecioUnitarioVenta_Promedio" Name="fieldPrecioUnitarioVentaPromedio" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldCostoUnitarioPromedio" FieldName="CostoUnitario_Promedio" Name="fieldCostoUnitarioPromedio" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="FTotalVenta" FieldName="TotalVenta" Name="fieldTotalVenta" Area="DataArea" AreaIndex="1" CellFormat-FormatString="N0" CellFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldParcipicionVenta" FieldName="ParcipicionVenta" Name="fieldParcipicionVenta" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="FMargen" FieldName="Margen" Name="fieldMargen" Area="DataArea" AreaIndex="2" CellFormat-FormatString="N2" CellFormat-FormatType="Custom" SummaryType="Average">
                </dx:PivotGridField>
            </Fields>
        </dx:ASPxPivotGrid>
    </div>
    <br />
    <br />
    <br />
    <div>
        <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Rentabilidad por Grupo Cliente" Font-Bold="true" Font-Size="Large"></dx:ASPxLabel>
    </div>
    <br /> 
    <div>
        <dx:ASPxButton ID="Exportar2" runat="server" Text="Exportar Excel" Theme="MaterialCompact" OnClick="Exportar2_Click">
            <Image IconID="export_exporttoxls_16x16">
            </Image>
        </dx:ASPxButton>
        <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter2" runat="server"
            ASPxPivotGridID="GvDatosC">
        </dx:ASPxPivotGridExporter>

    </div>
    <div>
        <dx:ASPxPivotGrid ID="GvDatosC" runat="server" ClientIDMode="AutoID">
            <Fields>
                <dx:PivotGridField ID="fieldGrupoCliente" FieldName="GrupoCliente" Name="fieldGrupoCliente" Area="RowArea" AreaIndex="0">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTotalVenta" FieldName="TotalVenta" Name="fieldTotalVenta" Area="DataArea" AreaIndex="1" CellFormat-FormatString="N0" CellFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldParticipacion" FieldName="Participacion" Name="fieldParticipacion" Area="DataArea" AreaIndex="0" CellFormat-FormatString="N0" CellFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMargen" FieldName="Margen" Name="fieldMargen" Area="DataArea" AreaIndex="2" CellFormat-FormatString="N0" CellFormat-FormatType="Custom" SummaryType="Average">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fiMes" FieldName="Mes" Name="fieldMes" Area="ColumnArea" AreaIndex="0">
                </dx:PivotGridField>
            </Fields>
        </dx:ASPxPivotGrid>
    </div>
    <br />
    <br />
    <br />
    <div>
        <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Rotacion Mensual" Font-Bold="true" Font-Size="Large"></dx:ASPxLabel>
    </div>
    <br />  
    <div>
        <dx:ASPxButton ID="Exportar3" runat="server" Text="Exportar Excel" Theme="MaterialCompact" OnClick="Exportar3_Click">
            <Image IconID="export_exporttoxls_16x16">
            </Image>
        </dx:ASPxButton>

        <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter3" runat="server"
            ASPxPivotGridID="GvDatosF">
        </dx:ASPxPivotGridExporter>

    </div>
    <div>
        <dx:ASPxPivotGrid ID="GvDatosF" runat="server" ClientIDMode="AutoID">
            <Fields>
                <dx:PivotGridField ID="fieldCodProveedor" FieldName="CodProveedor" Name="fieldCodProveedor" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldProveedor" FieldName="Proveedor" Name="fieldProveedor" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fiCodProducto" FieldName="CodProducto" Name="fieldCodProducto" Area="RowArea" AreaIndex="0">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fiProducto" FieldName="Producto" Name="fieldProducto" Area="RowArea" AreaIndex="1">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldStockActual" FieldName="StockActual" Name="fieldStockActual" Area="DataArea" AreaIndex="0" CellFormat-FormatString="N0" CellFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldUltimoMes" FieldName="UltimoMes" Name="fieldUltimoMes" Area="DataArea" AreaIndex="1" CellFormat-FormatString="N0" CellFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldDosMeses" FieldName="DosMeses" Name="fieldDosMeses" Area="DataArea" AreaIndex="2" CellFormat-FormatString="N0" CellFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTresMeses" FieldName="TresMeses" Name="fieldTresMeses" Area="DataArea" AreaIndex="3" CellFormat-FormatString="N0" CellFormat-FormatType="Custom">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldStockEnMeses" FieldName="StockEnMeses" Name="fieldStockEnMeses" Visible="False">
                </dx:PivotGridField>
            </Fields>
        </dx:ASPxPivotGrid>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Rentabilidad Por Grupo Proveedor" Font-Bold="true" Font-Size="Large"></dx:ASPxLabel>
    </div>  
        <dx:ASPxButton ID="Exportar4" runat="server" Text="Exportar Excel" Theme="MaterialCompact" OnClick="Exportar4_Click">
            <Image IconID="export_exporttoxls_16x16">
            </Image>
        </dx:ASPxButton>
        <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter4" runat="server"
            ASPxPivotGridID="GvDatosF">
        </dx:ASPxPivotGridExporter>

    <br />
    <dx:ASPxPivotGrid ID="GvDatosD" runat="server" ClientIDMode="AutoID">
        <Fields>
            <dx:PivotGridField ID="fieldNombreProveedor" FieldName="NombreProveedor" Name="fieldNombreProveedor" Area="RowArea" AreaIndex="0">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fielTotalVenta" FieldName="TotalVenta" Name="fieldTotalVenta" Area="DataArea" AreaIndex="1" CellFormat-FormatString="N0" CellFormat-FormatType="Custom">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fielParticipacion" FieldName="Participacion" Name="fieldParticipacion" Area="DataArea" AreaIndex="0" CellFormat-FormatString="N0" CellFormat-FormatType="Custom">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fielMargen" FieldName="Margen" Name="fieldMargen" Area="DataArea" AreaIndex="2" CellFormat-FormatString="N0" CellFormat-FormatType="Custom" SummaryType="Average">
            </dx:PivotGridField>
            <dx:PivotGridField ID="fielMes" FieldName="Mes" Name="fieldMes" Area="ColumnArea" AreaIndex="0">
            </dx:PivotGridField>
        </Fields>
    </dx:ASPxPivotGrid>
    <br />
    <div>
        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Rentabilidad Mensual" Font-Bold="true" Font-Size="Large"></dx:ASPxLabel>
    </div>
    <br />
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatosAA" runat="server" AutoGenerateColumns="False" OnToolbarItemClick="GvDatosAA_ToolbarItemClick">
            <Toolbars>
                <dx:GridViewToolbar  Position="Top">
                    <Items>
                        <dx:GridViewToolbarItem Text="Exportar" Name="ExportA" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXls" />
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                <dx:GridViewToolbarItem Command="ExportToCsv" />
                            </Items>

                            <Image IconID="actions_download_16x16office2013"></Image>
                        </dx:GridViewToolbarItem>
                        <dx:GridViewToolbarItem Alignment="Left">
                            <Template>
                                <dx:ASPxButtonEdit ID="tbToolbarSearchA" runat="server" NullText="Search..." Height="100%">
                                    <Buttons>
                                        <dx:SpinButtonExtended Image-IconID="find_find_16x16gray" />
                                    </Buttons>
                                </dx:ASPxButtonEdit>
                            </Template>
                        </dx:GridViewToolbarItem>
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsPager PageSize="25">
            </SettingsPager>
            <Settings AutoFilterCondition="Contains" ShowFilterRow="True" ShowGroupPanel="True" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearchA" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Mes" VisibleIndex="1">
                    <PropertiesTextEdit DisplayFormatString="N0" Size="10">
                        <Style Font-Size="Small">
                        </Style>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Grupo" VisibleIndex="2">
                    <PropertiesTextEdit DisplayFormatString="N0" Size="10">
                        <Style Font-Size="Small">
                        </Style>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodProducto" VisibleIndex="3">
                    <PropertiesTextEdit DisplayFormatString="N0" Size="10">
                        <Style Font-Size="Small">
                        </Style>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Producto" VisibleIndex="4" Width="350px">
                    <PropertiesTextEdit DisplayFormatString="N0" Size="10">
                        <Style Font-Size="Small">
                        </Style>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Q" VisibleIndex="5">
                    <PropertiesTextEdit DisplayFormatString="N0" Size="10">
                        <Style Font-Size="Small">
                        </Style>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PrecioUnitarioVenta_Promedio" VisibleIndex="6" Caption="P.U.Venta_Prom">
                    <PropertiesTextEdit DisplayFormatString="N0" HelpText="Precio Unitario Venta_Promedio">
                        <Style Font-Size="Small">
                        </Style>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CostoUnitario_Promedio" VisibleIndex="7" Caption="CostUn_Prom">
                    <PropertiesTextEdit DisplayFormatString="N0" HelpText="Costo Unitario Promedio" Size="10">
                        <HelpTextSettings DisplayMode="Popup">
                        </HelpTextSettings>
                        <Style Font-Size="Small">
                        </Style>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalVenta" VisibleIndex="8">
                    <PropertiesTextEdit DisplayFormatString="N0" Size="10">
                        <Style Font-Size="Small">
                        </Style>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ParcipicionVenta" VisibleIndex="9" Caption="Participacion">
                    <PropertiesTextEdit DisplayFormatString="N2" Size="10">
                        <Style Font-Size="Small">
                        </Style>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Margen" VisibleIndex="10">
                    <PropertiesTextEdit DisplayFormatString="N2" Size="10">
                        <Style Font-Size="Small">
                        </Style>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <Header Font-Size="Smaller">
                </Header>
                <Cell Font-Size="Smaller">
                </Cell>
            </Styles>
        </dx:ASPxGridView>
    </div>
    <br />
    <br />
    <br />

    <div>
        <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Rentabilidad Acomulada" Font-Bold="true" Font-Size="Large"></dx:ASPxLabel>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatosB" runat="server" AutoGenerateColumns="False" OnToolbarItemClick="GvDatosB_ToolbarItemClick">
            <Toolbars>
                <dx:GridViewToolbar  Position="Top">
                    <Items>
                        <dx:GridViewToolbarItem Text="Exportar" Name="ExportB" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXls" />
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                <dx:GridViewToolbarItem Command="ExportToCsv" />
                            </Items>

                            <Image IconID="actions_download_16x16office2013"></Image>
                        </dx:GridViewToolbarItem>
                        <dx:GridViewToolbarItem Alignment="Left">
                            <Template>
                                <dx:ASPxButtonEdit ID="tbToolbarSearchB" runat="server" NullText="Search..." Height="100%">
                                    <Buttons>
                                        <dx:SpinButtonExtended Image-IconID="find_find_16x16gray" />
                                    </Buttons>
                                </dx:ASPxButtonEdit>
                            </Template>
                        </dx:GridViewToolbarItem>
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsPager PageSize="25">
            </SettingsPager>
            <Settings AutoFilterCondition="Contains" ShowFilterRow="True" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearchB" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Grupo" VisibleIndex="1">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodProducto" VisibleIndex="2">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Producto" VisibleIndex="3" Width="350px">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Q" VisibleIndex="4">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PrecioUnitarioVenta_Promedio" VisibleIndex="5" Caption="P.U.Venta Prom">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CostoUnitario_Promedio" VisibleIndex="6" Caption="CostU_Prom">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalVenta" VisibleIndex="7">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Participacion" VisibleIndex="8">
                    <PropertiesTextEdit DisplayFormatString="N2">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Margen" VisibleIndex="9">
                    <PropertiesTextEdit DisplayFormatString="N2">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <Header Font-Size="Smaller">
                </Header>
                <Cell Font-Size="Smaller">
                </Cell>
            </Styles>
        </dx:ASPxGridView>
    </div>
    <br />
    <br />
    <br />
    <div>
        <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Rentabilidad por Grupo Cliente" Font-Bold="true" Font-Size="Large"></dx:ASPxLabel>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatosCC" runat="server" AutoGenerateColumns="False" OnToolbarItemClick="GvDatosCC_ToolbarItemClick">
            <Toolbars>
                <dx:GridViewToolbar  Position="Top">
                    <Items>
                        <dx:GridViewToolbarItem Text="Exportar" Name="ExportC" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXls" />
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                <dx:GridViewToolbarItem Command="ExportToCsv" />
                            </Items>

                            <Image IconID="actions_download_16x16office2013"></Image>
                        </dx:GridViewToolbarItem>
                        <dx:GridViewToolbarItem Alignment="Left">
                            <Template>
                                <dx:ASPxButtonEdit ID="tbToolbarSearchC" runat="server" NullText="Search..." Height="100%">
                                    <Buttons>
                                        <dx:SpinButtonExtended Image-IconID="find_find_16x16gray" />
                                    </Buttons>
                                </dx:ASPxButtonEdit>
                            </Template>
                        </dx:GridViewToolbarItem>
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsPager PageSize="25">
            </SettingsPager>
            <Settings AutoFilterCondition="Contains" ShowFilterRow="True" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearchC" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="GrupoCliente" VisibleIndex="1">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalVenta" VisibleIndex="7">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Participacion" VisibleIndex="8">
                    <PropertiesTextEdit DisplayFormatString="N2">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Margen" VisibleIndex="9">
                    <PropertiesTextEdit DisplayFormatString="N2">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <Header Font-Size="Smaller">
                </Header>
                <Cell Font-Size="Smaller">
                </Cell>
            </Styles>
        </dx:ASPxGridView>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Rentabilidad Por Grupo Proveedor" Font-Bold="true" Font-Size="Large"></dx:ASPxLabel>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatosDD" runat="server" AutoGenerateColumns="False" OnToolbarItemClick="GvDatosDD_ToolbarItemClick">
            <Toolbars>
                <dx:GridViewToolbar  Position="Top">
                    <Items>
                        <dx:GridViewToolbarItem Text="Exportar" Name="ExportD" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXls" />
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                <dx:GridViewToolbarItem Command="ExportToCsv" />
                            </Items>

                            <Image IconID="actions_download_16x16office2013"></Image>
                        </dx:GridViewToolbarItem>
                        <dx:GridViewToolbarItem Alignment="Left">
                            <Template>
                                <dx:ASPxButtonEdit ID="tbToolbarSearchD" runat="server" NullText="Search..." Height="100%">
                                    <Buttons>
                                        <dx:SpinButtonExtended Image-IconID="find_find_16x16gray" />
                                    </Buttons>
                                </dx:ASPxButtonEdit>
                            </Template>
                        </dx:GridViewToolbarItem>
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsPager PageSize="25">
            </SettingsPager>
            <Settings AutoFilterCondition="Contains" ShowFilterRow="True" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearchD" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="NombreProveedor" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalVenta" VisibleIndex="7">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Participacion" VisibleIndex="8">
                    <PropertiesTextEdit DisplayFormatString="N2">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Margen" VisibleIndex="9">
                    <PropertiesTextEdit DisplayFormatString="N2">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <Header Font-Size="Smaller">
                </Header>
                <Cell Font-Size="Smaller">
                </Cell>
            </Styles>
        </dx:ASPxGridView>
    </div>
    <br />
    <br />
    <br />
    <div>
        <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Rotacion Mensual" Font-Bold="true" Font-Size="Large"></dx:ASPxLabel>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatosFF" runat="server" AutoGenerateColumns="False" OnToolbarItemClick="GvDatosFF_ToolbarItemClick">
            <Toolbars>
                <dx:GridViewToolbar  Position="Top">
                    <Items>
                        <dx:GridViewToolbarItem Text="Exportar" Name="ExportF" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXls" />
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                <dx:GridViewToolbarItem Command="ExportToCsv" />
                            </Items>

                            <Image IconID="actions_download_16x16office2013"></Image>
                        </dx:GridViewToolbarItem>
                        <dx:GridViewToolbarItem Alignment="Left">
                            <Template>
                                <dx:ASPxButtonEdit ID="tbToolbarSearchF" runat="server" NullText="Search..." Height="100%">
                                    <Buttons>
                                        <dx:SpinButtonExtended Image-IconID="find_find_16x16gray" />
                                    </Buttons>
                                </dx:ASPxButtonEdit>
                            </Template>
                        </dx:GridViewToolbarItem>
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsPager PageSize="25">
            </SettingsPager>
            <Settings AutoFilterCondition="Contains" ShowFilterRow="True" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearchF" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="CodProveedor" VisibleIndex="1">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Proveedor" VisibleIndex="2">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Grupo" VisibleIndex="3">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodProducto" VisibleIndex="4">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Producto" VisibleIndex="5" Width="350px">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="StockActual" VisibleIndex="6">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UltimoMes" VisibleIndex="7">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DosMeses" VisibleIndex="8">
                    <PropertiesTextEdit DisplayFormatString="N2">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TresMeses" VisibleIndex="9">
                    <PropertiesTextEdit DisplayFormatString="N2">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="StockEnMeses" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <Header Font-Size="Smaller">
                </Header>
                <Cell Font-Size="Smaller">
                </Cell>
            </Styles>
        </dx:ASPxGridView>
    </div>


</asp:Content>
