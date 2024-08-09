<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="TransferenciaFilmDetalle.aspx.cs" Inherits="CVT_MermasRecepcion.ControlFilm.TransferenciaFilmDetalle" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 15px;
        }

        .auto-style6 {
            width: 94px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Control Film</a></li>
            <li><span id="current">Detalle Transferencia Film </span></li>
        </ul>
    </div>
    <div id="tableHeader">
        <span class="tableTitle" id="det" runat="server">Recepcion Film Detalle</span>
        <span class="tab-end"></span>
        <div id="options">
            <a style="margin-left: 150px">
                <asp:ImageButton ID="cmdVolver" runat="server"
                    ImageUrl="~/Images/back.png" OnClick="cmdVolver_Click" Height="27px" Width="34px" />
                volver</a>&nbsp;      
        </div>
    </div>
    <br />
    <div style="margin-left: 25px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="N° Bobina"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtNbobina" runat="server" Width="170px" Height="30px"></dx:ASPxTextBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Producto"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboProducto" runat="server" DataSourceID="LqsProducto" ValueField="ItemCode" Height="30px">
                        <Columns>
                            <dx:ListBoxColumn FieldName="ItemCode" Width="150px">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn FieldName="ItemName" Width="250px">
                            </dx:ListBoxColumn>
                        </Columns>
                        <ClearButton DisplayMode="Always">
                        </ClearButton>
                    </dx:ASPxComboBox>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 25px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Lote interno"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtLote" runat="server" Width="170px" Height="30px"></dx:ASPxTextBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Bodega"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboBodega" runat="server" DataSourceID="LqDsSite0" Height="30px" TextField="Site_Description" ValueField="Site_Id">
                        <ClearButton DisplayMode="Always">
                        </ClearButton>
                    </dx:ASPxComboBox>
                </td>
                <td class="auto-style5"></td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 100px">
        <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" Height="50px" Width="150px" OnClick="btnBuscar_Click"></dx:ASPxButton>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvFiltro" runat="server" AutoGenerateColumns="False" Theme="BlackGlass" KeyFieldName="NBobina">
            <SettingsPager AlwaysShowPager="True" Mode="ShowAllRecords">
            </SettingsPager>
            <Columns>
                <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowSelectCheckbox="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="NBobina" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PesoBruto" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PesoNeto" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PesoCono" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Producto" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LoteInterno" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Bodega" FieldName="IdBodega" VisibleIndex="7">
                    <PropertiesComboBox DataSourceID="LqDsSite" TextField="Site_Description" ValueField="Site_Id">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>
    <br />
    <div style="margin-left: 250px" class="auto-style6">
        <dx:ASPxButton ID="BtnAgregar" runat="server" Text="Agregar" Height="30px" Width="150px" OnClick="BtnAgregar_Click"></dx:ASPxButton>
    </div>
    <br />
    <br />
    <br />
    <div>
        <dx:ASPxButton ID="btnQuitarTodos" runat="server" Text="Quitar Todos" OnClick="btnQuitarTodos_Click" Theme="iOS" Width="150px"></dx:ASPxButton>
    </div>
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDatosTranferencia" KeyFieldName="Id_TransferenciaFilm;NBobina" OnHtmlRowCreated="GvDatos_HtmlRowCreated" OnRowCommand="GvDatos_RowCommand" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <Settings ShowFooter="True" />
            <Toolbars>
                <dx:GridViewToolbar Position="Top">
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
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>        
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Id_TransferenciaFilm" VisibleIndex="0" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NBobina" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PesoBruto" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PesoNeto" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PesoCono" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LoteInterno" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Fecha_Produc" VisibleIndex="8">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Producto" VisibleIndex="3" Caption="Nombre Producto">
                    <PropertiesComboBox DataSourceID="LqsProducto" TextField="ItemName" ValueField="ItemCode">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Producto" VisibleIndex="2" Caption="Cod.Producto">
                    <PropertiesComboBox DataSourceID="LqsProducto" TextField="ItemCode" ValueField="ItemCode">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Eliminar" VisibleIndex="16">
                    <DataItemTemplate>
                        <asp:ImageButton ID="Eliminar" CommandName="cmdEliminar" runat="server" ImageUrl="~/Images/eliminar.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataComboBoxColumn FieldName="BodOrigen" VisibleIndex="15">
                    <PropertiesComboBox DataSourceID="LqDsSite" TextField="Site_Description" ValueField="Site_Id">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
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
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsBobina" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_FILM_BOBINA">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsDatosTranferencia" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="VW_TRANSFERENCIA_DETALLE_FILM" Where="Id_TransferenciaFilm == @Id_TransferenciaFilm">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="Id_TransferenciaFilm" SessionField="TransferId" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsProducto" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" Select="new (ItemName, ItemCode)" TableName="OITM" Where="QryGroup14 == @QryGroup14">
            <WhereParameters>
                <asp:Parameter DefaultValue="Y" Name="QryGroup14" Type="Char" />
            </WhereParameters>
        </asp:LinqDataSource>

        <asp:LinqDataSource runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" TableName="Site" EntityTypeName="" ID="LqDsSite"></asp:LinqDataSource>

        <asp:LinqDataSource ID="LqsProveedorFilm" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" Select="new (CardCode, CardName)" TableName="OCRD" Where="QryGroup4 == @QryGroup4">
            <WhereParameters>
                <asp:Parameter DefaultValue="Y" Name="QryGroup4" Type="Char" />
            </WhereParameters>
        </asp:LinqDataSource>

        <asp:LinqDataSource runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" TableName="Site" EntityTypeName="" ID="LqDsSite0" Where="Site_Id==5 || Site_Id==4 || Site_Id==17 || Site_Id==3"></asp:LinqDataSource>

    </div>
</asp:Content>
