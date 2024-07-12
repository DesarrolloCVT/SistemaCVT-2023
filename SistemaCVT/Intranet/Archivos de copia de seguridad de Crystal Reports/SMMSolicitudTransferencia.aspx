<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SMMSolicitudTransferencia.aspx.cs" Inherits="CVT_MermasRecepcion.MayoristaOP.SMMSolicitudTransferencia" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>WMS</a></li>
            <li><span id="current">Solicitud Transferencia</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Solicitud Transferencia</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsSolicitudTran" KeyFieldName="Id_Solicitud" OnRowInserting="GvDatos_RowInserting" OnRowCommand="GvDatos_RowCommand" OnHtmlRowCreated="GvDatos_HtmlRowCreated">
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" />
            <Toolbars>
                <dx:GridViewToolbar Position="Top">
                    <Items>
                        <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif">
                            <Image Url="../Images/pn-add-source-copy.gif"></Image>
                        </dx:GridViewToolbarItem>
                        <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXls" />
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />
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
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0" ShowDeleteButton="True" ShowEditButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="Folio Solicitud" FieldName="Id_Solicitud" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaSolicitud" VisibleIndex="4">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Comentarios" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Estado" VisibleIndex="7">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Abierto" Value="1" />
                            <dx:ListEditItem Text="Enviado" Value="2" />
                            <dx:ListEditItem Text="Cerrado" Value="3" />
                        </Items>
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="BodegaOrigen" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="LqsBodega" TextField="Site_Description" ValueField="Site_Id">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="BodegaDestino" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="LqsBodega" TextField="Site_Description" ValueField="Site_Id">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Usuario" FieldName="idUsuario" VisibleIndex="5">
                    <PropertiesComboBox DataSourceID="LqsUsuario" TextField="NombreUsuario" ValueField="IdUsuario">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Detalle" VisibleIndex="16">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/boxadd.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
                      <dx:GridViewDataHyperLinkColumn Caption="Envia" VisibleIndex="16">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="envia" CommandName="cmdEnvia" runat="server" ImageUrl="~/Images/forward.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
            </Columns>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsSolicitudTran" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName="" TableName="SMM_Solicitud_Transferencia" EnableDelete="True" EnableInsert="True" EnableUpdate="True" OrderBy="Id_Solicitud desc">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsBodega" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName="" TableName="SMM_Site">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsUsuario" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Usuarios">
        </asp:LinqDataSource>
    </div>
</asp:Content>
