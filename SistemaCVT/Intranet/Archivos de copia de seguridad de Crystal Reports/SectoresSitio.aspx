<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SectoresSitio.aspx.cs" Inherits="CVT_MermasRecepcion.Mantenedores.SectoresSitio" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Sistema</a></li>
            <li><a href="Sitios.aspx">Sitios</a></li>
            <li><span id="current">Sectores</span></li>
        </ul>
    </div>
    <br />
    <div id="tableHeader">
        <span class="tableTitle">Sectores</span>
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
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatosSector" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDatosSector" KeyFieldName="Company_Id;Site_Id;Sector_Id" OnRowInserting="GvDatosSector_RowInserting" OnToolbarItemClick="GvDatosSector_ToolbarItemClick" OnRowDeleting="GvDatosSector_RowDeleting" OnRowUpdating="GvDatosSector_RowUpdating">
            <SettingsPager PageSize="50">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
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
                <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Company_Id" ReadOnly="True" Visible="False" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Site_Id" ReadOnly="True" Visible="False" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Sector_Id" ReadOnly="True" Visible="False" VisibleIndex="3">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Descripción" FieldName="Sector_Description" VisibleIndex="4">
                    <PropertiesTextEdit>
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Nombre Corto" FieldName="Sector_ShortDescription" VisibleIndex="5">
                    <PropertiesTextEdit>
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Observaciones" FieldName="Sector_Notes" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Tipo" FieldName="Sector_Status" VisibleIndex="6">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="AREA ALMACENAMIENTO" Value="1" ImageUrl="~/Images/boxok.png" />
                            <dx:ListEditItem Text="AREA PICKING" Value="2" ImageUrl="~/Images/boxadd.png" />
                            <dx:ListEditItem Text="MUELLE DESPACHO" Value="3" ImageUrl="~/Images/back.png" />
                            <dx:ListEditItem Text="MUELLE RECEPCION" Value="4" ImageUrl="~/Images/forward.png" />
                            <dx:ListEditItem Text="MUELLE REC-DESP" Value="5" ImageUrl="~/Images/Left-right.png" />
                            <dx:ListEditItem Text="AREA PREPARACION" Value="6" ImageUrl="~/Images/box.png" />
                            <dx:ListEditItem Text="AREA SORTING" Value="7" ImageUrl="~/Images/box.png" />
                            <dx:ListEditItem Text="CONSOLIDACION DE PALLET" Value="8" ImageUrl="~/Images/inventory.png" />
                            <dx:ListEditItem Text="REPOSICION A PICKING" Value="9" ImageUrl="~/Images/box.png" />
                        </Items>
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Apilamiento" FieldName="Sector_AllowStack" VisibleIndex="7">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Si" Value="1" ImageUrl="~/Images/ico-vigente.png" />
                            <dx:ListEditItem Text="No" Value="2" ImageUrl="~/Images/warning.png" />
                        </Items>
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDatosSector" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" OrderBy="Sector_Description" TableName="Sector" Where="Site_Id == @Site_Id">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="Site_Id" SessionField="Site_Id" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
</asp:Content>
