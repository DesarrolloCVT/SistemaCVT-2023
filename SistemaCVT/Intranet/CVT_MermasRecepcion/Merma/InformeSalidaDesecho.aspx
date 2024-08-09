<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="InformeSalidaDesecho.aspx.cs" Inherits="CVT_MermasRecepcion.Merma.InformeSalidaDesecho" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Merma</a></li>
            <li><span id="current">Informe Salida Desecho</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Informe Salida Desecho</span>
        <span class="tab-end"></span>
       <%-- <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="height: 20px;" />
                Exportar Excel</a>&nbsp;
              <a>
                  <asp:ImageButton ID="cmdNew" runat="server"
                      ImageUrl="~/Images/add.png" onclick="cmdNew_Click" style="width: 16px" />
                  Nuevo</a>
        </div>--%>
    </div>

    <br />
    <div style="margin-left: 50px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Mes" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboMes" runat="server" SelectedIndex="0" Width="110px">
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
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Año" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboAno" runat="server" Width="100px">
                        <Items>
                            <dx:ListEditItem Text="2017" Value="2017" />
                            <dx:ListEditItem Text="2018" Value="2018" />
                            <dx:ListEditItem Text="2019" Value="2019" />
                            <dx:ListEditItem Text="2020" Value="2020" />
                            <dx:ListEditItem Text="2021" Value="2021" />
                            <dx:ListEditItem Text="2022" Value="2022" />
                            <dx:ListEditItem Text="2023" Value="2023" />
                            <dx:ListEditItem Text="2024" Value="2024" />
                            <dx:ListEditItem Text="2025" Value="2025" />
                            <dx:ListEditItem Text="2026" Value="2026" />
                            <dx:ListEditItem Text="2027" Value="2027" />
                            <dx:ListEditItem Text="2028" Value="2028" />
                            <dx:ListEditItem Text="2029" Value="2029" />
                            <dx:ListEditItem Text="2030" Value="2030" />
                        </Items>
                    </dx:ASPxComboBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" Theme="iOS" OnClick="btnBuscar_Click"></dx:ASPxButton>
                </td>

            </tr>
        </table>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <Toolbars>
                <dx:GridViewToolbar>
                    <Items>
                        <%--<dx:GridViewToolbarItem Command="New" />--%>
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

            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
    </div>
</asp:Content>
