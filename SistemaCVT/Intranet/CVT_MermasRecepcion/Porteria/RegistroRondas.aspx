<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="RegistroRondas.aspx.cs" Inherits="CVT_MermasRecepcion.Porteria.RegistroRondas" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
        <div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">Inicio</a></li>
        <li><a>Porteria</a></li>
        <li><span id="current">Registro Rondas</span></li>
    </ul>
</div>
<br />
<br />
<div id="tableHeader">
    <span class="tableTitle">Registro Rondas</span>
    <span class="tab-end"></span>
    <br />
</div>
<div>
    <dx:ASPxGridView ID="GvRondaRegistro" runat="server" AutoGenerateColumns="False" DataSourceID="LqDsRegistroRondas" KeyFieldName="RegistroRonda_Id">
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
                                        <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
                        <SettingsBehavior AllowFocusedRow="True" />
                        <Toolbars>
                            <dx:GridViewToolbar >
                                <Items>
                                    
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
            <dx:GridViewDataTextColumn FieldName="RegistroRonda_Id" ReadOnly="True" VisibleIndex="0" Caption="Folio">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataDateColumn FieldName="Fecha" VisibleIndex="1">
                <PropertiesDateEdit DisplayFormatString="dd-MM-yyyy hh:mm tt">
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Usuario" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Punto" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataHyperLinkColumn FieldName="URL_Ubicacion" VisibleIndex="3">
            </dx:GridViewDataHyperLinkColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:LinqDataSource ID="LqDsRegistroRondas" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Ronda_Registro" OrderBy="RegistroRonda_Id desc">
    </asp:LinqDataSource>
</div>
</asp:Content>
