<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Sitios.aspx.cs" Inherits="CVT_MermasRecepcion.Mantenedores.Sitios" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 12px;
        }

        .auto-style6 {
            width: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Sistema</a></li>
            <li><span id="current">Sitios</span></li>
        </ul>
    </div>
    <div id="tableHeader">
        <span class="tableTitle">Sitios</span>
        <span class="tab-end"></span>
        <%--       <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px; height: 20px;" />
                Exportar Excel</a>&nbsp;
              <a>
                  <asp:ImageButton ID="cmdNew" runat="server"
                      ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="width: 16px" />
                  Nuevo</a>
        </div>--%>
    </div>
    <div>
        <dx:ASPxGridView ID="GvDatosSitios" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDatoSitios" KeyFieldName="Site_Id" OnRowCommand="GvDatosSitios_RowCommand" OnToolbarItemClick="GvDatosSitios_ToolbarItemClick" OnRowDeleting="GvDatosSitios_RowDeleting" OnRowUpdating="GvDatosSitios_RowUpdating">
            <ClientSideEvents ToolbarItemClick="function(s, e) {
	if (e.item.name == &quot;Nuevo&quot;) e.processOnServer = true; e.usePostBack=true;
 

}" />
            <SettingsPager PageSize="30">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
            <SettingsPopup>
                <EditForm MinWidth="750px" Modal="True" PopupAnimationType="Slide">
                </EditForm>
            </SettingsPopup>
            <Toolbars>
                <dx:GridViewToolbar >
                    <Items>
                        <dx:GridViewToolbarItem Command="Custom" Name="Nuevo" Text="Nuevo" Image-Url="../../Images/pn-add-source-copy.gif" />
                        <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXls" />
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                <dx:GridViewToolbarItem Command="ExportToDocx" />
                                <dx:GridViewToolbarItem Command="ExportToRtf" />
                                <dx:GridViewToolbarItem Command="ExportToCsv" />
                                <dx:GridViewToolbarItem Command="ExportToPdf" />
                            </Items>
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
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Company_Id" ReadOnly="True" Visible="False" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Site_Id" ReadOnly="True" Visible="False" VisibleIndex="2">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Descripción " FieldName="Site_Description" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Nombre Corto" FieldName="Site_ShortDescription" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Observaciones" FieldName="Site_Notes" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="GLN" FieldName="Site_GLN" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Sectores " VisibleIndex="10">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="sectores" CommandName="cmdSectores" runat="server" ImageUrl="~/Images/mix.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Dis.Sitios " VisibleIndex="10">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="DisSitios" CommandName="cmdDisSitios" runat="server" ImageUrl="~/Images/box.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDatoSitios" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="Site">
        </asp:LinqDataSource>
    </div>
    <dx:ASPxPopupControl ID="PopSitios" runat="server" AllowDragging="True" CloseAction="CloseButton" HeaderText="Nuevo" Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle" Width="450px">
        <ContentCollection>
            <dx:PopupControlContentControl>
                <br />
                <div>
                    <div style="margin-left: 30px">
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Descripcion" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtDescripcion" runat="server" Width="170px" Height="25px">
                                        <ValidationSettings Display="Dynamic">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="auto-style6"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Nombre corto" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtNombreCorto" runat="server" Width="170px" Height="25px" MaxLength="10">
                                        <ValidationSettings Display="Dynamic">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>

                                </td>
                            </tr>

                        </table>
                    </div>
                    <br />
                    <div style="margin-left: 30px">
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Observacion" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtobs" runat="server" Width="170px" Height="25px"></dx:ASPxTextBox>

                                </td>
                                <td class="auto-style6"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="GLN" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtGLN" runat="server" Width="170px" Height="25px"></dx:ASPxTextBox>

                                </td>
                            </tr>
                        </table>
                    </div>

                    <br />
                    <br />
                    <div style="margin-left: 150px">
                        <dx:ASPxButton ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click" Theme="iOS"></dx:ASPxButton>
                    </div>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
</asp:Content>
