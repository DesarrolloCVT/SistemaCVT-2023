<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Devolucion.aspx.cs" Inherits="CVT_MermasRecepcion.WMS.Devolucion"  %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxScheduler.Controls" TagPrefix="dxwschsc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>WMS</a></li>
            <li><span id="current">Devoluciones</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Devoluciones</span>
        <span class="tab-end"></span>
        <%--<tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Bodega Origen" 
                    Visible="False">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cb_borigen" runat="server" DataSourceID="LqDsSite" 
                    TextField="Site_ShortDescription" ValueField="Site_Id" Visible="False">
                </dx:ASPxComboBox>
            </td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Bodega Destino" 
                    Visible="False">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cb_bdestino" runat="server" DataSourceID="LqDsSite" 
                    TextField="Site_ShortDescription" ValueField="Site_Id" Visible="False">
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Folio" Visible="False">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txt_folio" runat="server" Width="170px" Visible="False">
                </dx:ASPxTextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>--%>
    </div>
    <div>
        <dx:ASPxPanel ID="ASPxPanel2" runat="server" Width="200px">
            <PanelCollection>
                <dx:PanelContent ID="PanelContent1" runat="server">
                    <div>
                        <p>Filtros</p>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha Desde">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxDateEdit ID="cb_fdesde" runat="server">
                                    </dx:ASPxDateEdit>
                                </td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Fecha Hasta">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxDateEdit ID="cb_fhasta" runat="server">
                                    </dx:ASPxDateEdit>
                                </td>
                            </tr>
                            <%--<tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Bodega Origen" 
                    Visible="False">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cb_borigen" runat="server" DataSourceID="LqDsSite" 
                    TextField="Site_ShortDescription" ValueField="Site_Id" Visible="False">
                </dx:ASPxComboBox>
            </td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Bodega Destino" 
                    Visible="False">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cb_bdestino" runat="server" DataSourceID="LqDsSite" 
                    TextField="Site_ShortDescription" ValueField="Site_Id" Visible="False">
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Folio" Visible="False">
                </dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxTextBox ID="txt_folio" runat="server" Width="170px" Visible="False">
                </dx:ASPxTextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>--%>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <dx:ASPxButton ID="btn_filtrar" runat="server" Text="Filtrar"
                                        OnClick="btn_filtrar_Click">
                                    </dx:ASPxButton>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False"
                        DataSourceID="LqDsRecepciones" KeyFieldName="Reception_Id" Width="100%"
                        OnRowCommand="GvDatos_RowCommand"
                        OnHtmlRowCreated="GvDatos_HtmlRowCreated"
                        OnRowInserting="GvDatos_RowInserting" OnRowInserted="GvDatos_RowInserted" OnToolbarItemClick="GvDatos_ToolbarItemClick" OnRowUpdating="GvDatos_RowUpdating">
                        <SettingsPager PageSize="25">
                        </SettingsPager>
                        <SettingsEditing Mode="PopupEditForm">
                        </SettingsEditing>
                        <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
                        <SettingsBehavior AllowFocusedRow="True" />
                        <Toolbars>
                            <dx:GridViewToolbar>
                                <Items>
                                    <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif">
                                    <Image Url="../Images/pn-add-source-copy.gif"></Image>
                                    </dx:GridViewToolbarItem>
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
                            <dx:GridViewCommandColumn ShowEditButton="True" ShowInCustomizationForm="True"
                                VisibleIndex="0">
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn FieldName="Company_Id"
                                ShowInCustomizationForm="True" VisibleIndex="1" ReadOnly="True"
                                Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Reception_Id" ReadOnly="True"
                                ShowInCustomizationForm="True" VisibleIndex="3" Caption="Folio">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn
                                FieldName="Business_Partner_Owner" ShowInCustomizationForm="True"
                                VisibleIndex="7" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="AccessControl_Id"
                                ShowInCustomizationForm="True" VisibleIndex="31" Caption="C.Acceso"
                                Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Sector_Id" ShowInCustomizationForm="True"
                                VisibleIndex="8" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Service_Id"
                                ShowInCustomizationForm="True" VisibleIndex="9" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Reception_DocNumber"
                                ShowInCustomizationForm="True" VisibleIndex="12" Caption="N Documento">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn FieldName="Reception_DateIn" ShowInCustomizationForm="True"
                                VisibleIndex="16" Caption="Fecha Ingreso">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataDateColumn FieldName="Reception_DateOut"
                                ShowInCustomizationForm="True" VisibleIndex="17" Caption="Fecha Salida">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn FieldName="Reception_Note"
                                ShowInCustomizationForm="True" VisibleIndex="18" Caption="Comentario"
                                Visible="False">
                                <EditFormSettings Visible="True" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Reception_GrossWeight"
                                ShowInCustomizationForm="True" VisibleIndex="21" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Reception_NetWeight"
                                ShowInCustomizationForm="True" VisibleIndex="22" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Reception_Tare"
                                ShowInCustomizationForm="True" VisibleIndex="23" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Reception_Stamp"
                                ShowInCustomizationForm="True" VisibleIndex="24" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Reception_SendStat"
                                ShowInCustomizationForm="True" VisibleIndex="25" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Accounts_Id"
                                ShowInCustomizationForm="True" VisibleIndex="26" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Reception_seals1"
                                ShowInCustomizationForm="True" VisibleIndex="27" Caption="Sello Proveedor"
                                Visible="False">
                                <EditFormSettings Visible="True" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Reception_seals2"
                                ShowInCustomizationForm="True" VisibleIndex="28" Caption="Sello Aduana"
                                Visible="False">
                                <EditFormSettings Visible="True" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Reception_seals3"
                                ShowInCustomizationForm="True" VisibleIndex="29" Caption="Sello SAG"
                                Visible="False">
                                <EditFormSettings Visible="True" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Reception_NumContainer"
                                ShowInCustomizationForm="True" VisibleIndex="30" Caption="N Contenedor"
                                Visible="False">
                                <EditFormSettings Visible="True" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Reception_Destination"
                                ShowInCustomizationForm="True" VisibleIndex="33" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Reception_RefrigerationUnit"
                                ShowInCustomizationForm="True" VisibleIndex="34" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Reception_Sealed"
                                ShowInCustomizationForm="True" VisibleIndex="35" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Reception_CrossDocking"
                                ShowInCustomizationForm="True" VisibleIndex="36" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="INV_0010_SyncStat"
                                ShowInCustomizationForm="True" VisibleIndex="37" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="INV_0010_UpdFrom"
                                ShowInCustomizationForm="True" VisibleIndex="38" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Reception_U_NumDocSAP"
                                ShowInCustomizationForm="True" VisibleIndex="6" Caption="N SAP">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Reception_ExpBased"
                                ShowInCustomizationForm="True" VisibleIndex="39" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Reception_U_TpoDocRef"
                                ShowInCustomizationForm="True" VisibleIndex="40" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Reception_U_FolioRef"
                                ShowInCustomizationForm="True" VisibleIndex="41" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn FieldName="Reception_U_FchRef"
                                ShowInCustomizationForm="True" VisibleIndex="13" Caption="Fecha Documento">
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn FieldName="Reception_U_Num_DI_Despacho"
                                ShowInCustomizationForm="True" VisibleIndex="44" Caption="N DI Despacho"
                                Visible="False">
                                <EditFormSettings Visible="True" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Reception_U_Hora_Inicio"
                                ShowInCustomizationForm="True" VisibleIndex="45" Caption="Hr Inicio"
                                Visible="False">
                                <EditFormSettings Visible="True" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Reception_U_Minuto_Inicio"
                                ShowInCustomizationForm="True" VisibleIndex="46" Caption="Min Inicio"
                                Visible="False">
                                <EditFormSettings Visible="True" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Reception_U_Hora_Termino"
                                ShowInCustomizationForm="True" VisibleIndex="47" Caption="Hr Termino"
                                Visible="False">
                                <EditFormSettings Visible="True" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Reception_U_Minuto_Termino"
                                ShowInCustomizationForm="True" VisibleIndex="48" Caption="Min Termino"
                                Visible="False">
                                <EditFormSettings Visible="True" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Reception_U_Tipo_Descarga"
                                ShowInCustomizationForm="True" VisibleIndex="49" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataHyperLinkColumn Caption="Detalle" VisibleIndex="54">
                                <EditFormSettings Visible="False" />
                                <DataItemTemplate>
                                    <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/boxadd.png" />
                                </DataItemTemplate>
                            </dx:GridViewDataHyperLinkColumn>
                            <dx:GridViewDataHyperLinkColumn Caption="Anula" VisibleIndex="55">
                                <EditFormSettings Visible="False" />
                                <DataItemTemplate>
                                    <asp:ImageButton ID="Anula" CommandName="cmdAnula" runat="server" ImageUrl="~/Images/node_delete.png" />
                                </DataItemTemplate>
                            </dx:GridViewDataHyperLinkColumn>
                            <dx:GridViewDataHyperLinkColumn Caption="Confirma" VisibleIndex="56">
                                <EditFormSettings Visible="False" />
                                <DataItemTemplate>
                                    <asp:ImageButton ID="Confirma" CommandName="cmdConfirma" runat="server"
                                        ImageUrl="~/Images/confirm.png" OnClientClick="LoadingPanel.Show();" />
                                </DataItemTemplate>
                            </dx:GridViewDataHyperLinkColumn>
                            <dx:GridViewDataComboBoxColumn Caption="Bodega" FieldName="Site_Id"
                                ShowInCustomizationForm="True" VisibleIndex="2">
                                <PropertiesComboBox DataSourceID="LqDsSite" TextField="Site_ShortDescription"
                                    ValueField="Site_Id">
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn Caption="Proveedor"
                                FieldName="Business_Partner_Provider" ShowInCustomizationForm="True"
                                VisibleIndex="4">
                                <PropertiesComboBox DataSourceID="LqDsProveedor"
                                    ValueField="Business_Partner_CId">
                                    <Columns>
                                        <dx:ListBoxColumn Caption="Cod" FieldName="Business_Partner_CId" Width="100px">
                                        </dx:ListBoxColumn>
                                        <dx:ListBoxColumn Caption="Proveedor" FieldName="Business_Partner_Name"
                                            Width="350px">
                                        </dx:ListBoxColumn>
                                    </Columns>
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn Caption="T Recepcion" FieldName="Reception_Type"
                                ShowInCustomizationForm="True" VisibleIndex="10">
                                <PropertiesComboBox>
                                    <Items>
                                        <dx:ListEditItem Text="Devolucion" Value="1" />
                                    </Items>
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn Caption="Estado" FieldName="Reception_Status"
                                ShowInCustomizationForm="True" VisibleIndex="19">
                                <PropertiesComboBox>
                                    <Items>
                                        <dx:ListEditItem Text="Abierta" Value="1" />
                                        <dx:ListEditItem Text="Cerrada" Value="2" />
                                        <dx:ListEditItem Text="Anulada" Value="3" />
                                    </Items>
                                </PropertiesComboBox>
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn Caption="T. Descarga" FieldName="Worktype_Id"
                                ShowInCustomizationForm="True" VisibleIndex="15">
                                <PropertiesComboBox DataSourceID="LqDsTipoTrabajo"
                                    TextField="WorkType_Description" ValueField="Worktype_Id">
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn Caption="Gruero Asignado"
                                FieldName="Reception_U_GrueroAsig" ShowInCustomizationForm="True"
                                VisibleIndex="42">
                                <PropertiesComboBox DataSourceID="LqDsStaff" TextField="Staff_Name"
                                    ValueField="Staff_Id">
                                </PropertiesComboBox>
                                <EditFormSettings Visible="True" />
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn Caption="Gruero Asignado 2"
                                FieldName="Reception_U_GrueroExterno" ShowInCustomizationForm="True"
                                Visible="False" VisibleIndex="43">
                                <PropertiesComboBox DataSourceID="LqDsStaff" TextField="Staff_Name"
                                    ValueField="Staff_Id">
                                </PropertiesComboBox>
                                <EditFormSettings Visible="True" />
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn Caption="T Doc SAP"
                                FieldName="Reception_U_TipoDocSAP" ShowInCustomizationForm="True"
                                VisibleIndex="5">
                                <PropertiesComboBox>
                                    <Items>
                                        <dx:ListEditItem Text="Entrega" Value="15" />
                                        <dx:ListEditItem Text="Factura" Value="13" />
                                    </Items>
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn Caption="T Documento" FieldName="DocType_Id"
                                ShowInCustomizationForm="True" VisibleIndex="11">
                                <PropertiesComboBox DataSourceID="LqDsTipoDocumento"
                                    TextField="DocType_Description" ValueField="DocType_Id">
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn Caption="Usuario" FieldName="Staff_Id"
                                ShowInCustomizationForm="True" VisibleIndex="20">
                                <PropertiesComboBox DataSourceID="LqDsStaff0" TextField="Staff_Name"
                                    ValueField="Staff_Id">
                                </PropertiesComboBox>
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn Caption="Tamaño Contenedor"
                                FieldName="Reception_U_Tamano_Contenedor" ShowInCustomizationForm="True"
                                Visible="False" VisibleIndex="50">
                                <PropertiesComboBox>
                                    <Items>
                                        <dx:ListEditItem Text="20" Value="20" />
                                        <dx:ListEditItem Text="40" Value="40" />
                                    </Items>
                                </PropertiesComboBox>
                                <EditFormSettings Visible="True" />
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn Caption="Origen" FieldName="Reception_Origin"
                                ShowInCustomizationForm="True" Visible="False" VisibleIndex="32">
                                <PropertiesComboBox DataSourceID="LqDsCountry" TextField="Country_Name"
                                    ValueField="Country_Id">
                                    <ValidationSettings Display="Dynamic">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </PropertiesComboBox>
                                <EditFormSettings Visible="True" />
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn Caption="Razon Devolucion"
                                FieldName="Reception_U_RazonRef" ShowInCustomizationForm="True"
                                VisibleIndex="14">
                                <PropertiesComboBox DataSourceID="LqDsMotDevolucion" TextField="Nombre"
                                    ValueField="Nombre">
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn Caption="Tipo pallet" FieldName="Reception_U_TipoPallet" ShowInCustomizationForm="True" VisibleIndex="51">
                                <PropertiesComboBox>
                                    <Items>
                                        <dx:ListEditItem Text="Blanco" Value="Blanco" />
                                        <dx:ListEditItem Text="Chep" Value="Chep" />
                                    </Items>
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataTextColumn Caption="Cantidad Pallet" FieldName="Reception_U_CantidadPallet" ShowInCustomizationForm="True" VisibleIndex="52">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataComboBoxColumn Caption="Area Responsable" FieldName="Reception_U_AreaResponsableDev" ShowInCustomizationForm="True" VisibleIndex="53">
                                <PropertiesComboBox DataSourceID="LqDsAreaResponsable" TextField="AreaNombre" ValueField="AreaDevolucion_Id">
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                        </Columns>
                        <Styles>
                            <FocusedRow BackColor="#FF9933">
                            </FocusedRow>
                        </Styles>
                        <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

                        <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
                    </dx:ASPxGridView>
                    <asp:LinqDataSource ID="LqDsRecepciones" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
                        TableName="Reception" EnableInsert="True" OrderBy="Reception_Id desc"
                        Where="Reception_DateIn &gt;= @Reception_DateIn &amp;&amp; Reception_DateIn &lt;= @Reception_DateIn1 &amp;&amp; DocType_Id == @DocType_Id"
                        EnableUpdate="True">
                        <WhereParameters>
                            <asp:ControlParameter ControlID="cb_fdesde" Name="Reception_DateIn"
                                PropertyName="Value" Type="DateTime" />
                            <asp:ControlParameter ControlID="cb_fhasta" Name="Reception_DateIn1"
                                PropertyName="Value" Type="DateTime" />
                            <asp:Parameter DefaultValue="10" Name="DocType_Id" Type="Int32" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                    <asp:LinqDataSource ID="LqDsSite" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
                        TableName="Site">
                    </asp:LinqDataSource>
                    <asp:LinqDataSource ID="LqDsProveedor" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
                        TableName="Business_Partner">
                    </asp:LinqDataSource>
                    <asp:LinqDataSource ID="LqDsCountry" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
                        TableName="Country">
                    </asp:LinqDataSource>
                    <asp:LinqDataSource ID="LqDsTipoTrabajo" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
                        TableName="WorkType">
                    </asp:LinqDataSource>
                    <asp:LinqDataSource ID="LqDsStaff" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
                        TableName="Staff"
                        Where="Profiles_Id == @Profiles_Id &amp;&amp; Staff_Enabled == @Staff_Enabled">
                        <WhereParameters>
                            <asp:Parameter DefaultValue="13" Name="Profiles_Id" Type="Int32" />
                            <asp:Parameter DefaultValue="1" Name="Staff_Enabled" Type="Int32" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                    <asp:LinqDataSource ID="LqDsStaff0" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
                        TableName="Staff" Where="Staff_Enabled == @Staff_Enabled">
                        <WhereParameters>
                            <asp:Parameter DefaultValue="1" Name="Staff_Enabled" Type="Int32" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                    <asp:LinqDataSource ID="LqDsMotDevolucion" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
                        TableName="CVT_MotivoDevolucion" Where="Estado == @Estado">
                        <WhereParameters>
                            <asp:Parameter DefaultValue="1" Name="Estado" Type="Int32" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                    <asp:LinqDataSource ID="LqDsAreaResponsable" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="AreaDevolucion">
                    </asp:LinqDataSource>
                    <asp:LinqDataSource ID="LqDsTipoDocumento" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
                        TableName="DocType"
                        Where="DocType_Id == @DocType_Id2">
                        <WhereParameters>
                            <asp:Parameter DefaultValue="10" Name="DocType_Id2" Type="Int32" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxPanel>
    </div>
</asp:Content>

