<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SMMAcuerdo_Comercial_Detalle.aspx.cs" Inherits="CVT_MermasRecepcion.MayoristaOP.SMMAcuerdo_Comercial_Detalle" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 15px;
        }
        .auto-style6 {
            width: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>WMS</a></li>
            <li><span id="current">SMM Detalle Acuerdo Comercial</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">SMM Detalle Acuerdo Comercial</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDetalleAcuerdoComercial" KeyFieldName="Id_detAcuerdoComercial" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsPager PageSize="50">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings AutoFilterCondition="Contains" ShowFilterRow="True" />
            <SettingsBehavior ConfirmDelete="True" />
            <ClientSideEvents ToolbarItemClick="function(s, e) {
	if (e.item.name == &quot;Nuevo&quot;) e.processOnServer = true; e.usePostBack=true;

}" />
            <Toolbars>
                <dx:GridViewToolbar  Position="Top">
                    <Items>
                        <dx:GridViewToolbarItem Command="Custom" Name="Nuevo" Text="Nuevo" Image-Url="../../Images/pn-add-source-copy.gif" >
<Image Url="../../Images/pn-add-source-copy.gif"></Image>
                        </dx:GridViewToolbarItem>
                        <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXls" />
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                <dx:GridViewToolbarItem Command="ExportToCsv" />
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

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id_detAcuerdoComercial" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Id_AcuerdoComercial" Visible="False" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Sell_Int" VisibleIndex="6">
                    <PropertiesTextEdit ConvertEmptyStringToNull="False">
                        <ValidationSettings Display="Dynamic">
                            <RegularExpression ErrorText="Agrege Coma Decimal ','" ValidationExpression="^[0-9]\d*(,\d+)?$" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Sell_Out" VisibleIndex="7">
                    <PropertiesTextEdit ConvertEmptyStringToNull="False">
                        <ValidationSettings Display="Dynamic">
                            <RegularExpression ErrorText="Agrege Coma Decimal ','" ValidationExpression="^[0-9]\d*(,\d+)?$" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Rapel" VisibleIndex="8">
                    <PropertiesTextEdit ConvertEmptyStringToNull="False">
                        <ValidationSettings Display="Dynamic">
                            <RegularExpression ErrorText="Agrege Coma Decimal ','" ValidationExpression="^[0-9]\d*(,\d+)?$" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Merma" VisibleIndex="9">
                    <PropertiesTextEdit ConvertEmptyStringToNull="False">
                        <ValidationSettings Display="Dynamic">
                            <RegularExpression ErrorText="Agrege Coma Decimal ','" ValidationExpression="^[0-9]\d*(,\d+)?$" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Retiro" VisibleIndex="10">
                    <PropertiesTextEdit ConvertEmptyStringToNull="False">
                        <ValidationSettings Display="Dynamic">
                            <RegularExpression ErrorText="Agrege Coma Decimal ','" ValidationExpression="^[0-9]\d*(,\d+)?$" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Centralizado" VisibleIndex="11">
                    <PropertiesTextEdit ConvertEmptyStringToNull="False">
                        <ValidationSettings Display="Dynamic">
                            <RegularExpression ErrorText="Agrege Coma Decimal ','" ValidationExpression="^[0-9]\d*(,\d+)?$" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ProntoPago" VisibleIndex="12">
                    <PropertiesTextEdit ConvertEmptyStringToNull="False">
                        <ValidationSettings Display="Dynamic">
                            <RegularExpression ErrorText="Agrege Coma Decimal ','" ValidationExpression="^[0-9]\d*(,\d+)?$" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Total_Acuerdo" VisibleIndex="14">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="CodProducto" VisibleIndex="5">
                    <PropertiesComboBox DataSourceID="LqsProducto" ValueField="ItemCode">
                        <Columns>
                            <dx:ListBoxColumn Caption="Cod Producto" FieldName="ItemCode">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Producto" FieldName="ItemName" Width="350px">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataDateColumn Caption="Fecha Inicio" FieldName="FechDesde" VisibleIndex="3">
                    <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy">
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn Caption="Fecha Termino" FieldName="FechHasta" VisibleIndex="4">
                    <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy">
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="AporteFijo" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDetalleAcuerdoComercial" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Acuerdo_Comercial_Detalle" Where="Id_AcuerdoComercial == @Id_AcuerdoComercial" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="Id_AcuerdoComercial" SessionField="idAcuerdo" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsProducto" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTMMETRODataContext" EntityTypeName="" TableName="MMetro_OITM" Where="CardCode == @CardCode">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="CardCode" SessionField="CodPro" Type="String" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>

    <br />
    <div>
        <dx:ASPxPopupControl ID="PopDetNuevo" runat="server" AllowDragging="True" CloseAction="CloseButton" HeaderText="Nuevo" Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle" Width="450px">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <br />
                    <div>
                        <div style="margin-left: 30px">
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Producto" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboProducto" runat="server" ValueType="System.String" DataSourceID="LqsProducto" ValueField="ItemCode" Height="30px" Width="450px">
                                            <Columns>
                                                <dx:ListBoxColumn Caption="CodProducto" FieldName="ItemCode">
                                                </dx:ListBoxColumn>
                                                <dx:ListBoxColumn Caption="Prodcuto" FieldName="ItemName" Width="350px">
                                                </dx:ListBoxColumn>
                                            </Columns>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style6"></td>        
                                    </tr>
                            </table>
                        </div>
                        <br />
                        <div  style="margin-left: 30px">
                            <table>
                                <tr>
                                     <td>
                                        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Sell int" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtSellInt" runat="server" Width="70px" Height="25px" MaxLength="10">
                                            <ValidationSettings Display="Dynamic">
                                                <RegularExpression ErrorText="Agrege Coma Decimal ','" ValidationExpression="^[0-9]\d*(,\d+)?$" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>

                                    </td>
                                    <td class="auto-style5"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Sell Out" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtShellOut" runat="server" Width="70px" Height="25px" MaxLength="10">
                                             <ValidationSettings Display="Dynamic">
                                                <RegularExpression ErrorText="Agrege Coma Decimal ','" ValidationExpression="^[0-9]\d*(,\d+)?$" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Rapel" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtRapel" runat="server" Width="70px" Height="25px" MaxLength="10">
                                           <ValidationSettings Display="Dynamic">
                                                <RegularExpression ErrorText="Agrege Coma Decimal ','" ValidationExpression="^[0-9]\d*(,\d+)?$" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                     <td class="auto-style5"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Aporte Fijo" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtAporteFijo" runat="server" Width="130px" Height="25px" MaxLength="10">
                                          
                                            <ValidationSettings Display="Dynamic">
                                                <RegularExpression ValidationExpression="\d+" />
                                            </ValidationSettings>
                                          
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>                           
                            </table>
                        </div>
                        <br />
                        <div style="margin-left: 30px">
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Merma" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtMerma" runat="server" Width="70px" Height="25px" MaxLength="10">
                                           <ValidationSettings Display="Dynamic">
                                                <RegularExpression ErrorText="Agrege Coma Decimal ','" ValidationExpression="^[0-9]\d*(,\d+)?$" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Retiro" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtRetiro" runat="server" Width="70px" Height="25px" MaxLength="10">
                                             <ValidationSettings Display="Dynamic">
                                                <RegularExpression ErrorText="Agrege Coma Decimal ','" ValidationExpression="^[0-9]\d*(,\d+)?$" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Centralizado" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtCentralizado" runat="server" Width="70px" Height="25px" MaxLength="10">
                                          <ValidationSettings Display="Dynamic">
                                                <RegularExpression ErrorText="Agrege Coma Decimal ','" ValidationExpression="^[0-9]\d*(,\d+)?$" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="auto-style6"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Pronto Pago" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtProntoPago" runat="server" Width="70px" Height="25px" MaxLength="10">
                                            <ValidationSettings Display="Dynamic">
                                                <RegularExpression ErrorText="Agrege Coma Decimal ','" ValidationExpression="^[0-9]\d*(,\d+)?$" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <div  style="margin-left: 30px">
                            <table>
                                <tr>
                                    <td>
                                         <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Fecha Inicio" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                        <dx:ASPxDateEdit ID="dteInicio" runat="server" Height="30px"></dx:ASPxDateEdit>
                                    </td>
                                    <td class="auto-style6"></td>
                                    <td>
                                         <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Fecha Termino" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                        <dx:ASPxDateEdit ID="dteTermino" runat="server" Height="30px"></dx:ASPxDateEdit>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <br />                   
                        <br />
                        <div style="margin-left: 150px">
                            <dx:ASPxButton ID="btnGuardar" runat="server" Text="Guardar"  Theme="iOS" OnClick="btnGuardar_Click" Width="155px" Height="37px"></dx:ASPxButton>
                        </div>
                    </div>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
</asp:Content>
