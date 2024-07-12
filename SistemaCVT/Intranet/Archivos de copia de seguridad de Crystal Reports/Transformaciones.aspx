<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Transformaciones.aspx.cs" Inherits="CVT_MermasRecepcion.Transformaciones.Transformaciones" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Transformacion</a></li>
            <li><span id="current">Transformacion</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Transformacion</span>
        <span class="tab-end"></span>
        <%--    <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" />
                Exportar Excel</a>
            <a>
                <asp:ImageButton ID="cmdNew" runat="server"
                    ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>
        </div>--%>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqDsTransformaciones" KeyFieldName="Transformacion_Id"
            OnRowInserted="GvDatos_RowInserted" OnRowInserting="GvDatos_RowInserting"
            OnRowCommand="GvDatos_RowCommand"
            OnHtmlRowCreated="GvDatos_HtmlRowCreated" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsPager PageSize="25">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            <SettingsBehavior AllowFocusedRow="True" />
            <Toolbars>
                <dx:GridViewToolbar >
                    <Items>
                        <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif" >
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
                <dx:GridViewDataTextColumn FieldName="Transformacion_Id" ReadOnly="True"
                    VisibleIndex="0" Caption="Folio">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Fecha" VisibleIndex="3">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Folio" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Comentario" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Usuario" FieldName="Staff_Id"
                    VisibleIndex="8">
                    <PropertiesComboBox DataSourceID="LqDsStaff" TextField="Staff_UserName"
                        ValueField="Staff_Id">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Bodega" FieldName="Site_Id"
                    VisibleIndex="1">
                    <PropertiesComboBox DataSourceID="LqDsSite" TextField="Site_ShortDescription"
                        ValueField="Site_Id">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Tipo" VisibleIndex="4">
                    <PropertiesComboBox>
                        <Items>
                            
                            <dx:ListEditItem Text="Manual" Value="0" />
                            
                        </Items>
                        
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="SubTipo" VisibleIndex="5">
                    <PropertiesComboBox>
                        <Items>
                            
                            <dx:ListEditItem Text="Unidad" Value="0" />
                            
                            <dx:ListEditItem Text="Barrido" Value="1" />
                            
                            <dx:ListEditItem Text="Reproceso" Value="2" />
                            
                        </Items>
                        
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Entidad" VisibleIndex="6">
                    <PropertiesComboBox>
                        <Items>
                            
                            <dx:ListEditItem Text="Expedicion" Value="8" />
                            
                            <dx:ListEditItem Text="Transferencia" Value="13" />
                            
                        </Items>
                        
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Estado" VisibleIndex="10">
                    <PropertiesComboBox>
                        <Items>
                            
                            <dx:ListEditItem Text="Abierta" Value="1" />
                            
                            <dx:ListEditItem Text="Terminada" Value="2" />
                            
                            <dx:ListEditItem Text="Anulada" Value="3" />
                            
                        </Items>
                        
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Detalle" VisibleIndex="11">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/boxadd.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Anula" VisibleIndex="12">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="Anula" CommandName="cmdAnula" runat="server" ImageUrl="~/Images/node_delete.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Confirma" VisibleIndex="13">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="Confirma" CommandName="cmdConfirma" runat="server"
                            ImageUrl="~/Images/confirm.png" OnClientClick="LoadingPanel.Show();" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataComboBoxColumn Caption="Proceso Relacionado" FieldName="ProcRelacionado" VisibleIndex="2">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Envasado" Value="Envasado" />
                            <dx:ListEditItem Text="Recepción" Value="Recepción" />
                            <dx:ListEditItem Text="Almacenaje Bodega" Value="Almacenaje Bodega" />
                        </Items>
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
        <asp:LinqDataSource ID="LqDsTransformaciones" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext"
            EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName=""
            TableName="CVT_Transformacion" OrderBy="Transformacion_Id desc">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqDsStaff" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext"
            EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName=""
            TableName="Staff">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqDsSite" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext"
            EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName=""
            TableName="Site">
        </asp:LinqDataSource>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
        </dx:ASPxGridViewExporter>

    </div>
    <dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel"
        Modal="True">
    </dx:ASPxLoadingPanel>
</asp:Content>

