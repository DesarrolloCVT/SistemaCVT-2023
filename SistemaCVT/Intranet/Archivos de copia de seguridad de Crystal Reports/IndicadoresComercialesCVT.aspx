<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="IndicadoresComercialesCVT.aspx.cs" Inherits="CVT_MermasRecepcion.Comercial.IndicadoresComercialesCVT" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Comercial</a></li>
            <li><span id="current">Indicadores Comerciales</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Indicadores Comerciales</span>
        <span class="tab-end"></span>
        <%--        <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click1"
                    Style="height: 20px;" />
                Exportar Excel</a>&nbsp;

        </div>--%>
    </div>
    <br />
    <br />
    <div style="margin-left: 50px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha inicio" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteFini" runat="server" Theme="iOS"></dx:ASPxDateEdit>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Fecha Termino" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteTermino" runat="server" Theme="iOS"></dx:ASPxDateEdit>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Valor kilo Flete" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtVKilo" runat="server" Width="170px" Theme="iOS">
                        <ValidationSettings Display="Dynamic">
                            <RegularExpression ValidationExpression="^[0-9]\d*(,\d+)?$" ErrorText="Decimal &quot; ,&quot;" />
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>

                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" Height="50px" OnClick="btnBuscar_Click" Width="93px" Theme="iOS"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatosA" runat="server" AutoGenerateColumns="False" OnToolbarItemClick="GvDatosA_ToolbarItemClick" OnCustomSummaryCalculate="GvDatosA_CustomSummaryCalculate" OnExportRenderBrick="GvDatosA_ExportRenderBrick">
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings ShowTitlePanel="True" />
            <SettingsBehavior AllowFocusedRow="True" />
            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <Toolbars>
                <dx:GridViewToolbar>
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
            <SettingsSearchPanel CustomEditorID="tbToolbarSearchA" />
            <SettingsText Title="INFORME POR TIPO DE NEGOCIO" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="TipoNegocio" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Ven_Neta" VisibleIndex="1">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PorParVenta" VisibleIndex="3" Caption="% Part Venta">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Mg_ConRapel" VisibleIndex="7" Caption="% Mg_Con Rapel">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Mg_SinFlete" VisibleIndex="9" Caption="% Mg_Sin Flete">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Mg_Bruto" FieldName="MgBruto" ShowInCustomizationForm="True" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Vneta Año Ant." FieldName="Ven_netaAnt" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Mg_Sin Flete Año Ant." FieldName="Mg_SinFleteAnterior" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Part Venta año Ant." FieldName="PorParVenta" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Mg_Bruto Año Ant." FieldName="MgBrutoAnterior" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Mg_Con Rapel año Ant." FieldName="Mg_ConRapelAnterior" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
            </Columns>
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="Total Venta Neta Año Actual: {0:N0}" FieldName="Ven_Neta" ShowInColumn="Ven_Neta" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="Total Venta Neta Año Anterior: {0:N0}" FieldName="Ven_netaAnt" ShowInColumn="Ven_Neta" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="Total Diferencia venta neta : {0:N0}" ShowInColumn="Ven_Neta" SummaryType="Custom" Tag="difVentaNeta" />
            </TotalSummary>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
    </div>
    <br />
    <br />
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatosB" runat="server" AutoGenerateColumns="False" OnToolbarItemClick="GvDatosB_ToolbarItemClick" OnCustomSummaryCalculate="GvDatosB_CustomSummaryCalculate">
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings ShowTitlePanel="True" />
            <SettingsBehavior AllowFocusedRow="True" />
            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <Toolbars>
                <dx:GridViewToolbar>
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
            <SettingsSearchPanel CustomEditorID="tbToolbarSearchB" />
            <SettingsText Title="INFORME POR FAMILIA PRODUCTO" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Familia" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Ven_Neta" VisibleIndex="1">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PorParVenta" VisibleIndex="3" Caption="% Part Venta">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Mg_ConRapel" VisibleIndex="7" Caption="% Mg_Con Rapel">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Mg_SinFlete" VisibleIndex="9" Caption="% Mg_Sin Flete">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Mg_Bruto" FieldName="MgBruto" ShowInCustomizationForm="True" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Vneta Año Ant." FieldName="Ven_netaAnt" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Mg_Sin Flete Año Ant." FieldName="Mg_SinFleteAnterior" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Part Venta año Ant." FieldName="PorParVenta" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Mg_Bruto Año Ant." FieldName="MgBrutoAnterior" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Mg_Con Rapel año Ant." FieldName="Mg_ConRapelAnterior" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
            </Columns>
             <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="Total Venta Neta Año Actual: {0:N0}" FieldName="Ven_Neta" ShowInColumn="Ven_Neta" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="Total Venta Neta Año Anterior: {0:N0}" FieldName="Ven_netaAnt" ShowInColumn="Ven_Neta" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="Total Diferencia venta neta : {0:N0}" ShowInColumn="Ven_Neta" SummaryType="Custom" Tag="difVentaNeta" />
            </TotalSummary>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
    </div>
    <br />
    <br />
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatosC" runat="server" AutoGenerateColumns="False" OnToolbarItemClick="GvDatosC_ToolbarItemClick" OnCustomSummaryCalculate="GvDatosC_CustomSummaryCalculate">
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings ShowTitlePanel="True" />
            <SettingsBehavior AllowFocusedRow="True" />
            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <Toolbars>
                <dx:GridViewToolbar>
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
            <SettingsSearchPanel CustomEditorID="tbToolbarSearchC" />
            <SettingsText Title="INFORME POR VENDEDORES" />
             <Columns>
                <dx:GridViewDataTextColumn FieldName="Vendedor" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Ven_Neta" VisibleIndex="1">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PorParVenta" VisibleIndex="3" Caption="% Part Venta">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Mg_ConRapel" VisibleIndex="7" Caption="% Mg_Con Rapel">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Mg_SinFlete" VisibleIndex="9" Caption="% Mg_Sin Flete">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Mg_Bruto" FieldName="MgBruto" ShowInCustomizationForm="True" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Vneta Año Ant." FieldName="Ven_netaAnt" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Mg_Sin Flete Año Ant." FieldName="Mg_SinFleteAnterior" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Part Venta año Ant." FieldName="PorParVenta" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Mg_Bruto Año Ant." FieldName="MgBrutoAnterior" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Mg_Con Rapel año Ant." FieldName="Mg_ConRapelAnterior" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
            </Columns>
               <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="Total Venta Neta Año Actual: {0:N0}" FieldName="Ven_Neta" ShowInColumn="Ven_Neta" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="Total Venta Neta Año Anterior: {0:N0}" FieldName="Ven_netaAnt" ShowInColumn="Ven_Neta" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="Total Diferencia venta neta : {0:N0}" ShowInColumn="Ven_Neta" SummaryType="Custom" Tag="difVentaNeta" />
            </TotalSummary>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
    </div>
    <br />
    <br />
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatosD" runat="server" AutoGenerateColumns="False" OnToolbarItemClick="GvDatosD_ToolbarItemClick" OnCustomSummaryCalculate="GvDatosD_CustomSummaryCalculate">
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings ShowTitlePanel="True" />
            <SettingsBehavior AllowFocusedRow="True" />
            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <Toolbars>
                <dx:GridViewToolbar>
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
            <SettingsSearchPanel CustomEditorID="tbToolbarSearchD" />
            <SettingsText Title="INFORME POR CLIENTE" />
           <Columns>
                <dx:GridViewDataTextColumn FieldName="Razon_Social" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Ven_Neta" VisibleIndex="1">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PorParVenta" VisibleIndex="3" Caption="% Part Venta">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Mg_ConRapel" VisibleIndex="7" Caption="% Mg_Con Rapel">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Mg_SinFlete" VisibleIndex="9" Caption="% Mg_Sin Flete">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Mg_Bruto" FieldName="MgBruto" ShowInCustomizationForm="True" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Vneta Año Ant." FieldName="Ven_netaAnt" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Mg_Sin Flete Año Ant." FieldName="Mg_SinFleteAnterior" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Part Venta año Ant." FieldName="PorParVenta" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Mg_Bruto Año Ant." FieldName="MgBrutoAnterior" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Mg_Con Rapel año Ant." FieldName="Mg_ConRapelAnterior" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
            </Columns>
                 <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="Total Venta Neta Año Actual: {0:N0}" FieldName="Ven_Neta" ShowInColumn="Ven_Neta" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="Total Venta Neta Año Anterior: {0:N0}" FieldName="Ven_netaAnt" ShowInColumn="Ven_Neta" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="Total Diferencia venta neta : {0:N0}" ShowInColumn="Ven_Neta" SummaryType="Custom" Tag="difVentaNeta" />
            </TotalSummary>

            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
    </div>

</asp:Content>
