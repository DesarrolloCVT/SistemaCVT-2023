<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="MantenedorTipoBloqueo.aspx.cs" Inherits="CVT_MermasRecepcion.BloqueoProducto.MantenedorTipoBloqueo" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Bloqueo Productos</a></li>
            <li><span id="current">Bloqueo Productos</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Tipo Bloqueo</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatoTipoBloqueo" runat="server" AutoGenerateColumns="False" DataSourceID="LqsTipoBloqueo" KeyFieldName="Id_TipoBloqueo" OnToolbarItemClick="GvDatoTipoBloqueo_ToolbarItemClick" Width="370px">
            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" ShowGroupPanel="True" AutoFilterCondition="Contains" />
            <SettingsBehavior ConfirmDelete="True" />

            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
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
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0" Width="50px">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="Codigo" FieldName="Id_TipoBloqueo" ReadOnly="True" VisibleIndex="1" Width="100px">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Descripcion" VisibleIndex="2" Width="300px">
                </dx:GridViewDataTextColumn>
            </Columns>            
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsTipoBloqueo" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_Producto_TipoBloqueo">
        </asp:LinqDataSource>
    </div>
</asp:Content>
