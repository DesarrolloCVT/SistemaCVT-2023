<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="RegistroSaturacionPatronAntiguo.aspx.cs" Inherits="CVT_MermasRecepcion.Calidad.Inspecciones.RegistroSaturacionPatronAntiguo" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Calidad</a></li>
            <li><span id="current">Registro Saturacion Patrones(Detector Antiguo)</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Registro Saturacion Patrones(Detector Antiguo)</span>
        <span class="tab-end"></span>
       <%-- <div id="options">
             <a>
                <asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" />
                Exportar Excel</a>
            <a>
                <asp:ImageButton ID="cmdNew" runat="server" ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="width: 16px; height: 16px;" />Nuevo</a>
        </div>--%>
    </div>
    <br />
    <br />
    <div>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Fecha"></asp:Label>
                </td>
                <td>
                    <dx:ASPxDateEdit ID="dteFecha" runat="server">
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxDateEdit>
                </td>
                <td>
                    <dx:ASPxButton ID="btnFiltrar" runat="server" Text="Filtrar" OnClick="btnFiltrar_Click"></dx:ASPxButton>
                </td>
                <td>&nbsp;  &nbsp;  &nbsp;
                </td>
                <td>
                    <dx:ASPxButton ID="btnGenerainforme" runat="server" Text="Generar informe" OnClick="btnGenerainforme_Click" Style="height: 23px"></dx:ASPxButton>
                </td>
            </tr>
        </table>

    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsSaturacionAntiguo" KeyFieldName="Id_SaturacionPatronesAntiguo" OnToolbarItemClick="GvDatos_ToolbarItemClick" OnRowDeleting="GvDatos_RowDeleting" OnRowUpdating="GvDatos_RowUpdating">
            <ClientSideEvents ToolbarItemClick="function(s, e) {
	if (e.item.name == &quot;Nuevo&quot;) e.processOnServer = true; e.usePostBack=true;
 

}" />
            <Toolbars>
                <dx:GridViewToolbar>
                    <Items>
                        <dx:GridViewToolbarItem Command="Custom" Name="Nuevo" Text="Nuevo" Image-Url="../../Images/pn-add-source-copy.gif" >
<Image Url="../../Images/pn-add-source-copy.gif"></Image>
                        </dx:GridViewToolbarItem>
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
       
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsBehavior ConfirmDelete="True" />
            <SettingsPopup>
                <EditForm Width="700px">
                    <SettingsAdaptivity MaxWidth="900px" MinWidth="700px" />
                </EditForm>

<FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <SettingsText ConfirmDelete="Solo usuarios verificadores pueden eliminar registros " />
            <Columns>
                <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0" ShowDeleteButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id_SaturacionPatronesAntiguo" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaRegistro" VisibleIndex="3">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn Caption="Cant.Veces Pasadas" FieldName="Pasadas" VisibleIndex="6">
                    <PropertiesTextEdit HelpText="Cantidad de veces pasados los patrones en forma seguida">
                        <HelpTextSettings DisplayMode="Popup">
                        </HelpTextSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="HoraRegistro" VisibleIndex="4">
                    <PropertiesTextEdit DisplayFormatString="t">
                        <MaskSettings Mask="HH:mm" />
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Encargado" FieldName="IdUsuario" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="Usuario" TextField="NombreUsuario" ValueField="IdUsuario">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Producto" FieldName="ItemCode" VisibleIndex="5">
                    <PropertiesComboBox DataSourceID="LqsProducto" TextField="ItemName" ValueField="ItemCode">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Detecta FE1.5mm " FieldName="FE15mm" VisibleIndex="7">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Detecta NO FE2.5mm " FieldName="NoFE25mm" VisibleIndex="8">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Detecta Acero Inoxidable2.5mm " FieldName="DetectaAcero" VisibleIndex="9">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Se enciende la baliza" FieldName="Enciendebaliza" VisibleIndex="10">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="SuenaBaliza" VisibleIndex="11">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Funciona brazo de rechazo" FieldName="FuncionaBrazo" VisibleIndex="12">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataDateColumn FieldName="Fecha_ingresoRegistro" Visible="False" VisibleIndex="13">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Observacion" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsSaturacionAntiguo" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_RegistroSaturacionPatronesAntiguo" Where="FechaRegistro == @FechaRegistro">
            <WhereParameters>
                <asp:ControlParameter ControlID="dteFecha" DefaultValue="01/01/1990" Name="FechaRegistro" PropertyName="Value" Type="DateTime" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="Usuario" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Usuarios">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsProducto" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" TableName="CVT_VW_PRODUCTOSPATRONTESTIGO">
        </asp:LinqDataSource>
    </div>
    <br />
    <div>
        <dx:ASPxPopupControl ID="popSaturacionPatronesAntiguo" runat="server" Width="500px" AllowDragging="True" CloseAction="CloseButton" HeaderText="Nuevo" Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <br />
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Producto" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboProducto" runat="server" ValueType="System.String" DataSourceID="LqsProducto0" TextField="ItemName" ValueField="ItemCode">
                                        <ValidationSettings Display="Dynamic" ValidationGroup="a1">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </td>
                                <td class="auto-style5"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxDateEdit ID="dtefechareg" runat="server">
                                        <ValidationSettings Display="Dynamic" ValidationGroup="a1">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxDateEdit>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Hora" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtHora" runat="server" Width="70px">
                                        <MaskSettings Mask="HH:mm" />
                                        <ValidationSettings Display="Dynamic" ValidationGroup="a1">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="auto-style5"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Cant.Veces Pasadas" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtCantVesPasada" runat="server" Width="70px">
                                        <ValidationSettings Display="Dynamic" ValidationGroup="a1">
                                            <RegularExpression ErrorText="solo numeros" ValidationExpression="\d+" />
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
                                <td class="auto-style6">
                                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Detecta FE1.5mm" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboFE15mm" runat="server" ValueType="System.String" SelectedIndex="0" Width="50px">
                                        <Items>
                                            <dx:ListEditItem Selected="True" Text="SI" Value="1" />
                                            <dx:ListEditItem Text="NO" Value="2" />
                                        </Items>
                                    </dx:ASPxComboBox>
                                </td>
                                <td class="auto-style5"></td>
                                <td class="auto-style8">
                                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Detecta NO FE2.5mm" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboNOFE25mm" runat="server" ValueType="System.String" SelectedIndex="0" Width="50px">
                                        <Items>
                                            <dx:ListEditItem Selected="True" Text="SI" Value="1" />
                                            <dx:ListEditItem Text="NO" Value="2" />
                                        </Items>
                                    </dx:ASPxComboBox>
                                </td>
                                <td class="auto-style5"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Detecta Acero Inoxidable 2.5mm" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboAcero" runat="server" ValueType="System.String" SelectedIndex="0" Width="50px">
                                        <Items>
                                            <dx:ListEditItem Selected="True" Text="SI" Value="1" />
                                            <dx:ListEditItem Text="NO" Value="2" />
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
                                <td class="auto-style7">
                                    <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Enciende Baliza" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboEnciendeBaliza" runat="server" ValueType="System.String" SelectedIndex="0" Width="50px">
                                        <Items>
                                            <dx:ListEditItem Selected="True" Text="SI" Value="1" />
                                            <dx:ListEditItem Text="NO" Value="2" />
                                        </Items>
                                    </dx:ASPxComboBox>
                                </td>
                                <td class="auto-style5"></td>
                                <td class="auto-style11">
                                    <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Suena Baliza" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboSuenaBaliza" runat="server" ValueType="System.String" SelectedIndex="0" Width="50px">
                                        <Items>
                                            <dx:ListEditItem Selected="True" Text="SI" Value="1" />
                                            <dx:ListEditItem Text="NO" Value="2" />
                                        </Items>
                                    </dx:ASPxComboBox>
                                </td>
                                <td class="auto-style9"></td>
                                <td class="auto-style10">
                                    <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Funciona brazo de rechazo" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboFuncBrazo" runat="server" ValueType="System.String" SelectedIndex="0" Width="50px">
                                        <Items>
                                            <dx:ListEditItem Selected="True" Text="SI" Value="1" />
                                            <dx:ListEditItem Text="NO" Value="2" />
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
                                    <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Observacion" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtObservacion" runat="server" Width="170px" Height="25px"></dx:ASPxTextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div>
                        <dx:ASPxButton ID="btnAgregar" runat="server" Text="Guardar" OnClick="btnAgregar_Click" Theme="iOS" ValidationGroup="a1" Style="height: 28px"></dx:ASPxButton>
                    </div>
                    <asp:LinqDataSource ID="LqsProducto0" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" TableName="CVT_VW_PRODUCTOSPATRONTESTIGO">
                    </asp:LinqDataSource>
                    <br />

                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
</asp:Content>
