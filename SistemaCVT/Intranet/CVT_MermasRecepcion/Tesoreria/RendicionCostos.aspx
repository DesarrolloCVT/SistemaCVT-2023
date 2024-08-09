<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="RendicionCostos.aspx.cs" Inherits="CVT_MermasRecepcion.Tesoreria.RendicionCostos" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Tesoreria</a></li>
            <li><span id="current">Rendicion de Costos</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Rendicion de Costos</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <br />

    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsRendicion" KeyFieldName="Id_Rendi" OnRowInserting="GvDatos_RowInserting" Width="1280px" OnRowCommand="GvDatos_RowCommand">
            <SettingsPager PageSize="25">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" ShowTitlePanel="True" />
            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
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
            <SettingsPopup>
                <EditForm HorizontalAlign="LeftSides" Modal="True" VerticalAlign="TopSides">
                </EditForm>
                <CustomizationWindow VerticalAlign="TopSides" />
                <FilterControl AutoUpdatePosition="False">
                </FilterControl>
            </SettingsPopup>
            <SettingsText Title="Rendicion de Costos" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="N Rendi" FieldName="Id_Rendi" ReadOnly="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaRegistro" VisibleIndex="8" Visible="False">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="FechaCreacion" VisibleIndex="10">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="IDUsuarioValida" VisibleIndex="11" Caption="Usuario Valida" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaValidacion" VisibleIndex="12" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="IDUsuarioCierraRendi" VisibleIndex="13" Caption="Usuario Cierra" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaCierreRendi" VisibleIndex="14" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="TotalRendicion" VisibleIndex="7">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Solicitante" FieldName="RunSolicita" MaxWidth="300" MinWidth="300" VisibleIndex="2" Width="300px">
                    <PropertiesComboBox DataSourceID="LqsUsuario" ValueField="Run">
                        <Columns>
                            <dx:ListBoxColumn FieldName="Nombre" Width="200px">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn FieldName="Apellido" Width="200px">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn FieldName="Run">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataMemoColumn FieldName="MotivoGasto" ShowInCustomizationForm="True" VisibleIndex="3">
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataComboBoxColumn FieldName="CentroCosto" ShowInCustomizationForm="True" VisibleIndex="5">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Administracion" Value="1" />
                            <dx:ListEditItem Text="Carga y Descarga" Value="2" />
                            <dx:ListEditItem Text="Jefatura de Planta" Value="3" />
                            <dx:ListEditItem Text="Guardias" Value="4" />
                            <dx:ListEditItem Text="Recursos Humanos" Value="5" />
                            <dx:ListEditItem Text="Gerencia General" Value="6" />
                            <dx:ListEditItem Text="Otros ...(Agricola)" Value="7" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="TipoDocumento" ShowInCustomizationForm="True" VisibleIndex="6">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Solicita Fondo por Rendir" Value="1" />
                            <dx:ListEditItem Text="Reembolso Boleta" Value="6" />
                            <dx:ListEditItem Text="Rendicion de Fondo" Value="2" />
                            <dx:ListEditItem Text="Solicita Pago Factura Proveedor" Value="3" />
                            <dx:ListEditItem Text="Solicita Reembolso Factura Cancelada" Value="4" />
                            <dx:ListEditItem Text="Solicita Pago Anticipo Proveedor" Value="5" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Empresa" ShowInCustomizationForm="True" VisibleIndex="4" Width="300px">
                    <PropertiesComboBox DataSourceID="LqsEmpresas" ValueField="RutEmpresa">
                        <Columns>
                            <dx:ListBoxColumn FieldName="RutEmpresa">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn FieldName="NombreEmpresa" Width="500px">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Usuario Crea" FieldName="IDUsuarioCrea" VisibleIndex="9">
                    <PropertiesComboBox DataSourceID="LqsUsuarioSistema" TextField="NombreUsuario" ValueField="IdUsuario">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Detalle" VisibleIndex="51">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/boxadd.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsRendicion" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" OrderBy="Id_Rendi" TableName="CVT_RendicionCostos">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsUsuario" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTControlBIODataContext" EntityTypeName="" TableName="VW_EMPLEADOS_CVT">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsEmpresas" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_EmpresasNegocio">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsUsuarioSistema" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Usuarios">
        </asp:LinqDataSource>
    </div>
</asp:Content>
