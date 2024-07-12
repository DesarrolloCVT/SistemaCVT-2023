<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InfComponentesMaquina.aspx.cs" Inherits="CVT_MermasRecepcion.Reporteria.InfComponentesMaquina" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Mantencion</a></li>
            <li><span id="current">Informe Maquinas</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Informe Maquinas</span>
        <span class="tab-end"></span>
      <%--  <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" />
                Exportar Excel</a>

        </div>--%>
    </div>
    <br />
    <div>

        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqDsArticulos"
            EnableViewState="False" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsPager PageSize="25">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            <SettingsDataSecurity AllowDelete="False" />
            <Toolbars>
                <dx:GridViewToolbar >
                    <Items>
                        <%--<dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif" />--%>
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
                <dx:GridViewDataTextColumn FieldName="Cod_Maquina" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Maquina" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cod_Parte"
                    VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Parte"
                    VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cod_Componente" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Componente" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsArticulos" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext"
            EnableInsert="True" EnableUpdate="True" EntityTypeName=""
            TableName="VW_CVT_MaquinasPartesComponentes"
            EnableDelete="True">
        </asp:LinqDataSource>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
        </dx:ASPxGridViewExporter>

    </div>
</asp:Content>
