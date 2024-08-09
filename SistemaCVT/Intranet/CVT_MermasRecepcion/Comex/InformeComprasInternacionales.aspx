<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="InformeComprasInternacionales.aspx.cs" Inherits="CVT_MermasRecepcion.Comex.InformeComprasInternacionales" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 171px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Comex</a></li>
            <li><span id="current">Informe Compras internacionales</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Informe Compras internacionales</span>
        <span class="tab-end"></span>
        <div id="options">
         <%--   <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="height: 20px;" />
                Exportar Excel</a>&nbsp;--%>
             <%-- <a>
                  <asp:ImageButton ID="cmdNew" runat="server"
                      ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>--%>
        </div>
    </div>
    <br />
    <br />
    <div>
        <table>
            <tr>
                <td>
                    <label>Fecha Inicio</label>
                </td>
                <td>
                    <dx:ASPxDateEdit ID="dteInicio" runat="server"></dx:ASPxDateEdit>
                </td>
                <td>&nbsp;  &nbsp;  &nbsp;
                </td>
                <td>
                    <label>Fecha Termino</label>
                </td>
                <td>
                    <dx:ASPxDateEdit ID="dteFtermino" runat="server"></dx:ASPxDateEdit>
                </td>
                <td>&nbsp;  &nbsp;  &nbsp;
                </td>
                <td>
                    <label>Tipo Informe</label>
                </td>
                <td class="auto-style5">
                    <dx:ASPxComboBox ID="cboTipoInforme" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cboTipoInforme_SelectedIndexChanged">
                        <Items>
                            <dx:ListEditItem Text="Informe Programa Semanal" Value="1" />
                            <dx:ListEditItem Text="Embarques Maritimos" Value="2" />
                            <dx:ListEditItem Text="Informe Semanal" Value="3" />
                            <dx:ListEditItem Text="Informe Llegados" Value="4" />
                        </Items>
                    </dx:ASPxComboBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>

        </table>
    </div>
    <br />
    <br />
    <div style="margin-left: 150px">
        <asp:Label ID="lblInforme" runat="server" Text="" Font-Size="Medium"></asp:Label>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsPager PageSize="20">
            </SettingsPager>
            <Settings ShowFilterRow="True" ShowGroupPanel="True" />
            <SettingsBehavior AllowFocusedRow="True" />
            <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
            <Toolbars>
                <dx:GridViewToolbar>
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
            </Columns>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="GvDatos">
        </dx:ASPxGridViewExporter>
    </div>
</asp:Content>
