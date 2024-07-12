<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="IndicadorComercialEnCurso.aspx.cs" Inherits="CVT_MermasRecepcion.Comercial.IndicadorComercialEnCurso" %>

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
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatosA" runat="server" AutoGenerateColumns="False" OnToolbarItemClick="GvDatosA_ToolbarItemClick">
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings ShowTitlePanel="True" ShowFooter="True" />
            <SettingsBehavior AllowFocusedRow="True" />
            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>

            <Columns>
                <dx:GridViewDataTextColumn FieldName="TipoNegocio" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="VentaNeta" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% PartVenta" FieldName="Porc_PartVenta" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% MgBruto" FieldName="MgBruto" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Mg_ConRapel" FieldName="Mg_ConRapel" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Mg_SinFlete" FieldName="Mg_SinFlete" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
            </Columns>

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
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatosB" runat="server" AutoGenerateColumns="False" OnToolbarItemClick="GvDatosB_ToolbarItemClick">
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings ShowTitlePanel="True" ShowFooter="True" />
            <SettingsBehavior AllowFocusedRow="True" />
            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>

            <Columns>
                <dx:GridViewDataTextColumn FieldName="Familia" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="VentaNeta" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% PartVenta" FieldName="Porc_PartVentaxProd" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% MgBruto" FieldName="MgBrutoxProd" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Mg_ConRapel" FieldName="Mg_ConRapelxProd" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Mg_SinFlete" FieldName="Mg_SinFletexProd" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
            </Columns>

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
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatosC" runat="server" AutoGenerateColumns="False" OnToolbarItemClick="GvDatosC_ToolbarItemClick">
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings ShowTitlePanel="True" ShowFooter="True" />
            <SettingsBehavior AllowFocusedRow="True" />
            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>

            <Columns>
                <dx:GridViewDataTextColumn FieldName="Vendedor" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Venta_Neta" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Porc_PartVenta" FieldName="Porc_PartVentaxVend" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% MgBruto" FieldName="MgBrutoxVend" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Mg_ConRapel" FieldName="Mg_ConRapelxVend" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Mg_SinFlete" FieldName="Mg_SinFletexVend" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
            </Columns>

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
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
    </div>
     <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatosD" runat="server" AutoGenerateColumns="False" OnToolbarItemClick="GvDatosD_ToolbarItemClick">
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings ShowTitlePanel="True" ShowFooter="True" />
            <SettingsBehavior AllowFocusedRow="True" />
            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>

            <Columns>
                <dx:GridViewDataTextColumn FieldName="Razon_Social" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Venta_Neta" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Porc_PartVenta" FieldName="Porc_PartVentaxCli" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% MgBruto" FieldName="MgBrutoxCli" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Mg_ConRapel" FieldName="Mg_ConRapelxCli" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Mg_SinFlete" FieldName="Mg_SinFletexCli" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
            </Columns>

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
            <SettingsSearchPanel CustomEditorID="tbToolbarSearchD" />
            <SettingsText Title="INFORME POR CLIENTE" />
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
    </div>


</asp:Content>
