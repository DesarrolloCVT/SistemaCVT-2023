<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="CVT_MermasRecepcion.Mantenedores.Productos" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Sistema</a></li>
            <li><span id="current">Productos</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Productos</span>
        <span class="tab-end"></span>
<%--        <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px" />
                Exportar Excel</a>&nbsp;
              <a>
                  <asp:ImageButton ID="cmdNew" runat="server"
                      ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="height: 16px;" />Nuevo</a>
        </div>--%>
    </div>
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqsProductos" KeyFieldName="Company_Id; ArticleProvider_Id;Business_Partner_Id"
            OnRowInserting="GvDatos_RowInserting" Style="margin-top: 3px" OnToolbarItemClick="GvDatos_ToolbarItemClick" OnRowDeleting="GvDatos_RowDeleting" OnRowUpdating="GvDatos_RowUpdating">
            <SettingsPager PageSize="50">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            <SettingsBehavior ConfirmDelete="True" />
            <Toolbars>
                <dx:GridViewToolbar >
                    <Items>
                        <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif" >
<Image Url="../Images/pn-add-source-copy.gif"></Image>
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
                <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True"
                    ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="Articulo" FieldName="ArticleProvider_Id"
                    ReadOnly="True" ShowInCustomizationForm="True" Visible="False"
                    VisibleIndex="4">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MeasurementUnit_Id"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Tipo" FieldName="ArticleType_Id"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="9">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Container_Id"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="10">
                    <PropertiesTextEdit DisplayFormatInEditMode="True">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Codigo Producto"
                    FieldName="ArticleProvider_CodClient" ShowInCustomizationForm="True"
                    VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Producto"
                    FieldName="ArticleProvider_Description" ShowInCustomizationForm="True"
                    VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ArticleProvider_QualityStatus"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ArticleProvider_ControlSN"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ArticleProvider_AllowControlQuality"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="15">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Tiempo Expiracion "
                    FieldName="ArticleProvider_ExpiryTime" ShowInCustomizationForm="True"
                    VisibleIndex="16">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Inf. Adicional"
                    FieldName="ArticleProvider_Dato1" ShowInCustomizationForm="True"
                    Visible="False" VisibleIndex="17">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ArticleProvider_GrossWeight"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="18">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ArticleProvider_Bulk"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="19">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ArticleProvider_CriticalStock"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="20">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ArticleProvider_CriticalStockInPicking"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="21">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="GTIN14" FieldName="ArticleProvider_GTIN14"
                    ShowInCustomizationForm="True" VisibleIndex="22">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="ArticleProvider_CreationDate"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="24">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="ArticleProvider_UserCreationId"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="25">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="INV_0010_SyncStat"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="26">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="INV_0010_UpdFrom"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="27">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="ArticleProvider_UpdateDate"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="28">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="ArticleProvider_UserUpdateId"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="29">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="GTIN13" FieldName="ArticleProvider_GTIN13"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="30">
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ArticleProvider_Width"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="32">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ArticleProvider_Height"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="33">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ArticleProvider_Length"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="34">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ArticleProvider_Volume"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="35">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ArticleProvider_MaxStock"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="36">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cantidad Paletizado"
                    FieldName="ArticleProvider_U_CantidadPaletizado" ShowInCustomizationForm="True"
                    VisibleIndex="37">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Nombre Alternativo"
                    FieldName="ArticleProvider_U_NombreAlternativo" ShowInCustomizationForm="True"
                    VisibleIndex="38">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ArticleProvider_EnvQty"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="31">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ArticleProvider_ControlLT"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Business_Partner_Id" ReadOnly="True"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Familia" FieldName="Family_Id"
                    VisibleIndex="7">
                    <PropertiesComboBox DataSourceID="LqsFamilia" TextField="Family_Description"
                        ValueField="Family_Id">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Estado"
                    FieldName="ArticleProvider_Status" VisibleIndex="23">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Activo" Value="1" />
                            <dx:ListEditItem Text="Inactivo" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="Compañia" FieldName="Company_Id"
                    ReadOnly="True" ShowInCustomizationForm="True" Visible="False"
                    VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ArticleProvider_ControlPN"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Accounts_Id"
                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsProductos" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
            TableName="ArticleProvider" EnableDelete="True" EnableInsert="True"
            EnableUpdate="True">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsFamilia" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
            TableName="Family">
        </asp:LinqDataSource>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
        </dx:ASPxGridViewExporter>
    </div>
</asp:Content>
