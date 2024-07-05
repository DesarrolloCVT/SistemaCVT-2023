<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CalculoPedidosCamionPropio.aspx.cs" Inherits="CVT_MermasRecepcion.GestionExternos.CalculoPedidosCamionPropio" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
      <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Gestion externos</a></li>
            <li><span id="current">Calculo pedidos camion propio</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Calculo pedidos camion propio</span>
        <span class="tab-end"></span>
        <%--        <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px" />
                Exportar Excel</a>
        </div>--%>
    </div>
     <table>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Desde: "></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxDateEdit ID="cbo_Desde" runat="server"></dx:ASPxDateEdit>
            </td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Hasta: "></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxDateEdit ID="cbo_Hasta" runat="server"></dx:ASPxDateEdit>
            </td>
        </tr>
    </table>
    <br />
        <br />
    <div>
        <dx:ASPxButton ID="btn_BuscaPedCamPropio" runat="server" Text="Buscar" OnClick="btn_BuscaPedCamPropio_Click"></dx:ASPxButton>
    </div>
    <br />
        <br />
    <div>
        <h3>
            Calculo Pedidos Camion Propio
         </h3>
        <br />
        <br />
        <dx:ASPxGridView ID="GVCalculoPedCamPropio" runat="server" AutoGenerateColumns="False" OnToolbarItemClick="GVCalculoPedCamPropio_ToolbarItemClick">
            <SettingsPager AlwaysShowPager="True" PageSize="10000">
            </SettingsPager>
            <Settings ShowFooter="True" />
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <Toolbars>
                <dx:GridViewToolbar >
                    <Items>
                        <%--<dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif" />--%>
                        <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXls" />
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                <dx:GridViewToolbarItem Command="ExportToDocx" />
                                <dx:GridViewToolbarItem Command="ExportToRtf" />
                                <dx:GridViewToolbarItem Command="ExportToCsv" />
                                <dx:GridViewToolbarItem Command="ExportToPdf" />
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
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Empresa" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Fecha" FieldName="DOCDATE" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cod Cliente" FieldName="CardCode" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cliente" FieldName="CARDNAME" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Camion" FieldName="U_PATENTECAMION" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cant Puntos" FieldName="Puntos" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
            </Columns>
            <TotalSummary>
                <dx:ASPxSummaryItem ShowInColumn="Cant Puntos" SummaryType="Sum" FieldName="Puntos" ValueDisplayFormat="N0" />
            </TotalSummary>
        </dx:ASPxGridView>
    </div>
</asp:Content>
