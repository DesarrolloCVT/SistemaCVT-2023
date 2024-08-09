<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="InformeFefo.aspx.cs" Inherits="CVT_MermasRecepcion.Reporteria.InformeFefo" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Informes</a></li>
            <li><span id="current">INFORME FEFO</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">FEFO</span>
        <span class="tab-end"></span>

    </div>
    <br />
    <div style="margin-left: 50px">
        <table>
            <tr>
                <td>
                    <asp:Label ID="Labelqq" runat="server" Text="Producto"></asp:Label>
                    <dx:ASPxComboBox ID="cbo_producto" runat="server" DataSourceID="LqDsProductos"
                        ValueField="ArticleProvider_CodClient" Width="381px" Theme="iOS">
                        <Columns>
                            <dx:ListBoxColumn FieldName="ArticleProvider_CodClient" Name="Codigo"
                                Width="100px" />
                            <dx:ListBoxColumn FieldName="ArticleProvider_Description" Name="Producto"
                                Width="350px" />
                        </Columns>
                        <ClearButton DisplayMode="Always">
                        </ClearButton>
                        <ValidationSettings Display="Dynamic">
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Bodega"></asp:Label>
                    <dx:ASPxComboBox ID="cboBodega" runat="server" Theme="iOS" Width="331px" DataSourceID="LqsBodega" ValueField="Site_ShortDescription">
                        <Columns>
                            <dx:ListBoxColumn Caption="Bodega" FieldName="Site_ShortDescription">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Descripcion" FieldName="Site_Description">
                            </dx:ListBoxColumn>
                        </Columns>
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>

                </td>
            </tr>
        </table>
        <asp:LinqDataSource ID="LqDsProductos" runat="server" EntityTypeName=""
            ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext"
            TableName="ArticleProvider">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsBodega" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" TableName="VW_SITIOS_TODOS">
        </asp:LinqDataSource>
    </div>
    <br />
    <div style="margin-left: 250px">
        <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" Height="62px" Theme="iOS" Width="171px" OnClick="btnBuscar_Click"></dx:ASPxButton>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsPager PageSize="100">
            </SettingsPager>
            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <Toolbars>
                <dx:GridViewToolbar>
                    <Items>
                        <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXls" />
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                <dx:GridViewToolbarItem Command="ExportToCsv" />
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
                <dx:GridViewDataTextColumn FieldName="Almacen" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cod_Prolducto" FieldName="ArticleProvider_CodClient" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Descripcion" FieldName="ArticleProvider_Description" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FProduccion" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FVencimiento" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Lote" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Bodega" FieldName="Site_ShortDescription" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SSCC" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Ubicacion" FieldName="Layout_Description" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PaisOrigen" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="EstadoPallet" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
            </Columns>
              <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default"/>
        </dx:ASPxGridView>
    </div>
</asp:Content>
