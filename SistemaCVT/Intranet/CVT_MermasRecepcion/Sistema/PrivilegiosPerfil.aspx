<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PrivilegiosPerfil.aspx.cs" Inherits="CVT_MermasRecepcion.Sistema.PrivilegiosPerfil" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Sistema</a></li>
            <li><a href="Perfiles.aspx">Perfiles</a></li>
            <li><span id="current">Privilegios Perfil</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Privilegios Perfil</span>
        <span class="tab-end"></span>
 <%--       <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px" />
                Exportar Excel</a>&nbsp;
              <a>
                  <asp:ImageButton ID="cmdNew" runat="server"
                      ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" />Nuevo</a>
        </div>--%>
        </div>
    <br />
        <div>
            <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False"
                DataSourceID="LqsPrivilegios" KeyFieldName="IdSubMenu" Width="450px"
                OnRowInserting="GvDatos_RowInserting" OnToolbarItemClick="GvDatos_ToolbarItemClick" OnRowDeleting="GvDatos_RowDeleting" OnRowUpdating="GvDatos_RowUpdating">
                <SettingsPager PageSize="50">
                </SettingsPager>
                <SettingsEditing Mode="PopupEditForm">
                </SettingsEditing>
                <SettingsBehavior ConfirmDelete="True" />
                <Toolbars>
                    <dx:GridViewToolbar>
                        <Items>
                            <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif" />
                            <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                                <Items>
                                    <dx:GridViewToolbarItem Command="ExportToXls" />
                                    <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                    <dx:GridViewToolbarItem Command="ExportToDocx" />
                                    <dx:GridViewToolbarItem Command="ExportToRtf" />
                                    <dx:GridViewToolbarItem Command="ExportToCsv" />
                                    <dx:GridViewToolbarItem Command="ExportToPdf" />
                                </Items>
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
                    <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0" ShowDeleteButton="True">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataComboBoxColumn FieldName="IdSubMenu"
                        VisibleIndex="2" Caption="SubMenu">
                        <PropertiesComboBox DataSourceID="LqsSubmenu" TextField="Nombre_SubMenu"
                            ValueField="IdSubMenu">
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn FieldName="IdPerfil" ReadOnly="True"
                        VisibleIndex="1" Caption="Perfil">
                        <PropertiesComboBox DataSourceID="LqsPerfil" TextField="Nombre_Perfil"
                            ValueField="IdPerfil">
                        </PropertiesComboBox>
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn FieldName="Permiso"
                        ShowInCustomizationForm="True" VisibleIndex="3">
                        <PropertiesComboBox>
                            <Items>
                                <dx:ListEditItem Text="Lectura-Escritura" Value="1" />
                                <dx:ListEditItem Text="Lectura" Value="0" />
                            </Items>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                </Columns>
                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
                <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            </dx:ASPxGridView>
            <asp:LinqDataSource ID="LqsPrivilegios" runat="server"
                ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
                TableName="CVT_PrivilegioPerfil" Where="IdPerfil == @IdPerfil" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
                <WhereParameters>
                    <asp:SessionParameter DefaultValue="0" Name="IdPerfil" SessionField="IdPerfil"
                        Type="Int32" />
                </WhereParameters>
            </asp:LinqDataSource>
            <asp:LinqDataSource ID="LqsPerfil" runat="server"
                ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
                TableName="CVT_PerfilUsuario" Where="IdPerfil == @IdPerfil">
                <WhereParameters>
                    <asp:SessionParameter DefaultValue="0" Name="IdPerfil" SessionField="IdPerfil"
                        Type="Int32" />
                </WhereParameters>
            </asp:LinqDataSource>
            <asp:LinqDataSource ID="LqsSubmenu" runat="server"
                ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
                TableName="CVT_SubMenu">
            </asp:LinqDataSource>
            <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
            </dx:ASPxGridViewExporter>
        </div>
</asp:Content>
