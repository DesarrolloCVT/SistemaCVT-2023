<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DescMantencion.aspx.cs" Inherits="CVT_MermasRecepcion.Informatica.DescMantencion" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Sistema</a></li>
            <li><span id="current">Familia Productos</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Descripcion Mantencion</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDescMantencion" KeyFieldName="ID_Mantencion" OnToolbarItemClick="GvDatos_ToolbarItemClick" Width="400px" OnRowDeleting="GvDatos_RowDeleting" OnRowInserting="GvDatos_RowInserting" OnRowUpdating="GvDatos_RowUpdating">
            <Toolbars>
                <dx:GridViewToolbar >
                    <Items>
                        <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif"/>
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
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0" Width="100px">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="ID_Mantencion" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Descripcion" FieldName="MantencionDescr" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsBehavior ConfirmDelete="True" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDescMantencion" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_INF_Mantencion_Descripcion">
        </asp:LinqDataSource>
    </div>
</asp:Content>
