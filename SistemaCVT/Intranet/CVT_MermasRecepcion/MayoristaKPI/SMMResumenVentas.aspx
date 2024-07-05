<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SMMResumenVentas.aspx.cs" Inherits="CVT_MermasRecepcion.MayoristaKPI.SMMResumenVentas" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            margin-bottom: 0px;
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
            <li><a>Mayorista</a></li>
            <li><span id="current">Resumen Ventas</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Resumen Ventas</span>
        <span class="tab-end"></span>
        <div id="options">
            <%--  <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px; height: 20px;" />
                Exportar Excel</a>&nbsp;--%>
            <%-- <a>
                  <asp:ImageButton ID="cmdNew" runat="server"
                      ImageUrl="~/Images/nuevo.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>--%>
        </div>
    </div>
    <br />
    <br />
    <div style="margin-left: 25px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha Inicio"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteInicio" runat="server" Height="30px"></dx:ASPxDateEdit>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Fecha Termino"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteTermino" runat="server" Height="30px"></dx:ASPxDateEdit>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 150px" class="auto-style5">
        <table>
            <tr>
                <td>
                    <dx:ASPxButton ID="btnBuscars" runat="server" Text="Buscar" Height="50px" OnClick="btnBuscars_Click" Theme="MaterialCompact" Width="150px">
                        <Image IconID="iconbuilder_actions_zoom_svg_16x16">
                        </Image>
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <br />
    <br />
    <div style="margin-left: 30px">
        <dx:ASPxRoundPanel ID="PanelA" runat="server" ShowCollapseButton="true" Width="500px" AllowCollapsingByHeaderClick="True" Theme="Office2003Blue" HeaderText="VENTAS POR GRUPO CLIENTES">
            <PanelCollection>
                <dx:PanelContent>
                    <div>
                        <br />
                        <br />
                        <div style="margin-left: 100px">
                            <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Ventas por Grupo Cliente" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                        </div>
                        <div>
                            <dx:ASPxGridView ID="GvDatosA" runat="server" AutoGenerateColumns="False" OnToolbarItemClick="GvDatosA_ToolbarItemClick">
                                <SettingsPager Mode="ShowAllRecords">
                                </SettingsPager>
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="TipoCliente" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="TotalVentas" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="CantTickets" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="TicketPromedio" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="TotalVentasCvTrading" FieldName="TotalVentasCvTradring" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <Toolbars>
                                    <dx:GridViewToolbar  Position="Top">
                                        <Items>
                                            <dx:GridViewToolbarItem Text="Exportar" Name="ExportA" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" Target="_parent">
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
                                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" />
                            </dx:ASPxGridView>
                        </div>
                        <br />
                        <br />
                        <br />
                        <br />
                        <div style="margin-left: 100px">
                            <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Ventas por Grupo Cliente Ultimo día" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                        </div>
                        <div>
                            <dx:ASPxGridView ID="GvDatosB" runat="server" OnToolbarItemClick="GvDatosB_ToolbarItemClick">
                                <SettingsPager Mode="ShowAllRecords">
                                </SettingsPager>
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="TipoCliente" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="TotalVentas" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="CantTickets" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="TicketPromedio" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="TotalVentasCvTrading" FieldName="TotalVentasCvTradring" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <Toolbars>
                                    <dx:GridViewToolbar  Position="Top">
                                        <Items>
                                            <dx:GridViewToolbarItem Text="Exportar" Name="ExportB" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" Target="_parent">
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
                                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" />
                            </dx:ASPxGridView>
                        </div>
                    </div>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxRoundPanel>
    </div>
    <br />
    <br />
    <div style="margin-left: 30px">
        <dx:ASPxRoundPanel ID="PanelB" runat="server" ShowCollapseButton="true" Width="500px" AllowCollapsingByHeaderClick="True" Theme="Office2003Blue" HeaderText="VENTAS POR VENDEDOR">
            <PanelCollection>
                <dx:PanelContent>
                    <br />
                    <br />
                    <div>
                        <div style="margin-left: 100px">
                            <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Ventas por Vendedor" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                        </div>
                        <div>
                            <dx:ASPxGridView ID="GvDatosC" runat="server" AutoGenerateColumns="False" OnToolbarItemClick="GvDatosC_ToolbarItemClick">
                                <SettingsPager Mode="ShowAllRecords">
                                </SettingsPager>
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="NombreVendedor" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="TotalVentas" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="CantTickets" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="TicketPromedio" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <Toolbars>
                                    <dx:GridViewToolbar  Position="Top">
                                        <Items>
                                            <dx:GridViewToolbarItem Text="Exportar" Name="ExportC" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" Target="_parent">
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
                                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" />
                            </dx:ASPxGridView>
                        </div>
                        <br />
                        <br />
                        <br />
                        <br />
                        <div style="margin-left: 100px">
                            <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Ventas por Vendedor Ultimo día" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                        </div>
                        <div>
                            <dx:ASPxGridView ID="GvDatosD" runat="server" OnToolbarItemClick="GvDatosD_ToolbarItemClick">
                                <SettingsPager Mode="ShowAllRecords">
                                </SettingsPager>
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="NombreVendedor" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="TotalVentas" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="CantTickets" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="TicketPromedio" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <Toolbars>
                                    <dx:GridViewToolbar  Position="Top">
                                        <Items>
                                            <dx:GridViewToolbarItem Text="Exportar" Name="ExportD" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" Target="_parent">
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
                                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" />
                            </dx:ASPxGridView>
                        </div>
                    </div>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxRoundPanel>
    </div>
    <br />
    <br />
    <div style="margin-left: 30px">
        <dx:ASPxRoundPanel ID="PanelC" runat="server" ShowCollapseButton="true" Width="500px" AllowCollapsingByHeaderClick="True" Theme="Office2003Blue" HeaderText="VENTAS POR CATEGORIA PRODUCTOS">
            <PanelCollection>
                <dx:PanelContent>
                    <div>
                        <br />
                        <br />
                        <div style="margin-left: 100px">
                            <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Ventas categoria Productos" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                        </div>
                        <div>
                            <dx:ASPxGridView ID="GvDatosE" runat="server" AutoGenerateColumns="False" OnToolbarItemClick="GvDatosE_ToolbarItemClick">
                                <SettingsPager Mode="ShowAllRecords">
                                </SettingsPager>
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="GrupoProducto" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="TotalVentas" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="CantTickets" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="TicketPromedio" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <Toolbars>
                                    <dx:GridViewToolbar Position="Top">
                                        <Items>
                                            <dx:GridViewToolbarItem Text="Exportar" Name="ExportE" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" Target="_parent">
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
                                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" />
                            </dx:ASPxGridView>
                        </div>
                        <br />
                        <br />
                        <br />
                        <br />
                        <div style="margin-left: 100px">
                            <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Ventas por Categoria Producto Ultimo día" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                        </div>
                        <div>
                            <dx:ASPxGridView ID="GvDatosF" runat="server" OnToolbarItemClick="GvDatosF_ToolbarItemClick">
                                <SettingsPager Mode="ShowAllRecords">
                                </SettingsPager>
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="GrupoProducto" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="TotalVentas" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="CantTickets" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="TicketPromedio" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <Toolbars>
                                    <dx:GridViewToolbar  Position="Top">
                                        <Items>
                                            <dx:GridViewToolbarItem Text="Exportar" Name="ExportF" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" Target="_parent">
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
                                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" />
                            </dx:ASPxGridView>
                        </div>
                    </div>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxRoundPanel>
    </div>
</asp:Content>
