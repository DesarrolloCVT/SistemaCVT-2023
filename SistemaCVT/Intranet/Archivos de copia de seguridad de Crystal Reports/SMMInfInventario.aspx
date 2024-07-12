<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SMMInfInventario.aspx.cs" Inherits="CVT_MermasRecepcion.Mayorista.SMMInfInventario" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Mayorista</a></li>
            <li><span id="current">Informe Inventario SMM</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Informe Inventario SMM</span>
        <span class="tab-end"></span>
        <%--      <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px; height: 20px;" />
                Exportar Excel</a>&nbsp;
              <a>
                  <asp:ImageButton ID="cmdNew" runat="server"
                      ImageUrl="~/Images/nuevo.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>
        </div>--%>
    </div>

    <br />
    <div style="margin-left: 25px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Folio" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cbofolio" runat="server" DataSourceID="Lqsfolio" Height="30px" TextField="Inventario_Id" ValueField="Inventario_Id"></dx:ASPxComboBox>
                    <asp:LinqDataSource ID="Lqsfolio" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName="" Select="new (Inventario_Id)" TableName="SMM_InventarioCabecera">
                    </asp:LinqDataSource>
                </td>
                <td></td>
                <td>
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" Height="50px" OnClick="btnBuscar_Click" Width="94px"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 55px">
        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="INFORME POR BODEGA Y PRODUCTO" Font-Bold="true" Font-Size="Large"></dx:ASPxLabel>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="gvdatos" runat="server" AutoGenerateColumns="False" DataSourceID="lqsInv" OnToolbarItemClick="gvdatos_ToolbarItemClick">
            <Toolbars>
                <dx:GridViewToolbar Position="Top">
                    <Items>
                        <dx:GridViewToolbarItem Text="Exportar" Name="Export1" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
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
                <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Folio" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Bodega" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodProducto" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Producto" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <Settings AutoFilterCondition="Contains" ShowFilterRow="True" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="lqsInv" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName="" TableName="SMM_VW_INF_INVENTARIO_SMM" Where="Folio == @Folio">
            <WhereParameters>
                <asp:ControlParameter ControlID="cbofolio" DefaultValue="0" Name="Folio" PropertyName="Value" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
    <br />
    <br />
    <br />
    <div style="margin-left: 55px">
        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="INFORME POR USUARIO" Font-Bold="true" Font-Size="Large"></dx:ASPxLabel>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos1" runat="server" AutoGenerateColumns="False" DataSourceID="LqsInfInventarioxUser" OnToolbarItemClick="GvDatos1_ToolbarItemClick">
            <SettingsPager PageSize="20">
            </SettingsPager>
            <Settings ShowFilterRow="True" ShowGroupPanel="True" AutoFilterCondition="Contains" />
            <Toolbars>
                <dx:GridViewToolbar  Position="Top">
                    <Items>
                        <dx:GridViewToolbarItem Text="Exportar" Name="Export1" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
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
                                <dx:ASPxButtonEdit ID="tbToolbarSearch1" runat="server" NullText="Search..." Height="100%">
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
                <dx:GridViewDataTextColumn FieldName="Folio" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Bodega" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodProducto" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Producto" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Usuario" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch1" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsInfInventarioxUser" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName="" TableName="SMM_VW_INF_INVENTARIOxUSER_SMM" Where="Folio == @Folio">
            <WhereParameters>
                <asp:ControlParameter ControlID="cbofolio" DefaultValue="0" Name="Folio" PropertyName="Value" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
</asp:Content>
