<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RecepcionFilm.aspx.cs" Inherits="CVT_MermasRecepcion.ControlFilm.RecepcionFilm" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Sistema</a></li>
            <li><span id="current">Recepcion Film</span></li>
        </ul>
    </div>
    <div id="tableHeader">
        <span class="tableTitle">Recepcion Film</span>
        <span class="tab-end"></span>
    </div>
    <br />

    <div style="margin-left: 150px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha Inicio"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteInicio" runat="server" Height="30px"></dx:ASPxDateEdit>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Fecha Termino"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteTermino" runat="server" Height="30px"></dx:ASPxDateEdit>
                </td>
                <td></td>
                <td>
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" Height="38px" Width="71px" OnClick="btnBuscar_Click"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsRecepcionFilm" KeyFieldName="FolioRecep_Film" OnHtmlRowCreated="GvDatos_HtmlRowCreated" OnRowCommand="GvDatos_RowCommand" OnRowInserting="GvDatos_RowInserting" OnToolbarItemClick="GvDatos_ToolbarItemClick" OnCommandButtonInitialize="GvDatos_CommandButtonInitialize">
            <Toolbars>
                <dx:GridViewToolbar >
                    <Items>
                        <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif">
                            <Image Url="../Images/pn-add-source-copy.gif"></Image>
                        </dx:GridViewToolbarItem>
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
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsPager PageSize="50">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings AutoFilterCondition="Contains" ShowFilterRow="True" />
            <SettingsBehavior AllowFocusedRow="True" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Columns>
                <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0" ShowClearFilterButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="Folio" FieldName="FolioRecep_Film" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaRecep" ShowInCustomizationForm="True" VisibleIndex="4">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="NumeroDoc" ShowInCustomizationForm="True" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NumeroDocSAp" ShowInCustomizationForm="True" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Bod.Recepcion" FieldName="Bodega_Recep" ShowInCustomizationForm="True" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="LqDsSite" TextField="Site_Description" ValueField="Site_Id">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Proveedor" ShowInCustomizationForm="True" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="LqsProveedorFilm" TextField="CardName" ValueField="CardCode">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="TipoDoc" VisibleIndex="6">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Guia Despacho" Value="GD" />
                            <dx:ListEditItem Text="Factura" Value="FAC" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="DocumentoSAP" VisibleIndex="8">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Orden de Compra" Value="OC" />
                            <dx:ListEditItem Text="Factura" Value="FAC" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Estado" VisibleIndex="11">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Abierta" Value="1" />
                            <dx:ListEditItem Text="Sincronizada" Value="2" />
                            <dx:ListEditItem Text="Anulada" Value="3" />
                        </Items>
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Detalle" VisibleIndex="12">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/boxadd.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Anula" VisibleIndex="13">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="Anula" CommandName="cmdAnula" runat="server" ImageUrl="~/Images/node_delete.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Confirma" VisibleIndex="14">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="Confirma" CommandName="cmdConfirma" runat="server"
                            ImageUrl="~/Images/confirm.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataComboBoxColumn FieldName="UsuarioRecep" VisibleIndex="5">
                    <PropertiesComboBox DataSourceID="LqsUsuario" TextField="NombreUsuario" ValueField="IdUsuario">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="Comentario" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsRecepcionFilm" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_FILM_RECEPCION" EnableDelete="True" EnableInsert="True" EnableUpdate="True" Where="FechaRecep &gt;= @FechaRecep &amp;&amp; FechaRecep &lt;= @FechaRecep1" OrderBy="FolioRecep_Film desc">
            <WhereParameters>
                <asp:ControlParameter ControlID="dteInicio" DefaultValue="01-01-1990" Name="FechaRecep" PropertyName="Value" Type="DateTime" />
                <asp:ControlParameter ControlID="dteTermino" DefaultValue="01-01-1990" Name="FechaRecep1" PropertyName="Value" Type="DateTime" />
            </WhereParameters>
        </asp:LinqDataSource>

        <asp:LinqDataSource runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" TableName="Site" EntityTypeName="" ID="LqDsSite"></asp:LinqDataSource>

        <asp:LinqDataSource ID="LqsProveedorFilm" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" Select="new (CardCode, CardName)" TableName="OCRD" Where="QryGroup4 == @QryGroup4 &amp;&amp; CardType == @CardType">
            <WhereParameters>
                <asp:Parameter DefaultValue="Y" Name="QryGroup4" Type="Char" />
                <asp:Parameter DefaultValue="S" Name="CardType" Type="Char" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsUsuario" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Usuarios">
        </asp:LinqDataSource>
    </div>
</asp:Content>
