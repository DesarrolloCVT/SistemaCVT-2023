<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="InspeccionSacos.aspx.cs" Inherits="CVT_MermasRecepcion.Calidad.Inspecciones.InspeccionSacos" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 20px;
        }

        .auto-style6 {
            width: 140px;
        }

        .auto-style7 {
            width: 84px;
        }

        .auto-style9 {
            width: 99px;
        }

        .auto-style10 {
            width: 73px;
        }

        .auto-style11 {
            width: 8px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Calidad</a></li>
            <li><span id="current">Inspeccion Visual Sacos</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Inspeccion Visual Sacos</span>
        <span class="tab-end"></span>
        <div id="options">
            <%-- <a>
                <asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" />
                Exportar Excel</a>--%>
           <%-- <a>
                <asp:ImageButton ID="cmdNew" runat="server" ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>--%>
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
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsSacos" KeyFieldName="Id_InspeccionSacos" Width="1946px" OnToolbarItemClick="GvDatos_ToolbarItemClick" OnRowDeleting="GvDatos_RowDeleting" OnRowInserting="GvDatos_RowInserting" OnRowUpdating="GvDatos_RowUpdating">

            <ClientSideEvents ToolbarItemClick="function(s, e) {
	if (e.item.name == &quot;Nuevo&quot;) e.processOnServer = true; e.usePostBack=true;
 

}" />
            <SettingsPager PageSize="50">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsBehavior ConfirmDelete="True" />
            <SettingsPopup>
                <EditForm MinWidth="800px">
                    <SettingsAdaptivity MaxWidth="900px" MinWidth="800px" SwitchAtWindowInnerWidth="1500" />
                </EditForm>

<FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <Toolbars>
                <dx:GridViewToolbar >
                    <Items>
                        <dx:GridViewToolbarItem Command="Custom" Name="Nuevo" Text="Nuevo" Image-Url="../../Images/pn-add-source-copy.gif" >
<Image Url="../../Images/pn-add-source-copy.gif"></Image>
                        </dx:GridViewToolbarItem>
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
            <SettingsText ConfirmDelete="Solo usuarios verificadores pueden eliminar registros " />
            <Columns>
                <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0" ShowDeleteButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id_InspeccionSacos" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="Fecha" FieldName="Fecha_registro" ShowInCustomizationForm="True" VisibleIndex="2" Width="150px">
                    <PropertiesDateEdit Width="150px">
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn Caption="Lote Materia Prima" FieldName="LoteMP" ShowInCustomizationForm="True" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Lote Producto Terminado" FieldName="LotePT" ShowInCustomizationForm="True" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Humedad" ShowInCustomizationForm="True" VisibleIndex="11" Caption="% Humedad">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Producto" FieldName="ItemCode" ShowInCustomizationForm="True" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="LqsProducto" TextField="ItemName" ValueField="ItemCode">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Materia Extraña Animal" FieldName="MateriaExtranaAnimal" ShowInCustomizationForm="True" VisibleIndex="12">
                    <PropertiesComboBox HelpText="Fecas de ratón o insectos">
                        <Items>

                            <dx:ListEditItem Text="Si" Value="1" />

                            <dx:ListEditItem Text="No" Value="2" />

                        </Items>


                        <HelpTextSettings DisplayMode="Popup">
                        </HelpTextSettings>

                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Materiales Extraños" FieldName="MateriaExtrana" ShowInCustomizationForm="True" VisibleIndex="13">
                    <PropertiesComboBox HelpText="Restos de madera, plástico, metales, piedras, etc">
                        <Items>

                            <dx:ListEditItem Text="Si" Value="1" />

                            <dx:ListEditItem Text="No" Value="2" />

                        </Items>


                        <HelpTextSettings DisplayMode="Popup">
                        </HelpTextSettings>

                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Proveedor" FieldName="CardCode" ShowInCustomizationForm="True" VisibleIndex="7">
                    <PropertiesComboBox DataSourceID="LinqDataSource1" TextField="CardName" ValueField="CardCode">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Usuario" FieldName="IdUsuario" ShowInCustomizationForm="True" VisibleIndex="14">
                    <PropertiesComboBox DataSourceID="Usuario" TextField="NombreUsuario" ValueField="IdUsuario">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="Hora" ShowInCustomizationForm="True" VisibleIndex="4">
                    <PropertiesTextEdit DisplayFormatString="t">

                        <MaskSettings Mask="HH:mm" />

                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="AccionCorrectiva" VisibleIndex="16">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="EstadoSaco" VisibleIndex="5">
                    <PropertiesComboBox>
                        <Items>

                            <dx:ListEditItem Text="OK" Value="1" />

                            <dx:ListEditItem Text="N/A" Value="2" />

                        </Items>

                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataDateColumn FieldName="Fecha_ingresoRegistro" Visible="False" VisibleIndex="17">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Proveedores_Mixtos" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataCheckColumn FieldName="ProvMixto" VisibleIndex="8" Visible="False">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataTextColumn Caption="N° Ac.Correctiva" FieldName="NAccionCorrectiva" VisibleIndex="15">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsSacos" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Inspeccion_Visual_Sacos" EnableDelete="True" EnableInsert="True" EnableUpdate="True" Where="Fecha_registro == @Fecha_registro" OrderBy="Id_InspeccionSacos desc">
            <WhereParameters>
                <asp:ControlParameter ControlID="dteFecha" DefaultValue="01/01/1990" Name="Fecha_registro" PropertyName="Value" Type="DateTime" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsProducto" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" TableName="CVT_VW_PRODUCTOSISPECCIONSACOS">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" TableName="OCRD" Where="CardType == @CardType">
            <WhereParameters>
                <asp:Parameter DefaultValue="S" Name="CardType" Type="Char" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="Usuario" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Usuarios">
        </asp:LinqDataSource>
    </div>
    <br />
    <div>
        <dx:ASPxPopupControl ID="popInspeccionSacos" runat="server" AllowDragging="True" CloseAction="CloseButton" HeaderText="Nuevo" Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle" Width="515px">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <br />
                    <div style="margin-left: 10px">
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxDateEdit ID="dteFechaReg" runat="server" Width="100px">
                                        <ValidationSettings Display="Dynamic" ValidationGroup="a1">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxDateEdit>
                                </td>
                                <td class="auto-style5"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Hora" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtHora" runat="server" Width="70px" Height="25px">
                                        <MaskSettings Mask="HH:mm" />
                                        <ValidationSettings Display="Dynamic" ValidationGroup="a1">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="auto-style5"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Producto" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboProducto" runat="server" ValueType="System.String" DataSourceID="LqsProducto" TextField="ItemName" ValueField="ItemCode" Width="180px">
                                        <ValidationSettings Display="Dynamic" ValidationGroup="a1">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div style="margin-left: 10px">
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Lote Materia Prima" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtLoteMateriaPrima" runat="server" Width="170px" Height="25px">
                                        <ValidationSettings Display="Dynamic" ValidationGroup="a1">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="auto-style5"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Lote Producto Terminado" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtLoteProductoTerminado" runat="server" Width="170px" Height="25px">
                                        <ValidationSettings ValidationGroup="a1">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div style="margin-left: 10px">
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Proveedor mixto" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>

                                </td>
                                <td>
                                    <asp:CheckBox ID="ckProveedorMixto" runat="server" AutoPostBack="True" OnCheckedChanged="ckProveedorMixto_CheckedChanged" /></td>
                                <td></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Proveedor" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboProveedor" runat="server" ValueType="System.String" DataSourceID="LinqDataSource1" TextField="CardName" ValueField="CardCode" OnSelectedIndexChanged="cboProveedor_SelectedIndexChanged" AutoPostBack="True"></dx:ASPxComboBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div style="margin-left: 10px">
                        <dx:ASPxMemo ID="memoprov" runat="server" Height="55px" Width="433px">
                        </dx:ASPxMemo>
                    </div>
                    <br />
                    <div style="margin-left: 10px">
                        <table>
                            <tr>
                                <td class="auto-style10">
                                    <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Estado Saco" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboEstadoSaco" runat="server" ValueType="System.String" Width="60px">
                                        <Items>
                                            <dx:ListEditItem Text="OK" Value="1" />
                                            <dx:ListEditItem Text="N/A" Value="2" />
                                        </Items>
                                        <ValidationSettings Display="Dynamic" ValidationGroup="a1">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </td>
                                <td class="auto-style5"></td>
                                <td class="auto-style7">
                                    <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="% Humedad" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtPorcHumedad" runat="server" Width="70px" Height="25px" Text="0,0">
                                        <ValidationSettings Display="Dynamic" ValidationGroup="a1">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="auto-style5"></td>
                                <td class="auto-style6">
                                    <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Materia Extraña Animal" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboMatExtranaAnimal" runat="server" ValueType="System.String" HelpText="Fecas de ratón o insectos" Width="70px" SelectedIndex="1">
                                        <Items>
                                            <dx:ListEditItem Text="SI" Value="1" />
                                            <dx:ListEditItem Text="NO" Value="2" Selected="True" />
                                        </Items>
                                        <HelpTextSettings DisplayMode="Popup">
                                        </HelpTextSettings>
                                        <ValidationSettings Display="Dynamic" ValidationGroup="a1">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </td>
                                <td class="auto-style11"></td>
                                <td class="auto-style9">
                                    <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Materiales Extraños" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboMaterialesExtranos" runat="server" ValueType="System.String" HelpText="Restos de madera,plásticos,metales,piedras,etc." Width="70px" SelectedIndex="1">
                                        <Items>
                                            <dx:ListEditItem Text="SI" Value="1" />
                                            <dx:ListEditItem Text="NO" Value="2" Selected="True" />
                                        </Items>
                                        <HelpTextSettings DisplayMode="Popup">
                                        </HelpTextSettings>
                                        <ValidationSettings Display="Dynamic" ValidationGroup="a1">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div style="margin-left: 10px">
                        <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Accion Correctiva" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                        <dx:ASPxMemo ID="memoAccionCorrectiva" runat="server" Height="33px" Width="301px"></dx:ASPxMemo>
                    </div>
                    <br />
                    <div style="margin-left: 10px">
                        <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="N° Accion Correctiva" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                        <dx:ASPxTextBox ID="txtNAccionCorrectiva" runat="server" Width="100px" Height="30px">
                            <ValidationSettings Display="Dynamic">
                                <RegularExpression ValidationExpression="\d+" ErrorText="Solo numeros" />
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                    </div>
                    <br />
                    <div style="margin-left: 50px">
                        <dx:ASPxButton ID="BtnGuardar" runat="server" Text="Guardar" Theme="iOS" OnClick="BtnGuardar_Click" ValidationGroup="a1" Style="height: 28px"></dx:ASPxButton>
                    </div>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
</asp:Content>
