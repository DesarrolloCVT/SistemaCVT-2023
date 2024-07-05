<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="GereradorEtiquetaQrProduccion.aspx.cs" Inherits="CVT_MermasRecepcion.Produccion.GereradorEtiquetaQrProduccion" %>

<%@ Register Assembly="DevExpress.XtraReports.v22.1.Web.WebForms, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Produccion</a></li>
            <li><span id="current">Etiquetas Produccion</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Etiquetado Produccion</span>
        <span class="tab-end"></span>
        <%--   <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px" />
                Exportar Excel</a>
        </div>--%>
    </div>
    <div>
        <table class="dxeBinImgCPnlSys">
            <tr>
                <td class="style2">
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Orden Fabricacion">
                    </dx:ASPxLabel>
                </td>
                <td class="style3" colspan="2">
                    <dx:ASPxComboBox ID="cbo_of" runat="server" AutoPostBack="True"
                        DataSourceID="LqDsOF" OnSelectedIndexChanged="cbo_of_SelectedIndexChanged"
                        ValueField="OF" Width="300px" Style="height: 23px">
                        <ClientSideEvents SelectedIndexChanged="function(s, e) {
	LoadingPanel.Show();

}" />
                        <Columns>
                            <dx:ListBoxColumn FieldName="OF">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn FieldName="CodProducto">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn FieldName="Producto">
                            </dx:ListBoxColumn>
                        </Columns>
                        <ValidationSettings Display="Dynamic" ValidationGroup="agregar">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                    <asp:LinqDataSource ID="LqDsOF" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName=""
                        TableName="CVT_ListaOFLiberadas" OrderBy="OF">
                    </asp:LinqDataSource>
                </td>
                <td class="style3">
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Cantidad Contenedoras">
                    </dx:ASPxLabel>
                </td>
                <td class="style3">
                    <dx:ASPxTextBox ID="txt_cantidad" runat="server" Width="170px">
                        <ValidationSettings Display="Dynamic" ValidationGroup="agregar">
                            <RegularExpression ValidationExpression="^([0-9])*$" />
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td class="style3">
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Turno/Linea:">
                    </dx:ASPxLabel>
                </td>
                <td class="style3">
                    <dx:ASPxComboBox ID="cbo_turno" runat="server" SelectedIndex="0" Width="45px">
                        <Items>
                            <dx:ListEditItem Selected="True" Text="1" Value="1" />
                            <dx:ListEditItem Text="2" Value="2" />
                            <dx:ListEditItem Text="3" Value="3" />
                            <dx:ListEditItem Text="4" Value="4" />
                            <dx:ListEditItem Text="5" Value="5" />
                            <dx:ListEditItem Text="6" Value="6" />
                        </Items>
                        <ValidationSettings Display="Dynamic" ValidationGroup="agregar">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Tipo Pallet"></dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cboTipoPallet" runat="server" DataSourceID="LqsTipoPallet" TextField="Supportive_Description" ValueField="Supportive_Id">
                        <ValidationSettings Display="Dynamic" ValidationGroup="agregar">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                    <asp:LinqDataSource ID="LqsTipoPallet" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" Select="new (Supportive_Description, Supportive_Id)" TableName="Supportive">
                    </asp:LinqDataSource>
                </td>
            </tr>
            <tr>
                <td class="style1" colspan="2">
                    <dx:ASPxLabel ID="lbl_bultos" runat="server">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="lbl_producto" runat="server">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="lbl_cantidad" runat="server">
                    </dx:ASPxLabel>
                </td>
                <td colspan="3">
                    <dx:ASPxButton ID="btn_generar" runat="server" Text="AGREGAR"
                        OnClick="btn_generar_Click" ValidationGroup="agregar">
                        <ClientSideEvents Click="function(s, e) {
	LoadingPanel.Show();
}" />
                    </dx:ASPxButton>
                </td>
            </tr>
            <tr>
                <td class="style1" colspan="2">
                    <dx:ASPxLabel ID="lbl_lote" runat="server">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="lbl_codproducto" runat="server">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="lbl_producido" runat="server">
                    </dx:ASPxLabel>
                </td>
                <td colspan="3">&nbsp;</td>
            </tr>
        </table>
    </div>
       <dx:ASPxLabel ID="lblLoteOFs" runat="server" Visible="false">
                    </dx:ASPxLabel>
     <dx:ASPxLabel ID="lblOFs" runat="server" Visible="false">
                    </dx:ASPxLabel>
    <div>
        <dx1:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqDsPackage" KeyFieldName="Company_Id" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsPager AlwaysShowPager="True" EnableAdaptivity="True"
                Mode="ShowAllRecords" PageSize="100000000">
            </SettingsPager>
            <Toolbars>
                <dx1:gridviewtoolbar >
                    <Items>
                        <%--   <dx:GridViewToolbarItem Command="New" />--%>
                        <dx1:gridviewtoolbaritem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx1:gridviewtoolbaritem Command="ExportToXls" />
                                <dx1:gridviewtoolbaritem Command="ExportToXlsx" />                               
                            </Items>
                        </dx1:gridviewtoolbaritem>
                        <dx1:gridviewtoolbaritem Alignment="Left">
                            <Template>
                                <dx1:aspxbuttonedit ID="tbToolbarSearch" runat="server" NullText="Search..." Height="100%">
                                    <Buttons>
                                        <dx1:spinbuttonextended Image-IconID="find_find_16x16gray" />
                                    </Buttons>
                                </dx1:aspxbuttonedit>
                            </Template>
                        </dx1:gridviewtoolbaritem>
                    </Items>
                </dx1:gridviewtoolbar>
            </Toolbars>
            <Columns>
                <dx1:gridviewdatatextcolumn FieldName="Company_Id" ReadOnly="True"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                </dx1:gridviewdatatextcolumn>
                <dx1:gridviewdatatextcolumn FieldName="Package_Id" ReadOnly="True"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx1:gridviewdatatextcolumn>
                <dx1:gridviewdatatextcolumn FieldName="Supportive_Id"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                </dx1:gridviewdatatextcolumn>
                <dx1:gridviewdatatextcolumn FieldName="Reception_Id"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                </dx1:gridviewdatatextcolumn>
                <dx1:gridviewdatatextcolumn FieldName="ArticleProvider_GrossWeight"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="12">
                </dx1:gridviewdatatextcolumn>
                <dx1:gridviewdatatextcolumn FieldName="Package_Barcode"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="13">
                </dx1:gridviewdatatextcolumn>
                <dx1:gridviewdatatextcolumn FieldName="Package_QuantityInitial"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="14">
                </dx1:gridviewdatatextcolumn>
                <dx1:gridviewdatatextcolumn Caption="Cantidad" FieldName="Package_Quantity"
                    ShowInCustomizationForm="True" VisibleIndex="7">
                </dx1:gridviewdatatextcolumn>
                <dx1:gridviewdatatextcolumn FieldName="Package_NetWeightInitial"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="15">
                </dx1:gridviewdatatextcolumn>
                <dx1:gridviewdatatextcolumn FieldName="Package_NetWeight"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="16">
                </dx1:gridviewdatatextcolumn>
                <dx1:gridviewdatatextcolumn FieldName="Package_GrossWeightInitial"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="17">
                </dx1:gridviewdatatextcolumn>
                <dx1:gridviewdatatextcolumn FieldName="Package_GrossWeight"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="18">
                </dx1:gridviewdatatextcolumn>
                <dx1:gridviewdatatextcolumn FieldName="Package_Height"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="19">
                </dx1:gridviewdatatextcolumn>
                <dx1:gridviewdatatextcolumn Caption="Estado" FieldName="Package_Status"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="20">
                </dx1:gridviewdatatextcolumn>
                <dx1:gridviewdatatextcolumn FieldName="Package_QualityStatus"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="21">
                </dx1:gridviewdatatextcolumn>
                <dx1:gridviewdatatextcolumn FieldName="Package_Owner"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="22">
                </dx1:gridviewdatatextcolumn>
                <dx1:gridviewdatatextcolumn Caption="N Pallet" FieldName="Package_SSCC"
                    ShowInCustomizationForm="True" VisibleIndex="4">
                </dx1:gridviewdatatextcolumn>
                <dx1:gridviewdatatextcolumn FieldName="Package_SSCCParent"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="23">
                </dx1:gridviewdatatextcolumn>
                <dx1:gridviewdatatextcolumn FieldName="Package_SSCCParent_Id"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="24">
                </dx1:gridviewdatatextcolumn>
                <dx1:gridviewdatatextcolumn Caption="Lote" FieldName="Package_Lot"
                    ShowInCustomizationForm="True" VisibleIndex="8">
                </dx1:gridviewdatatextcolumn>
                <dx1:gridviewdatadatecolumn Caption="F Produccion"
                    FieldName="Package_ProductionDate" ShowInCustomizationForm="True"
                    VisibleIndex="9">
                </dx1:gridviewdatadatecolumn>
                <dx1:gridviewdatadatecolumn Caption="F Vencimiento"
                    FieldName="Package_ExpiresDate" ShowInCustomizationForm="True"
                    VisibleIndex="10">
                </dx1:gridviewdatadatecolumn>
                <dx1:gridviewdatatextcolumn FieldName="Package_Mixed"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="25">
                </dx1:gridviewdatatextcolumn>
                <dx1:gridviewdatadatecolumn FieldName="Package_InDate"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="26">
                </dx1:gridviewdatadatecolumn>
                <dx1:gridviewdatadatecolumn FieldName="Package_OutDate"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="27">
                </dx1:gridviewdatadatecolumn>
                <dx1:gridviewdatatextcolumn FieldName="Package_SN"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="28">
                </dx1:gridviewdatatextcolumn>
                <dx1:gridviewdatatextcolumn FieldName="Package_PN"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="29">
                </dx1:gridviewdatatextcolumn>
                <dx1:gridviewdatatextcolumn FieldName="Package_ReserveQuantity"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="30">
                </dx1:gridviewdatatextcolumn>
                <dx1:gridviewdatatextcolumn FieldName="Package_Reserve"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="31">
                </dx1:gridviewdatatextcolumn>
                <dx1:gridviewdatatextcolumn FieldName="Package_Data1"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="32">
                </dx1:gridviewdatatextcolumn>
                <dx1:gridviewdatatextcolumn FieldName="Package_Data2"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="33">
                </dx1:gridviewdatatextcolumn>
                <dx1:gridviewdatatextcolumn FieldName="PackageState_Id"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="34">
                </dx1:gridviewdatatextcolumn>
                <dx1:gridviewdatatextcolumn FieldName="Accounts_Id"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="35">
                </dx1:gridviewdatatextcolumn>
                <dx1:gridviewdatatextcolumn FieldName="Package_FoilPP"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="36">
                </dx1:gridviewdatatextcolumn>
                <dx1:gridviewdatatextcolumn FieldName="EntryType" ShowInCustomizationForm="True"
                    Visible="False" VisibleIndex="37">
                </dx1:gridviewdatatextcolumn>
                <dx1:gridviewdatatextcolumn FieldName="Package_Origin"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="38">
                </dx1:gridviewdatatextcolumn>
                <dx1:gridviewdatatextcolumn FieldName="Package_Destination"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="39">
                </dx1:gridviewdatatextcolumn>
                <dx1:gridviewdatatextcolumn FieldName="Package_DependencesTotal"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="40">
                    <EditFormSettings Visible="False" />
                </dx1:gridviewdatatextcolumn>
                <dx1:gridviewdatatextcolumn FieldName="Package_CrossDocking"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="41">
                </dx1:gridviewdatatextcolumn>
                <dx1:gridviewdatatextcolumn FieldName="PackageState_Id_Initial"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="42">
                </dx1:gridviewdatatextcolumn>
                <dx1:gridviewdatacomboboxcolumn Caption="Posicion" FieldName="Layout_Id"
                    ShowInCustomizationForm="True" VisibleIndex="11">
                    <PropertiesComboBox DataSourceID="LqDsLayout" TextField="Layout_Description"
                        ValueField="Layout_Id">
                    </PropertiesComboBox>
                </dx1:gridviewdatacomboboxcolumn>
                <dx1:gridviewdatacomboboxcolumn Caption="Codigo Producto"
                    FieldName="ArticleProvider_Id" ShowInCustomizationForm="True" VisibleIndex="5">
                    <PropertiesComboBox DataSourceID="LqDsProducto"
                        TextField="ArticleProvider_CodClient" ValueField="ArticleProvider_Id">
                    </PropertiesComboBox>
                </dx1:gridviewdatacomboboxcolumn>
                <dx1:gridviewdatacomboboxcolumn Caption="Producto"
                    FieldName="ArticleProvider_Id" VisibleIndex="6">
                    <PropertiesComboBox DataSourceID="LqDsProducto"
                        TextField="ArticleProvider_Description" ValueField="ArticleProvider_Id">
                    </PropertiesComboBox>
                </dx1:gridviewdatacomboboxcolumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx1:ASPxGridView>
        <asp:LinqDataSource ID="LqDsPackage" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
            TableName="Package" Where="Package_Lot == @Package_Lot">
            <WhereParameters>
                <asp:ControlParameter ControlID="lblLoteOFs" DefaultValue="0" Name="Package_Lot" PropertyName="Text" Type="String" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqDsLayout" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
            TableName="Layout">
        </asp:LinqDataSource>

        <asp:LinqDataSource ID="LqDsProducto" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
            TableName="ArticleProvider">
        </asp:LinqDataSource>

    </div>
    <dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel"
        Modal="True">
    </dx:ASPxLoadingPanel>
    <div>
        <dx:ASPxPopupControl ID="PopEtiquetaNueva" runat="server" AllowDragging="True" CloseAction="CloseButton" HeaderText="Nuevo" Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle" Width="500px">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <dx:ASPxWebDocumentViewer ID="ASPxWebDocumentViewer1" runat="server" DisableHttpHandlerValidation="False" Height="900px">
                    </dx:ASPxWebDocumentViewer>
                </dx:PopupControlContentControl>                
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
</asp:Content>
