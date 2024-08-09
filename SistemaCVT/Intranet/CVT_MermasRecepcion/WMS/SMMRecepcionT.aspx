<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="SMMRecepcionT.aspx.cs" Inherits="CVT_MermasRecepcion.WMS.SMMRecepcionT" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 12px;
        }
        .auto-style6 {
            width: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
        <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>WMS</a></li>
            <li><span id="current">Recepciones</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Recepciones</span>
        <span class="tab-end"></span>
        <%--        <div id="options">
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
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha inicio" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteInicio" runat="server" Height="25px"></dx:ASPxDateEdit>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Fecha Termino" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteTermino" runat="server" Height="25px"></dx:ASPxDateEdit>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 150px">
        <table>
            <tr>
                <td>&nbsp;&nbsp;
                    <dx:ASPxButton ID="btnFiltrar" runat="server" Text="Filtrar" Height="30px" Width="110px" Theme="Glass" OnClick="btnFiltrar_Click"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqDsRecepciones" KeyFieldName="Reception_Id" Width="100%"
            OnRowCommand="GvDatos_RowCommand"
            OnHtmlRowCreated="GvDatos_HtmlRowCreated" OnToolbarItemClick="GvDatos_ToolbarItemClick" OnCommandButtonInitialize="GvDatos_CommandButtonInitialize">
            <ClientSideEvents ToolbarItemClick="function(s, e) {
	if (e.item.name == &quot;Nuevo&quot;) e.processOnServer = true; e.usePostBack=true;
 

}" />

            <SettingsPager PageSize="25">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>

            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            <SettingsBehavior AllowFocusedRow="True" />
            <Toolbars>
                <dx:GridViewToolbar EnableAdaptivity="True">
                    <Items>
                        <%--    <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif">
                            <Image Url="../Images/pn-add-source-copy.gif"></Image>
                        </dx:GridViewToolbarItem>--%>
                        <dx:GridViewToolbarItem Command="Custom" Name="Nuevo" Text="Nuevo" Image-Url="../../Images/pn-add-source-copy.gif">
                            <Image Url="../../Images/pn-add-source-copy.gif"></Image>
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
                <dx:GridViewCommandColumn ShowEditButton="True" ShowInCustomizationForm="True"
                    VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Reception_Id" ReadOnly="True"
                    ShowInCustomizationForm="True" VisibleIndex="2" Caption="Folio">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Reception_DocNumber"
                    ShowInCustomizationForm="True" VisibleIndex="9" Caption="N Documento">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Reception_DateIn" ShowInCustomizationForm="True"
                    VisibleIndex="14" Caption="Fecha Ingreso">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="Reception_DateOut"
                    ShowInCustomizationForm="True" VisibleIndex="15" Caption="Fecha Salida">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Reception_Note"
                    ShowInCustomizationForm="True" VisibleIndex="16" Caption="Comentario"
                    Visible="False">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Detalle" VisibleIndex="51">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/boxadd.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Anula" VisibleIndex="52">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="Anula" CommandName="cmdAnula" runat="server" ImageUrl="~/Images/node_delete.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Confirma" VisibleIndex="53">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="Confirma" CommandName="cmdConfirma" runat="server"
                            ImageUrl="~/Images/confirm.png" OnClientClick="LoadingPanel.Show();" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataComboBoxColumn Caption="Bodega" FieldName="Site_Id"
                    ShowInCustomizationForm="True" VisibleIndex="1">
                    <PropertiesComboBox DataSourceID="LqDsSite" TextField="Site_Description"
                        ValueField="Site_Id">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Proveedor"
                    FieldName="CardCode" ShowInCustomizationForm="True"
                    VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="LqDsProveedor"
                        ValueField="CardCode">
                        <Columns>
                            <dx:ListBoxColumn Caption="Cod" FieldName="CardCode" Width="100px">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Proveedor" FieldName="CardName"
                                Width="350px">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="T Recepcion" FieldName="Reception_Type"
                    ShowInCustomizationForm="True" VisibleIndex="7">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="COMPRA" Value="1" />
                            <dx:ListEditItem Text="SALA DE VENTAS" Value="2" />
                            <dx:ListEditItem Text="PLANTA PRODUCTIVA" Value="3" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Estado" FieldName="Reception_Status"
                    ShowInCustomizationForm="True" VisibleIndex="17">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Abierta" Value="1" />
                            <dx:ListEditItem Text="Cerrada" Value="2" />
                            <dx:ListEditItem Text="Anulada" Value="3" />
                        </Items>
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="T Documento"
                    FieldName="DocType" ShowInCustomizationForm="True"
                    VisibleIndex="8">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="GUIA DESPACHO" Value="GD" />
                            <dx:ListEditItem Text="FACTURA" Value="FAC" />
                            <dx:ListEditItem Text="DEVOLUCION" Value="DEV" />
                            <dx:ListEditItem Text="TRANSFERENCIA" Value="TRAS" />
                            <dx:ListEditItem Text="PLANTA PRODUCTIVA" Value="PPR" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Usuario" FieldName="IdUsuario"
                    ShowInCustomizationForm="True" VisibleIndex="18">
                    <PropertiesComboBox DataSourceID="LqsUsuario" TextField="NombreUsuario"
                        ValueField="IdUsuario">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="NumDocSAP" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="TipoDocSAP" VisibleIndex="12">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Sin Sincro." Value="0" />
                            <dx:ListEditItem Text="Orden de Compra" Value="1" />
                            <dx:ListEditItem Text="Ajuste Entrada" Value="2" />
                            <dx:ListEditItem Text="Devolucion" Value="3" />
                            <dx:ListEditItem Text="Transferencia" Value="4" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsRecepciones" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName=""
            TableName="SMM_Reception" EnableInsert="True" OrderBy="Reception_Id desc"
            Where="Reception_DateIn &gt;= @Reception_DateIn &amp;&amp; Reception_DateIn &lt;= @Reception_DateIn1"
            EnableUpdate="True">
            <WhereParameters>
                <asp:ControlParameter ControlID="dteInicio" Name="Reception_DateIn"
                    PropertyName="Value" Type="DateTime" DefaultValue="01-01-1990" />
                <asp:ControlParameter ControlID="dteTermino" Name="Reception_DateIn1"
                    PropertyName="Value" Type="DateTime" DefaultValue="01-01-1990" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqDsSite" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName=""
            TableName="SMM_Site">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqDsProveedor" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTMMETRODataContext" EntityTypeName=""
            TableName="MMetro_OCRD">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsUsuario" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
            TableName="CVT_Usuarios"
            Where="IdPerfil != @IdPerfil">
            <WhereParameters>
                <asp:Parameter DefaultValue="0" Name="IdPerfil" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
    <div>

        <dx:ASPxPopupControl ID="PopNuevo" runat="server"
            HeaderText="Nuevo" AllowDragging="True">
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Bodega" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboBodega" runat="server" ValueType="System.String" DataSourceID="LqDsSite" TextField="Site_Description" ValueField="Site_Id" Height="30px">
                                        <ValidationSettings Display="Dynamic">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </td>
                                <td class="auto-style5"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Tipo Recepcion" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboTipoRecepcion" runat="server" ValueType="System.String" Height="30px" AutoPostBack="True" OnSelectedIndexChanged="cboTipoRecepcion_SelectedIndexChanged">
                                        <Items>
                                            <dx:ListEditItem Text="NORMAL" Value="1" />
                                            <dx:ListEditItem Text="SALA DE VENTAS" Value="2" />
                                            <dx:ListEditItem Text="PLANTA PRODUCTIVA" Value="3" />
                                        </Items>
                                        <ValidationSettings Display="Dynamic">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </td>
                                <td class="auto-style5"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Proveedor" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboProveedor" runat="server" ValueType="System.String" Height="30px" Width="250px" DataSourceID="lqsProveedor2" ValueField="CardCode" >
                                        <Columns>
                                            <dx:ListBoxColumn FieldName="CardCode" Width="200px">
                                            </dx:ListBoxColumn>
                                            <dx:ListBoxColumn FieldName="CardName" Width="250px">
                                            </dx:ListBoxColumn>
                                        </Columns>
                                        <ValidationSettings Display="Dynamic">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Tipo Documento"></dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboTipoDoc" runat="server" ValueType="System.String" Height="30px">
                                        <Items>
                                            <dx:ListEditItem Text="GUIA DESPACHO" Value="GD" />
                                            <dx:ListEditItem Text="FACTURA" Value="FAC" />
                                            <dx:ListEditItem Text="DEVOLUCION" Value="DEV" />
                                            <dx:ListEditItem Text="TRANSFERENCIA" Value="TRAS" />
                                            <dx:ListEditItem Text="PLANTA PRODUCTIVA" Value="PPR" />
                                        </Items>
                                        <ValidationSettings Display="Dynamic">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </td>
                                <td class="auto-style5"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="N° Documento"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtNumDocumento" runat="server" Width="170px" Height="30px">
                                        <ValidationSettings Display="Dynamic">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="auto-style5"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Tipo Doc.SAP"></dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboTipDocSAP" runat="server" ValueType="System.String" Height="30px">
                                        <Items>
                                            <dx:ListEditItem Text="Sin Sincro." Value="0" />
                                            <dx:ListEditItem Text="Orden de Compra" Value="1" />
                                            <dx:ListEditItem Text="Ajuste Entrada" Value="2" />
                                            <dx:ListEditItem Text="Devolucion" Value="3" />
                                            <dx:ListEditItem Text="Transferencia" Value="4" />
                                        </Items>
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="N° Doc.SAP"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtNumDocSAP" runat="server" Width="170px" Height="30px"></dx:ASPxTextBox>
                                </td>
                                <td class="auto-style5"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Comentarios"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtComentarios" runat="server" Width="170px" Height="30px"></dx:ASPxTextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <br />
                    <div style="margin-left: 150px">                        
                        <dx:ASPxButton ID="btnGuardar" runat="server" Text="GUARDAR" Height="40px" OnClick="btnGuardar_Click" Theme="Glass" Width="140px"></dx:ASPxButton>
                    </div>
                    <asp:LinqDataSource ID="lqsProveedor2" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTMMETRODataContext" EntityTypeName=""
                        TableName="MMetro_OCRD" Where="CardType == @CardType">
                        <WhereParameters>
                            <asp:Parameter DefaultValue="T" Name="CardType" Type="Char" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>

    </div>
</asp:Content>
