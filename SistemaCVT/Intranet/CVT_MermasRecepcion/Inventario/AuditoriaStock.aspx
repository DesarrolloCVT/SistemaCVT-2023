<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="AuditoriaStock.aspx.cs" Inherits="CVT_MermasRecepcion.Inventario.AuditoriaStock" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 22px;
        }

        .auto-style6 {
            width: 21px;
        }

        .auto-style7 {
            width: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Inventario</a></li>
            <%--  <li><a href="../Inventario/Inventario.aspx">Inventario</a></li>--%>
            <li><span id="current">Auditoria Stock</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Auditoria Stock</span>
        <span class="tab-end"></span>
        <%--    <div id="options">         
          <a><asp:ImageButton ID="cmdExcel"    runat="server" 
              ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" onclick="cmdExcel_Click" 
              style="width: 20px" /> Exportar Excel</a>
     <a>             <asp:ImageButton ID="cmdNew"      runat="server" 
              ImageUrl="~/Images/add.png"  onclick="cmdNew_Click" style="width: 16px"/>Nuevo</a>
    </div>--%>
    </div>
    <br />
    <br />

    <div style="margin-left: 50px">
        <table>
            <tr>
                <td>
                    <asp:Label runat="server" Text="Desde"></asp:Label>
                    <dx:ASPxDateEdit ID="dteDesde" runat="server"></dx:ASPxDateEdit>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <asp:Label runat="server" Text="Hasta"></asp:Label>
                    <dx:ASPxDateEdit ID="dteHasta" runat="server"></dx:ASPxDateEdit>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <asp:Label runat="server" Text="Informe"></asp:Label>
                    <dx:ASPxComboBox ID="cboInforme" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cboInforme_SelectedIndexChanged">
                        <Items>
                            <dx:ListEditItem Text="INFORME GENERAL" Value="1" />
                            <dx:ListEditItem Text="INFORME POR COD.PRODUCTO" Value="2" />
                        </Items>
                    </dx:ASPxComboBox>
                </td>
                <td class="auto-style7"></td>

                <td>
                    <dx:ASPxTextBox ID="txtProducto" runat="server" Width="170px" Height="30px" NullText="Cod.Producto" NullTextDisplayMode="UnfocusedAndFocused"></dx:ASPxTextBox>
                </td>
            </tr>
        </table>
    </div>
    <br />

    <div style="margin-left: 250px">
        <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click"></dx:ASPxButton>
    </div>
    <br />
    <div style="margin-left: 200px">
        <dx:ASPxLabel ID="lblTipInf" runat="server" Text="" Font-Size="Medium"></dx:ASPxLabel>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" OnToolbarItemClick="GvDatos_ToolbarItemClick">
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
            <SettingsPager PageSize="50">
            </SettingsPager>
            <Settings ShowFilterRow="True" />
            <SettingsBehavior AllowFocusedRow="True" />

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
    </div>
</asp:Content>
