<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="InspeccionArroz.aspx.cs" Inherits="CVT_MermasRecepcion.Calidad.Inspecciones.InspeccionArroz" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Calidad</a></li>
            <li><span id="current">Inspeccion Arroz</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Inspeccion Arroz</span><div id="options">
            <%-- <a>
                <asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" />
                Exportar Excel</a>--%>
            <%--  <a>
                <asp:ImageButton ID="cmdNew" runat="server" ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="width: 16px; height: 16px;" />Nuevo</a>--%>
        </div>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsArroz" KeyFieldName="Id_InspeccionPT_Arroz" Width="773px" OnRowCommand="GvDatos_RowCommand" OnHtmlRowCreated="GvDatos_HtmlRowCreated" OnToolbarItemClick="GvDatos_ToolbarItemClick" OnRowDeleting="GvDatos_RowDeleting" OnRowUpdated="GvDatos_RowUpdated" OnRowUpdating="GvDatos_RowUpdating">

            <ClientSideEvents ToolbarItemClick="function(s, e) {
	if (e.item.name == &quot;Nuevo&quot;) e.processOnServer = true; e.usePostBack=true;
 

}" />

            <SettingsPager PageSize="100">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            <SettingsBehavior ConfirmDelete="True" />
            <SettingsPopup>
                <EditForm Width="700px">
                </EditForm>

<FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <Toolbars>
                <dx:GridViewToolbar >
                    <Items>
                        <dx:GridViewToolbarItem Command="Custom" Name="Nuevo" Text="Nuevo" Image-Url="../../Images/pn-add-source-copy.gif" >
<Image Url="../../Images/pn-add-source-copy.gif"></Image>
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
            <SettingsText ConfirmDelete="Solo usuarios verificadores pueden eliminar registros " />
            <Columns>
                <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0" ShowDeleteButton="True" ShowClearFilterButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id_InspeccionPT_Arroz" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Lote" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaRegisro" VisibleIndex="2">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataComboBoxColumn Caption="Proveedor" FieldName="CardCode" VisibleIndex="5">
                    <PropertiesComboBox DataSourceID="LqsProveedor" TextField="CardName" ValueField="CardCode">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Producto" FieldName="ItemCode" VisibleIndex="8">
                    <PropertiesComboBox DataSourceID="LqsProducto" TextField="ItemName" ValueField="ItemCode">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Encargado" FieldName="IdUsuario" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="Usuario" TextField="NombreUsuario" ValueField="IdUsuario">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Detalle" VisibleIndex="11">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/menu.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataTextColumn Caption="Accion Correctiva" FieldName="AccionCorrectiva" VisibleIndex="9">
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Fecha_ingresoRegistro" Visible="False" VisibleIndex="10">
                    <PropertiesDateEdit DisplayFormatString="">
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataHyperLinkColumn FieldName="PDF" VisibleIndex="12">
                    <Settings AllowAutoFilter="False" />
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detallePdf" CommandName="cmdDetallePdf" runat="server" ImageUrl="~/Images/documentpdf.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataMemoColumn Caption="Proveedor Mixto" FieldName="ProvMixto" VisibleIndex="7">
                    <PropertiesMemoEdit Height="45px">
                    </PropertiesMemoEdit>
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataCheckColumn FieldName="PMixto" Visible="False" VisibleIndex="6">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Verificado" VisibleIndex="13">
                    <PropertiesHyperLinkEdit>
                        <Style HorizontalAlign="Center" VerticalAlign="Middle">
                             </Style>
                    </PropertiesHyperLinkEdit>
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="Verificado" CommandName="cmdVerificado" runat="server" ImageUrl="~/Images/activo.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataTextColumn FieldName="Estado" Visible="False" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsArroz" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_InspeccionPT_Arroz" EnableDelete="True" EnableInsert="True" EnableUpdate="True" OrderBy="Id_InspeccionPT_Arroz desc">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="Usuario" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Usuarios">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsProveedor" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" TableName="OCRD" Where="CardType == @CardType">
            <WhereParameters>
                <asp:Parameter DefaultValue="S" Name="CardType" Type="Char" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsProducto" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_VW_ProductosArroz">
        </asp:LinqDataSource>
    </div>
    <br />
    <div>
        <dx:ASPxPopupControl ID="popInsArroz" runat="server" AllowDragging="True" CloseAction="CloseButton" HeaderText="Nuevo" Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle" Width="500px">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <br />
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                    <dx:ASPxDateEdit ID="dteFechReg" runat="server" Width="100px">
                                        <ValidationSettings Display="Dynamic">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxDateEdit>
                                </td>
                                <td class="auto-style5"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Producto" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboProductos" runat="server" ValueType="System.String" DataSourceID="LqsProducto" TextField="ItemName" ValueField="ItemCode">
                                        <ValidationSettings Display="Dynamic">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </td>
                                <td class="auto-style5"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Lote" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtLote" runat="server" Width="150px" Height="25px">
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
                                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Proveedor Mixto" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                    <asp:CheckBox ID="chkmixto" runat="server" AutoPostBack="True" OnCheckedChanged="chkmixto_CheckedChanged" />
                                </td>
                                <td class="auto-style5"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Proveedor" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboProveedor" runat="server" ValueType="System.String" DataSourceID="LqsProveedor" TextField="CardName" ValueField="CardCode" AutoPostBack="True" OnSelectedIndexChanged="cboProveedor_SelectedIndexChanged"></dx:ASPxComboBox>
                                </td>

                            </tr>
                        </table>
                    </div>
                    <br />
                    <div>
                        <table>
                            <tr>
                                <td>

                                    <dx:ASPxMemo ID="memoMixto" runat="server" Height="50px" Width="444px"></dx:ASPxMemo>

                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="accion Correctiva" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                    <dx:ASPxMemo ID="memoAccionCorrectiva" runat="server" Height="50px" Width="444px"></dx:ASPxMemo>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div>
                        <dx:ASPxButton ID="BtnGuardar" runat="server" Text="Guardar" OnClick="BtnGuardar_Click" Theme="iOS"></dx:ASPxButton>
                    </div>
                    <br />
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
    <br />
    <div>
        <dx:ASPxPopupControl ID="popVerificar" runat="server" AllowDragging="True" CloseAction="CloseButton" CloseAnimationType="Fade" HeaderText="Verificacion " Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <br />
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Usuario" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtUsuario" runat="server" Width="170px" Height="25px" Theme="Default">
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
                                    <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Contraseña" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                    <asp:TextBox ID="txtContrasena" runat="server" CausesValidation="True" Height="25px" TextMode="Password" Width="170px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div style="margin-left: 35px">
                        <dx:ASPxButton ID="btnVerificar" runat="server" Text="Verificar" Theme="MaterialCompact" OnClick="btnVerificar_Click"></dx:ASPxButton>
                    </div>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
</asp:Content>
