<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="RecepcionDetalle.aspx.cs" Inherits="CVT_MermasRecepcion.WMS.RecepcionDetalle" %>

<%@ Register Assembly="DevExpress.XtraReports.v22.1.Web.WebForms, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1 {
            height: 23px;
        }

        .style2 {
            width: 170px;
        }

        .style3 {
            height: 23px;
            width: 170px;
        }

        .style4 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>WMS</a></li>
            <li><span id="current">Recepciones</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Recepciones: 
        <dx:ASPxLabel ID="lbl_recepcion" runat="server" Text="">
        </dx:ASPxLabel>
        </span>
        <span class="tab-end"></span>
        <div id="options">
            <%--   <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px" />
                Exportar Excel</a>--%>
            <a>
                <asp:ImageButton ID="cmdImprimir" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-print.png" OnClick="cmdImprimir_Click"
                    Style="width: 20px" />
                Imprimir Recepcion</a>
        </div>
    </div>
    <div>
        <table class="dxeBinImgCPnlSys">
            <tr>
                <td>&nbsp;</td>
                <td class="style2">
                    <dx:ASPxButton ID="btn_reported" runat="server" Height="18px"
                        OnClick="btn_reported_Click" Text="Det. Productos" Width="46px" ValidationGroup="c">
                    </dx:ASPxButton>
                </td>
                <td>&nbsp;</td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Cod Producto">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cb_producto" runat="server" DataSourceID="LqDsReported"
                        ValueField="ArticleProvider_Id">
                        <Columns>
                            <dx:ListBoxColumn Caption="Cod" FieldName="ArticleProvider_CodClient"
                                Width="150px">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Producto" FieldName="ArticleProvider_Description"
                                Width="300px">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Nombre Alternativo"
                                FieldName="ArticleProvider_U_NombreAlternativo" Width="250px">
                            </dx:ListBoxColumn>
                        </Columns>
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                    <asp:LinqDataSource ID="LqDsReported" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
                        TableName="CVT_VW_ReceptionReported" Where="Reception_Id == @Reception_Id">
                        <WhereParameters>
                            <asp:SessionParameter DefaultValue="-1" Name="Reception_Id"
                                SessionField="RecepcionId" Type="Int32" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Cantidad">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txt_cantidad" runat="server" Width="170px">
                        <ValidationSettings Display="Dynamic">
                            <RegularExpression ErrorText="solo numeros" ValidationExpression="\d+" />
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="F. Produccion">
                    </dx:ASPxLabel>
                </td>
                <td class="style2">
                    <dx:ASPxDateEdit ID="cb_fproduccion" runat="server">
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxDateEdit>
                </td>
                <td>&nbsp;</td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="F. Vencimiento">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxDateEdit ID="cb_fvencimiento" runat="server">
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxDateEdit>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Lote Proveedor">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txt_loteproveedor" runat="server" Width="170px">
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Lote">
                    </dx:ASPxLabel>
                </td>
                <td class="style2">
                    <dx:ASPxTextBox ID="txt_lote" runat="server" Width="170px">
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td>&nbsp;</td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="DUN14">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txt_dun14" runat="server" Width="170px">
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Comentario">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txt_comentario" runat="server" Width="170px">
                        <ValidationSettings Display="Dynamic">
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Tipo Pallet">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cboTipoPallet" runat="server" DataSourceID="LqsTipoPallet" TextField="Supportive_Description" ValueField="Supportive_Id">
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                    <asp:LinqDataSource ID="LqsTipoPallet" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" Select="new (Supportive_Id, Supportive_Description)" TableName="Supportive">
                    </asp:LinqDataSource>
                </td>
                <td class="style1"></td>
                <td class="style1"></td>
                <td class="style1">&nbsp;</td>
                <td class="style1">&nbsp;</td>
                <td class="style1"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="style2">&nbsp;</td>
                <td>&nbsp;</td>
                <td>
                    <dx:ASPxButton ID="btn_agregarbulto" runat="server" Text="AGREGAR BULTO"
                        OnClick="btn_agregarbulto_Click" Height="35px">
                    </dx:ASPxButton>
                </td>
                <td>
                    <dx:ASPxButton ID="btn_agregarbulto0" runat="server" Text="AGREGAR BULTO MASIVO"
                        OnClick="btn_agregarbultomasivo_Click" Height="35px">
                    </dx:ASPxButton>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Cantidad">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbo_cantpallet" runat="server">
                        <Items>
                            <dx:ListEditItem Text="1" Value="1" />
                            <dx:ListEditItem Text="2" Value="2" />
                            <dx:ListEditItem Text="3" Value="3" />
                            <dx:ListEditItem Text="4" Value="4" />
                            <dx:ListEditItem Text="5" Value="5" />
                            <dx:ListEditItem Text="6" Value="6" />
                            <dx:ListEditItem Text="7" Value="7" />
                            <dx:ListEditItem Text="8" Value="8" />
                            <dx:ListEditItem Text="9" Value="9" />
                            <dx:ListEditItem Text="10" Value="10" />
                            <dx:ListEditItem Text="11" Value="11" />
                            <dx:ListEditItem Text="12" Value="12" />
                            <dx:ListEditItem Text="13" Value="13" />
                            <dx:ListEditItem Text="14" Value="14" />
                            <dx:ListEditItem Text="15" Value="15" />
                            <dx:ListEditItem Text="16" Value="16" />
                            <dx:ListEditItem Text="17" Value="17" />
                            <dx:ListEditItem Text="18" Value="18" />
                            <dx:ListEditItem Text="19" Value="19" />
                            <dx:ListEditItem Text="20" Value="20" />
                            <dx:ListEditItem Text="21" Value="21" />
                            <dx:ListEditItem Text="22" Value="22" />
                            <dx:ListEditItem Text="23" Value="23" />
                            <dx:ListEditItem Text="24" Value="24" />
                            <dx:ListEditItem Text="25" Value="25" />
                            <dx:ListEditItem Text="26" Value="26" />
                            <dx:ListEditItem Text="27" Value="27" />
                            <dx:ListEditItem Text="28" Value="28" />
                            <dx:ListEditItem Text="29" Value="29" />
                            <dx:ListEditItem Text="30" Value="30" />
                        </Items>
                    </dx:ASPxComboBox>
                </td>
            </tr>
            <tr>
                <td colspan="7">
                    <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False"
                        DataSourceID="LqDsPackage" KeyFieldName="Package_Id"
                        OnHtmlRowCreated="GvDatos_HtmlRowCreated"
                        OnRowCommand="GvDatos_RowCommand" OnToolbarItemClick="GvDatos_ToolbarItemClick">
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Toolbars>
                            <dx:GridViewToolbar>
                                <Items>
                                    <%--   <dx:GridViewToolbarItem Command="New" />--%>
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
                            <dx:GridViewCommandColumn VisibleIndex="0"
                                ShowDeleteButton="True">
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn FieldName="Company_Id" ReadOnly="True"
                                Visible="False" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Package_Id" ReadOnly="True"
                                Visible="False" VisibleIndex="3">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Reception_Id" Visible="False"
                                VisibleIndex="4">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Layout_Id" Visible="False"
                                VisibleIndex="5">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="ArticleProvider_GrossWeight"
                                Visible="False" VisibleIndex="8">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Package_Barcode" Visible="False"
                                VisibleIndex="9">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Cantidad"
                                FieldName="Package_QuantityInitial" VisibleIndex="10">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Package_Quantity" Visible="False"
                                VisibleIndex="11">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Package_NetWeightInitial" Visible="False"
                                VisibleIndex="12">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Package_NetWeight" Visible="False"
                                VisibleIndex="13">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Package_GrossWeightInitial"
                                Visible="False" VisibleIndex="14">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Package_GrossWeight" Visible="False"
                                VisibleIndex="15">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Package_Height" Visible="False"
                                VisibleIndex="16">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Package_Status" Visible="False"
                                VisibleIndex="17">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Package_QualityStatus" Visible="False"
                                VisibleIndex="18">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Package_Owner" Visible="False"
                                VisibleIndex="19">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="N Pallet" FieldName="Package_SSCC"
                                VisibleIndex="6">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Package_SSCCParent" Visible="False"
                                VisibleIndex="20">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Package_SSCCParent_Id" Visible="False"
                                VisibleIndex="21">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Lote" FieldName="Package_Lot"
                                VisibleIndex="22">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn Caption="F Produccion"
                                FieldName="Package_ProductionDate" VisibleIndex="23">
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataDateColumn Caption="F Vencimiento"
                                FieldName="Package_ExpiresDate" VisibleIndex="24">
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn FieldName="Package_Mixed" Visible="False"
                                VisibleIndex="25">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn FieldName="Package_InDate" Visible="False"
                                VisibleIndex="26">
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataDateColumn FieldName="Package_OutDate" Visible="False"
                                VisibleIndex="27">
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn Caption="DUN 14" FieldName="Package_SN"
                                VisibleIndex="29">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Package_PN" Visible="False"
                                VisibleIndex="31">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Package_ReserveQuantity" Visible="False"
                                VisibleIndex="32">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Package_Reserve" Visible="False"
                                VisibleIndex="33">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Lote Proveedor" FieldName="Package_Data1"
                                VisibleIndex="28">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Package_Data2" Visible="False"
                                VisibleIndex="34">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="PackageState_Id" Visible="False"
                                VisibleIndex="35">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Accounts_Id" Visible="False"
                                VisibleIndex="36">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Package_FoilPP" Visible="False"
                                VisibleIndex="37">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="EntryType" Visible="False"
                                VisibleIndex="38">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Package_Origin" Visible="False"
                                VisibleIndex="39">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Package_Destination" Visible="False"
                                VisibleIndex="40">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Package_DependencesTotal" Visible="False"
                                VisibleIndex="41">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Package_CrossDocking" Visible="False"
                                VisibleIndex="42">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="PackageState_Id_Initial" Visible="False"
                                VisibleIndex="43">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataComboBoxColumn Caption="Producto"
                                FieldName="ArticleProvider_Id" VisibleIndex="7">
                                <PropertiesComboBox DataSourceID="LqDsReported" ValueField="ArticleProvider_Id">
                                    <Columns>
                                        <dx:ListBoxColumn Caption="Cod" FieldName="ArticleProvider_CodClient">
                                        </dx:ListBoxColumn>
                                        <dx:ListBoxColumn Caption="Producto" FieldName="ArticleProvider_Description">
                                        </dx:ListBoxColumn>
                                    </Columns>
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataHyperLinkColumn Caption="Confirma" VisibleIndex="44">
                                <EditFormSettings Visible="False" />
                                <DataItemTemplate>
                                    <asp:ImageButton ID="Confirma" CommandName="cmdConfirma" runat="server"
                                        ImageUrl="~/Images/confirm.png" OnClientClick="LoadingPanel.Show();" />
                                </DataItemTemplate>
                            </dx:GridViewDataHyperLinkColumn>
                            <dx:GridViewDataComboBoxColumn Caption="Tipo de Pallet" FieldName="Supportive_Id" VisibleIndex="30">
                                <PropertiesComboBox DataSourceID="LqsTipoPallet" TextField="Supportive_Description" ValueField="Supportive_Id">
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataTextColumn Caption="N" VisibleIndex="1">
                                <DataItemTemplate>
                                    <asp:Label ID="N" runat="server" Text="" />
                                </DataItemTemplate>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

                        <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
                    </dx:ASPxGridView>
                    <asp:LinqDataSource ID="LqDsPackage" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EnableUpdate="True"
                        EntityTypeName="" OrderBy="Package_SSCC desc" TableName="Package"
                        Where="Reception_Id == @Reception_Id" EnableDelete="True">
                        <WhereParameters>
                            <asp:SessionParameter DefaultValue="-1" Name="Reception_Id"
                                SessionField="RecepcionId" Type="Int32" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server"
                        GridViewID="GvDatos">
                    </dx:ASPxGridViewExporter>
                </td>
            </tr>
        </table>
    </div>
    <div>
        <br />
        <br />
        <p>RESUMEN</p>
        <dx:ASPxGridView ID="GvResumen" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqDsResumen">
            <Columns>
                <dx:GridViewDataTextColumn Caption="Codigo"
                    FieldName="ArticleProvider_CodClient" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Producto"
                    FieldName="ArticleProvider_Description" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Reception_Id" Visible="False"
                    VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsResumen" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
            TableName="CVT_VW_RecepcionResumen" Where="Reception_Id == @Reception_Id">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="-1" Name="Reception_Id"
                    SessionField="RecepcionId" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
    <div>
        <dx:ASPxPopupControl ID="popup_reported" runat="server"
            HeaderText="Detalle Productos">
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <table class="style4">
                        <tr>
                            <td rowspan="2">
                                <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Producto">
                                </dx:ASPxLabel>
                            </td>
                            <td rowspan="2">
                                <dx:ASPxComboBox ID="cbo_producto" runat="server" DataSourceID="LqDsProductos"
                                    ValueField="ArticleProvider_Id">
                                    <Columns>
                                        <dx:ListBoxColumn Caption="Cod" FieldName="ArticleProvider_CodClient"
                                            Width="150px">
                                        </dx:ListBoxColumn>
                                        <dx:ListBoxColumn Caption="Producto" FieldName="ArticleProvider_Description"
                                            Width="300px">
                                        </dx:ListBoxColumn>
                                        <dx:ListBoxColumn Caption="Nombre Alternativo"
                                            FieldName="ArticleProvider_U_NombreAlternativo" Width="200px">
                                        </dx:ListBoxColumn>
                                    </Columns>
                                    <ValidationSettings ValidationGroup="c">
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                                <asp:LinqDataSource ID="LqDsProductos" runat="server"
                                    ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
                                    TableName="ArticleProvider" Where="ArticleProvider_Status == @ArticleProvider_Status">
                                    <WhereParameters>
                                        <asp:Parameter DefaultValue="1" Name="ArticleProvider_Status" Type="Int32" />
                                    </WhereParameters>
                                </asp:LinqDataSource>
                            </td>
                            <td>
                                <dx:ASPxButton ID="btn_agregar" runat="server" OnClick="btn_agregar_Click"
                                    Text="AGREGAR" ValidationGroup="c">
                                </dx:ASPxButton>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxButton ID="btn_cerrarpopup" runat="server"
                                    OnClick="btn_cerrarpopup_Click" Text="CERRAR" ValidationGroup="c">
                                </dx:ASPxButton>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <dx:ASPxGridView ID="Gv_Reported" runat="server" AutoGenerateColumns="False"
                                    DataSourceID="LqDsReportedrec"
                                    KeyFieldName="Company_Id;Site_Id;Reception_Id;ArticleProvider_Id">
                                    <Columns>
                                        <dx:GridViewCommandColumn ShowDeleteButton="True"
                                            ShowInCustomizationForm="True" VisibleIndex="0">
                                        </dx:GridViewCommandColumn>
                                        <dx:GridViewDataTextColumn FieldName="Company_Id" ReadOnly="True"
                                            ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Site_Id" ReadOnly="True"
                                            ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Reception_Id" ReadOnly="True"
                                            ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="ReceptionReported_Quantity"
                                            ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataComboBoxColumn FieldName="ReceptionReported_Weigth"
                                            ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                            <PropertiesComboBox DataSourceID="LqDsProductos"
                                                ValueField="ArticleProvider_Id">
                                                <Columns>
                                                    <dx:ListBoxColumn Caption="Cod" FieldName="ArticleProvider_CodClient">
                                                    </dx:ListBoxColumn>
                                                    <dx:ListBoxColumn Caption="Producto" FieldName="ArticleProvider_Description">
                                                    </dx:ListBoxColumn>
                                                </Columns>
                                            </PropertiesComboBox>
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="Producto"
                                            FieldName="ArticleProvider_Id" ReadOnly="True" ShowInCustomizationForm="True"
                                            VisibleIndex="4">
                                            <PropertiesComboBox DataSourceID="LqDsProductos"
                                                ValueField="ArticleProvider_Id">
                                                <Columns>
                                                    <dx:ListBoxColumn Caption="Cod" FieldName="ArticleProvider_CodClient">
                                                    </dx:ListBoxColumn>
                                                    <dx:ListBoxColumn Caption="Producto" FieldName="ArticleProvider_Description">
                                                    </dx:ListBoxColumn>
                                                </Columns>
                                            </PropertiesComboBox>
                                        </dx:GridViewDataComboBoxColumn>
                                    </Columns>
                                </dx:ASPxGridView>
                                <asp:LinqDataSource ID="LqDsReportedrec" runat="server"
                                    ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EnableDelete="True"
                                    EntityTypeName="" TableName="ReceptionReported"
                                    Where="Reception_Id == @Reception_Id">
                                    <WhereParameters>
                                        <asp:SessionParameter DefaultValue="-1" Name="Reception_Id"
                                            SessionField="RecepcionId" Type="Int32" />
                                    </WhereParameters>
                                </asp:LinqDataSource>
                            </td>
                        </tr>
                    </table>
                </dx:PopupControlContentControl>                
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
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
