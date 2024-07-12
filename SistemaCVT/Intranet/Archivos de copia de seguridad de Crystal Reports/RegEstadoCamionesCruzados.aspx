<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RegEstadoCamionesCruzados.aspx.cs" Inherits="CVT_MermasRecepcion.Comex.RegEstadoCamionesCruzados" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        
        .auto-style8 {
            width: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Comex</a></li>
            <li><span id="current">Estado Camiones</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Estado Camiones</span>
        <span class="tab-end"></span>
        <%-- <dx:ASPxLabel ID="lblNCamiones" runat="server" Text=""></dx:ASPxLabel>--%>
    </div>
    <br />
    <div>
    </div>
    <div>
        <dx:ASPxPopupControl ID="PopRegistro" runat="server" AllowDragging="True" CloseAction="CloseButton" CloseAnimationType="Fade" HeaderText="Verificacion " Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle" Width="650px">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <br />
                    <div style="margin-left: 25px">
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Referencia" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtReferencia" runat="server" Width="170px" OnTextChanged="txtReferencia_TextChanged" Height="25px" AutoPostBack="True"></dx:ASPxTextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div style="margin-left: 25px">
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="lbOC" runat="server" Text="OC" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txOC" runat="server" Width="80px" Border-BorderStyle="none" Height="25px" ReadOnly="True">
                                        <Border BorderStyle="None"></Border>
                                    </dx:ASPxTextBox>

                                </td>
                                <td class="auto-style8"></td>
                                <td>
                                    <dx:ASPxLabel ID="lbNCamion" runat="server" Text="N Camiones" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txNCamiones" runat="server" Width="80px" Border-BorderStyle="none" Height="25px" ReadOnly="True">
                                        <Border BorderStyle="None"></Border>
                                    </dx:ASPxTextBox>
                                    <%-- <dx:ASPxLabel ID="lblNCamiones" runat="server" Text=""></dx:ASPxLabel>--%>
                                </td>
                                <td class="auto-style8"></td>
                                <td>
                                    <dx:ASPxLabel ID="lbProd" runat="server" Text="Producto" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txProducto" runat="server" Width="300px" Border-BorderStyle="none" Height="25px" ReadOnly="True">
                                        <Border BorderStyle="None"></Border>
                                    </dx:ASPxTextBox>
                                    <%--<dx:ASPxLabel ID="lblProducto" runat="server" Text=""></dx:ASPxLabel>--%>
                                </td>
                                <td class="auto-style8"></td>
                                <td>
                                    <dx:ASPxLabel ID="lbProve" runat="server" Text="Proveedor" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txProveedor" runat="server" Width="200px" Border-BorderStyle="none" Height="25px" ReadOnly="True">
                                        <Border BorderStyle="None"></Border>
                                    </dx:ASPxTextBox>
                                    <%-- <dx:ASPxLabel ID="lblProveedor" runat="server" Text=""></dx:ASPxLabel>--%>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div style="margin-left: 25px">
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Informados" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtInformados" runat="server" Width="170px" Height="25px"></dx:ASPxTextBox>
                                </td>
                                <td class="auto-style8"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Cruzados" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtCruzados" runat="server" Width="170px" Height="25px"></dx:ASPxTextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div style="margin-left: 25px">
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Liberados" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtLiberados" runat="server" Width="170px" Height="25px"></dx:ASPxTextBox>
                                </td>
                                <td class="auto-style8"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Llegados" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtllegados" runat="server" Width="170px" Height="25px"></dx:ASPxTextBox>
                                </td>
                                <td class="auto-style8"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Recepcionados" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtRecepcionados" runat="server" Width="170px" Height="25px"></dx:ASPxTextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <br />
                    <div style="margin-left: 250px">
                        <dx:ASPxButton ID="btnGuardar" runat="server" Text="Guardar" Height="41px" Width="143px" OnClick="btnGuardar_Click"></dx:ASPxButton>
                    </div>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsRegistroCamCruzados" KeyFieldName="id_RegRecepcionCamiones" OnToolbarItemClick="GvDatos_ToolbarItemClick" Width="1487px" OnRowDeleting="GvDatos_RowDeleting" OnRowUpdating="GvDatos_RowUpdating">
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
                        <ClientSideEvents ToolbarItemClick="function(s, e) {
	if (e.item.name == &quot;Nuevo&quot;) e.processOnServer = true; e.usePostBack=true;
 

}" />

            <Toolbars>
                <dx:GridViewToolbar>
                    <Items>
                        <dx:GridViewToolbarItem Command="Custom" Name="Nuevo" Text="Nuevo" Image-Url="../../Images/pn-add-source-copy.gif" >
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
                <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="id_RegRecepcionCamiones" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Fercha" MaxWidth="150" MinWidth="150" VisibleIndex="2" Width="150px" Caption="Fecha">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Referencia" VisibleIndex="4">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Informados" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cruzados" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Liberados" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Llegados" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Recepcionados" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="OC" VisibleIndex="3" Caption="N° OC">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NCamiones" VisibleIndex="7" Caption="Cant.Camiones">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Producto" ShowInCustomizationForm="True" VisibleIndex="5">
                    <PropertiesComboBox DataSourceID="lqsProducto" ValueField="ItemCode">
                        <Columns>
                            <dx:ListBoxColumn Caption="Cod.Producto" FieldName="ItemCode" Width="150px">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Producto" FieldName="ItemName" Width="250px">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Proveedor" ShowInCustomizationForm="True" VisibleIndex="6">
                    <PropertiesComboBox DataSourceID="lqsProveedor" ValueField="CardCode">
                        <Columns>
                            <dx:ListBoxColumn Caption="Cod.Proveedor" FieldName="CardCode">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Proveedor" FieldName="CardName">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsRegistroCamCruzados" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_RegEstadoCamionesCruzados">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="lqsProducto" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" Select="new (ItemCode, ItemName)" TableName="OITM">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="lqsProveedor" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" Select="new (CardCode, CardName)" TableName="OCRD">
        </asp:LinqDataSource>
    </div>
</asp:Content>
