<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InventarioEquipos.aspx.cs" Inherits="CVT_MermasRecepcion.Informatica.InventarioEquipos" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style6 {
            margin-left: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Informatica</a></li>
            <li><span id="current">Inventario Equipos</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Inventario Equipos</span>
        <span class="tab-end"></span>
    </div>
    <div>

        <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0"
            Width="100%" SaveStateToCookies="True" SaveStateToCookiesID="1">
            <TabPages>
                <dx:TabPage Text="SERVIDORES" Name="Servidores" ToolTip="Servidores">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                            <div>
                                <p><strong>SERVIDORES</strong></p>
                            </div>
                            <dx:ASPxGridView ID="GvServidores" runat="server" AutoGenerateColumns="False"
                                DataSourceID="LqDsServidores" KeyFieldName="ID" OnToolbarItemClick="GvServidores_ToolbarItemClick" OnRowCommand="GvServidores_RowCommand" OnRowInserting="GvServidores_RowInserting">
                                <SettingsPager PageSize="2000">
                                </SettingsPager>
                                <SettingsEditing Mode="PopupEditForm">
                                </SettingsEditing>
                                <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
                                <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
                                <Toolbars>
                                    <dx:GridViewToolbar >
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
                                    <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True"
                                        ShowInCustomizationForm="True" VisibleIndex="0" ShowClearFilterButton="True">
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="1">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Nombre_Equipo" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Dispositivo" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Direccion_IP" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Direccion_MAC" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Modelo" VisibleIndex="7">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="RAM" VisibleIndex="8">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Procesador" VisibleIndex="9">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Disco" VisibleIndex="10">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="Marca" ShowInCustomizationForm="True" VisibleIndex="6">
                                        <PropertiesComboBox DataSourceID="lqsMarca8" TextField="MARCA" ValueField="ID">
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="Sistema_Operativo" ShowInCustomizationForm="True" VisibleIndex="11">
                                        <PropertiesComboBox DataSourceID="lqsSO2" TextField="SistemaOperativo" ValueField="ID">
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataTextColumn Caption="Codigo inventario" FieldName="Cod_AF" ShowInCustomizationForm="True" VisibleIndex="13">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="CodLicencia" ShowInCustomizationForm="True" VisibleIndex="15">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataHyperLinkColumn Caption="Adjuntos" VisibleIndex="16">
                                        <EditFormSettings Visible="False" />
                                        <DataItemTemplate>
                                            <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/menu.png" />
                                        </DataItemTemplate>
                                        <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                                        </CellStyle>
                                    </dx:GridViewDataHyperLinkColumn>
                                    <dx:GridViewDataHyperLinkColumn Caption="Dar de Baja" VisibleIndex="17">
                                        <EditFormSettings Visible="False" />
                                        <DataItemTemplate>
                                            <asp:ImageButton ID="bajadaEquipo" CommandName="cmdBajada" runat="server" ImageUrl="~/Images/delete.png" />
                                        </DataItemTemplate>
                                        <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                                        </CellStyle>
                                    </dx:GridViewDataHyperLinkColumn>
                                    <dx:GridViewDataTextColumn FieldName="Cores" ShowInCustomizationForm="True" VisibleIndex="12">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="TipoLicencia" ShowInCustomizationForm="True" VisibleIndex="14">
                                        <PropertiesComboBox>
                                            <Items>
                                                <dx:ListEditItem Text="OEM" Value="OEM" />
                                                <dx:ListEditItem Text="Retail" Value="Retail" />
                                                <dx:ListEditItem Text="Volumen" Value="Volumen" />
                                            </Items>
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                </Columns>
                                <Styles>
                                    <FocusedRow BackColor="#FF9933">
                                    </FocusedRow>
                                </Styles>
                                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

                                <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
                            </dx:ASPxGridView>
                            <asp:LinqDataSource ID="LqDsServidores" runat="server"
                                ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
                                TableName="CVT_INF_Servidor" Where="Estado == @Estado" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
                                <WhereParameters>
                                    <asp:Parameter DefaultValue="1" Name="Estado" Type="Int32" />
                                </WhereParameters>
                            </asp:LinqDataSource>
                            <asp:LinqDataSource ID="lqsSO2" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_INF_SistemaOperativo">
                            </asp:LinqDataSource>
                            <asp:LinqDataSource ID="lqsMarca8" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_INF_MARCA">
                            </asp:LinqDataSource>
                            <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server"
                                ExportedRowType="All" GridViewID="GvServidores">
                            </dx:ASPxGridViewExporter>
                            <dx:ASPxPopupControl ID="PopBajadaServidor" runat="server"
                                HeaderText="Bajada Equipo" AllowDragging="True" CloseAction="CloseButton" CloseAnimationType="Fade">
                                <ContentCollection>
                                    <dx:PopupControlContentControl runat="server">
                                        <div>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Motivo Baja"></dx:ASPxLabel>
                                                        <dx:ASPxComboBox ID="cboMotivo" runat="server" ValueType="System.String" Height="30px">
                                                            <Items>
                                                                <dx:ListEditItem Text="Donacion" Value="Donacion" />
                                                                <dx:ListEditItem Text="Venta o Subasta" Value="Venta o Subasta" />
                                                                <dx:ListEditItem Text="Robo" Value="Robo" />
                                                                <dx:ListEditItem Text="Entrega a Empresa de Residuos" Value="Entrega a Empresa de Residuos" />
                                                                <dx:ListEditItem Text="Sin Reparacion" Value="Sin Reparacion" />
                                                                <dx:ListEditItem Text="Vida Util (Antiguedad)" Value="Vida Util (Antiguedad)" />
                                                            </Items>
                                                        </dx:ASPxComboBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <br />
                                        <div>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Observaciones"></dx:ASPxLabel>
                                                        <dx:ASPxMemo ID="txtObservacion" runat="server" Height="71px" Width="243px"></dx:ASPxMemo>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div style="margin-left: 50px">
                                            <dx:ASPxButton ID="btnGuardarBajaServidor" runat="server" Text="GUARDAR" Height="40px" Theme="Glass" Width="140px" OnClick="btnGuardarBajaServidor_Click"></dx:ASPxButton>
                                        </div>
                                    </dx:PopupControlContentControl>
                                </ContentCollection>
                            </dx:ASPxPopupControl>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="COMPUTADORES" Name="Computadores">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                            <div>
                                <p><strong>COMPUTADORES</strong></p>
                            </div>
                            <dx:ASPxGridView ID="GvComputadores" runat="server" AutoGenerateColumns="False"
                                DataSourceID="LqDsComputadores" KeyFieldName="ID" OnToolbarItemClick="GvComputadores_ToolbarItemClick" OnRowCommand="GvComputadores_RowCommand" OnRowInserting="GvComputadores_RowInserting">
                                <SettingsPager PageSize="2000">
                                </SettingsPager>
                                <SettingsEditing Mode="PopupEditForm">
                                </SettingsEditing>
                                <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
                                <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
                                <Toolbars>
                                    <dx:GridViewToolbar >
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
                                                    <dx:ASPxButtonEdit ID="tbToolbarSearch2" runat="server" NullText="Search..." Height="100%">
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
                                    <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True"
                                        ShowInCustomizationForm="True" VisibleIndex="0" ShowClearFilterButton="True">
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="1">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Nombre_Equipo" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Direccion_MAC" VisibleIndex="6">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Modelo" VisibleIndex="8">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="RAM" VisibleIndex="9">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Procesador" VisibleIndex="10">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Disco" VisibleIndex="11">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="Marca" ShowInCustomizationForm="True" VisibleIndex="7">
                                        <PropertiesComboBox DataSourceID="LqsMarca1" TextField="MARCA" ValueField="ID">
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="Sistema_Operativo" ShowInCustomizationForm="True" VisibleIndex="12">
                                        <PropertiesComboBox DataSourceID="LqsSO" TextField="SistemaOperativo" ValueField="ID">
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="Area_u_Oficina" ShowInCustomizationForm="True" VisibleIndex="13">
                                        <PropertiesComboBox DataSourceID="LqsArea1" TextField="Nombre" ValueField="Id_Area">
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="Dispositivo" ShowInCustomizationForm="True" VisibleIndex="4">
                                        <PropertiesComboBox DataSourceID="LqsTipoDispositivo1" TextField="Nombre" ValueField="Id_tipoDispositivo">
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataComboBoxColumn Caption="Usuario" FieldName="ID_Usuario" ShowInCustomizationForm="True" VisibleIndex="2">
                                        <PropertiesComboBox DataSourceID="LqsPersonalAsignado1" ValueField="pin">
                                            <Columns>
                                                <dx:ListBoxColumn Caption="Run" FieldName="pin">
                                                </dx:ListBoxColumn>
                                                <dx:ListBoxColumn Caption="Nombre" FieldName="name">
                                                </dx:ListBoxColumn>
                                                <dx:ListBoxColumn Caption="Apellido" FieldName="last_name">
                                                </dx:ListBoxColumn>
                                            </Columns>
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataTextColumn Caption="Codigo Inventario" FieldName="Cod_AF" ShowInCustomizationForm="True" VisibleIndex="14">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataHyperLinkColumn Caption="Adjuntos" VisibleIndex="16">
                                        <EditFormSettings Visible="False" />
                                        <DataItemTemplate>
                                            <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/menu.png" />
                                        </DataItemTemplate>
                                    </dx:GridViewDataHyperLinkColumn>
                                    <dx:GridViewDataHyperLinkColumn Caption="Dar de Baja" VisibleIndex="17">
                                        <EditFormSettings Visible="False" />
                                        <DataItemTemplate>
                                            <asp:ImageButton ID="bajadaEquipo" CommandName="cmdBajada" runat="server" ImageUrl="~/Images/delete.png" />
                                        </DataItemTemplate>
                                        <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                                        </CellStyle>
                                    </dx:GridViewDataHyperLinkColumn>
                                    <dx:GridViewDataTextColumn FieldName="CodLicencia" ShowInCustomizationForm="True" VisibleIndex="15">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Direccion_IP" ShowInCustomizationForm="True" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <Styles>
                                    <FocusedRow BackColor="#FF9933">
                                    </FocusedRow>
                                </Styles>
                                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

                                <SettingsSearchPanel CustomEditorID="tbToolbarSearch2" />
                            </dx:ASPxGridView>
                            <asp:LinqDataSource ID="LqDsComputadores" runat="server"
                                ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
                                TableName="CVT_INF_Computador" EnableDelete="True" EnableInsert="True"
                                EnableUpdate="True" Where="Estado == @Estado">
                                <WhereParameters>
                                    <asp:Parameter DefaultValue="1" Name="Estado" Type="Int32" />
                                </WhereParameters>
                            </asp:LinqDataSource>
                            <asp:LinqDataSource ID="LqsMarca1" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_INF_MARCA">
                            </asp:LinqDataSource>
                            <asp:LinqDataSource ID="LqsArea1" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_AreaTrabajo">
                            </asp:LinqDataSource>
                            <asp:LinqDataSource ID="LqsSO" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_INF_SistemaOperativo">
                            </asp:LinqDataSource>
                            <asp:LinqDataSource ID="LqsPersonalAsignado1" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTControlBIODataContext" EntityTypeName="" Select="new (name, last_name, pin)" TableName="pers_person">
                            </asp:LinqDataSource>
                            <asp:LinqDataSource ID="LqsTipoDispositivo1" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_INF_TipoDispositivo" Where="IdFiltro == @IdFiltro">
                                <WhereParameters>
                                    <asp:Parameter DefaultValue="2" Name="IdFiltro" Type="Int32" />
                                </WhereParameters>
                            </asp:LinqDataSource>
                            <dx:ASPxGridViewExporter ID="ASPxGridViewExporter2" runat="server"
                                ExportedRowType="All" GridViewID="GvComputadores">
                            </dx:ASPxGridViewExporter>

                            <dx:ASPxPopupControl ID="PopComputadores" runat="server"
                                HeaderText="Bajada Computadores" AllowDragging="True" CloseAction="CloseButton" CloseAnimationType="Fade">
                                <ContentCollection>
                                    <dx:PopupControlContentControl runat="server">
                                        <div>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Motivo Baja"></dx:ASPxLabel>
                                                        <dx:ASPxComboBox ID="cboMotivocomputador" runat="server" ValueType="System.String" Height="30px">
                                                            <Items>
                                                                <dx:ListEditItem Text="Donacion" Value="Donacion" />
                                                                <dx:ListEditItem Text="Venta o Subasta" Value="Venta o Subasta" />
                                                                <dx:ListEditItem Text="Robo" Value="Robo" />
                                                                <dx:ListEditItem Text="Entrega a Empresa de Residuos" Value="Entrega a Empresa de Residuos" />
                                                                <dx:ListEditItem Text="Sin Reparacion" Value="Sin Reparacion" />
                                                                <dx:ListEditItem Text="Vida Util (Antiguedad)" Value="Vida Util (Antiguedad)" />
                                                            </Items>
                                                        </dx:ASPxComboBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <br />
                                        <div>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Observaciones"></dx:ASPxLabel>
                                                        <dx:ASPxMemo ID="txtObsComputador" runat="server" Height="71px" Width="243px"></dx:ASPxMemo>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div style="margin-left: 50px">
                                            <dx:ASPxButton ID="btnBajadaComputadores" runat="server" Text="GUARDAR" Height="40px" Theme="Glass" Width="140px" OnClick="btnBajadaComputadores_Click"></dx:ASPxButton>
                                        </div>
                                    </dx:PopupControlContentControl>
                                </ContentCollection>
                            </dx:ASPxPopupControl>

                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="IMPRESORAS" Name="Impresoras">
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl1" runat="server">
                            <div>
                                <p><strong>IMPRESORAS</strong></p>
                            </div>
                            <dx:ASPxGridView ID="GvImpresoras" runat="server" AutoGenerateColumns="False"
                                DataSourceID="LqDsImpresoras" KeyFieldName="ID" OnToolbarItemClick="GvImpresoras_ToolbarItemClick" OnRowCommand="GvImpresoras_RowCommand" OnRowInserting="GvImpresoras_RowInserting">
                                <SettingsPager PageSize="2000">
                                </SettingsPager>
                                <SettingsEditing Mode="PopupEditForm">
                                </SettingsEditing>
                                <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
                                <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
                                <Toolbars>
                                    <dx:GridViewToolbar >
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
                                                    <dx:ASPxButtonEdit ID="tbToolbarSearch3" runat="server" NullText="Search..." Height="100%">
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
                                    <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True"
                                        ShowInCustomizationForm="True" VisibleIndex="0" ShowClearFilterButton="True">
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="1">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Modelo" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Usuario" VisibleIndex="6">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Contraseña" VisibleIndex="7">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="MAC" VisibleIndex="8">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Direccion_IP" VisibleIndex="9">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Tóner" VisibleIndex="11">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Ubicación___Usuario" VisibleIndex="12">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="Marca" ShowInCustomizationForm="True" VisibleIndex="4">
                                        <PropertiesComboBox DataSourceID="LqsMarca5" TextField="MARCA" ValueField="ID">
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="Tipo_Dispositivo" ShowInCustomizationForm="True" VisibleIndex="2">
                                        <PropertiesComboBox>
                                            <Items>
                                                <dx:ListEditItem Text="Multifuncional" Value="Multifuncional" />
                                                <dx:ListEditItem Text="Impresora Laser" Value="Impresora Laser" />
                                                <dx:ListEditItem Text="Impresora Etiquetas" Value="Impresora Etiquetas" />
                                                <dx:ListEditItem Text="Multifunción Tinta" Value="Multifunción Tinta" />
                                            </Items>
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="Tipo_Contrato" ShowInCustomizationForm="True" VisibleIndex="3">
                                        <PropertiesComboBox>
                                            <Items>
                                                <dx:ListEditItem Text="Propias" Value="Propias" />
                                                <dx:ListEditItem Text="Arriendo" Value="Arriendo" />
                                            </Items>
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="Conectividad" ShowInCustomizationForm="True" VisibleIndex="10">
                                        <PropertiesComboBox>
                                            <Items>
                                                <dx:ListEditItem Text="Ethernet" Value="Ethernet" />
                                                <dx:ListEditItem Text="WIFI/USB 2.0" Value="WIFI/USB 2.0" />
                                                <dx:ListEditItem Text="USB 2.0" Value="USB 2.0" />
                                                <dx:ListEditItem Text="Serie, paralelo, USB" Value="Serie, paralelo, USB" />
                                                <dx:ListEditItem Text="Serie, paralelo, USB Ethernet/WIFI" Value="Serie, paralelo, USB Ethernet/WIFI" />
                                            </Items>
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataTextColumn Caption="Codigo Inventario" FieldName="Cod_AF" ShowInCustomizationForm="True" VisibleIndex="13">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataHyperLinkColumn Caption="Adjuntos" VisibleIndex="15">
                                        <EditFormSettings Visible="False" />
                                        <DataItemTemplate>
                                            <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/menu.png" />
                                        </DataItemTemplate>
                                    </dx:GridViewDataHyperLinkColumn>
                                    <dx:GridViewDataHyperLinkColumn Caption="Dar de Baja" VisibleIndex="17">
                                        <EditFormSettings Visible="False" />
                                        <DataItemTemplate>
                                            <asp:ImageButton ID="bajadaEquipo" CommandName="cmdBajadaImpresora" runat="server" ImageUrl="~/Images/delete.png" />
                                        </DataItemTemplate>
                                        <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                                        </CellStyle>
                                    </dx:GridViewDataHyperLinkColumn>
                                    <dx:GridViewDataTextColumn FieldName="Serie_Dimacofi" ShowInCustomizationForm="True" VisibleIndex="14">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <Styles>
                                    <FocusedRow BackColor="#FF9933">
                                    </FocusedRow>
                                </Styles>
                                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

                                <SettingsSearchPanel CustomEditorID="tbToolbarSearch3" />
                            </dx:ASPxGridView>
                            <asp:LinqDataSource ID="LqDsImpresoras" runat="server"
                                ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
                                TableName="CVT_INF_Impresora" EnableDelete="True" EnableInsert="True"
                                EnableUpdate="True" Where="Estado == @Estado">
                                <WhereParameters>
                                    <asp:Parameter DefaultValue="1" Name="Estado" Type="Int32" />
                                </WhereParameters>
                            </asp:LinqDataSource>
                            <asp:LinqDataSource ID="LqsMarca5" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_INF_MARCA">
                            </asp:LinqDataSource>
                            <dx:ASPxGridViewExporter ID="ASPxGridViewExporter3" runat="server"
                                ExportedRowType="All" GridViewID="GvImpresoras">
                            </dx:ASPxGridViewExporter>

                            <dx:ASPxPopupControl ID="PopImpresora" runat="server"
                                HeaderText="Bajada Impresoras" AllowDragging="True" CloseAction="CloseButton" CloseAnimationType="Fade">
                                <ContentCollection>
                                    <dx:PopupControlContentControl runat="server">
                                        <div>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Motivo Baja"></dx:ASPxLabel>
                                                        <dx:ASPxComboBox ID="cboMotivoImpresora" runat="server" ValueType="System.String" Height="30px">
                                                            <Items>
                                                                <dx:ListEditItem Text="Donacion" Value="Donacion" />
                                                                <dx:ListEditItem Text="Venta o Subasta" Value="Venta o Subasta" />
                                                                <dx:ListEditItem Text="Robo" Value="Robo" />
                                                                <dx:ListEditItem Text="Entrega a Empresa de Residuos" Value="Entrega a Empresa de Residuos" />
                                                                <dx:ListEditItem Text="Sin Reparacion" Value="Sin Reparacion" />
                                                                <dx:ListEditItem Text="Vida Util (Antiguedad)" Value="Vida Util (Antiguedad)" />
                                                            </Items>
                                                        </dx:ASPxComboBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <br />
                                        <div>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Observaciones"></dx:ASPxLabel>
                                                        <dx:ASPxMemo ID="txtObsImpresora" runat="server" Height="71px" Width="243px"></dx:ASPxMemo>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div style="margin-left: 50px">
                                            <dx:ASPxButton ID="btnBajadaImpresora" runat="server" Text="GUARDAR" Height="40px" Theme="Glass" Width="140px" OnClick="btnBajadaImpresora_Click"></dx:ASPxButton>
                                        </div>
                                    </dx:PopupControlContentControl>
                                </ContentCollection>
                            </dx:ASPxPopupControl>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="RF" Name="RF">
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl2" runat="server">
                            <div>
                                <p><strong>RF</strong></p>
                            </div>
                            <dx:ASPxGridView ID="GvRF" runat="server" AutoGenerateColumns="False"
                                DataSourceID="LqDsRF" KeyFieldName="ID" OnToolbarItemClick="GvRF_ToolbarItemClick" OnRowCommand="GvRF_RowCommand" OnRowInserting="GvRF_RowInserting">
                                <SettingsPager PageSize="2000">
                                </SettingsPager>
                                <SettingsEditing Mode="PopupEditForm">
                                </SettingsEditing>
                                <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
                                <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
                                <Toolbars>
                                    <dx:GridViewToolbar >
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
                                                    <dx:ASPxButtonEdit ID="tbToolbarSearch4" runat="server" NullText="Search..." Height="100%">
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
                                    <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True"
                                        ShowInCustomizationForm="True" VisibleIndex="0" ShowClearFilterButton="True">
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="1">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Modelo" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="IP" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Part_Number" VisibleIndex="6">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Serial_Number" VisibleIndex="7">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="MAC" VisibleIndex="8">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="RAM" VisibleIndex="10">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="CPU" VisibleIndex="11">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Flash_Size" VisibleIndex="12">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="Marca" ShowInCustomizationForm="True" VisibleIndex="3">
                                        <PropertiesComboBox DataSourceID="lqsMarca7" TextField="MARCA" ValueField="ID">
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="Sistema_Operativo" ShowInCustomizationForm="True" VisibleIndex="9">
                                        <PropertiesComboBox DataSourceID="lqsSO1" TextField="SistemaOperativo" ValueField="ID">
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="Usuario" ShowInCustomizationForm="True" VisibleIndex="13">
                                        <PropertiesComboBox DataSourceID="LqsPersonalAsignado0" ValueField="pin">
                                            <Columns>
                                                <dx:ListBoxColumn Caption="Rut" FieldName="pin">
                                                </dx:ListBoxColumn>
                                                <dx:ListBoxColumn Caption="Nombre" FieldName="name">
                                                </dx:ListBoxColumn>
                                                <dx:ListBoxColumn Caption="Apellido" FieldName="last_name">
                                                </dx:ListBoxColumn>
                                            </Columns>
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="Area" ShowInCustomizationForm="True" VisibleIndex="15">
                                        <PropertiesComboBox DataSourceID="LqsArea2" TextField="Nombre" ValueField="Id_Area">
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataComboBoxColumn Caption="Seg.Usuario" FieldName="UsuarioDos" ShowInCustomizationForm="True" VisibleIndex="14">
                                        <PropertiesComboBox DataSourceID="LqsPersonalAsignado0" ValueField="pin">
                                            <Columns>
                                                <dx:ListBoxColumn Caption="Run" FieldName="pin">
                                                </dx:ListBoxColumn>
                                                <dx:ListBoxColumn Caption="Nombre" FieldName="name">
                                                </dx:ListBoxColumn>
                                                <dx:ListBoxColumn Caption="Apellido" FieldName="last_name">
                                                </dx:ListBoxColumn>
                                            </Columns>
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="Dispositivo" ShowInCustomizationForm="True" VisibleIndex="2">
                                        <PropertiesComboBox DataSourceID="LqsTipoDispositivo0" TextField="Nombre" ValueField="Id_tipoDispositivo">
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataTextColumn Caption="Codigo Inventario" FieldName="Cod_AF" ShowInCustomizationForm="True" VisibleIndex="16">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataHyperLinkColumn Caption="Adjuntos" VisibleIndex="17">
                                        <EditFormSettings Visible="False" />
                                        <DataItemTemplate>
                                            <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/menu.png" />
                                        </DataItemTemplate>
                                    </dx:GridViewDataHyperLinkColumn>
                                    <dx:GridViewDataHyperLinkColumn Caption="Dar de Baja" VisibleIndex="17">
                                        <EditFormSettings Visible="False" />
                                        <DataItemTemplate>
                                            <asp:ImageButton ID="bajadaEquipo" CommandName="cmdBajadaRF" runat="server" ImageUrl="~/Images/delete.png" />
                                        </DataItemTemplate>
                                        <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                                        </CellStyle>
                                    </dx:GridViewDataHyperLinkColumn>
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
                                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
                                <SettingsSearchPanel CustomEditorID="tbToolbarSearch4" />
                            </dx:ASPxGridView>
                            <asp:LinqDataSource ID="LqDsRF" runat="server"
                                ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
                                TableName="CVT_INF_RadioFrecuencia" EnableDelete="True" EnableInsert="True"
                                EnableUpdate="True" Where="Estado == @Estado">
                                <WhereParameters>
                                    <asp:Parameter DefaultValue="1" Name="Estado" Type="Int32" />
                                </WhereParameters>
                            </asp:LinqDataSource>
                            <asp:LinqDataSource ID="lqsMarca7" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_INF_MARCA">
                            </asp:LinqDataSource>
                            <asp:LinqDataSource ID="lqsSO1" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_INF_SistemaOperativo">
                            </asp:LinqDataSource>
                            <asp:LinqDataSource ID="LqsPersonalAsignado0" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTControlBIODataContext" EntityTypeName="" Select="new (name, last_name, pin)" TableName="pers_person">
                            </asp:LinqDataSource>
                            <asp:LinqDataSource ID="LqsArea2" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_AreaTrabajo">
                            </asp:LinqDataSource>
                            <asp:LinqDataSource ID="LqsTipoDispositivo0" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_INF_TipoDispositivo" Where="IdFiltro == @IdFiltro">
                                <WhereParameters>
                                    <asp:Parameter DefaultValue="3" Name="IdFiltro" Type="Int32" />
                                </WhereParameters>
                            </asp:LinqDataSource>
                            <dx:ASPxGridViewExporter ID="ASPxGridViewExporter4" runat="server"
                                ExportedRowType="All" GridViewID="GvRF">
                            </dx:ASPxGridViewExporter>
                            <dx:ASPxPopupControl ID="PopRF" runat="server"
                                HeaderText="Bajada Radio Frecuencia" AllowDragging="True" CloseAction="CloseButton" CloseAnimationType="Fade">
                                <ContentCollection>
                                    <dx:PopupControlContentControl runat="server">
                                        <div>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Motivo Baja"></dx:ASPxLabel>
                                                        <dx:ASPxComboBox ID="cboRF" runat="server" ValueType="System.String" Height="30px">
                                                            <Items>
                                                                <dx:ListEditItem Text="Donacion" Value="Donacion" />
                                                                <dx:ListEditItem Text="Venta o Subasta" Value="Venta o Subasta" />
                                                                <dx:ListEditItem Text="Robo" Value="Robo" />
                                                                <dx:ListEditItem Text="Entrega a Empresa de Residuos" Value="Entrega a Empresa de Residuos" />
                                                                <dx:ListEditItem Text="Sin Reparacion" Value="Sin Reparacion" />
                                                                <dx:ListEditItem Text="Vida Util (Antiguedad)" Value="Vida Util (Antiguedad)" />
                                                            </Items>
                                                        </dx:ASPxComboBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <br />
                                        <div>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Observaciones"></dx:ASPxLabel>
                                                        <dx:ASPxMemo ID="txtObsRF" runat="server" Height="71px" Width="243px"></dx:ASPxMemo>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div style="margin-left: 50px">
                                            <dx:ASPxButton ID="btnBajadaRF" runat="server" Text="GUARDAR" Height="40px" Theme="Glass" Width="140px" OnClick="btnBajadaRF_Click"></dx:ASPxButton>
                                        </div>
                                    </dx:PopupControlContentControl>
                                </ContentCollection>
                            </dx:ASPxPopupControl>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="RED" Name="RED">
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl3" runat="server">
                            <div>
                                <p><strong>RED</strong></p>
                            </div>

                            <dx:ASPxGridView ID="GvRED" runat="server" AutoGenerateColumns="False"
                                DataSourceID="LqDsRED" KeyFieldName="ID" OnToolbarItemClick="GvRED_ToolbarItemClick" OnRowCommand="GvRED_RowCommand" OnRowInserting="GvRED_RowInserting">
                                <SettingsPager PageSize="2000">
                                </SettingsPager>
                                <SettingsEditing Mode="PopupEditForm">
                                </SettingsEditing>
                                <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
                                <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
                                <Toolbars>
                                    <dx:GridViewToolbar >
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
                                                    <dx:ASPxButtonEdit ID="tbToolbarSearch5" runat="server" NullText="Search..." Height="100%">
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
                                    <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True"
                                        ShowInCustomizationForm="True" VisibleIndex="0" ShowClearFilterButton="True">
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="1">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="IP" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="MAC" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Usuario" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Contraseña" VisibleIndex="6">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Modelo_" VisibleIndex="8">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Puertos_" VisibleIndex="10">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="SFP" VisibleIndex="11">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Firmware" VisibleIndex="12">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Ubicación" VisibleIndex="13">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Gateway" VisibleIndex="14">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Mascara_Subred" VisibleIndex="15">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="IP_Publica" VisibleIndex="16">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="DNS" VisibleIndex="17">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataDateColumn FieldName="Fecha_Compra" VisibleIndex="18">
                                    </dx:GridViewDataDateColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="Marca" ShowInCustomizationForm="True" VisibleIndex="7">
                                        <PropertiesComboBox DataSourceID="lqsMarca2" TextField="MARCA" ValueField="ID">
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="Dispositivo" ShowInCustomizationForm="True" VisibleIndex="2">
                                        <PropertiesComboBox>
                                            <Items>
                                                <dx:ListEditItem Text="Switch Administrable" Value="Switch Administrable" />
                                                <dx:ListEditItem Text="Switch NO Admin" Value="Switch NO Admin" />
                                                <dx:ListEditItem Text="Switch Fibra SFP" Value="Switch Fibra SFP" />
                                                <dx:ListEditItem Text="Firewall" Value="Firewall" />
                                                <dx:ListEditItem Text="Router" Value="Router" />
                                                <dx:ListEditItem Text="Modem" Value="Modem" />
                                            </Items>
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="Velocidad" ShowInCustomizationForm="True" VisibleIndex="9">
                                        <PropertiesComboBox>
                                            <Items>
                                                <dx:ListEditItem Text="10/100" Value="10/100" />
                                                <dx:ListEditItem Text="10/100/1000" Value="10/100/1000" />
                                            </Items>
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataTextColumn Caption="Codigo Inventario" FieldName="Cod_AF" ShowInCustomizationForm="True" VisibleIndex="19">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataHyperLinkColumn Caption="Adjuntos" VisibleIndex="20">
                                        <EditFormSettings Visible="False" />
                                        <DataItemTemplate>
                                            <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/menu.png" />
                                        </DataItemTemplate>
                                    </dx:GridViewDataHyperLinkColumn>
                                    <dx:GridViewDataHyperLinkColumn Caption="Dar de Baja" VisibleIndex="21">
                                        <EditFormSettings Visible="False" />
                                        <DataItemTemplate>
                                            <asp:ImageButton ID="bajadaEquipo" CommandName="cmdBajadaRed" runat="server" ImageUrl="~/Images/delete.png" />
                                        </DataItemTemplate>
                                        <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                                        </CellStyle>
                                    </dx:GridViewDataHyperLinkColumn>
                                </Columns>
                                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

                                <SettingsSearchPanel CustomEditorID="tbToolbarSearch5" />
                                <Styles>
                                    <FocusedRow BackColor="#FF9933">
                                    </FocusedRow>
                                </Styles>
                            </dx:ASPxGridView>
                            <asp:LinqDataSource ID="LqDsRED" runat="server"
                                ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
                                TableName="CVT_INF_EqRED" EnableDelete="True" EnableInsert="True"
                                EnableUpdate="True" Where="Estado == @Estado">
                                <WhereParameters>
                                    <asp:Parameter DefaultValue="1" Name="Estado" Type="Int32" />
                                </WhereParameters>
                            </asp:LinqDataSource>
                            <asp:LinqDataSource ID="lqsMarca2" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_INF_MARCA">
                            </asp:LinqDataSource>
                            <dx:ASPxGridViewExporter ID="ASPxGridViewExporter5" runat="server"
                                ExportedRowType="All" GridViewID="GvRED">
                            </dx:ASPxGridViewExporter>

                            <dx:ASPxPopupControl ID="PopRed" runat="server"
                                HeaderText="Bajada Equipo Red" AllowDragging="True" CloseAction="CloseButton" CloseAnimationType="Fade">
                                <ContentCollection>
                                    <dx:PopupControlContentControl runat="server">
                                        <div>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Motivo Baja"></dx:ASPxLabel>
                                                        <dx:ASPxComboBox ID="cboRed" runat="server" ValueType="System.String" Height="30px">
                                                            <Items>
                                                                <dx:ListEditItem Text="Donacion" Value="Donacion" />
                                                                <dx:ListEditItem Text="Venta o Subasta" Value="Venta o Subasta" />
                                                                <dx:ListEditItem Text="Robo" Value="Robo" />
                                                                <dx:ListEditItem Text="Entrega a Empresa de Residuos" Value="Entrega a Empresa de Residuos" />
                                                                <dx:ListEditItem Text="Sin Reparacion" Value="Sin Reparacion" />
                                                                <dx:ListEditItem Text="Vida Util (Antiguedad)" Value="Vida Util (Antiguedad)" />
                                                            </Items>
                                                        </dx:ASPxComboBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <br />
                                        <div>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Observaciones"></dx:ASPxLabel>
                                                        <dx:ASPxMemo ID="txtObsRed" runat="server" Height="71px" Width="243px"></dx:ASPxMemo>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div style="margin-left: 50px">
                                            <dx:ASPxButton ID="btnBajadaRed" runat="server" Text="GUARDAR" Height="40px" Theme="Glass" Width="140px" OnClick="btnBajadaRed_Click"></dx:ASPxButton>
                                        </div>
                                    </dx:PopupControlContentControl>
                                </ContentCollection>
                            </dx:ASPxPopupControl>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="WIFI" Name="WIFI">
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl4" runat="server">
                            <div>
                                <p><strong>WIFI</strong></p>
                            </div>
                            <dx:ASPxGridView ID="GvWIFI" runat="server" AutoGenerateColumns="False"
                                DataSourceID="LqDsWifi" KeyFieldName="ID" OnToolbarItemClick="GvWIFI_ToolbarItemClick" OnRowCommand="GvWIFI_RowCommand" OnRowInserting="GvWIFI_RowInserting">
                                <SettingsPager PageSize="2000">
                                </SettingsPager>
                                <SettingsEditing Mode="PopupEditForm">
                                </SettingsEditing>
                                <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
                                <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
                                <Toolbars>
                                    <dx:GridViewToolbar >
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
                                                    <dx:ASPxButtonEdit ID="tbToolbarSearch6" runat="server" NullText="Search..." Height="100%">
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
                                    <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True"
                                        ShowInCustomizationForm="True" VisibleIndex="0" ShowClearFilterButton="True">
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="1">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Usuario_Adm" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Contraseña_Adm" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Modelo" VisibleIndex="6">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="IP" VisibleIndex="7">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="MAC" VisibleIndex="8">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Ubicación" VisibleIndex="9">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Canal" VisibleIndex="11">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Firmware" VisibleIndex="12">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Conectado_a" VisibleIndex="13">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="SSID" VisibleIndex="14">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Clave" VisibleIndex="15">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="Marca" ShowInCustomizationForm="True" VisibleIndex="5">
                                        <PropertiesComboBox DataSourceID="lqsMarca4" TextField="MARCA" ValueField="ID">
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="Security_Type" ShowInCustomizationForm="True" VisibleIndex="10">
                                        <PropertiesComboBox>
                                            <Items>
                                                <dx:ListEditItem Text="WPA-PSK" Value="WPA-PSK" />
                                                <dx:ListEditItem Text="WPA2 Personal" Value="WPA2 Personal" />
                                                <dx:ListEditItem Text="WEP" Value="WEP" />
                                                <dx:ListEditItem Text="WPA2-PSK" Value="WPA2-PSK" />
                                                <dx:ListEditItem Text="WPAWPA2-PSK" Value="WPAWPA2-PSK" />
                                            </Items>
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="Dispositivo" ShowInCustomizationForm="True" VisibleIndex="2">
                                        <PropertiesComboBox>
                                            <Items>
                                                <dx:ListEditItem Text="Antena Punto a Punto" Value="Antena Punto a Punto" />
                                                <dx:ListEditItem Text="Router Inalambrico" Value="Router Inalambrico" />
                                                <dx:ListEditItem Text="Access Point" Value="Access Point" />
                                            </Items>
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataTextColumn Caption="Codigo Inventario" FieldName="Cod_AF" ShowInCustomizationForm="True" VisibleIndex="16">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataHyperLinkColumn Caption="Adjuntos" VisibleIndex="17">
                                        <EditFormSettings Visible="False" />
                                        <DataItemTemplate>
                                            <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/menu.png" />
                                        </DataItemTemplate>
                                    </dx:GridViewDataHyperLinkColumn>
                                    <dx:GridViewDataHyperLinkColumn Caption="Dar de Baja" VisibleIndex="21">
                                        <EditFormSettings Visible="False" />
                                        <DataItemTemplate>
                                            <asp:ImageButton ID="bajadaEquipo" CommandName="cmdBajadaWifi" runat="server" ImageUrl="~/Images/delete.png" />
                                        </DataItemTemplate>
                                        <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                                        </CellStyle>
                                    </dx:GridViewDataHyperLinkColumn>
                                </Columns>
                                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

                                <SettingsSearchPanel CustomEditorID="tbToolbarSearch6" />
                                <Styles>
                                    <FocusedRow BackColor="#FF9933">
                                    </FocusedRow>
                                </Styles>
                            </dx:ASPxGridView>
                            <asp:LinqDataSource ID="LqDsWifi" runat="server"
                                ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
                                TableName="CVT_INF_EqWireless" EnableDelete="True" EnableInsert="True"
                                EnableUpdate="True" Where="Estado == @Estado">
                                <WhereParameters>
                                    <asp:Parameter DefaultValue="1" Name="Estado" Type="Int32" />
                                </WhereParameters>
                            </asp:LinqDataSource>
                            <asp:LinqDataSource ID="lqsMarca4" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_INF_MARCA">
                            </asp:LinqDataSource>
                            <dx:ASPxGridViewExporter ID="ASPxGridViewExporter6" runat="server"
                                ExportedRowType="All" GridViewID="GvWIFI">
                            </dx:ASPxGridViewExporter>

                            <dx:ASPxPopupControl ID="PopWifi" runat="server"
                                HeaderText="Bajada Equipo Wireless" AllowDragging="True" CloseAction="CloseButton" CloseAnimationType="Fade">
                                <ContentCollection>
                                    <dx:PopupControlContentControl runat="server">
                                        <div>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Motivo Baja"></dx:ASPxLabel>
                                                        <dx:ASPxComboBox ID="cboWifi" runat="server" ValueType="System.String" Height="30px">
                                                            <Items>
                                                                <dx:ListEditItem Text="Donacion" Value="Donacion" />
                                                                <dx:ListEditItem Text="Venta o Subasta" Value="Venta o Subasta" />
                                                                <dx:ListEditItem Text="Robo" Value="Robo" />
                                                                <dx:ListEditItem Text="Entrega a Empresa de Residuos" Value="Entrega a Empresa de Residuos" />
                                                                <dx:ListEditItem Text="Sin Reparacion" Value="Sin Reparacion" />
                                                                <dx:ListEditItem Text="Vida Util (Antiguedad)" Value="Vida Util (Antiguedad)" />
                                                            </Items>
                                                        </dx:ASPxComboBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <br />
                                        <div>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Observaciones"></dx:ASPxLabel>
                                                        <dx:ASPxMemo ID="txtObsWifi" runat="server" Height="71px" Width="243px"></dx:ASPxMemo>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div style="margin-left: 50px">
                                            <dx:ASPxButton ID="btnBajadaWifi" runat="server" Text="GUARDAR" Height="40px" Theme="Glass" Width="140px" OnClick="btnBajadaWifi_Click"></dx:ASPxButton>
                                        </div>
                                    </dx:PopupControlContentControl>
                                </ContentCollection>
                            </dx:ASPxPopupControl>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="OTROS" Name="OTROS">
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl5" runat="server">
                            <div>
                                <p><strong>OTROS</strong></p>
                            </div>
                            <dx:ASPxGridView ID="GvOtros" runat="server" AutoGenerateColumns="False"
                                DataSourceID="LqDsOtros" KeyFieldName="ID" OnToolbarItemClick="GvOtros_ToolbarItemClick" OnRowCommand="GvOtros_RowCommand" OnRowInserting="GvOtros_RowInserting">
                                <SettingsPager PageSize="2000">
                                </SettingsPager>
                                <SettingsEditing Mode="PopupEditForm">
                                </SettingsEditing>
                                <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
                                <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
                                <Toolbars>
                                    <dx:GridViewToolbar >
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
                                                    <dx:ASPxButtonEdit ID="tbToolbarSearch7" runat="server" NullText="Search..." Height="100%">
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
                                    <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True"
                                        ShowInCustomizationForm="True" VisibleIndex="0" ShowClearFilterButton="True">
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="1">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Dispositivo" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Proveedor" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Modelo" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Direccion_IP" VisibleIndex="6">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="MAC" VisibleIndex="7">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Base_Datos" VisibleIndex="8">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Usuario_BD" VisibleIndex="9">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Contraseña_BD" VisibleIndex="10">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="Marca" ShowInCustomizationForm="True" VisibleIndex="4">
                                        <PropertiesComboBox DataSourceID="lqsMarca6" TextField="MARCA" ValueField="ID">
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataTextColumn Caption="Codigo Inventario" FieldName="Cod_AF" ShowInCustomizationForm="True" VisibleIndex="11">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataHyperLinkColumn Caption="Dar de Baja" VisibleIndex="21">
                                        <EditFormSettings Visible="False" />
                                        <DataItemTemplate>
                                            <asp:ImageButton ID="bajadaEquipo" CommandName="cmdBajadaOtros" runat="server" ImageUrl="~/Images/delete.png" />
                                        </DataItemTemplate>
                                        <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                                        </CellStyle>
                                    </dx:GridViewDataHyperLinkColumn>
                                </Columns>
                                <Styles>
                                    <FocusedRow BackColor="#FF9933">
                                    </FocusedRow>
                                </Styles>
                                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

                                <SettingsSearchPanel CustomEditorID="tbToolbarSearch7" />
                            </dx:ASPxGridView>
                            <asp:LinqDataSource ID="LqDsOtros" runat="server"
                                ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
                                TableName="CVT_INF_OtroEq" EnableDelete="True" EnableInsert="True"
                                EnableUpdate="True" Where="Estado == @Estado">
                                <WhereParameters>
                                    <asp:Parameter DefaultValue="1" Name="Estado" Type="Int32" />
                                </WhereParameters>
                            </asp:LinqDataSource>
                            <asp:LinqDataSource ID="lqsMarca6" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_INF_MARCA">
                            </asp:LinqDataSource>
                            <dx:ASPxGridViewExporter ID="ASPxGridViewExporter7" runat="server"
                                ExportedRowType="All" GridViewID="GvOtros">
                            </dx:ASPxGridViewExporter>

                            <dx:ASPxPopupControl ID="PopOtros" runat="server"
                                HeaderText="Bajada Otros Equipos" AllowDragging="True" CloseAction="CloseButton" CloseAnimationType="Fade">
                                <ContentCollection>
                                    <dx:PopupControlContentControl runat="server">
                                        <div>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel15" runat="server" Text="Motivo Baja"></dx:ASPxLabel>
                                                        <dx:ASPxComboBox ID="cboOtros" runat="server" ValueType="System.String" Height="30px">
                                                            <Items>
                                                                <dx:ListEditItem Text="Donacion" Value="Donacion" />
                                                                <dx:ListEditItem Text="Venta o Subasta" Value="Venta o Subasta" />
                                                                <dx:ListEditItem Text="Robo" Value="Robo" />
                                                                <dx:ListEditItem Text="Entrega a Empresa de Residuos" Value="Entrega a Empresa de Residuos" />
                                                                <dx:ListEditItem Text="Sin Reparacion" Value="Sin Reparacion" />
                                                                <dx:ListEditItem Text="Vida Util (Antiguedad)" Value="Vida Util (Antiguedad)" />
                                                            </Items>
                                                        </dx:ASPxComboBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <br />
                                        <div>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel16" runat="server" Text="Observaciones"></dx:ASPxLabel>
                                                        <dx:ASPxMemo ID="txtObsOtros" runat="server" Height="71px" Width="243px"></dx:ASPxMemo>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div style="margin-left: 50px">
                                            <dx:ASPxButton ID="btnBajadaOtros" runat="server" Text="GUARDAR" Height="40px" Theme="Glass" Width="140px" OnClick="btnBajadaOtros_Click"></dx:ASPxButton>
                                        </div>
                                    </dx:PopupControlContentControl>
                                </ContentCollection>
                            </dx:ASPxPopupControl>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="VIDEO VIGILANCIA" Name="VIDEO VIGILANCIA">
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl6" runat="server">
                            <div>
                                <p><strong>VIDEO VIGILANCIA</strong></p>
                            </div>
                            <dx:ASPxGridView ID="GvVideo" runat="server" AutoGenerateColumns="False"
                                DataSourceID="LqDsVideo" KeyFieldName="ID" OnToolbarItemClick="GvVideo_ToolbarItemClick" OnRowCommand="GvVideo_RowCommand" OnRowInserting="GvVideo_RowInserting">
                                <SettingsPager PageSize="2000">
                                </SettingsPager>
                                <SettingsEditing Mode="PopupEditForm">
                                </SettingsEditing>
                                <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
                                <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
                                <Toolbars>
                                    <dx:GridViewToolbar >
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
                                                    <dx:ASPxButtonEdit ID="tbToolbarSearch8" runat="server" NullText="Search..." Height="100%">
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
                                    <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True"
                                        ShowInCustomizationForm="True" VisibleIndex="0" ShowClearFilterButton="True">
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="1">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Modelo" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Usuario" VisibleIndex="6">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Contraseña" VisibleIndex="7">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Acceso" VisibleIndex="8">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Dirección_MAC" VisibleIndex="9">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Firmware" VisibleIndex="10">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Resolución" VisibleIndex="11">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="NVR" VisibleIndex="12">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Conectada__a" VisibleIndex="13">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Monitoreo" VisibleIndex="14">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Almacenamiento" VisibleIndex="15">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Codificacion" VisibleIndex="16">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="Marca" ShowInCustomizationForm="True" VisibleIndex="5">
                                        <PropertiesComboBox DataSourceID="lqsMarca9" TextField="MARCA" ValueField="ID">
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="Dispositivo" ShowInCustomizationForm="True" VisibleIndex="2">
                                        <PropertiesComboBox>
                                            <Items>
                                                <dx:ListEditItem Text="Camera IP" Value="Camera IP" />
                                                <dx:ListEditItem Text="NVR" Value="NVR" />
                                                <dx:ListEditItem Text="DVR" Value="DVR" />
                                                <dx:ListEditItem Text="Video Portero" Value="Video Portero" />
                                            </Items>
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataComboBoxColumn Caption="Tipo " FieldName="Tipo_" ShowInCustomizationForm="True" VisibleIndex="3">
                                        <PropertiesComboBox>
                                            <Items>
                                                <dx:ListEditItem Text="Bullet" Value="Bullet" />
                                                <dx:ListEditItem Text="Domo" Value="Domo" />
                                                <dx:ListEditItem Text="SobreMesa" Value="SobreMesa" />
                                                <dx:ListEditItem Text="PTZ" Value="PTZ" />
                                                <dx:ListEditItem Text="Equipo Grabación" Value="Equipo Grabación" />
                                            </Items>
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataHyperLinkColumn Caption="Adjuntos" VisibleIndex="17">
                                        <EditFormSettings Visible="False" />
                                        <DataItemTemplate>
                                            <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/menu.png" />
                                        </DataItemTemplate>
                                    </dx:GridViewDataHyperLinkColumn>
                                    <dx:GridViewDataHyperLinkColumn Caption="Dar de Baja" VisibleIndex="21">
                                        <EditFormSettings Visible="False" />
                                        <DataItemTemplate>
                                            <asp:ImageButton ID="bajadaEquipo" CommandName="cmdBajadaVideo" runat="server" ImageUrl="~/Images/delete.png" />
                                        </DataItemTemplate>
                                        <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                                        </CellStyle>
                                    </dx:GridViewDataHyperLinkColumn>
                                </Columns>
                                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

                                <SettingsSearchPanel CustomEditorID="tbToolbarSearch8" />
                                <Styles>
                                    <FocusedRow BackColor="#FF9933">
                                    </FocusedRow>
                                </Styles>
                            </dx:ASPxGridView>
                            <asp:LinqDataSource ID="LqDsVideo" runat="server"
                                ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
                                TableName="CVT_INF_VideoVigilancia" EnableDelete="True" EnableInsert="True"
                                EnableUpdate="True" Where="Estado == @Estado">
                                <WhereParameters>
                                    <asp:Parameter DefaultValue="1" Name="Estado" Type="Int32" />
                                </WhereParameters>
                            </asp:LinqDataSource>
                            <asp:LinqDataSource ID="lqsMarca9" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_INF_MARCA">
                            </asp:LinqDataSource>
                            <dx:ASPxGridViewExporter ID="ASPxGridViewExporter8" runat="server"
                                ExportedRowType="All" GridViewID="GvVideo">
                            </dx:ASPxGridViewExporter>

                            <dx:ASPxPopupControl ID="Popvideo" runat="server"
                                HeaderText="Bajada Equipo Video Vigilancia" AllowDragging="True" CloseAction="CloseButton" CloseAnimationType="Fade">
                                <ContentCollection>
                                    <dx:PopupControlContentControl runat="server">
                                        <div>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="Motivo Baja"></dx:ASPxLabel>
                                                        <dx:ASPxComboBox ID="cboVideo" runat="server" ValueType="System.String" Height="30px">
                                                            <Items>
                                                                <dx:ListEditItem Text="Donacion" Value="Donacion" />
                                                                <dx:ListEditItem Text="Venta o Subasta" Value="Venta o Subasta" />
                                                                <dx:ListEditItem Text="Robo" Value="Robo" />
                                                                <dx:ListEditItem Text="Entrega a Empresa de Residuos" Value="Entrega a Empresa de Residuos" />
                                                                <dx:ListEditItem Text="Sin Reparacion" Value="Sin Reparacion" />
                                                                <dx:ListEditItem Text="Vida Util (Antiguedad)" Value="Vida Util (Antiguedad)" />
                                                            </Items>
                                                        </dx:ASPxComboBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <br />
                                        <div>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel14" runat="server" Text="Observaciones"></dx:ASPxLabel>
                                                        <dx:ASPxMemo ID="txtObsVideo" runat="server" Height="71px" Width="243px"></dx:ASPxMemo>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div style="margin-left: 50px">
                                            <dx:ASPxButton ID="btnBajadaVideo" runat="server" Text="GUARDAR" Height="40px" Theme="Glass" Width="140px" OnClick="btnBajadaVideo_Click"></dx:ASPxButton>
                                        </div>
                                    </dx:PopupControlContentControl>
                                </ContentCollection>
                            </dx:ASPxPopupControl>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="UPS" Name="UPS">
                    <ContentCollection>
                        <dx:ContentControl ID="ContentControl7" runat="server">
                            <div>
                                <p><strong>UPS</strong></p>
                            </div>
                            <dx:ASPxGridView ID="GvUPS" runat="server" AutoGenerateColumns="False"
                                DataSourceID="LqDsUPS" KeyFieldName="ID" OnToolbarItemClick="GvUPS_ToolbarItemClick" OnRowCommand="GvUPS_RowCommand" OnRowInserting="GvUPS_RowInserting">
                                <SettingsPager PageSize="2000">
                                </SettingsPager>
                                <SettingsEditing Mode="PopupEditForm">
                                </SettingsEditing>
                                <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
                                <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
                                <Toolbars>
                                    <dx:GridViewToolbar >
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
                                                    <dx:ASPxButtonEdit ID="tbToolbarSearch9" runat="server" NullText="Search..." Height="100%">
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
                                    <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True"
                                        ShowInCustomizationForm="True" VisibleIndex="0" ShowClearFilterButton="True">
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="1">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Modelo" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Capacidad" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Entrada" VisibleIndex="6">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Salida" VisibleIndex="7">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Potencia" VisibleIndex="8">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Numero_de_Tomas" VisibleIndex="9">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Tiempo_de_Respaldo__" VisibleIndex="10">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Rack_de_comunicaciones" VisibleIndex="11">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="Marca" ShowInCustomizationForm="True" VisibleIndex="3">
                                        <PropertiesComboBox DataSourceID="lqsMarca3" TextField="MARCA" ValueField="ID">
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="Dispositivo" ShowInCustomizationForm="True" VisibleIndex="2">
                                        <PropertiesComboBox>
                                            <Items>
                                                <dx:ListEditItem Text="UPS Online" Value="UPS Online" />
                                                <dx:ListEditItem Text="UPS Interactiva" Value="UPS Interactiva" />
                                                <dx:ListEditItem Text="UPS Ondapura" Value="UPS Ondapura" />
                                            </Items>
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                    <dx:GridViewDataTextColumn Caption="Codigo Inventario" FieldName="Cod_AF" ShowInCustomizationForm="True" VisibleIndex="12">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataHyperLinkColumn Caption="Dar de Baja" VisibleIndex="21">
                                        <EditFormSettings Visible="False" />
                                        <DataItemTemplate>
                                            <asp:ImageButton ID="bajadaEquipo" CommandName="cmdBajadaUps" runat="server" ImageUrl="~/Images/delete.png" />
                                        </DataItemTemplate>
                                        <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                                        </CellStyle>
                                    </dx:GridViewDataHyperLinkColumn>
                                </Columns>
                                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

                                <SettingsSearchPanel CustomEditorID="tbToolbarSearch9" />
                                <Styles>
                                    <FocusedRow BackColor="#FF9933">
                                    </FocusedRow>
                                </Styles>
                            </dx:ASPxGridView>
                            <asp:LinqDataSource ID="LqDsUPS" runat="server"
                                ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
                                TableName="CVT_INF_EqRespaldoEnergia" EnableDelete="True" EnableInsert="True"
                                EnableUpdate="True" Where="Estado == @Estado">
                                <WhereParameters>
                                    <asp:Parameter DefaultValue="1" Name="Estado" Type="Int32" />
                                </WhereParameters>
                            </asp:LinqDataSource>
                            <asp:LinqDataSource ID="lqsMarca3" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_INF_MARCA">
                            </asp:LinqDataSource>
                            <dx:ASPxGridViewExporter ID="ASPxGridViewExporter9" runat="server"
                                ExportedRowType="All" GridViewID="GvUPS">
                            </dx:ASPxGridViewExporter>

                            <dx:ASPxPopupControl ID="PopUps" runat="server"
                                HeaderText="Bajada Equipo Ups" AllowDragging="True" CloseAction="CloseButton" CloseAnimationType="Fade">
                                <ContentCollection>
                                    <dx:PopupControlContentControl runat="server">
                                        <div>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel17" runat="server" Text="Motivo Baja"></dx:ASPxLabel>
                                                        <dx:ASPxComboBox ID="cboUps" runat="server" ValueType="System.String" Height="30px">
                                                            <Items>
                                                                <dx:ListEditItem Text="Donacion" Value="Donacion" />
                                                                <dx:ListEditItem Text="Venta o Subasta" Value="Venta o Subasta" />
                                                                <dx:ListEditItem Text="Robo" Value="Robo" />
                                                                <dx:ListEditItem Text="Entrega a Empresa de Residuos" Value="Entrega a Empresa de Residuos" />
                                                                <dx:ListEditItem Text="Sin Reparacion" Value="Sin Reparacion" />
                                                                <dx:ListEditItem Text="Vida Util (Antiguedad)" Value="Vida Util (Antiguedad)" />
                                                            </Items>
                                                        </dx:ASPxComboBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <br />
                                        <div>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel18" runat="server" Text="Observaciones"></dx:ASPxLabel>
                                                        <dx:ASPxMemo ID="txtObsUps" runat="server" Height="71px" Width="243px"></dx:ASPxMemo>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div style="margin-left: 50px">
                                            <dx:ASPxButton ID="btnBajadaUps" runat="server" Text="GUARDAR" Height="40px" Theme="Glass" Width="140px" OnClick="btnBajadaUps_Click"></dx:ASPxButton>
                                        </div>
                                    </dx:PopupControlContentControl>
                                </ContentCollection>
                            </dx:ASPxPopupControl>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>              
                <dx:TabPage Name="TELEFONIA FIJA" Text="TELEFONIA FIJA">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                            <div>
                                <div>
                                    <p><strong>TELEFONIA FIJA</strong></p>
                                </div>
                                <br />
                                <div>
                                    <dx:ASPxGridView ID="GvTFija" runat="server" AutoGenerateColumns="False" DataSourceID="lqsTFija" KeyFieldName="ID_TFija" OnToolbarItemClick="GvTFija_ToolbarItemClick" OnRowCommand="GvTFija_RowCommand" OnRowInserting="GvTFija_RowInserting">
                                        <SettingsPager PageSize="2000">
                                        </SettingsPager>
                                        <SettingsEditing Mode="PopupEditForm">
                                        </SettingsEditing>
                                        <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
                                        <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
                                        <Toolbars>
                                            <dx:GridViewToolbar >
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
                                                            <dx:ASPxButtonEdit ID="tbToolbarSearch12" runat="server" NullText="Search..." Height="100%">
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
                                            <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                            </dx:GridViewCommandColumn>
                                            <dx:GridViewDataTextColumn Caption="ID" FieldName="ID_TFija" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                                <EditFormSettings Visible="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="VlanID" ShowInCustomizationForm="True" VisibleIndex="2">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Usuario" ShowInCustomizationForm="True" VisibleIndex="5">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Anexo" ShowInCustomizationForm="True" VisibleIndex="6">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="DireccionIP" ShowInCustomizationForm="True" VisibleIndex="7">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="DireccionMAC" ShowInCustomizationForm="True" VisibleIndex="8">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Modelo" ShowInCustomizationForm="True" VisibleIndex="10">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Otros" ShowInCustomizationForm="True" VisibleIndex="11">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataComboBoxColumn FieldName="Dispositivo" ShowInCustomizationForm="True" VisibleIndex="3">
                                                <PropertiesComboBox>
                                                    <Items>
                                                        <dx:ListEditItem Text="Central Telefonica" Value="Central Telefonica" />
                                                        <dx:ListEditItem Text="Libre" Value="Libre" />
                                                        <dx:ListEditItem Text="Telefono IP" Value="Telefono IP" />
                                                    </Items>
                                                </PropertiesComboBox>
                                            </dx:GridViewDataComboBoxColumn>
                                            <dx:GridViewDataComboBoxColumn FieldName="Oficina" ShowInCustomizationForm="True" VisibleIndex="4">
                                                <PropertiesComboBox>
                                                    <Items>
                                                        <dx:ListEditItem Text="Buin" Value="Buin" />
                                                        <dx:ListEditItem Text="Lo Barnechea" Value="Lo Barnechea" />
                                                    </Items>
                                                </PropertiesComboBox>
                                            </dx:GridViewDataComboBoxColumn>
                                            <dx:GridViewDataComboBoxColumn FieldName="Marca" ShowInCustomizationForm="True" VisibleIndex="9">
                                                <PropertiesComboBox DataSourceID="lqsMarca10" TextField="MARCA" ValueField="ID">
                                                </PropertiesComboBox>
                                            </dx:GridViewDataComboBoxColumn>
                                            <dx:GridViewDataTextColumn Caption="Codigo Inventario" FieldName="Cod_AF" ShowInCustomizationForm="True" VisibleIndex="12">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataHyperLinkColumn Caption="Dar de Baja" VisibleIndex="21">
                                                <EditFormSettings Visible="False" />
                                                <DataItemTemplate>
                                                    <asp:ImageButton ID="bajadaEquipo" CommandName="cmdBajadaTF" runat="server" ImageUrl="~/Images/delete.png" />
                                                </DataItemTemplate>
                                                <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                                                </CellStyle>
                                            </dx:GridViewDataHyperLinkColumn>
                                        </Columns>
                                        <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

                                        <SettingsSearchPanel CustomEditorID="tbToolbarSearch12" />
                                        <Styles>
                                            <FocusedRow BackColor="#FF9933">
                                            </FocusedRow>
                                        </Styles>
                                    </dx:ASPxGridView>
                                    <asp:LinqDataSource ID="lqsTFija" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_INF_Telefonia_Fija" Where="Estado == @Estado">
                                        <WhereParameters>
                                            <asp:Parameter DefaultValue="1" Name="Estado" Type="Int32" />
                                        </WhereParameters>
                                    </asp:LinqDataSource>
                                    <asp:LinqDataSource ID="lqsMarca10" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_INF_MARCA">
                                    </asp:LinqDataSource>
                                    <%--  <dx:ASPxGridViewExporter ID="ASPxGridViewExporter12" runat="server" ExportedRowType="All" GridViewID="GvTFija">
                                    </dx:ASPxGridViewExporter>--%>
                                </div>
                            </div>

                            <dx:ASPxPopupControl ID="PopTelF" runat="server"
                                HeaderText="Bajada Equipo Telefonia Fija" AllowDragging="True" CloseAction="CloseButton" CloseAnimationType="Fade">
                                <ContentCollection>
                                    <dx:PopupControlContentControl runat="server">
                                        <div>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel19" runat="server" Text="Motivo Baja"></dx:ASPxLabel>
                                                        <dx:ASPxComboBox ID="cboTF" runat="server" ValueType="System.String" Height="30px">
                                                            <Items>
                                                                <dx:ListEditItem Text="Donacion" Value="Donacion" />
                                                                <dx:ListEditItem Text="Venta o Subasta" Value="Venta o Subasta" />
                                                                <dx:ListEditItem Text="Robo" Value="Robo" />
                                                                <dx:ListEditItem Text="Entrega a Empresa de Residuos" Value="Entrega a Empresa de Residuos" />
                                                                <dx:ListEditItem Text="Sin Reparacion" Value="Sin Reparacion" />
                                                                <dx:ListEditItem Text="Vida Util (Antiguedad)" Value="Vida Util (Antiguedad)" />
                                                            </Items>
                                                        </dx:ASPxComboBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <br />
                                        <div>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel20" runat="server" Text="Observaciones"></dx:ASPxLabel>
                                                        <dx:ASPxMemo ID="txtObsTF" runat="server" Height="71px" Width="243px"></dx:ASPxMemo>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div style="margin-left: 50px">
                                            <dx:ASPxButton ID="btnBajaTF" runat="server" Text="GUARDAR" Height="40px" Theme="Glass" Width="140px" OnClick="btnBajaTF_Click1"></dx:ASPxButton>
                                        </div>
                                    </dx:PopupControlContentControl>
                                </ContentCollection>
                            </dx:ASPxPopupControl>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Name="EQUIPOS MOVILES" Text="EQUIPOS MOVILES">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                            <div>
                                <div>
                                    <div>
                                        <p><strong>EQUIPOS MOVILES</strong></p>
                                    </div>
                                    <br />
                                </div>
                                <br />
                                <div>
                                    <dx:ASPxGridView ID="GvEquiposMoviles" runat="server" AutoGenerateColumns="False" DataSourceID="LqsEquiposMovil" KeyFieldName="Id_EquiposMoviles" OnToolbarItemClick="GvEquiposMoviles_ToolbarItemClick" OnRowCommand="GvEquiposMoviles_RowCommand" OnRowInserting="GvEquiposMoviles_RowInserting">
                                        <SettingsPager PageSize="150">
                                        </SettingsPager>
                                        <SettingsEditing Mode="PopupEditForm">
                                        </SettingsEditing>
                                        <Settings ShowFilterRow="True" ShowGroupPanel="True" AutoFilterCondition="Contains" />
                                        <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
                                        <Toolbars>
                                            <dx:GridViewToolbar >
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
                                                            <dx:ASPxButtonEdit ID="tbToolbarSearch13" runat="server" NullText="Search..." Height="100%">
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
                                            <dx:GridViewDataTextColumn Caption="ID" FieldName="Id_EquiposMoviles" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                                <EditFormSettings Visible="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="IMEI" ShowInCustomizationForm="True" VisibleIndex="2">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Modelo" ShowInCustomizationForm="True" VisibleIndex="4">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Codigo Inventario" FieldName="Cod_AF" ShowInCustomizationForm="True" VisibleIndex="8">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Ram" ShowInCustomizationForm="True" VisibleIndex="5">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Procesador" ShowInCustomizationForm="True" VisibleIndex="6">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataComboBoxColumn Caption="Marca" FieldName="id_Marca" ShowInCustomizationForm="True" VisibleIndex="3">
                                                <PropertiesComboBox DataSourceID="LqsMarca11" TextField="MARCA" ValueField="ID">
                                                </PropertiesComboBox>
                                            </dx:GridViewDataComboBoxColumn>
                                            <dx:GridViewDataComboBoxColumn FieldName="SO" ShowInCustomizationForm="True" VisibleIndex="7">
                                                <PropertiesComboBox DataSourceID="LqsSO3" TextField="SistemaOperativo" ValueField="ID">
                                                </PropertiesComboBox>
                                            </dx:GridViewDataComboBoxColumn>
                                            <dx:GridViewDataHyperLinkColumn Caption="Adjuntos" VisibleIndex="17">
                                                <EditFormSettings Visible="False" />
                                                <DataItemTemplate>
                                                    <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/menu.png" />
                                                </DataItemTemplate>
                                            </dx:GridViewDataHyperLinkColumn>
                                            <dx:GridViewDataHyperLinkColumn Caption="Dar de Baja" VisibleIndex="21">
                                                <EditFormSettings Visible="False" />
                                                <DataItemTemplate>
                                                    <asp:ImageButton ID="bajadaEquipo" CommandName="cmdBajadaEM" runat="server" ImageUrl="~/Images/delete.png" />
                                                </DataItemTemplate>
                                                <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                                                </CellStyle>
                                            </dx:GridViewDataHyperLinkColumn>
                                        </Columns>
                                        <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

                                        <SettingsSearchPanel CustomEditorID="tbToolbarSearch13" />
                                    </dx:ASPxGridView>
                                    <asp:LinqDataSource ID="LqsEquiposMovil" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_INF_EquiposMoviles" EnableDelete="True" EnableInsert="True" EnableUpdate="True" Where="Estado == @Estado">
                                        <WhereParameters>
                                            <asp:Parameter DefaultValue="1" Name="Estado" Type="Int32" />
                                        </WhereParameters>
                                    </asp:LinqDataSource>
                                    <asp:LinqDataSource ID="LqsMarca11" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_INF_MARCA">
                                    </asp:LinqDataSource>
                                    <asp:LinqDataSource ID="LqsSO3" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_INF_SistemaOperativo">
                                    </asp:LinqDataSource>
                                </div>
                            </div>

                            <dx:ASPxPopupControl ID="PopEM" runat="server"
                                HeaderText="Bajada Equipos Moviles" AllowDragging="True" CloseAction="CloseButton" CloseAnimationType="Fade">
                                <ContentCollection>
                                    <dx:PopupControlContentControl runat="server">
                                        <div>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel21" runat="server" Text="Motivo Baja"></dx:ASPxLabel>
                                                        <dx:ASPxComboBox ID="cboEM" runat="server" ValueType="System.String" Height="30px">
                                                            <Items>
                                                                <dx:ListEditItem Text="Donacion" Value="Donacion" />
                                                                <dx:ListEditItem Text="Venta o Subasta" Value="Venta o Subasta" />
                                                                <dx:ListEditItem Text="Robo" Value="Robo" />
                                                                <dx:ListEditItem Text="Entrega a Empresa de Residuos" Value="Entrega a Empresa de Residuos" />
                                                                <dx:ListEditItem Text="Sin Reparacion" Value="Sin Reparacion" />
                                                                <dx:ListEditItem Text="Vida Util (Antiguedad)" Value="Vida Util (Antiguedad)" />
                                                            </Items>
                                                        </dx:ASPxComboBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <br />
                                        <div>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel22" runat="server" Text="Observaciones"></dx:ASPxLabel>
                                                        <dx:ASPxMemo ID="txtObsEM" runat="server" Height="71px" Width="243px"></dx:ASPxMemo>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div style="margin-left: 50px">
                                            <dx:ASPxButton ID="btnBajadaEM" runat="server" Text="GUARDAR" Height="40px" Theme="Glass" Width="140px" OnClick="btnBajadaEM_Click"></dx:ASPxButton>
                                        </div>
                                    </dx:PopupControlContentControl>
                                </ContentCollection>
                            </dx:ASPxPopupControl>

                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Name="MONITORES" Text="MONITORES">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                            <div>
                                <div>
                                    <div>
                                        <p><strong>MONITORES</strong></p>
                                    </div>
                                    <br />
                                </div>
                                <br />
                                <div>
                                    <dx:ASPxGridView ID="GvMonitores" runat="server" AutoGenerateColumns="False" DataSourceID="LqsMonitores" KeyFieldName="Id_invMonitores" OnToolbarItemClick="GvMonitores_ToolbarItemClick" OnRowCommand="GvMonitores_RowCommand" OnRowInserting="GvMonitores_RowInserting">
                                        <SettingsPager PageSize="150">
                                        </SettingsPager>
                                        <SettingsEditing Mode="PopupEditForm">
                                        </SettingsEditing>
                                        <Settings ShowFilterRow="True" ShowGroupPanel="True" AutoFilterCondition="Contains" />
                                        <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
                                        <Columns>
                                            <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                            </dx:GridViewCommandColumn>
                                            <dx:GridViewDataTextColumn FieldName="Id_invMonitores" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                                <EditFormSettings Visible="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="CodActivo" ShowInCustomizationForm="True" VisibleIndex="2">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Modelo" ShowInCustomizationForm="True" VisibleIndex="6">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Pulgadas" ShowInCustomizationForm="True" VisibleIndex="7">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Resolucion" ShowInCustomizationForm="True" VisibleIndex="8">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Comentarios" ShowInCustomizationForm="True" VisibleIndex="11">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataComboBoxColumn Caption="Usuario" FieldName="Id_Usuario" ShowInCustomizationForm="True" VisibleIndex="3">
                                                <PropertiesComboBox DataSourceID="LqsPersonalAsignado2" ValueField="pin">
                                                    <Columns>
                                                        <dx:ListBoxColumn Caption="Run" FieldName="pin">
                                                        </dx:ListBoxColumn>
                                                        <dx:ListBoxColumn Caption="Nombre" FieldName="name">
                                                        </dx:ListBoxColumn>
                                                        <dx:ListBoxColumn Caption="Apellido" FieldName="last_name">
                                                        </dx:ListBoxColumn>
                                                    </Columns>
                                                </PropertiesComboBox>
                                            </dx:GridViewDataComboBoxColumn>
                                            <dx:GridViewDataComboBoxColumn Caption="Area" FieldName="Id_Area" ShowInCustomizationForm="True" VisibleIndex="4">
                                                <PropertiesComboBox DataSourceID="LqsArea3" TextField="Nombre" ValueField="Id_Area">
                                                </PropertiesComboBox>
                                            </dx:GridViewDataComboBoxColumn>
                                            <dx:GridViewDataComboBoxColumn Caption="Marca" FieldName="Id_Marca" ShowInCustomizationForm="True" VisibleIndex="5">
                                                <PropertiesComboBox DataSourceID="LqsMARCA22" TextField="MARCA" ValueField="ID">
                                                </PropertiesComboBox>
                                            </dx:GridViewDataComboBoxColumn>
                                            <dx:GridViewDataComboBoxColumn FieldName="Condicion" ShowInCustomizationForm="True" VisibleIndex="9">
                                                <PropertiesComboBox>
                                                    <Items>
                                                        <dx:ListEditItem Text="Buen Estado" Value="Buen Estado" />
                                                        <dx:ListEditItem Text="Deteriorado" Value="Deteriorado" />
                                                    </Items>
                                                </PropertiesComboBox>
                                            </dx:GridViewDataComboBoxColumn>
                                            <dx:GridViewDataComboBoxColumn FieldName="Conexion" ShowInCustomizationForm="True" VisibleIndex="10">
                                                <PropertiesComboBox>
                                                    <Items>
                                                        <dx:ListEditItem Text="VGA/HDMI" Value="VGA/HDMI" />
                                                        <dx:ListEditItem Text="VGA" Value="VGA" />
                                                        <dx:ListEditItem Text="HDMI" Value="HDMI" />
                                                        <dx:ListEditItem Text="DISPLAY PORT" Value="DISPLAY PORT" />
                                                    </Items>
                                                </PropertiesComboBox>
                                            </dx:GridViewDataComboBoxColumn>
                                            <dx:GridViewDataHyperLinkColumn Caption="Adjuntos" VisibleIndex="12">
                                                <EditFormSettings Visible="False" />
                                                <DataItemTemplate>
                                                    <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/menu.png" />
                                                </DataItemTemplate>
                                            </dx:GridViewDataHyperLinkColumn>
                                            <dx:GridViewDataHyperLinkColumn Caption="Dar de Baja" VisibleIndex="21">
                                                <EditFormSettings Visible="False" />
                                                <DataItemTemplate>
                                                    <asp:ImageButton ID="bajadaEquipo" CommandName="cmdBajadaMonitor" runat="server" ImageUrl="~/Images/delete.png" />
                                                </DataItemTemplate>
                                                <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                                                </CellStyle>
                                            </dx:GridViewDataHyperLinkColumn>
                                        </Columns>
                                        <Toolbars>
                                            <dx:GridViewToolbar >
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
                                                            <dx:ASPxButtonEdit ID="tbToolbarSearch14" runat="server" NullText="Search..." Height="100%">
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

                                        <SettingsSearchPanel CustomEditorID="tbToolbarSearch14" />
                                        <Styles>
                                            <FocusedRow BackColor="#FF9933">
                                            </FocusedRow>
                                        </Styles>
                                    </dx:ASPxGridView>
                                    <asp:LinqDataSource ID="LqsMonitores" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_INF_Monitores" EnableDelete="True" EnableInsert="True" EnableUpdate="True" OrderBy="Id_invMonitores desc" Where="Estado == @Estado">
                                        <WhereParameters>
                                            <asp:Parameter DefaultValue="1" Name="Estado" Type="Int32" />
                                        </WhereParameters>
                                    </asp:LinqDataSource>
                                    <asp:LinqDataSource ID="LqsMARCA22" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_INF_MARCA" OrderBy="MARCA">
                                    </asp:LinqDataSource>
                                    <asp:LinqDataSource ID="LqsArea3" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_AreaTrabajo">
                                    </asp:LinqDataSource>
                                    <asp:LinqDataSource ID="LqsPersonalAsignado2" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTControlBIODataContext" EntityTypeName="" Select="new (name, last_name, pin)" TableName="pers_person">
                                    </asp:LinqDataSource>
                                </div>
                            </div>

                            <dx:ASPxPopupControl ID="PopMonitor" runat="server"
                                HeaderText="Bajada Monitores" AllowDragging="True" CloseAction="CloseButton" CloseAnimationType="Fade">
                                <ContentCollection>
                                    <dx:PopupControlContentControl runat="server">
                                        <div>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel23" runat="server" Text="Motivo Baja"></dx:ASPxLabel>
                                                        <dx:ASPxComboBox ID="cboMonitores" runat="server" ValueType="System.String" Height="30px">
                                                            <Items>
                                                                <dx:ListEditItem Text="Donacion" Value="Donacion" />
                                                                <dx:ListEditItem Text="Venta o Subasta" Value="Venta o Subasta" />
                                                                <dx:ListEditItem Text="Robo" Value="Robo" />
                                                                <dx:ListEditItem Text="Entrega a Empresa de Residuos" Value="Entrega a Empresa de Residuos" />
                                                                <dx:ListEditItem Text="Sin Reparacion" Value="Sin Reparacion" />
                                                                <dx:ListEditItem Text="Vida Util (Antiguedad)" Value="Vida Util (Antiguedad)" />
                                                            </Items>
                                                        </dx:ASPxComboBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <br />
                                        <div>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel24" runat="server" Text="Observaciones"></dx:ASPxLabel>
                                                        <dx:ASPxMemo ID="txtObsMonitores" runat="server" Height="71px" Width="243px"></dx:ASPxMemo>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div style="margin-left: 50px">
                                            <dx:ASPxButton ID="btnBajadaMonitores" runat="server" Text="GUARDAR" Height="40px" Theme="Glass" Width="140px" OnClick="btnBajadaMonitores_Click"></dx:ASPxButton>
                                        </div>
                                    </dx:PopupControlContentControl>
                                </ContentCollection>
                            </dx:ASPxPopupControl>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
            </TabPages>
            <TabStyle Font-Bold="True" Font-Italic="False" Font-Size="Medium"
                ForeColor="Black">
            </TabStyle>
        </dx:ASPxPageControl>
    </div>
</asp:Content>
