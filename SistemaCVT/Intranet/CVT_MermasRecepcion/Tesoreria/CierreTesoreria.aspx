<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CierreTesoreria.aspx.cs" Inherits="CVT_MermasRecepcion.Tesoreria.CierreTesoreria" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Tesoreria</a></li>
            <li><span id="current">Cierre Tesoreria</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Cierre Tesoreria</span>
        <span class="tab-end"></span>
        <div id="options">
          <%--  <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="height: 20px;" />
                Exportar Excel</a>&nbsp;--%>
           <%--   <a>
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
                    <asp:Label runat="server" Text="Fecha Inicio"></asp:Label>
                    <dx:ASPxDateEdit ID="dte_Inicio" runat="server"></dx:ASPxDateEdit>
                </td>
                <td>&nbsp;  &nbsp;  &nbsp;</td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Fecha Termino"></asp:Label>
                    <dx:ASPxDateEdit ID="dte_Termino" runat="server"></dx:ASPxDateEdit>
                </td>
                <td>&nbsp;  &nbsp;  &nbsp;</td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Informe"></asp:Label>
                    <dx:ASPxComboBox ID="cbo_Opcion" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cbo_Opcion_SelectedIndexChanged">
                        <Items>
                            <dx:ListEditItem Text="Pagos x Periodo" Value="1" />
                            <dx:ListEditItem Text="Proyeccion de Pagos" Value="2" />
                            <dx:ListEditItem Text="Facturas Pagadas x Periodo" Value="3" />
                            <dx:ListEditItem Text="Proyeccion de Cobranza" Value="4" />
                            <dx:ListEditItem Text="Cumplimiento x Condicion de Pago Compra" Value="5" />
                            <dx:ListEditItem Text="Pendientes Reconciliacion" Value="6" />
                            <dx:ListEditItem Text="Facturas x Centro de Costo" Value="7" />
                            <dx:ListEditItem Text="Cartola Bancaria" Value="8" />
                            <dx:ListEditItem Text="Cumplimiento x Condicion de Pago Venta" Value="9" />
                            <dx:ListEditItem Text="Despachos x Comuna y Camion" Value="10" />
                            <dx:ListEditItem Text="Porcentaje compras por Proveedor" Value="11" />
                            <dx:ListEditItem Text="Porcentaje ventas por Clientes" Value="12" />
                            <dx:ListEditItem Text="Pedidos por Items de Gastos" Value="13" />
                            <dx:ListEditItem Text="Cuentas Mayor a" Value="14" />
                        </Items>
                    </dx:ASPxComboBox>
                </td>
                <td>&nbsp;  &nbsp;  &nbsp;</td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Cuenta"></asp:Label>
                    <dx:ASPxTextBox ID="txt_Cuentas" runat="server" Width="170px" Height="26px" AutoPostBack="True" OnTextChanged="txt_Cuentas_TextChanged">
                    </dx:ASPxTextBox>
                </td>
                <td>&nbsp;  &nbsp;  &nbsp;</td>


                <td>&nbsp;</td>
            </tr>
        </table>
    </div>
    <br />
    <br />
    <br />
    <div style="margin-left: 50px">
        <asp:Label ID="lblInforme" runat="server" Text="" Font-Size="Medium"></asp:Label>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsPager PageSize="50">
            </SettingsPager>
            <Settings ShowFilterRow="True" ShowGroupPanel="True" VerticalScrollableHeight="500" GroupSummaryTextSeparator="  ;  " ShowGroupFooter="VisibleIfExpanded" />
            <SettingsBehavior AllowFocusedRow="True" />
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
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="GvDatos">
        </dx:ASPxGridViewExporter>
    </div>
</asp:Content>
