<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ResumenGestion.aspx.cs" Inherits="CVT_MermasRecepcion.Gestion.ResumenGestion" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Gestion</a></li>
            <li><span id="current">Resumen Gestion</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Resumen Gestion</span>
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
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Tipo Informe"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cbotipoInf" runat="server" EnableTheming="True" Theme="iOS">
                        <Items>
                            <dx:ListEditItem Text="Detalle Cta." Value="1" />
                            <dx:ListEditItem Text="Detalle Cta. Padre" Value="2" />
                            <dx:ListEditItem Text="Detalle Linea Gestion" Value="3" />
                        </Items>
                    </dx:ASPxComboBox>
                </td>
                <td></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Fecha Inicio"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteInicio" runat="server" Theme="iOS"></dx:ASPxDateEdit>
                </td>
                <td></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Fecha Termino"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteTermino" runat="server" Theme="iOS"></dx:ASPxDateEdit>
                </td>
            </tr>
        </table>
    </div>
    <div style="margin-left: 50px">
        <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" Height="43px" OnClick="btnBuscar_Click" Theme="iOS" Width="139px"></dx:ASPxButton>
    </div>

    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <Toolbars>
                <dx:GridViewToolbar>
                    <Items>                   
                        <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXls" />
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />                               
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
             <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
    </div>
</asp:Content>
