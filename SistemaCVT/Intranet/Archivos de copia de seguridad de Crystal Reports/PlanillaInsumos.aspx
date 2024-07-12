<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PlanillaInsumos.aspx.cs" Inherits="CVT_MermasRecepcion.Insumos.PlanillaInsumos" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
     <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Insumos</a></li>
            <li><span id="current">Planilla Mensual de Insumos</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Planilla Mensual Insumos</span>
        <span class="tab-end"></span>
    </div>
    <div>
        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="En esta planilla solo se podrán ingresar insumos hasta el día 6 de cada mes. Después de eso, los insumos ingresados deberán ingresarse en la planilla del mes siguiente."></dx:ASPxLabel>
    </div>
    <div>
        <dx:ASPxGridView ID="GvPlanillaInsumos" runat="server" AutoGenerateColumns="False" DataSourceID="LqPlanilla" KeyFieldName="PInsumos_Id" OnRowCommand="GvPlanillaInsumos_RowCommand" OnRowInserting="GvPlanillaInsumos_RowInserting" OnToolbarItemClick="GvPlanillaInsumos_ToolbarItemClick">
            <SettingsPager PageSize="100">
            </SettingsPager>
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
            <Columns>
                <dx:GridViewDataTextColumn Caption="Folio" FieldName="PInsumos_Id" ReadOnly="True" VisibleIndex="0">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="Fecha Ingreso" FieldName="Fecha_Registro" VisibleIndex="2" ReadOnly="True">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Detalle" VisibleIndex="6">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                            <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/boxadd.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataComboBoxColumn Caption="Para el Mes de" FieldName="Mes" VisibleIndex="3">
                    <PropertiesComboBox DisplayFormatString="d">
                        <Items>
                            <dx:ListEditItem Text="Enero" Value="1" />
                            <dx:ListEditItem Text="Febrero" Value="2" />
                            <dx:ListEditItem Text="Marzo" Value="3" />
                            <dx:ListEditItem Text="Abril" Value="4" />
                            <dx:ListEditItem Text="Mayo" Value="5" />
                            <dx:ListEditItem Text="Junio" Value="6" />
                            <dx:ListEditItem Text="Julio" Value="7" />
                            <dx:ListEditItem Text="Agosto" Value="8" />
                            <dx:ListEditItem Text="Septiembre" Value="9" />
                            <dx:ListEditItem Text="Octubre" Value="10" />
                            <dx:ListEditItem Text="Noviembre" Value="11" />
                            <dx:ListEditItem Text="Diciembre" Value="12" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Area Solicitante" FieldName="Area" VisibleIndex="5">
                    <PropertiesComboBox DataSourceID="LqArea" TextField="Nombre" ValueField="Nombre">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Usuario" FieldName="Usuario_Sistema" ReadOnly="True" VisibleIndex="1">
                    <PropertiesComboBox DataSourceID="LqUsuario" TextField="NombreUsuario" ValueField="IdUsuario">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Año" FieldName="Ano" VisibleIndex="4">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="2023" Value="2023" />
                            <dx:ListEditItem Text="2024" Value="2024" />
                            <dx:ListEditItem Text="2025" Value="2025" />
                            <dx:ListEditItem Text="2026" Value="2026" />
                            <dx:ListEditItem Text="2027" Value="2027" />
                            <dx:ListEditItem Text="2028" Value="2028" />
                            <dx:ListEditItem Text="2029" Value="2029" />
                            <dx:ListEditItem Text="2030" Value="2030" />
                            <dx:ListEditItem Text="2031" Value="2031" />
                            <dx:ListEditItem Text="2032" Value="2032" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
            <Toolbars>
                            <dx:GridViewToolbar>
                                <Items>
                                    <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif">
                                    <Image Url="../Images/pn-add-source-copy.gif"></Image>
                                    </dx:GridViewToolbarItem>
                                    <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                                        <Items>
                                            <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                            <dx:GridViewToolbarItem Command="ExportToXls" />
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
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqPlanilla" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Planilla_Insumos" EnableDelete="True" EnableInsert="True" EnableUpdate="True" OrderBy="PInsumos_Id desc"></asp:LinqDataSource>
        <asp:LinqDataSource ID="LqArea" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_AreaTrabajo">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqUsuario" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Usuarios">
        </asp:LinqDataSource>
    </div>
</asp:Content>
