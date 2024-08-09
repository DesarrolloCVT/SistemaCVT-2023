<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ListaPagoCobranzasPeriodo.aspx.cs" Inherits="CVT_MermasRecepcion.Tesoreria.ListaPagoCobranzasPeriodo" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 27px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Cierre Mensual</a></li>
            <li><a href="TesoreriaBlank.aspx">Tesoreria</a></li>
            <li><span id="current">Listado cobranzas periodo</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Listado cobranzas periodo</span>
        <span class="tab-end"></span>
        <div id="options">
    <%--        <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px" />
                Exportar Excel</a>--%>
            <%-- <a>             <asp:ImageButton ID="cmdNew"      runat="server" 
              ImageUrl="~/Images/add.png"  onclick="cmdNew_Click" style="width: 16px"/>Nuevo</a>--%>
        </div>
    </div>
    <div>
        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="200px" HeaderText="Filtros">
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <table>
                        <tr>
                            <td style="width: 250px">
                                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha Inicio">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Fecha Termino">
                                </dx:ASPxLabel>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">
                                <dx:ASPxDateEdit ID="cb_fini" runat="server">
                                    <ValidationSettings ValidationGroup="a">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxDateEdit>
                            </td>
                            <td class="auto-style1">
                                <dx:ASPxDateEdit ID="cb_fter" runat="server">
                                    <ValidationSettings ValidationGroup="a">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxDateEdit>
                            </td>
                        </tr>
                        <tfoot>
                            <tr>
                                <td></td>
                                <td>
                                    <dx:ASPxButton ID="btn_buscar" runat="server" OnClick="btn_buscar_Click" Text="Buscar">
                                    </dx:ASPxButton>
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxRoundPanel>


    </div>
    <br />
    <div>

        <dx:ASPxGridView ID="GvDatos" runat="server">
            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
        </dx:ASPxGridView>
    </div>
    <br />
    <br />
    <div>

        <dx:ASPxGridView ID="GvDatos2" runat="server" AutoGenerateColumns="False" OnToolbarItemClick="GvDatos2_ToolbarItemClick">
            <SettingsPager PageSize="50">
            </SettingsPager>
            <Settings ShowFilterRow="True" />
            <SettingsBehavior AllowFocusedRow="True" />
            <Toolbars>
                <dx:GridViewToolbar>
                    <Items>
                        <%--  <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif" />--%>
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
                <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="Codigo" FieldName="CardCode" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Razon Social" FieldName="CardName" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Monto" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="GvDatos2">
        </dx:ASPxGridViewExporter>
    </div>
</asp:Content>
