<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ExpedicionRapida.aspx.cs" Inherits="CVT_MermasRecepcion.WMS.ExpedicionRapida" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 35px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>WMS</a></li>
            <li><span id="current">Expedicion Rapida</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Expedicion Rapida</span>
        <span class="tab-end"></span>
        <%--  <div id="options">
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
                    <asp:Label ID="Label1" runat="server" Text="Desde"></asp:Label>
                    <dx:ASPxDateEdit ID="dteDesde" runat="server"></dx:ASPxDateEdit>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Hasta"></asp:Label>
                    <dx:ASPxDateEdit ID="dteHasta" runat="server"></dx:ASPxDateEdit>
                </td>
                <td>
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click"></dx:ASPxButton>
                </td>

            </tr>
        </table>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsExpedicion" KeyFieldName="Expedition_Id" Width="1400px" OnRowCommand="GvDatos_RowCommand" OnRowInserting="GvDatos_RowInserting" OnHtmlRowCreated="GvDatos_HtmlRowCreated" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsPager PageSize="50">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm" NewItemRowPosition="Bottom">
            </SettingsEditing>
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
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
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Company_Id" ReadOnly="True" VisibleIndex="2" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Expedition_Id" ReadOnly="True" VisibleIndex="4" Caption="Folio N°">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Business_Partner_Id" VisibleIndex="5" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="AccessControl_Id" VisibleIndex="8" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Order_Id" VisibleIndex="9" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="WorkType_Id" VisibleIndex="11" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ClientDestiny_Id" VisibleIndex="12" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Expedition_DocNumber" VisibleIndex="13" Caption="N° Doc">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Expedition_DateOut" VisibleIndex="14" Caption="Fecha Termino">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Expedition_Note" VisibleIndex="15" Caption="Nota                                                                                                                                       " Width="250px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Expedition_GrossWeight" VisibleIndex="17" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Expedition_NetWeight" VisibleIndex="18" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Expedition_Tare" VisibleIndex="19" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Expedition_Stamp" VisibleIndex="22" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Expedition_seals1" VisibleIndex="23" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Expedition_seals2" VisibleIndex="24" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Expedition_seals3" VisibleIndex="25" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Expedition_NumContainer" VisibleIndex="26" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Expedition_DateIn" VisibleIndex="27" Caption="Fecha Inicio">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Expedition_SendState" VisibleIndex="28" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Expedition_Sync" VisibleIndex="29" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Expedition_Confirmed" VisibleIndex="31" Caption="Confirmados">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Expedition_Included" VisibleIndex="30" Caption="Incluidos">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="INV_0010_SyncStat" VisibleIndex="32" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="INV_0010_UpdFrom" VisibleIndex="33" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Expedition_U_TipoDocSAP" VisibleIndex="34" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Expedition_U_NumDocSAP" VisibleIndex="35" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Bodega" FieldName="Site_Id" ShowInCustomizationForm="True" VisibleIndex="3" Width="200px">
                    <PropertiesComboBox DataSourceID="site" TextField="Site_Description" ValueField="Site_Id">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Tipo Doc." FieldName="DocType_Id" VisibleIndex="6">
                    <PropertiesComboBox DataSourceID="Documento" TextField="DocType_Description" ValueField="DocType_Id">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Estado" FieldName="Expedition_Status" VisibleIndex="20">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="ABIERTA" Value="1" />
                            <dx:ListEditItem Text="CERRADO" Value="2" />
                            <dx:ListEditItem Text="CANCELADO" Value="3" />
                        </Items>
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Detalle" VisibleIndex="51">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/boxadd.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Sector_Id" VisibleIndex="10" Caption="Sector">
                    <PropertiesComboBox DataSourceID="LinqDataSource3" TextField="Sector_Description" ValueField="Sector_Id">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Confirma" VisibleIndex="53">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="Confirma" CommandName="cmdConfirma" runat="server"
                            ImageUrl="~/Images/confirm.png" OnClientClick="LoadingPanel.Show();" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataComboBoxColumn Caption="Usuario" FieldName="Staff_Id" VisibleIndex="16">
                    <PropertiesComboBox DataSourceID="LinqDataSource4" TextField="Staff_Name" ValueField="Staff_Id">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Motivo" FieldName="Expedition_U_Motivo" VisibleIndex="21">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="HURTO" Value="300200" />
                            <dx:ListEditItem Text="FALTANTE PROVEEDOR" Value="300300" />
                            <dx:ListEditItem Text="DESECHO" Value="300100" />
                            <dx:ListEditItem Text="SIN SINCRONIZACION " Value="00" />
                            <dx:ListEditItem Text="AJUSTE INVENTARIO" Value="300500" />
                            <dx:ListEditItem Text="MUESTRA CALIDAD" Value="300400" />
                        </Items>
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Tipo Expedicion" FieldName="Expedition_Type" VisibleIndex="7">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="EXP. A. SALIDA" Value="1" />
                            <dx:ListEditItem Text="EXP. C. DOCKING" Value="2" />
                            <dx:ListEditItem Text="EXP.CLIENTE" Value="3" />
                            <dx:ListEditItem Text="EXP. P.PRODUCTIVA" Value="4" />
                            <dx:ListEditItem Text="EXP. RAPIDA" Value="5" />
                            <dx:ListEditItem Text="EXP. REVERSA RECEPCION" Value="6" />
                            <dx:ListEditItem Text="EXP. SIN REFERENCIA" Value="7" />
                        </Items>
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Eliminar" VisibleIndex="1">
                    <PropertiesHyperLinkEdit>
                        <Style HorizontalAlign="Center" VerticalAlign="Middle">
                             </Style>
                    </PropertiesHyperLinkEdit>
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="eliminar" CommandName="cmdEliminar" runat="server" ImageUrl="~/Images/eliminar.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
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
        <asp:LinqDataSource ID="LqsExpedicion" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" TableName="Expedition" Where="Expedition_DateIn &gt;= @Expedition_DateIn &amp;&amp; Expedition_DateIn &lt;= @Expedition_DateIn1" OrderBy="Expedition_DateIn desc" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
            <WhereParameters>
                <asp:ControlParameter ControlID="dteDesde" DefaultValue="01-01-1800" Name="Expedition_DateIn" PropertyName="Value" Type="DateTime" />
                <asp:ControlParameter ControlID="dteHasta" DefaultValue="01-01-1800" Name="Expedition_DateIn1" PropertyName="Value" Type="DateTime" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="site" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" TableName="Site">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="Documento" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" TableName="DocType">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LinqDataSource3" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" TableName="Sector">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LinqDataSource4" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" Select="new (Staff_Id, Staff_Name, Staff_LastName)" TableName="Staff">
        </asp:LinqDataSource>
    </div>
</asp:Content>
