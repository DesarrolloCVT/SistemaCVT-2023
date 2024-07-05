<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CalculoDescargas.aspx.cs" Inherits="CVT_MermasRecepcion.GestionExternos.CalculoDescargas" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Gestion externos</a></li>
            <li><span id="current">Calculo descargas</span></li>
        </ul>
    </div>
    <br />
    <br />
    <div id="tableHeader">
        <span class="tableTitle">Calculo descargas</span>
        <span class="tab-end"></span>
        <%--        <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px" />
                Exportar Excel</a>
        </div>--%>
        <br />
    </div>

    <table>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Desde: "></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxDateEdit ID="cbo_Desde" runat="server"></dx:ASPxDateEdit>
            </td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Hasta: "></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxDateEdit ID="cbo_Hasta" runat="server"></dx:ASPxDateEdit>
            </td>
        </tr>
    </table>
    <div>
        <dx:ASPxButton ID="btnBuscarCalculoDesc" runat="server" Text="Buscar" OnClick="btnBuscarCalculoDesc_Click"></dx:ASPxButton>
        <br />
        <br />
        <br />
        <h3>Calculo Descargas </h3>
        <dx:ASPxGridView ID="GVCalculoDescargas" runat="server" OnToolbarItemClick="GVCalculoDescargas_ToolbarItemClick">
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
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
        </dx:ASPxGridView>
    </div>
</asp:Content>
