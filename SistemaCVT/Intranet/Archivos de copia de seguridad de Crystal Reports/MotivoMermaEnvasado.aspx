<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MotivoMermaEnvasado.aspx.cs" Inherits="CVT_MermasRecepcion.Mantenedores.MotivoMermaEnvasado" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Sistema</a></li>
            <li><span id="current">Motivo Merma</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Motivo Merma</span>
        <span class="tab-end"></span>
        <%--       <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px; height: 20px;" />
                Exportar Excel</a>&nbsp;
              <a>
                  <asp:ImageButton ID="cmdNew" runat="server"
                      ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>
        </div>--%>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsMotivoMerma" KeyFieldName="id_Motivo" Width="268px">
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" />
            <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
            <Toolbars>
                <dx:GridViewToolbar Position="Top">
                    <Items>
                        <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif" >
<Image Url="../Images/pn-add-source-copy.gif"></Image>
                        </dx:GridViewToolbarItem>
                        <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXls" />
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                <dx:GridViewToolbarItem Command="ExportToCsv" />
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
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="id_Motivo" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Caption="ID" MaxWidth="100" MinWidth="100">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Descripcion" ShowInCustomizationForm="True" VisibleIndex="2" MaxWidth="400" MinWidth="400">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Estado" VisibleIndex="3" MaxWidth="150" MinWidth="150">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Activo" Value="1" />
                            <dx:ListEditItem Text="Inactivo" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsMotivoMerma" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_ControlEnvasadoPT_MotivoMerma" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
        </asp:LinqDataSource>
    </div>
</asp:Content>
