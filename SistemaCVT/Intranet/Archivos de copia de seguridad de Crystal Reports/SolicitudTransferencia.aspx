<%@ Page Title="SolicitudFilm" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SolicitudTransferencia.aspx.cs" Inherits="CVT_MermasRecepcion.ControlFilm.SolicitudTransferencia" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Sistema</a></li>
            <li><span id="current">Solicitud Transferencia</span></li>
        </ul>
    </div>
    <div id="tableHeader">
        <span class="tableTitle">Solicitud Transferencia</span>
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
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsSoliTransferencia" KeyFieldName="Id_Solicitud" OnRowInserting="GvDatos_RowInserting" OnRowCommand="GvDatos_RowCommand" OnCommandButtonInitialize="GvDatos_CommandButtonInitialize">
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
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings AutoFilterCondition="Contains" ShowFilterRow="True" />
            <SettingsBehavior ConfirmDelete="True" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0" ShowClearFilterButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="Folio" FieldName="Id_Solicitud" ReadOnly="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaSolicitud" VisibleIndex="4">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="NumeroOF" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Usuario" FieldName="IdUsuario" VisibleIndex="5">
                    <PropertiesComboBox DataSourceID="lqsUsuario" TextField="NombreUsuario" ValueField="IdUsuario">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Detalle" VisibleIndex="8">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/boxadd.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataComboBoxColumn FieldName="BodegaOrigen" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="LqDsSite" TextField="Site_Description" ValueField="Site_Id">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="BodegaDestino" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="LqDsSite" TextField="Site_Description" ValueField="Site_Id">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Estado" VisibleIndex="6">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Abierto" Value="1" />
                            <dx:ListEditItem Text="Cerrado" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsSoliTransferencia" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_FILM_SOLICITUD_TRANSFERENCIA" EnableDelete="True" EnableInsert="True" EnableUpdate="True" Where="FechaSolicitud &gt;= @FechaSolicitud &amp;&amp; FechaSolicitud &lt;= @FechaSolicitud1" OrderBy="Id_Solicitud desc">
            <WhereParameters>
                <asp:ControlParameter ControlID="dteInicio" DefaultValue="01-01-1990" Name="FechaSolicitud" PropertyName="Value" Type="DateTime" />
                <asp:ControlParameter ControlID="dteTermino" DefaultValue="01-01-1990" Name="FechaSolicitud1" PropertyName="Value" Type="DateTime" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="lqsUsuario" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Usuarios">
        </asp:LinqDataSource>

        <asp:LinqDataSource runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" TableName="Site" EntityTypeName="" ID="LqDsSite" Where="Site_Id==5 || Site_Id==4 || Site_Id==17"></asp:LinqDataSource>

    </div>
</asp:Content>
