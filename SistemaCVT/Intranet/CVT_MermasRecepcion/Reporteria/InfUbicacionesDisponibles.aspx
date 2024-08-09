<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="InfUbicacionesDisponibles.aspx.cs" Inherits="CVT_MermasRecepcion.Reporteria.InfUbicacionesDisponibles" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="tableHeader">
        <span class="tableTitle">Ubicaciones Diponibles</span>
        <span class="tab-end"></span>

    </div>
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Informes</a></li>
            <li><span id="current">Informe de Ubicaciones Disponibles</span></li>
        </ul>
    </div>
    <br />
    <div>
        <dx:ASPxRoundPanel HeaderText="Filtros" runat="server" ID="panel" ShowCollapseButton="True">
            <PanelCollection>
                <dx:PanelContent>
                    <table>
                        <tr>
                            <td>
                                <dx:ASPxLabel runat="server" Text="Bodega"></dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxComboBox runat="server" ID="cb_site" DataSourceID="LqDsSite" TextField="Site_ShortDescription" ValueField="Site_Id">
                                    <ValidationSettings ValidationGroup="SendMessage">
                                        <RequiredField IsRequired="true" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                                <asp:LinqDataSource ID="LqDsSite" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" Select="new (Site_Id, Site_ShortDescription)" TableName="Site">
                                </asp:LinqDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxLabel runat="server" Text="Tipo Rack"></dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxComboBox runat="server" ID="cb_rack" DataSourceID="LqDsRack" TextField="Rack_Type" ValueField="Rack_Id" ValueType="System.Int32"></dx:ASPxComboBox>

                                <asp:LinqDataSource ID="LqDsRack" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" TableName="Rack">
                                </asp:LinqDataSource>
                            </td>
                            <td>
                                <dx:ASPxButton runat="server" Text="Limpiar" ID="btn_limpiar" OnClick="btn_limpiar_Click"></dx:ASPxButton>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <dx:ASPxButton runat="server" ID="btn_filtrar" Text="Filtrar" OnClick="btn_filtrar_Click">
                                    <ClientSideEvents Click="function(s, e){
                                        ASPxClientEdit.ValidateGroup('SendMessage');    
                                    }" />
                                </dx:ASPxButton>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxRoundPanel>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxLabel runat="server" Font-Bold="true" Text="Ubicaciones Disponibles"></dx:ASPxLabel>
        <%--   <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" />
                Exportar Excel</a>

        </div>--%>
    </div>
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqDsUbicaciones" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsPager PageSize="40">
            </SettingsPager>
            <SettingsBehavior AllowFocusedRow="True" />
            <SettingsCookies Enabled="True" />
            <Toolbars>
                <dx:GridViewToolbar>
                    <Items>
                        <%--   <dx:GridViewToolbarItem Command="New" />--%>
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
                <dx:GridViewDataTextColumn FieldName="Layout_Id" Visible="False" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Ubicacion" FieldName="Layout_Description" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Ubicacion Corta" FieldName="Layout_ShortDescription" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Site_Id" Visible="False" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Bodega" FieldName="Site_ShortDescription" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Rack_Id" Visible="False" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Tipo Rack" FieldName="Rack_Type" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsUbicaciones" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" TableName="CVT_VW_UbicacionesDisponibles">
        </asp:LinqDataSource>

        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="GvDatos">
        </dx:ASPxGridViewExporter>

    </div>

</asp:Content>
