<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="BalanceOchoColumnas.aspx.cs" Inherits="CVT_MermasRecepcion.Contabilidad.BalanceOchoColumnas" %>

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
            <li><a>Contabilidad</a></li>
            <li><span id="current">Balance</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Balance</span>
        <span class="tab-end"></span>
        <%--      <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="height: 20px;" />
                Exportar Excel</a>&nbsp;         
        </div>--%>
    </div>
    <br />
    <br />
    <div>
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Año"></dx:ASPxLabel>
                    <dx:ASPxDateEdit runat="server" PickerType="Years" ID="dteano" Height="30px">
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxDateEdit>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Mes"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboMes" runat="server" Height="30px" SelectedIndex="0">
                        <Items>
                            <dx:ListEditItem Selected="True" Text="Todos" Value="0" />
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
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Tipo"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboTipo" runat="server" Height="30px" SelectedIndex="0">
                        <Items>
                            <dx:ListEditItem Text="SII" Value="SII" Selected="True" />
                            <dx:ListEditItem Text="L1" Value="L1" />
                            <dx:ListEditItem Text="L2" Value="L2" />
                            <dx:ListEditItem Text="L3" Value="L3" />
                            <dx:ListEditItem Text="L4" Value="L4" />
                            <dx:ListEditItem Text="L5" Value="L5" />
                            <dx:ListEditItem Text="L6" Value="L6" />
                        </Items>
                    </dx:ASPxComboBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" Height="44px" Width="104px" OnClick="btnBuscar_Click"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings ShowFooter="True" AutoFilterCondition="Contains" ShowFilterRow="True" />
            <Toolbars>
                <dx:GridViewToolbar Position="Top">
                    <Items>
                        <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXls" />
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                <dx:GridViewToolbarItem Command="ExportToCsv" />
                            </Items>
                            <Image IconID="actions_download_16x16office2013"></Image>
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
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="CodCuenta" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cuenta" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DEBITO" VisibleIndex="3">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CREDITO" VisibleIndex="4">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DEUDOR" VisibleIndex="5">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ACREEDOR" VisibleIndex="6">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ACTIVO" VisibleIndex="7">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PASIVO" VisibleIndex="8">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PERDIDA" VisibleIndex="9">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="GANANCIA" VisibleIndex="10">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodCuentaSII" Visible="False" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
            </Columns>
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="Total Debito : {0:N0}" FieldName="DEBITO" ShowInColumn="DEBITO" SummaryType="Sum" ValueDisplayFormat="N0" />
                <dx:ASPxSummaryItem DisplayFormat="Total Credito : {0:N0}" FieldName="CREDITO" ShowInColumn="CREDITO" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="Total Deudor : {0:N0}" FieldName="DEUDOR" ShowInColumn="DEUDOR" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="Total Acreedor : {0:N0}" FieldName="ACREEDOR" ShowInColumn="ACREEDOR" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="Total Activo : {0:N0}" FieldName="ACTIVO" ShowInColumn="ACTIVO" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="Total Pasivo : {0:N0}" FieldName="PASIVO" ShowInColumn="PASIVO" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="Total Perdida : {0:N0}" FieldName="PERDIDA" ShowInColumn="PERDIDA" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="Total Ganancia : {0:N0}" FieldName="GANANCIA" ShowInColumn="GANANCIA" SummaryType="Sum" />
            </TotalSummary>
        </dx:ASPxGridView>
    </div>
</asp:Content>
