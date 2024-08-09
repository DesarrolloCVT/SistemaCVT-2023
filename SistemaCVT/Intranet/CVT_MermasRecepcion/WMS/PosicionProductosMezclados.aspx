<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PosicionProductosMezclados.aspx.cs" Inherits="CVT_MermasRecepcion.WMS.PosicionProductosMezclados" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>WMS</a></li>
            <li><span id="current">Posicion Productos Mezclados</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Posicion Productos Mezclados</span>
        <span class="tab-end"></span>
    </div>
    <%--    <div>
        <a>
            <asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" />
            Exportar Excel</a>
    </div>--%>
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" KeyFieldName="Layout_Id"
            DataSourceID="LqDsMezcla" OnRowCommand="GvDatos_RowCommand" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsPager PageSize="25">
            </SettingsPager>
            <SettingsBehavior AllowFocusedRow="True" />
            <Toolbars>
                <dx:GridViewToolbar>
                    <Items>
                        <%--     <dx:GridViewToolbarItem Command="New" />--%>
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
                <dx:GridViewDataTextColumn Caption="Productos Diferentes"
                    FieldName="Cant_Porductos" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cod Ubicacion" FieldName="Layout_Id"
                    VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Posicion" FieldName="Layout_Description"
                    VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Bodega" FieldName="Site_ShortDescription"
                    VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Confirma" VisibleIndex="17">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="cmdDetalle" CommandName="cmdDetalle" runat="server"
                            ImageUrl="~/Images/reportes.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
            </Columns>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsMezcla" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
            TableName="CVT_MezclaProductoUbicacion">
        </asp:LinqDataSource>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server"
            GridViewID="GvDatos">
        </dx:ASPxGridViewExporter>

        <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" HeaderText="Detalle"
            Width="900px">
            <ContentCollection>
                <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">
                    <%--           <div>
                        <a>
                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel1_Click" />
                            Exportar Excel</a>
                    </div>--%>
                    <dx:ASPxGridView ID="GvDatos0" runat="server" AutoGenerateColumns="False"
                        DataSourceID="LqDsConsultaPosicion" OnToolbarItemClick="GvDatos0_ToolbarItemClick">
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings ShowGroupPanel="True" />
                        <Toolbars>
                            <dx:GridViewToolbar>
                                <Items>
                                    <%--     <dx:GridViewToolbarItem Command="New" />--%>
                                    <dx:GridViewToolbarItem Text="ExportarDet" Name="ExportDet" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
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
                            <dx:GridViewDataTextColumn Caption="N Pallet" FieldName="Package_SSCC"
                                ShowInCustomizationForm="True" VisibleIndex="0">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Codigo Producto"
                                FieldName="ArticleProvider_CodClient" ShowInCustomizationForm="True"
                                VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Producto"
                                FieldName="ArticleProvider_Description" ShowInCustomizationForm="True"
                                VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Cantidad" FieldName="Package_Quantity"
                                ShowInCustomizationForm="True" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Lote" FieldName="Package_Lot"
                                ShowInCustomizationForm="True" VisibleIndex="4">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Posicion" FieldName="Layout_Description"
                                ShowInCustomizationForm="True" VisibleIndex="5">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Layout_Id" ShowInCustomizationForm="True"
                                Visible="False" VisibleIndex="6">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Bodega" FieldName="Site_ShortDescription"
                                ShowInCustomizationForm="True" VisibleIndex="7">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Cantidad Lote SAP" FieldName="Quantity"
                                ShowInCustomizationForm="True" VisibleIndex="8">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Usuario" FieldName="Staff_Name"
                                ShowInCustomizationForm="True" VisibleIndex="9">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Fecha Posicionamiento" FieldName="Location_InDate"
                                ShowInCustomizationForm="True" VisibleIndex="10">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
                        <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
                    </dx:ASPxGridView>
                    <asp:LinqDataSource ID="LqDsConsultaPosicion" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
                        TableName="CVT_ConsultaPosicion" Where="Layout_Id == @Layout_Id">
                        <WhereParameters>
                            <asp:SessionParameter DefaultValue="0" Name="Layout_Id" SessionField="LayoutId"
                                Type="Int32" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter2" runat="server"
                        ExportedRowType="All" GridViewID="GvDatos0">
                    </dx:ASPxGridViewExporter>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
</asp:Content>
