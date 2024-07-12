<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ResumenConsumoCombustible.aspx.cs" Inherits="CVT_MermasRecepcion.ControlCierreMensual.Transporte.ResumenConsumoCombustible" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
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
        <span class="tableTitle">Resumen Consumo Combustible</span>
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
                    <dx:ASPxTextBox ID="txt_ano" runat="server" Width="170px">
                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip">
                            <RequiredField ErrorText="Debe ingresar un Año" IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxButton ID="btn_Buscar" runat="server" Text="Buscar" OnClick="btn_Buscar_Click"></dx:ASPxButton>
                </td>
            </tr>
            <tr>
                <td>
                    <label>Patente</label></td>

                <td>
                    <asp:TextBox ID="txt_Patente" runat="server"></asp:TextBox></td>
                <td>&nbsp;</td>
                <td>
                    <label>Propietario</label></td>

                <td>
                    <asp:TextBox ID="txt_propietario" runat="server"></asp:TextBox></td>

                <td>
                    <dx:ASPxButton ID="btn_limpiar" runat="server" Text="Limpiar" OnClick="btn_limpiar_Click"></dx:ASPxButton>
                </td>

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
                <%--   <td><a>
                    <asp:ImageButton ID="ImageButton1" runat="server"
                        ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_ClickMes" />
                    Exportar Excel</a></td>--%>
            </tr>
        </table>
        <dx:ASPxGridView ID="GvDatosMes" runat="server" AutoGenerateColumns="False" DataSourceID="LqsResumenMes" OnToolbarItemClick="GvDatosMes_ToolbarItemClick">
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
                <dx:GridViewDataTextColumn FieldName="Propietario" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Patente" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalConsumo" VisibleIndex="2" Caption="Total Consumo $">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalLitros" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Mes" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Año" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsResumenMes" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_VW_ResumenConsumoCombustiblePorMes">
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
                    <label>RESUMEN POR PROPIETARIO</label>
                </td>
                <td>&nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;</td>
       <%--         <td><a>
                    <asp:ImageButton ID="ImageButton2" runat="server"
                        ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_ClickPatente"
                        Style="width: 20px" />
                    Exportar Excel</a></td>--%>
            </tr>
        </table>
        <dx:ASPxGridView ID="GvDatosPropietario" runat="server" AutoGenerateColumns="False" DataSourceID="LqsResumenPropietario" OnToolbarItemClick="GvDatosPropietario_ToolbarItemClick">
            <Toolbars>
                <dx:GridViewToolbar>
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
                <dx:GridViewDataTextColumn FieldName="Propietario" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalConsumo" VisibleIndex="1" Caption="Total Consumo $">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalLitros" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Mes" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Año" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsResumenPropietario" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_VW_ResumenConsumoCombustiblePorPropietario">
        </asp:LinqDataSource>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter2" runat="server" GridViewID="GvDatosPropietario">
        </dx:ASPxGridViewExporter>
    </div>
</asp:Content>
