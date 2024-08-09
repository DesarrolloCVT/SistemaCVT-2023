<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ListadoCheckRealizadosArmadoPedido.aspx.cs" Inherits="CVT_MermasRecepcion.Calidad.ListadoCheckRealizadosArmadoPedido" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Calidad</a></li>
            <li><span id="current">Check List Armado Pedido</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Armado Pedido</span>
        <span class="tab-end"></span>
  <%--      <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px" />
                Exportar Excel</a>
        </div>--%>

    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqDsCheckArmadoPedido" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsPager PageSize="50">
            </SettingsPager>
            <SettingsBehavior AllowFocusedRow="True" />
            <Toolbars>
                <dx:GridViewToolbar>
                    <Items>
                      <%--  <dx:GridViewToolbarItem Command="New" />--%>
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
                <dx:GridViewDataTextColumn FieldName="Pedido_N" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cliente" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaEntrega" VisibleIndex="2">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataCheckColumn FieldName="FEFO" VisibleIndex="3">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataCheckColumn FieldName="VidaUtil" VisibleIndex="4">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataCheckColumn FieldName="EstadoPallet" VisibleIndex="5">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataCheckColumn FieldName="Film" VisibleIndex="6">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataCheckColumn FieldName="BaseProducto" VisibleIndex="7">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataCheckColumn FieldName="DUN14" VisibleIndex="8">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataTextColumn FieldName="LugarArmado" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaRegistro" VisibleIndex="10">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Usuario" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>

        <asp:LinqDataSource ID="LqDsCheckArmadoPedido" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
            TableName="CVT_VW_CheckListArmadoPedido">
        </asp:LinqDataSource>

        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server"
            GridViewID="GvDatos">
        </dx:ASPxGridViewExporter>

    </div>
</asp:Content>
