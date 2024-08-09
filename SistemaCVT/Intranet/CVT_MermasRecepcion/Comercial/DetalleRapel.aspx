<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="DetalleRapel.aspx.cs" Inherits="CVT_MermasRecepcion.Comercial.DetalleRapel" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style6 {
            width: 15px;
        }

        .auto-style7 {
            width: 266px;
        }

        .auto-style8 {
            width: 10px;
        }

        .auto-style9 {
            width: 12px;
        }

        .auto-style10 {
            width: 20px;
        }

        .auto-style11 {
            width: 19px;
        }

        .auto-style12 {
            width: 25px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Comercial</a></li>
            <li><span id="current">Detalle Rapel</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Detalle Rapel</span>
        <span class="tab-end"></span>
        <%--        <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click1"
                    Style="height: 20px;" />
                Exportar Excel</a>&nbsp;

        </div>--%>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDetRapel" KeyFieldName="CardCode;Address;ItemCode" OnToolbarItemClick="GvDatos_ToolbarItemClick" OnRowDeleting="GvDatos_RowDeleting" OnRowUpdated="GvDatos_RowUpdated">
            <SettingsPager PageSize="100">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />

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
                <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowInCustomizationForm="True" VisibleIndex="0" ShowDeleteButton="True" ShowEditButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="PastaColiseo" ShowInCustomizationForm="True" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="4% LA_Coliseo_CM" FieldName="LA_Coliseo_CM" ShowInCustomizationForm="True" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="4% LA_Coliseo_W(Aceite Arroz)" FieldName="LA_Coliseo_W" ShowInCustomizationForm="True" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="3 % LA_MMPP_W" FieldName="LA_MMPP_W" ShowInCustomizationForm="True" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Centralizacion" ShowInCustomizationForm="True" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Merma" ShowInCustomizationForm="True" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Distrib_Cent_MMPP" ShowInCustomizationForm="True" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Distrib_Cent_Resto_Surtido" FieldName="Distrib_Cent_Rest_Surtido" ShowInCustomizationForm="True" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Extranet_Resto_Surtido" FieldName="Extranet_Rest_Surtido" ShowInCustomizationForm="True" VisibleIndex="15">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Rebate_Fijo" ShowInCustomizationForm="True" VisibleIndex="16">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Reposicion_Int_SellOut" ShowInCustomizationForm="True" VisibleIndex="17">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NoDevolucion" ShowInCustomizationForm="True" VisibleIndex="18">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PEL" ShowInCustomizationForm="True" VisibleIndex="19">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CobroFianza" ShowInCustomizationForm="True" VisibleIndex="20">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalRapel" ShowInCustomizationForm="True" VisibleIndex="21">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Datos de Cliente                                                                                                                                " FieldName="CardCode" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" MaxWidth="300" Width="300px">
                    <PropertiesComboBox DataSourceID="LqsCodCliente" ValueField="CardCode">
                        <Columns>
                            <dx:ListBoxColumn Caption="Cod.Cliente" FieldName="CardCode" Width="250px">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Cliente" FieldName="CardName" Width="450px">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Direccion" FieldName="Address" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="LqsDireccion" TextField="Address" ValueField="Address">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Cod.Producto" FieldName="ItemCode" ReadOnly="True" VisibleIndex="4">
                    <PropertiesComboBox DataSourceID="LqsCodProducto" ValueField="ItemCode">
                        <Columns>
                            <dx:ListBoxColumn Caption="Cod.Producto" FieldName="ItemCode" Width="250px">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Producto" FieldName="ItemName" Width="450px">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataDateColumn FieldName="FechaInicio" VisibleIndex="1">
                    <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy">
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="FechaTermino" VisibleIndex="6">
                    <PropertiesDateEdit DisplayFormatString="">
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataComboBoxColumn FieldName="FamiliaProducto" VisibleIndex="5">
                    <PropertiesComboBox DataSourceID="FamProd" TextField="ItmsGrpNam" ValueField="ItmsGrpCod">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
            <SettingsPopup>
                <EditForm Width="950px">
                </EditForm>
                <CustomizationWindow Width="950px" />

<FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDetRapel" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Porcentaje_Rapel" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsCodCliente" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" Select="new (CardName, CardCode)" TableName="OCRD">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsCodProducto" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" Select="new (ItemCode, ItemName)" TableName="OITM">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsDireccion" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" Select="new (Address)" TableName="CRD1" Where="AdresType == @AdresType">
            <WhereParameters>
                <asp:Parameter DefaultValue="S" Name="AdresType" Type="Char" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="FamProd" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" Select="new (ItmsGrpCod, ItmsGrpNam)" TableName="OITB">
        </asp:LinqDataSource>
    </div>
    <div>
        <dx:ASPxPopupControl ID="popNuevo" runat="server" AllowDragging="True" CloseAction="None" HeaderText="Nuevo" Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle" Width="950px" Theme="iOS">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <br />
                    <br />
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Cliente" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboCliente" runat="server" ValueType="System.String" DataSourceID="LqsCodCliente2" AutoPostBack="True" Height="25px" OnSelectedIndexChanged="cboCliente_SelectedIndexChanged" ValueField="CardCode" Width="300px">
                                        <Columns>
                                            <dx:ListBoxColumn Caption="Cod.Cliente" FieldName="CardCode" Width="200px">
                                            </dx:ListBoxColumn>
                                            <dx:ListBoxColumn Caption="Nombre" FieldName="CardName" Width="350px">
                                            </dx:ListBoxColumn>
                                        </Columns>
                                        <ClearButton DisplayMode="OnHover">
                                        </ClearButton>
                                        <ValidationSettings Display="Dynamic">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </td>
                                <td class="auto-style6"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Direccion" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboDireccion" runat="server" ValueType="System.String" DataSourceID="LqsDireccion2" Height="25px" ValueField="Address" Width="290px">
                                        <Columns>
                                            <dx:ListBoxColumn Caption="Ubicacion" FieldName="Address">
                                            </dx:ListBoxColumn>
                                            <dx:ListBoxColumn Caption="Direccion" FieldName="Street">
                                            </dx:ListBoxColumn>
                                        </Columns>
                                        <ClearButton DisplayMode="OnHover">
                                        </ClearButton>
                                        <ValidationSettings Display="Dynamic">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </td>
                                <td class="auto-style6"></td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <br />
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Producto" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboProducto" runat="server" ValueType="System.String" DataSourceID="LqsCodProducto2" Height="25px" ValueField="ItemCode" Width="272px">
                                        <Columns>
                                            <dx:ListBoxColumn Caption="Cod.Producto" FieldName="ItemCode" Width="200px">
                                            </dx:ListBoxColumn>
                                            <dx:ListBoxColumn Caption="Producto" FieldName="ItemName" Width="250px">
                                            </dx:ListBoxColumn>
                                        </Columns>
                                        <ClearButton DisplayMode="OnHover">
                                        </ClearButton>
                                        <ValidationSettings Display="Dynamic">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </td>
                                <td class="auto-style6"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel18" runat="server" Text="Fecha de Inicio" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxDateEdit ID="dteFechaInicio" runat="server">
                                        <ValidationSettings Display="Dynamic">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxDateEdit>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <br />
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Pasta Coliseo" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtPastaColiseo" runat="server" Width="150px" Height="25px">
                                        <ValidationSettings Display="Dynamic">
                                            <RegularExpression ValidationExpression="^[0-9]\d*(,\d+)?$" ErrorText="Decimal debe ser con &quot; , &quot;" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="auto-style6"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="4% LA_Coliseo_CM" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txt4laColiseo" runat="server" Width="150px" Height="25px">
                                        <ValidationSettings Display="Dynamic">
                                            <RegularExpression ErrorText="Decimal debe ser con &quot; , &quot;" ValidationExpression="^[0-9]\d*(,\d+)?$" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="auto-style6"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="3% LA_MMPP_W" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txt3LA_MMPP" runat="server" Width="150px" Height="25px">
                                        <ValidationSettings Display="Dynamic">
                                            <RegularExpression ErrorText="Decimal debe ser con &quot; , &quot;" ValidationExpression="^[0-9]\d*(,\d+)?$" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="auto-style6"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Centralización" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtCentralizacion" runat="server" Width="150px" Height="25px">
                                        <ValidationSettings Display="Dynamic">
                                            <RegularExpression ErrorText="Decimal debe ser con &quot; , &quot;" ValidationExpression="^[0-9]\d*(,\d+)?$" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="auto-style8"></td>
                                <td class="auto-style7">
                                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="4% LA_Coliseo_W(Aceite Arroz)" Font-Size="medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txt4LA_Coliseo_W" runat="server" Width="150px" Height="25px">
                                        <ValidationSettings Display="Dynamic">
                                            <RegularExpression ErrorText="Decimal debe ser con &quot; , &quot;" ValidationExpression="^[0-9]\d*(,\d+)?$" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <br />
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Merma" Font-Size="medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtMerma" runat="server" Width="150px" Height="25px">
                                        <ValidationSettings Display="Dynamic">
                                            <RegularExpression ErrorText="Decimal debe ser con &quot; , &quot;" ValidationExpression="^[0-9]\d*(,\d+)?$" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="auto-style9"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Distri.Cent.MMPP" Font-Size="medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtDisCentMMPP" runat="server" Width="150px" Height="25px">
                                        <ValidationSettings Display="Dynamic">
                                            <RegularExpression ErrorText="Decimal debe ser con &quot; , &quot;" ValidationExpression="^[0-9]\d*(,\d+)?$" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="auto-style6"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Distri.Cent.Resto Surtido" Font-Size="medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtDisCentResSurtido" runat="server" Width="150px" Height="25px">
                                        <ValidationSettings Display="Dynamic">
                                            <RegularExpression ErrorText="Decimal debe ser con &quot; , &quot;" ValidationExpression="^[0-9]\d*(,\d+)?$" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="auto-style10"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Extranet.Resto Surtido" Font-Size="medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtExtranetResSurtido" runat="server" Width="150px" Height="25px">
                                        <ValidationSettings Display="Dynamic">
                                            <RegularExpression ErrorText="Decimal debe ser con &quot; , &quot;" ValidationExpression="^[0-9]\d*(,\d+)?$" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="auto-style6"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="Rebate Fijo" Font-Size="medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtRebateFijo" runat="server" Width="150px" Height="25px">
                                        <ValidationSettings Display="Dynamic">
                                            <RegularExpression ErrorText="Decimal debe ser con &quot; , &quot;" ValidationExpression="^[0-9]\d*(,\d+)?$" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <br />
                    <div>
                        <table>
                            <tr>

                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel15" runat="server" Text="Respo.Interna Sell Out" Font-Size="medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtRepoSellOut" runat="server" Width="150px" Height="25px">
                                        <ValidationSettings Display="Dynamic">
                                            <RegularExpression ErrorText="Decimal debe ser con &quot; , &quot;" ValidationExpression="^[0-9]\d*(,\d+)?$" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="auto-style11"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel14" runat="server" Text="No Devolucion" Font-Size="medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtNoDevolucion" runat="server" Width="150px" Height="25px">
                                        <ValidationSettings Display="Dynamic">
                                            <RegularExpression ErrorText="Decimal debe ser con &quot; , &quot;" ValidationExpression="^[0-9]\d*(,\d+)?$" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="auto-style6"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel16" runat="server" Text="PEL" Font-Size="medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtPEL" runat="server" Width="150px" Height="25px">
                                        <ValidationSettings Display="Dynamic">
                                            <RegularExpression ErrorText="Decimal debe ser con &quot; , &quot;" ValidationExpression="^[0-9]\d*(,\d+)?$" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="auto-style6"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel17" runat="server" Text="Cobro Fianza" Font-Size="medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtCobroFianza" runat="server" Width="150px" Height="25px">
                                        <ValidationSettings Display="Dynamic">
                                            <RegularExpression ErrorText="Decimal debe ser con &quot; , &quot;" ValidationExpression="^[0-9]\d*(,\d+)?$" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <br />
                    <br />
                    <div style="margin-left: 250px">
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxButton ID="btnGuardar" runat="server" Text="Guardar" Theme="iOS" Height="60px" Width="180px" OnClick="btnGuardar_Click"></dx:ASPxButton>
                                </td>
                                <td class="auto-style12"></td>
                                <td>
                                    <dx:ASPxButton ID="btnSalir" runat="server" Text="Salir" Theme="iOS" Height="60px" Width="140px" BackColor="Red" OnClick="btnSalir_Click" CausesValidation="False"></dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <asp:LinqDataSource ID="LqsCodCliente2" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" TableName="OCRD">
                    </asp:LinqDataSource>
                    <asp:LinqDataSource ID="LqsDireccion2" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" TableName="CRD1" Where="AdresType == @AdresType &amp;&amp; CardCode == @CardCode">
                        <WhereParameters>
                            <asp:Parameter DefaultValue="S" Name="AdresType" Type="Char" />
                            <asp:ControlParameter ControlID="cboCliente" DefaultValue="0" Name="CardCode" PropertyName="Value" Type="String" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                    <asp:LinqDataSource ID="LqsCodProducto2" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_PROD_PORC_RAPEL">
                    </asp:LinqDataSource>
                    <br />
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
        <br />
    </div>
</asp:Content>
