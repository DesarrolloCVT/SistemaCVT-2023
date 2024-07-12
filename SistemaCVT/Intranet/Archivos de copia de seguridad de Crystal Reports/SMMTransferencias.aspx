<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SMMTransferencias.aspx.cs" Inherits="CVT_MermasRecepcion.MayoristaOP.SMMTransferencias" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>WMS</a></li>
            <li><span id="current">Transferencias</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Transferencias</span>
        <span class="tab-end"></span>
        <%--   <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" />
                Exportar Excel</a>
            <a>
                <asp:ImageButton ID="cmdNew" runat="server" ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>

        </div>--%>
    </div>
    <br />
    <div style="margin-left: 50px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha Inicio" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteInicio" runat="server"></dx:ASPxDateEdit>
                </td>
                <td></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Fecha Termino" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteTermino" runat="server"></dx:ASPxDateEdit>
                </td>
                <td></td>
                <td>
                    <dx:ASPxButton ID="btnFiltrar" runat="server" Text="Filtrar" Height="48px" Theme="Glass" Width="88px" OnClick="btnFiltrar_Click"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsTransferenciaSMM" KeyFieldName="Transfer_Id" OnHtmlRowCreated="GvDatos_HtmlRowCreated" OnRowCommand="GvDatos_RowCommand" OnRowInserting="GvDatos_RowInserting" OnToolbarItemClick="GvDatos_ToolbarItemClick" OnCommandButtonInitialize="GvDatos_CommandButtonInitialize" OnRowUpdating="GvDatos_RowUpdating">
            <Toolbars>
                <dx:GridViewToolbar>
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
            <SettingsPager PageSize="50">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            <SettingsBehavior AllowFocusedRow="True" />
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />

            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>

            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="Folio" FieldName="Transfer_Id" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="Fecha Creacion" FieldName="Date" ShowInCustomizationForm="True" VisibleIndex="5">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Transfer_Folio_Entidad" ShowInCustomizationForm="True" VisibleIndex="9" Caption="Folio Entidad">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Transfer_Comentario" ShowInCustomizationForm="True" VisibleIndex="11" Caption="Comentarios">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Transfer_FechaCierre" ShowInCustomizationForm="True" VisibleIndex="12" Caption="Fecha Cierre">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataComboBoxColumn Caption="Bodega Origen" FieldName="Site_Id" ShowInCustomizationForm="True" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="lqsBodOrigen" TextField="Site_Description" ValueField="Site_Id">
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Bodega Destino" FieldName="Site_Id_Destiny" ShowInCustomizationForm="True" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="lqsBodDestino" TextField="Site_Description" ValueField="Site_Id">
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Usuario" FieldName="IdUsuario" ShowInCustomizationForm="True" VisibleIndex="4">
                    <PropertiesComboBox DataSourceID="lqsUsuario" TextField="NombreUsuario" ValueField="IdUsuario">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Estado" FieldName="Status" VisibleIndex="6">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Abierta" Value="1" />
                            <dx:ListEditItem Text="Confirmada" Value="2" />
                            <dx:ListEditItem Text="Proceso" Value="3" />
                            <dx:ListEditItem Text="Terminada" Value="4" />
                            <dx:ListEditItem Text="Anulada" Value="5" />
                        </Items>
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Entidad Relacionada" FieldName="Transfer_Entidad" VisibleIndex="8">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Produccion" Value="1" />
                            <dx:ListEditItem Text="Sala de Ventas" Value="2" />
                            <dx:ListEditItem Text="Mermas" Value="3" />
                        </Items>
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Detalle" VisibleIndex="16">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/boxadd.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Envia" VisibleIndex="18">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="Envia" CommandName="cmdEnvia" runat="server"
                            ImageUrl="~/Images/forward.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Anula" VisibleIndex="17">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="Anula" CommandName="cmdNull" runat="server" ImageUrl="~/Images/node_delete.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Confirma" VisibleIndex="19">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="Confirma" CommandName="cmdConfirma" runat="server"
                            ImageUrl="~/Images/confirm.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataComboBoxColumn Caption="Cantidad" FieldName="Transfer_Id" VisibleIndex="7">
                    <PropertiesComboBox DataSourceID="LinqDataSource1" TextField="CantidadPallet" ValueField="Transfer_Id">
                    </PropertiesComboBox>
                    <Settings AllowAutoFilter="False" />
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="N° Solicitud" FieldName="FolioSolicitud" VisibleIndex="10">
                    <PropertiesComboBox DataSourceID="LqsSolicitudes" TextField="Id_Solicitud" ValueField="Id_Solicitud">
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsTransferenciaSMM" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName="" TableName="SMM_Transfer" EnableDelete="True" EnableInsert="True" EnableUpdate="True" OrderBy="Transfer_Id desc">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="lqsBodOrigen" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName="" TableName="SMM_Site">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="lqsBodDestino" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName="" TableName="SMM_Site">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="lqsUsuario" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Usuarios">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName="" TableName="VW_LIST_TRANSFER">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsSolicitudes" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName="" TableName="SMM_Solicitud_Transferencia" Where="Estado == @Estado">
            <WhereParameters>
                <asp:Parameter DefaultValue="2" Name="Estado" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
</asp:Content>
