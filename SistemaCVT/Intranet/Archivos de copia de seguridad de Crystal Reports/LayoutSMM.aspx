<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="LayoutSMM.aspx.cs" Inherits="CVT_MermasRecepcion.Mantenedores.LayoutSMM" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Sistema</a></li>
            <li><a href="Sitios.aspx">Sitios</a></li>
            <li><span id="current">Distribucion Sitios</span></li>
        </ul>
    </div>
    <br />
    <div id="tableHeader">
        <span class="tableTitle">Distribucion Sitios</span>
        <span class="tab-end"></span>
        <div id="options">
            <%--    <a>
                <asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" Style="width: 20px" />
                Exportar Excel</a>
            <a>
                <asp:ImageButton ID="cmdNew" runat="server"
                    ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" />
                Nuevo</a>--%>
            <a>
                <asp:ImageButton ID="Atras" runat="server" ImageUrl="~/Images/back.png" OnClick="Atras_Click" Height="25px" Width="26px" />Volver</a>

        </div>
    </div>
    <div>
        <dx:ASPxGridView ID="GvDatosLayout" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDatosLayout" KeyFieldName="Layout_Id" OnRowInserting="GvDatosLayout_RowInserting" OnToolbarItemClick="GvDatosLayout_ToolbarItemClick" OnRowDeleting="GvDatosLayout_RowDeleting" OnRowUpdating="GvDatosLayout_RowUpdating">
            <SettingsPager PageSize="25">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
            <ClientSideEvents ToolbarItemClick="function(s, e) {
	if (e.item.name == &quot;Nuevo&quot;) e.processOnServer = true; e.usePostBack=true;
 

}" />
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
                <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Layout_Id" ReadOnly="True" VisibleIndex="1" Caption="Codigo" ShowInCustomizationForm="True">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Site_Id" VisibleIndex="5" Visible="False" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Layout_Description" VisibleIndex="7" Caption="Descripcion" ShowInCustomizationForm="True">
                    <PropertiesTextEdit>
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Layout_Y_Pasillo" VisibleIndex="2" Caption="Pas." ShowInCustomizationForm="True">
                    <PropertiesTextEdit>
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Layout_X_Fila" VisibleIndex="3" Caption="Fila" ShowInCustomizationForm="True">
                    <PropertiesTextEdit>
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Ub.xDefecto" FieldName="UbicacionxDefecto" VisibleIndex="16">
                    <PropertiesComboBox>
                        <Items>
<dx:ListEditItem Text="SI" Value="Y"></dx:ListEditItem>
<dx:ListEditItem Text="NO" Value="N"></dx:ListEditItem>
</Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="CantidadUbicaciones" VisibleIndex="17" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Column." FieldName="Layout_Z_Columna" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDatosLayout" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="SMM_Layout" Where="Site_Id == @Site_Id">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="Site_Id" SessionField="Site_Id" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsRack" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName="" TableName="SMM_Rack">
        </asp:LinqDataSource>
    </div>

    <dx:ASPxPopupControl ID="PopNuevo" runat="server"
        HeaderText="Nuevo" AllowDragging="True" CloseAction="CloseButton">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <div>
                    <table>
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Pasillo" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                <dx:ASPxTextBox ID="txtPasillo" runat="server" Width="70px" Height="30px">
                                    <ValidationSettings Display="Dynamic">
                                        <RegularExpression ValidationExpression="\d+" />
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td class="auto-style5"></td>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Fila" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                <dx:ASPxTextBox ID="txtFila" runat="server" Width="70px" Height="30px">
                                    <ValidationSettings Display="Dynamic">
                                        <RegularExpression ValidationExpression="\d+" />
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                            <td class="auto-style5"></td>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Columna" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                <dx:ASPxTextBox ID="txtColumna" runat="server" Width="70px" Height="30px">
                                    <ValidationSettings Display="Dynamic">
                                        <RegularExpression ValidationExpression="\d+" />
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
                        <%--    <td>
                                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Tipo Rack" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                <dx:ASPxComboBox ID="cboTipoRack" runat="server" ValueType="System.String" DataSourceID="LqsRack" Height="30px" TextField="Rack_Type" ValueField="Rack_Id" Width="150px">
                                    <ValidationSettings Display="Dynamic">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                            </td>--%>
                            <td class="auto-style5"></td>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Ubi.x Def." Font-Size="Medium" Font-Bold="true" ToolTip="Ubicacion x Defecto"></dx:ASPxLabel>
                                <dx:ASPxComboBox ID="cboUbxDef" runat="server" ValueType="System.String" Height="30px" Width="100px" AutoPostBack="True" OnSelectedIndexChanged="cboUbxDef_SelectedIndexChanged">
                                    <Items>
                                        <dx:ListEditItem Text="SI" Value="Y" />
                                        <dx:ListEditItem Text="NO" Value="N" />
                                    </Items>
                                    <ValidationSettings Display="Dynamic">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                            </td>
                            <td class="auto-style5"></td>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Cant.Ubicaciones" Font-Size="Medium" Font-Bold="true" ToolTip="Ubicacion x Defecto"></dx:ASPxLabel>
                                <dx:ASPxTextBox ID="txtCantUbicaciones" runat="server" Width="100px" Height="30px">
                                    <ValidationSettings Display="Dynamic">
                                        <RegularExpression ValidationExpression="\d+" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                    </table>
                </div>
                <br />
                <div style="margin-left: 50px">
                    <table>
                        <tr>
                            <td>
                                <dx:ASPxButton ID="btnGuardar" runat="server" Text="GUARDAR" Height="40px" Theme="Glass" Width="140px" OnClick="btnGuardar_Click"></dx:ASPxButton>
                            </td>
                            <td class="auto-style5"></td>
                            <td>

                                <dx:ASPxButton ID="btnSalir" runat="server" Text="Salir" Height="40px" Theme="Glass" Width="140px" OnClick="btnSalir_Click" CausesValidation="False"></dx:ASPxButton>
                            </td>
                        </tr>
                    </table>

                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
</asp:Content>
