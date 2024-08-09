<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PrecioCompra.aspx.cs" Inherits="CVT_MermasRecepcion.Mayorista.PrecioCompra" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 20px;
        }

        .auto-style6 {
            margin-right: 18px;
        }

        .auto-style7 {
            width: 350px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Mayorista</a></li>
            <li><span id="current">Precios</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Precios</span>
        <span class="tab-end"></span>
        <%--       <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px; height: 20px;" />
                Exportar Excel</a>&nbsp;
              <a>
                  <asp:ImageButton ID="cmdNew" runat="server" ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>
        </div>--%>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsUltimoPrecioCompra" KeyFieldName="id_RegistroPrecio" OnRowUpdating="GvDatos_RowUpdating" OnRowCommand="GvDatos_RowCommand" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <ClientSideEvents ToolbarItemClick="function(s, e) {
	if (e.item.name == &quot;Nuevo&quot;) e.processOnServer = true; e.usePostBack=true;
 

}" />
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Toolbars>
                <dx:GridViewToolbar >
                    <Items>
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
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="UltimoPrecioCompra" VisibleIndex="5">
                    <PropertiesTextEdit>
                        <ValidationSettings Display="Dynamic">
                            <RegularExpression ErrorText="solo numeros" ValidationExpression="\d+" />
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Porcentaje" VisibleIndex="6">
                    <PropertiesTextEdit>
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="Fecha Registro" FieldName="FechaUltimoRegistro" VisibleIndex="7">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataComboBoxColumn Caption="Cod.Producto" FieldName="ItemCode" ReadOnly="True" VisibleIndex="1">
                    <PropertiesComboBox DataSourceID="lqsProducto" TextField="ItemCode" ValueField="ItemCode">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Descripcion" FieldName="ItemCode" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="lqsProducto" TextField="ItemName" ValueField="ItemCode">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataHyperLinkColumn FieldName="Hist.Cambios" VisibleIndex="12">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detalleHistorial" CommandName="cmdDetalleHistorial" runat="server" ImageUrl="~/Images/reloj-de-pared.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataTextColumn FieldName="ProductoNoRegistrado" VisibleIndex="4">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Competencia" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Proveedor" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsUltimoPrecioCompra" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="MMetro_UltimoPrecioCompra" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="lqsProducto" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTMMETRODataContext" EntityTypeName="" TableName="MMetro_OITM">
        </asp:LinqDataSource>
    </div>
    <br />
    <div>
        <dx:ASPxPopupControl ID="popNuevo" runat="server" AllowDragging="True" CloseAction="CloseButton" HeaderText="Nuevo" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle" Modal="True" PopupAction="None" Width="167px">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <br />
                    <div style="margin-left: 40px">
                        <div>

                            <dx:ASPxRadioButtonList ID="rbtProd" runat="server" ValueType="System.String" AutoPostBack="True" CssClass="auto-style6" Theme="Material" Width="302px" RepeatDirection="Horizontal" TextWrap="False" OnSelectedIndexChanged="rbtProd_SelectedIndexChanged">
                                <Items>
                                    <dx:ListEditItem Text="PROD.EXISTENTE" Value="1" />
                                    <dx:ListEditItem Text="PROD.NO CREADO" Value="2" />
                                </Items>
                                <Border BorderStyle="None" />
                            </dx:ASPxRadioButtonList>

                        </div>
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="lblProd" runat="server" Text="Cod.Producto" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboProducto" runat="server" ValueType="System.String" DataSourceID="lqsProducto" ValueField="ItemCode" Height="27px" Width="350px">
                                            <Columns>
                                                <dx:ListBoxColumn Caption="Codigo" FieldName="ItemCode">
                                                </dx:ListBoxColumn>
                                                <dx:ListBoxColumn Caption="Descripcion" FieldName="ItemName" Width="450px">
                                                </dx:ListBoxColumn>
                                            </Columns>
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div>
                            <table>
                                <tr>
                                    <td class="auto-style7">
                                        <dx:ASPxLabel ID="lblProNoReg" runat="server" Text="Registrar Producto" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtProdNoReg" runat="server" Width="350px" Height="27px"></dx:ASPxTextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <br />
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Precio"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtPrecio" runat="server" Width="112px" Height="25px">
                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip">
                                            <RegularExpression ErrorText="Solo Numeros" ValidationExpression="\d+" />
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="auto-style5"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Porcentaje"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtPorcentaje" runat="server" Width="112px" Height="25px">
                                        <ValidationSettings Display="Dynamic" ErrorDisplayMode="ImageWithTooltip">
                                            <RegularExpression ErrorText="" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="auto-style5"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Competencia"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtCompetencia" runat="server" Width="170px" Height="25px"></dx:ASPxTextBox>
                                </td>
                                <td class="auto-style5"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Proveedor"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtProveedor" runat="server" Width="170px" Height="25px"></dx:ASPxTextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div style="margin-left: 200px">
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxButton ID="btnGuardar" runat="server" Text="Guardar" Width="189px" OnClick="btnGuardar_Click" Height="41px"></dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
    <br />
    <div>
        <div>
            <dx:ASPxPopupControl ID="popLog" runat="server" HeaderText="Historial " AllowDragging="True" CloseAction="CloseButton" CloseAnimationType="Fade" Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle">
                <ContentCollection>
                    <dx:PopupControlContentControl>
                        <br />
                        <br />
                        <div>
                            <dx:ASPxGridView ID="GvDatosHistorial" runat="server" AutoGenerateColumns="False" DataSourceID="LqsLogPrecioCompra" KeyFieldName="ItemCode" OnToolbarItemClick="GvDatosHistorial_ToolbarItemClick">
                                <Toolbars>
                                    <dx:GridViewToolbar >
                                        <Items>

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
                                        </Items>
                                    </dx:GridViewToolbar>
                                </Toolbars>
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="Producto" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Precio" ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataDateColumn FieldName="FechaRegistro" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2">
                                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm">
                                        </PropertiesDateEdit>
                                    </dx:GridViewDataDateColumn>
                                </Columns>
                                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
                                <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
                            </dx:ASPxGridView>
                            <asp:LinqDataSource ID="LqsLogPrecioCompra" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="MMetro_LogUltimoPrecioCompra" Where="id_RegistroPrecio == @id_RegistroPrecio">
                                <WhereParameters>
                                    <asp:SessionParameter DefaultValue="0" Name="id_RegistroPrecio" SessionField="id_RegistroPrecio" Type="Int32" />
                                </WhereParameters>
                            </asp:LinqDataSource>
                        </div>
                    </dx:PopupControlContentControl>
                </ContentCollection>
            </dx:ASPxPopupControl>
        </div>
    </div>
</asp:Content>
