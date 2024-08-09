<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="MonitoreoDetectorMetalesUno.aspx.cs" Inherits="CVT_MermasRecepcion.Calidad.Inspecciones.MonitoreoDetectorMetalesUno" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 20px;
        }

        .auto-style6 {
            width: 113px;
        }

        .auto-style7 {
            width: 92px;
        }

        .auto-style8 {
            width: 32px;
        }

        .auto-style9 {
            width: 80px;
        }

        .auto-style10 {
            width: 51px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Calidad</a></li>
            <li><span id="current">Monitoreo Detector de Metales 1</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Monitoreo Detector de Metales 1</span>
        <span class="tab-end"></span>
        <div id="options">
            <%-- <a>
                <asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" />
                Exportar Excel</a>--%>
         <%--   <a>
                <asp:ImageButton ID="cmdNew" runat="server" ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="width: 16px; height: 16px;" />Nuevo</a>--%>
        </div>
    </div>
    <br />
    <div>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Fecha"></asp:Label>
                </td>
                <td>
                    <dx:ASPxDateEdit ID="dteFecha" runat="server">
                        <ValidationSettings Display="Dynamic">
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
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDetectorMetalesUno" KeyFieldName="Id_MonitoreoMetales" Width="353px" OnToolbarItemClick="GvDatos_ToolbarItemClick" OnRowDeleting="GvDatos_RowDeleting" OnRowUpdating="GvDatos_RowUpdating">
            <ClientSideEvents ToolbarItemClick="function(s, e) {
	if (e.item.name == &quot;Nuevo&quot;) e.processOnServer = true; e.usePostBack=true;
 

}" />
            <SettingsPager PageSize="50">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsBehavior ConfirmDelete="True" />
            <SettingsPopup>
                <EditForm MinWidth="900px">
                    <SettingsAdaptivity MaxWidth="900px" MinWidth="900px" SwitchAtWindowInnerWidth="1500" />
                </EditForm>

<FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <Toolbars>
                <dx:GridViewToolbar>
                    <Items>
                        <dx:GridViewToolbarItem Command="Custom" Name="Nuevo" Text="Nuevo" Image-Url="../../Images/pn-add-source-copy.gif" >
<Image Url="../../Images/pn-add-source-copy.gif"></Image>
                        </dx:GridViewToolbarItem>
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
            <SettingsText ConfirmDelete="Solo usuarios verificadores pueden eliminar registros " />
            <Columns>
                <dx:GridViewCommandColumn ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="0" ShowDeleteButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id_MonitoreoMetales" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False"></EditFormSettings>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Producto" ShowInCustomizationForm="True" VisibleIndex="5" Width="150px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaMonitoreo" ShowInCustomizationForm="True" VisibleIndex="3">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="HoraMonitoreo" VisibleIndex="4">
                    <PropertiesTextEdit DisplayFormatString="t">
                        <MaskSettings Mask="HH:mm" />
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Detecta FE 1.5mm" FieldName="FE15mm" VisibleIndex="6">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Detecta NO FE 2.5 mm" FieldName="NoFE25mm" VisibleIndex="7">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Detecta Acero Inoxidable 2.5 mm " FieldName="AceroInox25mm" VisibleIndex="8">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="EnciendeBaliza" VisibleIndex="9">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="SuenaBaliza" VisibleIndex="10">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Funciona brazo de rechazo" FieldName="Brazo_de_rechazo" VisibleIndex="11">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="SI" Value="1" />
                            <dx:ListEditItem Text="NO" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Responsable" FieldName="IdUsuario" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="Usuario" TextField="NombreUsuario" ValueField="IdUsuario">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataDateColumn FieldName="Fecha_ingresoRegistro" Visible="False" VisibleIndex="12">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Observacion" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDetectorMetalesUno" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_MonitoreoDetectorMetalesUno" Where="FechaMonitoreo == @FechaMonitoreo">
            <WhereParameters>
                <asp:ControlParameter ControlID="dteFecha" DefaultValue="01/01/1999" Name="FechaMonitoreo" PropertyName="Value" Type="DateTime" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="Usuario" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Usuarios">
        </asp:LinqDataSource>
    </div>
    <br />
    <div>
        <dx:ASPxPopupControl ID="popMonitoreoDetectorMetales1" runat="server" AllowDragging="True" CloseAction="CloseButton" HeaderText="Nuevo" Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle" Width="500px">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <br />
                    <div>
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                        <dx:ASPxDateEdit ID="dteFechaMoni" runat="server" Width="100px"></dx:ASPxDateEdit>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Hora" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtHora" runat="server" Width="80px">
                                            <MaskSettings Mask="HH:mm" />
                                            <ValidationSettings Display="Dynamic" ValidationGroup="a1">
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Producto" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtProducto" runat="server" Width="170px">
                                            <ValidationSettings Display="Dynamic" ValidationGroup="a1">
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
                                        <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Detecta FE 1.5mm" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboFE15mm" runat="server" ValueType="System.String" SelectedIndex="0" Width="80px">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="SI" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td></td>
                                    <td class="auto-style6">
                                        <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Detecta NO FE 2.5 mm" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboFE25mm" runat="server" ValueType="System.String" SelectedIndex="0" Width="80px">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="SI" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Detecta Acero Inoxidable 2.5 mm" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboAcero25mm" runat="server" ValueType="System.String" SelectedIndex="0" Width="80px">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="SI" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td></td>

                                </tr>
                            </table>
                        </div>
                        <br />
                        <div>
                            <table>
                                <tr>
                                    <td class="auto-style7">
                                        <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Enciende Baliza" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboBaliza" runat="server" ValueType="System.String" SelectedIndex="0" Width="80px">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="SI" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style8"></td>
                                    <td class="auto-style9">
                                        <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Suena Baliza" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboSuenaBaliza" runat="server" ValueType="System.String" SelectedIndex="0" Width="80px">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="SI" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style10"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Funciona brazo de rechazo" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboBrazoRechazo" runat="server" ValueType="System.String" SelectedIndex="0" Width="80px">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="SI" Value="1" />
                                                <dx:ListEditItem Text="NO" Value="2" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td></td>

                                </tr>
                            </table>
                        </div>
                        <br />
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Observacion" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>

                                        <dx:ASPxTextBox ID="txtObservacion" runat="server" Width="170px" Height="25px"></dx:ASPxTextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <div>
                            <dx:ASPxButton ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" Theme="iOS" ValidationGroup="a1"></dx:ASPxButton>
                        </div>
                    </div>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
</asp:Content>
