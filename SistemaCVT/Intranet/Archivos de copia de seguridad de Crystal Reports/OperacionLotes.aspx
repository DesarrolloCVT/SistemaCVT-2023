<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="OperacionLotes.aspx.cs" Inherits="CVT_MermasRecepcion.Inventario.OperacionLotes" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 20px;
        }

        .auto-style6 {
            margin-left: 3px;
        }

        .auto-style7 {
            width: 22px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Inventario</a></li>
            <%--  <li><a href="../Inventario/Inventario.aspx">Inventario</a></li>--%>
            <li><span id="current">Lotes</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Lotes</span>
        <span class="tab-end"></span>     
    </div>
    <br />
    <div style="margin-left: 50px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="informe"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboInforme" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cboInforme_SelectedIndexChanged">
                        <Items>
                            <dx:ListEditItem Text="Inf x Codigo" Value="1" />
                            <dx:ListEditItem Text="Inf x Codigo y Lote" Value="2" />
                            <dx:ListEditItem Text="Inf x Codigo ,Lote y Bodega" Value="3" />
                            <dx:ListEditItem Text="Informe General" Value="4" />
                        </Items>
                    </dx:ASPxComboBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="lblcodPro" runat="server" Text="Cod.Producto"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="Cbo_Producto" runat="server" DataSourceID="LqDsProductos" ValueField="ItemCode">
                        <Columns>
                            <dx:ListBoxColumn Caption="Codigo" FieldName="ItemCode" Width="100px">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Producto" FieldName="ItemName" Width="300px">
                            </dx:ListBoxColumn>
                        </Columns>
                    </dx:ASPxComboBox>
                    <asp:LinqDataSource ID="LqDsProductos" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" Select="new (ItemCode, ItemName)" TableName="OITM">
                    </asp:LinqDataSource>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="lblLote" runat="server" Text="Lote"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtLote" runat="server" Width="170px" Height="23px">
                        <ValidationSettings ErrorText="*" Display="Dynamic">
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="lblBodega" runat="server" Text="Bodega"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboBodega" runat="server" DataSourceID="LQSBodega" TextField="Site_Description" ValueField="Site_ShortDescription"></dx:ASPxComboBox>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 50px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="lblInicio" runat="server" Text="Desde"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteDesde" runat="server"></dx:ASPxDateEdit>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="lblHasta" runat="server" Text="Hasta"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteHasta" runat="server"></dx:ASPxDateEdit>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 250px">
        <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" Height="28px" Width="85px"></dx:ASPxButton>
        <asp:LinqDataSource ID="LQSBodega" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" TableName="Site">
        </asp:LinqDataSource>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <Settings ShowFilterRow="True" />
            <SettingsBehavior AllowFocusedRow="True" />
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
    </div>
    <br />
    <br />
    <br />
    <br />
    <div>
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="lblDetalle" runat="server" Text="DETALLE" Font-Size="Medium"></dx:ASPxLabel>
                </td>
                <td class="auto-style7"></td>
                <%--<td>
                    <a>
                        <asp:ImageButton ID="ImageButton1" runat="server"
                            ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" CssClass="auto-style6" OnClick="ImageButton1_Click" />
                        Exportar Excel</a>
                </td>--%>
            </tr>
        </table>
    </div>
    <br />


    <div>
        <dx:ASPxGridView ID="GvDetalle" runat="server" AutoGenerateColumns="False" OnToolbarItemClick="GvDetalle_ToolbarItemClick">
            <SettingsPager PageSize="30">
            </SettingsPager>
            <Settings ShowFilterRow="True" />
            <SettingsBehavior AllowFocusedRow="True" />
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
    </div>
</asp:Content>
