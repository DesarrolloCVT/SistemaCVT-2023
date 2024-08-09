<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="InformeStockFilm.aspx.cs" Inherits="CVT_MermasRecepcion.ControlFilm.InformeStockFilm" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 176px;
        }

        .auto-style6 {
            width: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Informes</a></li>
            <li><span id="current">Informe Stock Film</span></li>
        </ul>
    </div>
    <div id="tableHeader">
        <span class="tableTitle">Informe Stock Film</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <div style="margin-left: 25px">
        <table class="style1">
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Producto" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cbo_producto" runat="server" DataSourceID="LqsProducto" Height="30px" ValueField="ItemCode" Width="400px">
                        <Columns>
                            <dx:ListBoxColumn Caption="Cod.Producto" FieldName="ItemCode" Width="150px">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Producto" FieldName="ItemName" Width="350px">
                            </dx:ListBoxColumn>
                        </Columns>
                        <ClearButton DisplayMode="Always">
                        </ClearButton>
                    </dx:ASPxComboBox>
                </td>
                <td class="auto-style6"></td>
                <td class="auto-style5">
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Lote" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txt_lote" runat="server" Width="170px" Height="30px"></dx:ASPxTextBox>
                </td>
            </tr>
            <asp:LinqDataSource ID="LqsProducto" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" Select="new (ItemName, ItemCode)" TableName="OITM" Where="QryGroup14 == @QryGroup14">
                <WhereParameters>
                    <asp:Parameter DefaultValue="Y" Name="QryGroup14" Type="Char" />
                </WhereParameters>
            </asp:LinqDataSource>
        </table>
    </div>
    <br />
    <div style="margin-left: 25px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Bodega" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cbo_bodega" runat="server" DataSourceID="LqDsSite" Height="30px" TextField="Descripcion" ValueField="Descripcion" Width="200px">
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <dx:ASPxButton ID="btn_Buscar" runat="server" Text="Buscar" Height="45px" Width="100px" OnClick="btn_Buscar_Click">
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>
        <asp:LinqDataSource runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" TableName="VW_Bodegas_informe_stockFilm" EntityTypeName="" ID="LqDsSite"></asp:LinqDataSource>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsPager PageSize="100">
            </SettingsPager>
            <Settings ShowFooter="True" />
            <Toolbars>
                <dx:GridViewToolbar >
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
                <dx:GridViewDataTextColumn FieldName="NBobina" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodProducto" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Producto" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PesoBruto" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PesoCono" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PesoNeto" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LoteInterno" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="BodegaActual" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Proveedor" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodProveedor" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LoteProveedor" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Fecha_Produc" VisibleIndex="11">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="Fecha_Venc" VisibleIndex="12">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="FolioRecep_Film" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaRecep" VisibleIndex="14">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="NumeroDocSAp" VisibleIndex="15">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="BodegaRecepcion" VisibleIndex="16">
                </dx:GridViewDataTextColumn>
            </Columns>
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="Peso Bruto Total : {0}" FieldName="PesoBruto" ShowInColumn="PesoBruto" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="Peso Neto Total : {0}" FieldName="PesoNeto" ShowInColumn="PesoNeto" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="Total Pallets: {0}" FieldName="NBobina" ShowInColumn="NBobina" SummaryType="Count" />
            </TotalSummary>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsBehavior AllowFocusedRow="True" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsInfStockFilm" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="VW_INF_STOCK_FILM" Where="BodegaActual == @BodegaActual">
            <WhereParameters>
                <asp:Parameter DefaultValue="0" Name="BodegaActual" Type="String" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
</asp:Content>
