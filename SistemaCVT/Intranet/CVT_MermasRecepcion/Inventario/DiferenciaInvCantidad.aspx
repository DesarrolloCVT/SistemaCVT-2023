<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="DiferenciaInvCantidad.aspx.cs" Inherits="CVT_MermasRecepcion.Inventario.DiferenciaInvCantidad" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
      <br />
        <div>
            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Bold="True" Font-Size="Large"
                Text="Diferencias por Cantidad">
            </dx:ASPxLabel>
        </div>
        <div>
            <dx:ASPxGridView ID="GvCantidad" runat="server" AutoGenerateColumns="False"
                OnRowCommand="GvCantidad_RowCommand" DataSourceID="LqDsCantidad" OnToolbarItemClick="GvCantidad_ToolbarItemClick">
                <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
                <Toolbars>
                    <dx:GridViewToolbar>
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
                    <dx:GridViewDataTextColumn FieldName="Inventario_Id" VisibleIndex="1" Caption="Folio">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Usuario" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BodegaPistoleo" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="UbicacionPistoleo" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="RackPistoleo" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BodegaSistema" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="UbicacionSistema" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="RackSistema" VisibleIndex="8">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="NPallet" VisibleIndex="9">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Estado" VisibleIndex="10">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CodProducto" VisibleIndex="11">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Producto" VisibleIndex="12">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CodProductoSistema" VisibleIndex="13">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ProductoSistema" VisibleIndex="14">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Lote" VisibleIndex="15">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="LoteSistema" VisibleIndex="16">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="17">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CantidadSistema" VisibleIndex="18">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="FechaRegistro" VisibleIndex="19">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataHyperLinkColumn Caption="C. WMS" VisibleIndex="20">
                        <EditFormSettings Visible="False" />
                        <DataItemTemplate>
                            <asp:ImageButton ID="Corregir" CommandName="cmdCorregir" runat="server" ImageUrl="~/Images/check-box.png" />
                        </DataItemTemplate>
                    </dx:GridViewDataHyperLinkColumn>
                </Columns>
                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />

                <SettingsPopup>
                    <FilterControl AutoUpdatePosition="False"></FilterControl>
                </SettingsPopup>

                <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            </dx:ASPxGridView>
            <asp:LinqDataSource ID="LqDsCantidad" runat="server"
                ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
                TableName="CVT_VW_InventarioCantidadDiferente">
            </asp:LinqDataSource>
            <dx:ASPxGridViewExporter runat="server" GridViewID="GvCantidad" ExportedRowType="All" ID="ASPxGridViewExporter2">
            </dx:ASPxGridViewExporter>
        </div>
        <br />
</asp:Content>
