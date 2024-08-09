<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="CVT_MermasRecepcion.Sistema.Usuarios" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Sistema</a></li>
            <li><span id="current">Usuarios</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Usuarios</span>
        <span class="tab-end"></span>
        <%--<div id="options">
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
    <div style="height: 292px; width: 990px">
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqsUsuarios" KeyFieldName="IdUsuario" Width="981px"
            OnRowInserted="GvDatos_RowInserted" OnRowInserting="GvDatos_RowInserting" OnRowUpdating="GvDatos_RowUpdating" OnToolbarItemClick="GvDatos_ToolbarItemClick" OnRowDeleting="GvDatos_RowDeleting">
            <SettingsPager PageSize="25">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            <SettingsBehavior AllowFocusedRow="True" />
            <Toolbars>
                <dx:GridViewToolbar>
                    <Items>
                        <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif">
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
                <dx:GridViewCommandColumn ShowEditButton="True"
                    VisibleIndex="0" ShowClearFilterButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="IdUsuario" ReadOnly="True"
                    ShowInCustomizationForm="True" VisibleIndex="1" Caption="ID Usuario" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UsuarioSistema"
                    ShowInCustomizationForm="True" VisibleIndex="2" Caption="Usuario Sistema">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Clave" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Clave" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NombreUsuario"
                    ShowInCustomizationForm="True" VisibleIndex="4" Caption="Nombre Usuario">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Depto" ShowInCustomizationForm="True"
                    VisibleIndex="7" Caption="Departamento" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaRegistro"
                    ShowInCustomizationForm="True" VisibleIndex="8" Caption="Fecha Registro">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="FechaUpdate"
                    ShowInCustomizationForm="True" VisibleIndex="9" Caption="Fecha Update" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="MailUsuario"
                    ShowInCustomizationForm="True" VisibleIndex="12" Caption="Mail Usuario">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="IdPerfil" VisibleIndex="10"
                    Caption="Perfil">
                    <PropertiesComboBox DataSourceID="LqsPerfil" TextField="Nombre_Perfil"
                        ValueField="IdPerfil">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Area" FieldName="Id_Area" VisibleIndex="6">
                    <PropertiesComboBox DataSourceID="LqsArea" TextField="Nombre" ValueField="Id_Area">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataCheckColumn FieldName="Verificador" VisibleIndex="14">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataComboBoxColumn FieldName="RestriccionBodega" VisibleIndex="13">
                    <PropertiesComboBox DataSourceID="LqsBodega" TextField="Descripcion" ValueField="DescripcionCorta">
                        <ClearButton DisplayMode="Always">
                        </ClearButton>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Perfil Movile" FieldName="IdPerfilMovile" VisibleIndex="11">
                    <PropertiesComboBox DataSourceID="LqsPerfilesXamarin" TextField="Nombre_Perfil" ValueField="IdPerfil">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="TelefonoContacto" VisibleIndex="5">
                    <PropertiesTextEdit>
                        <ValidationSettings>
                            <RegularExpression ErrorText="solo Numeros" ValidationExpression="\d+" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataCheckColumn FieldName="JefeArea" VisibleIndex="15">
                </dx:GridViewDataCheckColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsUsuarios" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext"
            EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName=""
            TableName="CVT_Usuarios">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsPerfil" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
            TableName="CVT_PerfilUsuario" EnableDelete="True" EnableInsert="True"
            EnableUpdate="True">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsArea" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_AreaTrabajo">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsBodega" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_SITE_USUARIOS">
        </asp:LinqDataSource>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
        </dx:ASPxGridViewExporter>
        <asp:LinqDataSource ID="LqsPerfilesXamarin" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_PerfilUsuario" EnableDelete="True" EnableInsert="True" EnableUpdate="True" Where="Nombre_Perfil.Contains(&quot;movile&quot;)">
        </asp:LinqDataSource>
    </div>
</asp:Content>
