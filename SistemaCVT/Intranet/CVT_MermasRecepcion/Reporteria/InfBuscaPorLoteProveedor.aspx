<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="InfBuscaPorLoteProveedor.aspx.cs" Inherits="CVT_MermasRecepcion.Reporteria.InfBuscaPorLoteProveedor" %>
<%@ Register assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style6 {
            width: 20px;
        }
        .auto-style7 {
            width: 121px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
<div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>Informes</a></li>
        <li><span id="current">Busca Por Lote Proveedor</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Busca Por Lote Proveedor</span>
    <span class="tab-end"></span>   
</div>
<div>
    <br />

    <table class="dxeBinImgCPnlSys">
        <tr>
            <td class="auto-style7">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Lote Proveedor" Font-Size="Medium"   >
                </dx:ASPxLabel>
            </td>
            <td class="auto-style6">
                <dx:ASPxTextBox ID="txt_pallet" runat="server" Width="170px">
                </dx:ASPxTextBox>
            </td>
            <td>
                <dx:ASPxButton ID="btn_buscar" runat="server" onclick="btn_buscar_Click" 
                    Text="Buscar">
                </dx:ASPxButton>
            </td>
        </tr>
        
        <tr>
            <td colspan="3">
                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="LqDsBuscaLP">
                            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
<SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
                    <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
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
                        <dx:GridViewDataTextColumn FieldName="Package_SSCC" VisibleIndex="1" Caption="N Pallet">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ArticleProvider_CodClient" 
                            VisibleIndex="2" Caption="Codigo">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="ArticleProvider_Description" 
                            VisibleIndex="3" Caption="Producto">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Package_Status" VisibleIndex="4" Caption="Estado">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Package_Lot" VisibleIndex="5" Caption="Lote Interno">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Package_Data1" VisibleIndex="6" Caption="Lote Proveedor">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Package_Data2" VisibleIndex="7" Caption="Info">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Layout_ShortDescription" VisibleIndex="9" Caption="Ubicacion">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="Site_ShortDescription" VisibleIndex="8" Caption="Bodega">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="F Vencimiento" FieldName="Package_ExpiresDate" VisibleIndex="11">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="F Produccion" FieldName="Package_ProductionDate" VisibleIndex="10">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <Styles>
                        <FocusedRow BackColor="#FF9933">
                        </FocusedRow>
                    </Styles>
                </dx:ASPxGridView>
                <asp:LinqDataSource ID="LqDsBuscaLP" runat="server" 
                    ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" 
                    TableName="CVT_VW_BuscaPorLoteProveedor" 
                    Where="Package_Data1 == @Package_Data1">
                    <WhereParameters>
                        <asp:ControlParameter ControlID="txt_pallet" DefaultValue="CVTCVT" 
                            Name="Package_Data1" PropertyName="Text" Type="String" />
                    </WhereParameters>
                </asp:LinqDataSource>
            </td>
        </tr>
    </table>

</div>
</asp:Content>
