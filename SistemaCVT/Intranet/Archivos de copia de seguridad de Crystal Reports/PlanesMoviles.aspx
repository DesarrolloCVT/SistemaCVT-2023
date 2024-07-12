<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PlanesMoviles.aspx.cs" Inherits="CVT_MermasRecepcion.Informatica.PlanesMoviles" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Informatica</a></li>
            <li><span id="current">Planes Moviles</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Planes Moviles</span>
        <span class="tab-end"></span>
        <%--        <div id="options">
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
    <br />
    <div>
        <dx:ASPxGridView ID="GvPlan" runat="server" AutoGenerateColumns="False" DataSourceID="LqsPlanMovil" KeyFieldName="Plan_Codigo" OnToolbarItemClick="GvPlan_ToolbarItemClick">
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
                                <dx:ASPxButtonEdit ID="tbToolbarSearch11" runat="server" NullText="Search..." Height="100%">
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
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="0" ShowClearFilterButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="Codigo" FieldName="Plan_Codigo" ShowInCustomizationForm="True" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Nombre" FieldName="Plan_Nombre" ShowInCustomizationForm="True" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="GB" ShowInCustomizationForm="True" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Minutos" ShowInCustomizationForm="True" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SMS" ShowInCustomizationForm="True" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CargoFijoNeto" ShowInCustomizationForm="True" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ValorMinutoAdicional" ShowInCustomizationForm="True" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="VelocidadResidual" ShowInCustomizationForm="True" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch11" />
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsPlanMovil" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_INF_PlanesMoviles">
        </asp:LinqDataSource>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter11" runat="server" ExportedRowType="All" GridViewID="GvPlan">
        </dx:ASPxGridViewExporter>
    </div>
</asp:Content>
