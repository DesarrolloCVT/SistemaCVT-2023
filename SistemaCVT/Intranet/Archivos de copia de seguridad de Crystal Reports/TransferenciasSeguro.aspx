<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TransferenciasSeguro.aspx.cs" Inherits="CVT_MermasRecepcion.Seguros.TransferenciasSeguros" %>

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
    &nbsp;<div>
        <dx:ASPxPanel ID="ASPxPanel2" runat="server" Width="200px">
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <div>                      
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
                        DataSourceID="LqDsTransferencias" KeyFieldName="Transfer_Id" Width="100%"
                        OnRowCommand="GvDatos_RowCommand"
                        OnHtmlRowCreated="GvDatos_HtmlRowCreated"
                        OnRowInserting="GvDatos_RowInserting" OnRowInserted="GvDatos_RowInserted" OnToolbarItemClick="GvDatos_ToolbarItemClick">
                        <SettingsPager PageSize="25">
                        </SettingsPager>
                        <SettingsEditing Mode="PopupEditForm">
                        </SettingsEditing>
                        <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
                        <SettingsBehavior AllowFocusedRow="True" />
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
                        <Columns>
                            <%--<dx:GridViewDataHyperLinkColumn Caption="Enviar" VisibleIndex="19">
                                <EditFormSettings Visible="False" />
                                <DataItemTemplate>
                                    <asp:ImageButton ID="PreConfirma" CommandName="cmdPreConfirma" runat="server"
                                        ImageUrl="~/Images/confirm.png" />
                                </DataItemTemplate>
                            </dx:GridViewDataHyperLinkColumn>--%>
                            <dx:GridViewCommandColumn ShowClearFilterButton="True"
                                ShowInCustomizationForm="True" VisibleIndex="0">
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn FieldName="Company_Id" ReadOnly="True"
                                ShowInCustomizationForm="True" VisibleIndex="1" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Transfer_Id" ReadOnly="True"
                                ShowInCustomizationForm="True" VisibleIndex="2" Caption="Folio">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn FieldName="Date" ShowInCustomizationForm="True"
                                VisibleIndex="7" Caption="Fecha Creacion">
                                <PropertiesDateEdit EditFormat="Custom">
                                </PropertiesDateEdit>
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn FieldName="INV_0010_UpdFrom"
                                ShowInCustomizationForm="True" VisibleIndex="11" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Transfer_U_NXTipoMovTrans"
                                ShowInCustomizationForm="True" VisibleIndex="12" Visible="False">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="N°Reclamo"
                                FieldName="Transfer_U_Folio_Entidad" ShowInCustomizationForm="True"
                                VisibleIndex="14">
                                <EditFormSettings Visible="True" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataComboBoxColumn Caption="Bod Origen" FieldName="Site_Id"
                                ShowInCustomizationForm="True" VisibleIndex="3">
                                <PropertiesComboBox DataSourceID="LqDsSiteAll" TextField="Site_ShortDescription"
                                    ValueField="Site_Id">
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn Caption="Tipo" FieldName="Type_Id"
                                ShowInCustomizationForm="True" VisibleIndex="4" Visible="False">
                                <PropertiesComboBox>
                                    <Items>
                                        <dx:ListEditItem Text="Completo" Value="1" />
                                        <dx:ListEditItem Text="Unidades" Value="2" />
                                    </Items>
                                </PropertiesComboBox>
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn Caption="Bod Destino"
                                FieldName="Site_Id_Destiny" ShowInCustomizationForm="True"
                                VisibleIndex="5">
                                <PropertiesComboBox DataSourceID="LqDsSite" TextField="Site_ShortDescription"
                                    ValueField="Site_Id">
                                </PropertiesComboBox>
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn Caption="Usuario" FieldName="Staff_Id"
                                ShowInCustomizationForm="True" VisibleIndex="6">
                                <PropertiesComboBox DataSourceID="LqDsStaff" TextField="Staff_Name"
                                    ValueField="Staff_Id">
                                </PropertiesComboBox>
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn Caption="Tipo"
                                FieldName="Transfer_U_Entidad" ShowInCustomizationForm="True"
                                VisibleIndex="13">
                                <PropertiesComboBox>
                                    <Items>
                                        <dx:ListEditItem Text="Seguro" Value="1" />
                                        <dx:ListEditItem Text="Proveedor" Value="2" />
                                    </Items>
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn Caption="Est Sync"
                                FieldName="INV_0010_SyncStat" ShowInCustomizationForm="True"
                                VisibleIndex="10">
                                <PropertiesComboBox>
                                    <Items>
                                        <dx:ListEditItem Text="No Sincronizar" Value="X" />
                                        <dx:ListEditItem Text="Sincronizada" Value="S" />
                                        <dx:ListEditItem Text="Pendiente" Value="U" />
                                    </Items>
                                </PropertiesComboBox>
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn Caption="Estado" FieldName="Status"
                                ShowInCustomizationForm="True" VisibleIndex="9">
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
                            <dx:GridViewDataHyperLinkColumn Caption="Detalle" VisibleIndex="18">
                                <EditFormSettings Visible="False" />
                                <DataItemTemplate>
                                    <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/boxadd.png" />
                                </DataItemTemplate>
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataHyperLinkColumn>
                            <dx:GridViewDataHyperLinkColumn Caption="Anula" VisibleIndex="19">
                                <EditFormSettings Visible="False" />
                                <DataItemTemplate>
                                    <asp:ImageButton ID="Anula" CommandName="cmdAnula" runat="server" ImageUrl="~/Images/node_delete.png" />
                                </DataItemTemplate>
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataHyperLinkColumn>
                            <dx:GridViewDataHyperLinkColumn Caption="Confirma" VisibleIndex="20">
                                <EditFormSettings Visible="False" />
                                <DataItemTemplate>
                                    <asp:ImageButton ID="Confirma" CommandName="cmdConfirma" runat="server"
                                        ImageUrl="~/Images/confirm.png" OnClientClick="LoadingPanel.Show();" />
                                </DataItemTemplate>
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataHyperLinkColumn>
                            <dx:GridViewDataComboBoxColumn Caption="Cant. Pallets" FieldName="Transfer_Id"
                                ShowInCustomizationForm="True" VisibleIndex="8">
                                <PropertiesComboBox DataSourceID="CVTTransfer" TextField="Cant_Pallets"
                                    ValueField="Transfer_Id">
                                </PropertiesComboBox>
                                <Settings AllowAutoFilter="False" AllowFilterBySearchPanel="False" />
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn Caption="Usuario Recepcion" FieldName="Transfer_U_UsuarioCierre" ShowInCustomizationForm="True" VisibleIndex="16" Visible="False">
                                <PropertiesComboBox DataSourceID="LqDsStaff" TextField="Staff_Name" ValueField="Staff_Id">
                                </PropertiesComboBox>
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataDateColumn Caption="Fecha Recepcion" FieldName="Transfer_U_FechaCierre" ShowInCustomizationForm="True" VisibleIndex="17" Visible="False">
                                <PropertiesDateEdit DisplayFormatString="">
                                </PropertiesDateEdit>
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataHyperLinkColumn Caption="Gnra Salida" ShowInCustomizationForm="True" VisibleIndex="22">
                                <EditFormSettings Visible="False" />
                                <DataItemTemplate>
                                    <asp:ImageButton ID="GeneraExpedicion" CommandName="cmdExpedicion" runat="server" ImageUrl="~/Images/reception.png" />
                                </DataItemTemplate>
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataHyperLinkColumn>
                            <dx:GridViewDataTextColumn Caption="Poliza" FieldName="Transfer_U_Comentario" ShowInCustomizationForm="True" VisibleIndex="15">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <Styles>
                            <FocusedRow BackColor="#FF9933">
                            </FocusedRow>
                        </Styles>
                        <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
                        <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
                    </dx:ASPxGridView>
                    <asp:LinqDataSource ID="LqDsTransferencias" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
                        TableName="Transfer" OrderBy="Transfer_Id desc"
                        Where="Date &lt;= @Date &amp;&amp; Date &gt;= @Date1 &amp;&amp; Site_Id_Destiny == @Site_Id_Destiny" EnableInsert="True">
                        <WhereParameters>
                            <asp:ControlParameter ControlID="cb_fhasta" Name="Date" PropertyName="Value"
                                Type="DateTime" />
                            <asp:ControlParameter ControlID="cb_fdesde" Name="Date1" PropertyName="Value"
                                Type="DateTime" />
                            <asp:Parameter DefaultValue="20" Name="Site_Id_Destiny" Type="Int32" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                    <asp:LinqDataSource ID="LqDsSite" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
                        TableName="Site" Where="Site_ShortDescription != @Site_ShortDescription1 &amp;&amp; Site_ShortDescription != @Site_ShortDescription2">
                        <WhereParameters>
                            <asp:Parameter DefaultValue="CV700" Name="Site_ShortDescription1" Type="String" />
                            <asp:Parameter DefaultValue="CV701" Name="Site_ShortDescription2" Type="String" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                    <asp:LinqDataSource ID="LqDsSiteAll" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" TableName="Site">
                    </asp:LinqDataSource>
                    <asp:LinqDataSource ID="LqDsStaff" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
                        TableName="Staff">
                    </asp:LinqDataSource>
                    <asp:LinqDataSource ID="LqDsEntidad" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
                        TableName="CVT_Entidad">
                    </asp:LinqDataSource>
                    <asp:LinqDataSource ID="CVTTransfer" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
                        Select="new (Transfer_Id, Cant_Pallets)" TableName="CVT_Transfer">
                    </asp:LinqDataSource>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxPanel>
    </div>
    <dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel"
        Modal="True">
    </dx:ASPxLoadingPanel>
</asp:Content>
