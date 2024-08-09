<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="InfTransferenciasEfectuadas.aspx.cs" Inherits="CVT_MermasRecepcion.Reporteria.InfTransferenciasEfectuadas" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Informes</a></li>
            <li><span id="current">Informe Transferencias Efectuadas</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Informe Transferencias Efectuadas</span>
        <span class="tab-end"></span>
    <%--    <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px; height: 20px;" />
                Exportar Excel</a>
        </div>--%>
    </div>
    <br />
    <div>
        <table class="style1">
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Fecha Desde">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxDateEdit ID="fdesde" runat="server">
                    </dx:ASPxDateEdit>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Fecha Hasta">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxDateEdit ID="fhasta" runat="server">
                    </dx:ASPxDateEdit>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Bodega Origen">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <asp:LinqDataSource ID="LqDsBodega0" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
                        TableName="VW_BodegasTransferenciasEfectuadas">
                    </asp:LinqDataSource>
                    <dx:ASPxComboBox ID="cbo_bodegaOrigen" runat="server" DataSourceID="LqDsBodega0"
                        ValueField="Bodega" Width="200px">
                        <Columns>
                            <dx:ListBoxColumn FieldName="Bodega" Name="Codigo" />
                            <dx:ListBoxColumn FieldName="Descripcion" Name="Bodega" />
                        </Columns>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Bodega Destino">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <asp:LinqDataSource ID="LqDsBodega" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
                        TableName="VW_BodegasTransferenciasEfectuadas">
                    </asp:LinqDataSource>
                    <dx:ASPxComboBox ID="cbo_bodegaDestino" runat="server" DataSourceID="LqDsBodega"
                        ValueField="Bodega" Width="200px">
                        <Columns>
                            <dx:ListBoxColumn FieldName="Bodega" Name="Codigo" />
                            <dx:ListBoxColumn FieldName="Descripcion" Name="Bodega" />
                        </Columns>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
                <td>
                    <dx:ASPxButton ID="btn_Generar" runat="server" OnClick="btn_Generar_Click"
                        Text="Generar">
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" KeyFieldName="Folio" OnToolbarItemClick="GvDatos_ToolbarItemClick" AutoGenerateColumns="False">
            <SettingsPager AlwaysShowPager="True" Mode="ShowAllRecords" PageSize="10000">
            </SettingsPager>
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            <SettingsBehavior AllowFocusedRow="True" />
            <Toolbars>
                <dx:GridViewToolbar>
                    <Items>
                        <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                <dx:GridViewToolbarItem Command="ExportToXls" />
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
                <dx:GridViewDataTextColumn FieldName="Folio" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Fecha" VisibleIndex="1">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Entidad" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FolioEntidad" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NPallet" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodProducto" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Producto" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="BodOrigen" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="BodDestino" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Estado" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Usuario" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Lote" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="GrupoProducto" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Familia" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsTransferencias" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" TableName="CVT_VW_TransferenciasEfectuadas" Where="BodOrigen == @BodOrigen &amp;&amp; BodDestino == @BodDestino &amp;&amp; Fecha &gt;= @Fecha &amp;&amp; Fecha &lt;= @Fecha1">
            <WhereParameters>
                <asp:ControlParameter ControlID="cbo_bodegaOrigen" DefaultValue="0" Name="BodOrigen" PropertyName="Value" Type="String" />
                <asp:ControlParameter ControlID="cbo_bodegaDestino" DefaultValue="0" Name="BodDestino" PropertyName="Value" Type="String" />
                <asp:ControlParameter ControlID="fdesde" DefaultValue="01-01-1900" Name="Fecha" PropertyName="Value" Type="DateTime" />
                <asp:ControlParameter ControlID="fhasta" DefaultValue="01-01-1900" Name="Fecha1" PropertyName="Value" Type="DateTime" />
            </WhereParameters>
        </asp:LinqDataSource>

        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="GvDatos">
        </dx:ASPxGridViewExporter>

    </div>
</asp:Content>

