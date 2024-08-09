<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="SMMOrdenVentas.aspx.cs" Inherits="CVT_MermasRecepcion.MayoristaOP.SMMOrdenVentas" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 15px;
            height: 40px;
        }

        .auto-style6 {
            height: 40px;
        }

        .auto-style7 {
            width: 10px;
        }

        .auto-style8 {
            width: 16px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Mayorista</a></li>
            <li><span id="current">Orden de Ventas</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Orden de Ventas</span>
        <span class="tab-end"></span>
        <%--      <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px; height: 20px;" />
                Exportar Excel</a>&nbsp;
              <a>
                  <asp:ImageButton ID="cmdNew" runat="server"
                      ImageUrl="~/Images/nuevo.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>
        </div>--%>
    </div>
    <br />
    <br />
    <div style="margin-left: 30px">
        <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" ShowCollapseButton="true" Width="200px" AllowCollapsingByHeaderClick="True" Theme="Office2003Blue" HeaderText="CREAR CLIENTE">
            <PanelCollection>
                <dx:PanelContent>
                    <div>
                        <div>
                            <table>
                                <tr>
                                    <td class="auto-style6">
                                        <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="RUT Cliente" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtRutCli" runat="server" Width="170px" Height="30px" MaxLength="10" MaskSettings-Mask="00000000-a">
                                            <MaskSettings Mask="00000000-a"></MaskSettings>

                                            <ValidationSettings Display="Dynamic">
                                                <RegularExpression ErrorText="ingrese rut" ValidationExpression="^[0-9]+-[0-9kK]{1}$" />
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Nombre Cliente" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtNomCli" runat="server" Width="350px" Height="30px">
                                            <ValidationSettings Display="Dynamic">
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div>
                            <table>
                                <tr>
                                    <td class="auto-style6">
                                        <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Razon Social" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtRazon" runat="server" Width="300px" Height="30px">
                                            <ValidationSettings Display="Dynamic">
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Giro" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtGiro" runat="server" Width="400px" Height="30px">
                                            <ValidationSettings Display="Dynamic">
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Direccion Facturacion" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtDirFacturacion" runat="server" Width="540px" Height="30px">
                                            <ValidationSettings Display="Dynamic">
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Direccion Despacho" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtDirDespacho" runat="server" Width="540px" Height="30px">
                                            <ValidationSettings Display="Dynamic">
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Telefono" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtTelefono" runat="server" Width="170px" Height="30px">
                                            <ValidationSettings Display="Dynamic">
                                                <RegularExpression ErrorText="SOLO NUMEROS" ValidationExpression="\d+" />
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="auto-style8"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Correo" Font-Bold="true"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtCorreo" runat="server" Width="330px" Height="30px">
                                            <ValidationSettings Display="Dynamic">
                                                <RegularExpression ErrorText="INGRESE CORREO VALIDO" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>

                                </tr>
                            </table>
                        </div>
                        <br />
                        <div style="margin-left: 150px">
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxButton ID="btnGuardarCliente" runat="server" Text="Guardar Cliente" Theme="iOS" Height="52px" Width="215px" OnClick="btnGuardarCliente_Click"></dx:ASPxButton>
                                    </td>
                                    <td class="auto-style7"></td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxRoundPanel>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsOrdenVentas" KeyFieldName="IdOrdenVentas" OnRowCommand="GvDatos_RowCommand" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsPager PageSize="100">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings AutoFilterCondition="Contains" />
            <SettingsBehavior ConfirmDelete="True" />
            <ClientSideEvents ToolbarItemClick="function(s, e) {
	if (e.item.name == &quot;Nuevo&quot;) e.processOnServer = true; e.usePostBack=true;
 

}" />
            <Toolbars>
                <dx:GridViewToolbar>
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
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="Folio" FieldName="IdOrdenVentas" ReadOnly="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaEntrega" VisibleIndex="3">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Cliente" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="LqsCliente" ValueField="RutCliente">
                        <Columns>
                            <dx:ListBoxColumn FieldName="RutCliente">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn FieldName="NombreCliente" Width="450px">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Direccion de Despacho" FieldName="Dir_Despacho" VisibleIndex="4">
                    <PropertiesComboBox DataSourceID="LqsDireccionDesp" TextField="DirecDesp" ValueField="DirecDesp">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Direccion de Facturacion" FieldName="Dir_Facturacion" VisibleIndex="5">
                    <PropertiesComboBox DataSourceID="LqsDireccionFac" TextField="DirecFact" ValueField="DirecFact">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Detalle " VisibleIndex="10">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/menu.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsOrdenVentas" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName="" TableName="SMM_Orden_de_Ventas" EnableDelete="True" EnableInsert="True" EnableUpdate="True" OrderBy="IdOrdenVentas desc">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsCliente" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName="" TableName="SMM_VW_CLIENTES_ORDEN_VENTAS">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsDireccionDesp" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName="" TableName="SMM_VW_DIR_DESPACHO_ORDEN_VENTA">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsDireccionFac" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName="" TableName="SMM_VW_DIR_FACTURACION_ORDEN_VENTA">
        </asp:LinqDataSource>
        <br />
        <dx:ASPxPopupControl ID="PopNuevo" runat="server" AllowDragging="True" HeaderText="Nuevo" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle">
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <div style="margin-left: 25px">
                        <div>
                            <table>
                                <tr>
                                    <td>

                                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Cliente"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="CboCliente" runat="server" ValueType="System.String" DataSourceID="LqsCliente0" Height="30px" ValueField="RutCliente" Width="468px" AutoPostBack="True">
                                            <Columns>
                                                <dx:ListBoxColumn Caption="CodCliente" FieldName="RutCliente">
                                                </dx:ListBoxColumn>
                                                <dx:ListBoxColumn Caption="Nombre" FieldName="NombreCliente" Width="450px">
                                                </dx:ListBoxColumn>
                                            </Columns>
                                            <ValidationSettings Display="Dynamic" ValidationGroup="a1">
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
                                        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Direccion Despacho"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboDirDespacho" runat="server" ValueType="System.String" DataSourceID="LqsDireccionDesp0" Height="30px" TextField="DirecDesp" ValueField="DirecDesp" Width="466px">
                                            <ValidationSettings Display="Dynamic" ValidationGroup="a1">
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
                                        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Direccion Facturacion"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboDirFac" runat="server" ValueType="System.String" DataSourceID="LqsDireccionFac0" Height="30px" TextField="DirecFact" ValueField="DirecFact" Width="466px">
                                            <ValidationSettings Display="Dynamic" ValidationGroup="a1">
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
                                        <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Fecha Entrega"></dx:ASPxLabel>
                                        <dx:ASPxDateEdit ID="dteFechaEntrega" runat="server" Height="30px">
                                            <ValidationSettings Display="Dynamic" ValidationGroup="a1">
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxDateEdit>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <br />
                        <div style="margin-left: 150px">
                            <dx:ASPxButton ID="btnGuardar" runat="server" Height="40px" Text="GUARDAR" Theme="Glass" Width="140px" OnClick="btnGuardar_Click" ValidationGroup="a1">
                            </dx:ASPxButton>
                        </div>
                        <asp:LinqDataSource ID="LqsCliente0" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName="" TableName="SMM_VW_CLIENTES_ORDEN_VENTAS">
                        </asp:LinqDataSource>
                        <asp:LinqDataSource ID="LqsDireccionDesp0" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName="" TableName="SMM_VW_DIR_DESPACHO_ORDEN_VENTA" Where="RutCliente == @RutCliente">
                            <WhereParameters>
                                <asp:ControlParameter ControlID="CboCliente" DefaultValue="0" Name="RutCliente" PropertyName="Value" Type="String" />
                            </WhereParameters>
                        </asp:LinqDataSource>
                        <asp:LinqDataSource ID="LqsDireccionFac0" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName="" TableName="SMM_VW_DIR_FACTURACION_ORDEN_VENTA" Where="RutCliente == @RutCliente">
                            <WhereParameters>
                                <asp:ControlParameter ControlID="CboCliente" DefaultValue="0" Name="RutCliente" PropertyName="Value" Type="String" />
                            </WhereParameters>
                        </asp:LinqDataSource>
                    </div>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
</asp:Content>
