<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="CostoTotalPorCamion.aspx.cs" Inherits="CVT_MermasRecepcion.ControlCierreMensual.Transporte.CostoTotalPorCamion1" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraCharts.v22.1.Web, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraCharts.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <%--     <li><a>Control Cierre</a></li>--%>
            <li><span id="current">Control Cierre</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Costo Total por Camiones</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <br />
    <div>
        <table>
            <tr>
                <td>
                    <label>Ingrese Mes </label>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cb_Mes" runat="server">
                        <Items>
                            <dx:ListEditItem Text="1" Value="1" />
                            <dx:ListEditItem Text="2" Value="2" />
                            <dx:ListEditItem Text="3" Value="3" />
                            <dx:ListEditItem Text="4" Value="4" />
                            <dx:ListEditItem Text="5" Value="5" />
                            <dx:ListEditItem Text="6" Value="6" />
                            <dx:ListEditItem Text="7" Value="7" />
                            <dx:ListEditItem Text="8" Value="8" />
                            <dx:ListEditItem Text="9" Value="9" />
                            <dx:ListEditItem Text="10" Value="10" />
                            <dx:ListEditItem Text="11" Value="11" />
                            <dx:ListEditItem Text="12" Value="12" />
                        </Items>
                    </dx:ASPxComboBox>
                </td>
                <td>&nbsp;</td>
                <td>Ingrese Año</td>
                <td>
                    <dx:ASPxTextBox ID="txt_ano" runat="server" Width="90px" Height="25px">
                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip">
                            <RequiredField ErrorText="Debe ingresar un Año" IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td>
                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Debe ingresar un Año" ControlToValidate="txt_ano" ForeColor="Red"></asp:RequiredFieldValidator>--%></td>
                <td>
                    <dx:ASPxButton ID="btn_Buscar" runat="server" Text="Buscar" OnClick="btn_Buscar_Click"></dx:ASPxButton>
                </td>
            </tr>
            <tr>
                <td>
                    <label>Patente</label></td>
                <td>
                    <asp:TextBox ID="txt_Patente" runat="server" Height="25px" Width="98px"></asp:TextBox></td>
            </tr>
        </table>
    </div>
    <br />
    <br />

    <div>
        <table>
            <tr>
                <td>
                    <label>RESUMEN POR MES</label>
                </td>
                <td>&nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;</td>
            </tr>
        </table>
        <br />
        <dx:ASPxGridView ID="GvDatosMes" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDatosMes" OnToolbarItemClick="GvDatosMes_ToolbarItemClick">
            <SettingsPager PageSize="15">
            </SettingsPager>
            <SettingsBehavior AllowFocusedRow="True" />
            <Toolbars>
                <dx:GridViewToolbar >
                    <Items>
                        <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXls" />
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                <dx:GridViewToolbarItem Command="ExportToDocx" />
                                <dx:GridViewToolbarItem Command="ExportToRtf" />
                                <dx:GridViewToolbarItem Command="ExportToCsv" />
                                <dx:GridViewToolbarItem Command="ExportToPdf" />
                            </Items>
                        </dx:GridViewToolbarItem>
                        <dx:GridViewToolbarItem Alignment="Left">
                            <Template>
                                <dx:ASPxButtonEdit ID="tbToolbarSearch" runat="server" NullText="Search..." Height="100%">
                                    <Buttons>
                                        <dx:SpinButtonExtended Image-IconID="find_find_16x16gray" />
                                    </Buttons>
                                </dx:ASPxButtonEdit>
                            </Template>
                        </dx:GridViewToolbarItem>
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Patente" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Monto" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Mes" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Año" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CantDocumentos" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Propietario" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>

        <asp:LinqDataSource ID="LqsDatosMes" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_VW_ResumenMensualCamion" Where="Mes == @Mes">
        </asp:LinqDataSource>

        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="GvDatosMes">
        </dx:ASPxGridViewExporter>

    </div>
    <br />
    <br />
    <div>
        <table>
            <tr>
                <td>
                    <label>RESUMEN POR CATEGORIA</label>
                </td>
                <td>&nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;</td>
            </tr>
        </table>
        <br />
        <dx:ASPxGridView ID="GvDatosCategoria" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDatosCategoria" OnToolbarItemClick="GvDatosCategoria_ToolbarItemClick">
            <SettingsPager PageSize="15">
            </SettingsPager>
            <SettingsBehavior AllowFocusedRow="True" />
            <Toolbars>
                <dx:GridViewToolbar >
                    <Items>
                        <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXls" />
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                <dx:GridViewToolbarItem Command="ExportToDocx" />
                                <dx:GridViewToolbarItem Command="ExportToRtf" />
                                <dx:GridViewToolbarItem Command="ExportToCsv" />
                                <dx:GridViewToolbarItem Command="ExportToPdf" />
                            </Items>
                        </dx:GridViewToolbarItem>
                        <dx:GridViewToolbarItem Alignment="Left">
                            <Template>
                                <dx:ASPxButtonEdit ID="tbToolbarSearch" runat="server" NullText="Search..." Height="100%">
                                    <Buttons>
                                        <dx:SpinButtonExtended Image-IconID="find_find_16x16gray" />
                                    </Buttons>
                                </dx:ASPxButtonEdit>
                            </Template>
                        </dx:GridViewToolbarItem>
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Patente" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Categoria" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Monto" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Mes" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Año" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CantDocumentos" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Propietario" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDatosCategoria" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_VW_ResumenMensualCategoriaCamion" Where="Mes == @Mes">
        </asp:LinqDataSource>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter2" runat="server" GridViewID="GvDatosCategoria">
        </dx:ASPxGridViewExporter>
    </div>
    <br />
    <br />
    <div>
        <table>
            <tr>
                <td>
                    <label>RESUMEN POR TIPO DE GASTO</label>
                </td>
                <td>&nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;</td>
            <%--    <td><a>
                    <asp:ImageButton ID="ImageButton3" runat="server"
                        ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_ClickTipo"
                        Style="height: 20px;" />
                    Exportar Excel</a></td>--%>
            </tr>
        </table>
        <br />
        <br />
        <dx:ASPxGridView ID="GvDatosTipoGasto" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDatosPorGastos" OnToolbarItemClick="GvDatosTipoGasto_ToolbarItemClick">
            <SettingsPager PageSize="15">
            </SettingsPager>
            <SettingsBehavior AllowFocusedRow="True" />
            <Toolbars>
                <dx:GridViewToolbar >
                    <Items>                  
                        <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXls" />
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                <dx:GridViewToolbarItem Command="ExportToDocx" />
                                <dx:GridViewToolbarItem Command="ExportToRtf" />
                                <dx:GridViewToolbarItem Command="ExportToCsv" />
                                <dx:GridViewToolbarItem Command="ExportToPdf" />
                            </Items>
                        </dx:GridViewToolbarItem>
                        <dx:GridViewToolbarItem Alignment="Left">
                            <Template>
                                <dx:ASPxButtonEdit ID="tbToolbarSearch" runat="server" NullText="Search..." Height="100%">
                                    <Buttons>
                                        <dx:SpinButtonExtended Image-IconID="find_find_16x16gray" />
                                    </Buttons>
                                </dx:ASPxButtonEdit>
                            </Template>
                        </dx:GridViewToolbarItem>
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Patente" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Categoria" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DetalleGasto" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Monto" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Mes" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Año" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CantDocumentos" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Propietario" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDatosPorGastos" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_VW_ResumenMensualGastosCamion" Where="Mes == @Mes">
        </asp:LinqDataSource>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter3" runat="server">
        </dx:ASPxGridViewExporter>
    </div>
    <br />
    <br />
    <div>
        <table>
            <tr>
                <td>
                    <label>RESUMEN ANUAL</label>
                </td>
                <td>&nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;</td>
                <td><a>
                    <asp:ImageButton ID="ImageButton4" runat="server"
                        ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_ClickAnual"
                        Style="width: 20px" />
                    Exportar Excel</a></td>
            </tr>
        </table>
        <br />
        <br />
        <dx:ASPxPivotGrid ID="PvDatos" runat="server" ClientIDMode="AutoID" DataSourceID="LqsDatosMes0">
            <Fields>
                <dx:PivotGridField ID="fieldPropietario" Area="RowArea" AreaIndex="0" FieldName="Propietario" Name="fieldPropietario">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldPatente" Area="RowArea" AreaIndex="1" FieldName="Patente" Name="fieldPatente">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMonto" Area="DataArea" AreaIndex="0" FieldName="Monto" Name="fieldMonto">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldAo" Area="ColumnArea" AreaIndex="0" FieldName="Año" Name="fieldAo">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldMes" Area="ColumnArea" AreaIndex="1" FieldName="Mes" Name="fieldMes">
                </dx:PivotGridField>
            </Fields>
            <OptionsPager ColumnsPerPage="100" RowsPerPage="10000">
            </OptionsPager>
        </dx:ASPxPivotGrid>
        <a>

            <asp:LinqDataSource ID="LqsDatosMes0" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_VW_ResumenMensualCamion" Where="Año == @Año">
                <WhereParameters>
                    <asp:ControlParameter ControlID="txt_ano" DefaultValue="2019" Name="Año" PropertyName="Text" Type="Int32" />
                </WhereParameters>
            </asp:LinqDataSource>

        </a>
        <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server"
            ASPxPivotGridID="PvDatos">
        </dx:ASPxPivotGridExporter>
        <br />
    </div>
    <br />
    <table>
        <tr>
            <td>
                <label>Gasto Total Por Año</label>
            </td>
            <td>&nbsp;  &nbsp;</td>
            <td>
                <label>Año</label></td>
            <td>&nbsp;</td>
            <td>
                <dx:ASPxTextBox ID="txt_anografico" runat="server" Width="100px"></dx:ASPxTextBox>
            </td>
            <td>
                <dx:ASPxButton ID="btn_Seleccion" runat="server" Text="Ver Grafico" OnClick="btn_Seleccion_Click"></dx:ASPxButton>
            </td>
        </tr>
    </table>
    <br />
    <br />

    <dx:WebChartControl ID="WebChartControl1" runat="server" CrosshairEnabled="True" DataSourceID="LinqDataSource1" Height="714px" SeriesDataMember="DetalleGasto" Width="1530px">
        <DiagramSerializable>
            <cc1:XYDiagram>
                <axisx visibleinpanesserializable="-1">
                <gridlines visible="True">
                </gridlines>
            </axisx>
                <axisy minorcount="4" visibleinpanesserializable="-1">
            </axisy>
            </cc1:XYDiagram>
        </DiagramSerializable>
        <Legend Name="Default Legend"></Legend>
        <SeriesTemplate ArgumentDataMember="Patente" SeriesDataMember="DetalleGasto" ValueDataMembersSerializable="Monto">
            <viewserializable>
            <cc1:SideBySideBarSeriesView BarWidth="1.5">
            </cc1:SideBySideBarSeriesView>
        </viewserializable>
        </SeriesTemplate>
    </dx:WebChartControl>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_VW_ResumenTotalGastoCamionPorDetalle" Where="Año == @Año">
        <WhereParameters>
            <asp:ControlParameter ControlID="txt_anografico" DefaultValue="1990" Name="Año" PropertyName="Text" Type="Int32" />
        </WhereParameters>
    </asp:LinqDataSource>
</asp:Content>
