<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DevolucionFilmDetalle.aspx.cs" Inherits="CVT_MermasRecepcion.ControlFilm.DevolucionFilmDetalle" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style6 {
            width: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>WMS</a></li>
            <li><span id="current">Devolucion Film</span></li>
        </ul>
    </div>
    <div id="tableHeader">
        <span class="tableTitle">Devolucion Film</span>
        <span class="tab-end"></span>
        <div id="options">
            <a style="margin-left: 150px">
                <asp:ImageButton ID="cmdVolver" runat="server"
                    ImageUrl="~/Images/back.png" OnClick="cmdVolver_Click" Height="27px" Width="34px" />
                volver</a>&nbsp;      
        </div>
    </div>
    <br />
    <div style="margin-left: 250px">
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="FOLIO: " Font-Bold="true" Font-Size="X-Large"></asp:Label>

                </td>
                <td>
                    <dx:ASPxLabel ID="lblFolio" runat="server" Text=" " Font-Size="X-Large"></dx:ASPxLabel>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Bodega: " Font-Bold="true" Font-Size="X-Large"></asp:Label>
                </td>
                <td>
                    <dx:ASPxLabel ID="lblNombreBodega" runat="server" Text=" " Font-Size="X-Large"></dx:ASPxLabel>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Motivo: " Font-Bold="true" Font-Size="X-Large"></asp:Label>

                </td>
                <td>
                    <dx:ASPxLabel ID="lblMotivo" runat="server" Text=" " Font-Size="X-Large"></dx:ASPxLabel>
                </td>
            </tr>
        </table>
    </div>
    <div style="margin-left: 250px">
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="OBSERVACIÓN: " Font-Size="X-Large" Font-Bold="true"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblObs" runat="server" Text=" " Font-Size="X-Large"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <br />
    <div style="margin-left: 200px">
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="N° Bobina" Font-Bold="true" Font-Size="Medium"></asp:Label>
                </td>
                <td></td>
                <td>
                    <dx:ASPxTextBox ID="txtNbobina" runat="server" Width="170px" Height="28px" AutoPostBack="True" MaxLength="10" OnTextChanged="txtNbobina_TextChanged">
                        <ValidationSettings>
                            <RegularExpression ErrorText="solo numeros" ValidationExpression="\d+" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDetDevol" KeyFieldName="Nbobina" OnHtmlRowCreated="GvDatos_HtmlRowCreated" OnRowCommand="GvDatos_RowCommand" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings ShowFooter="True" />
            <SettingsBehavior AllowFocusedRow="True" />
            <Toolbars>
                <dx:GridViewToolbar >
                    <Items>
                        <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXls" />
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />
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
                <dx:GridViewDataTextColumn FieldName="Folio_Devol" Visible="False" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Nbobina" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodProducto" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DescProducto" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="IdBodega" Visible="False" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LoteInterno" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LoteProveedor" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PesoBruto" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Eliminar" VisibleIndex="1" Width="70px">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="Eliminar" CommandName="cmdEliminar" runat="server" ImageUrl="~/Images/eliminar.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
            </Columns>
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="TOTAL SOPORTADO: {0}" FieldName="Descripción" ShowInColumn="LoteProveedor" SummaryType="Count" />
                <dx:ASPxSummaryItem DisplayFormat="TOTAL KILOS: {0}" FieldName="PesoBruto" ShowInColumn="PesoBruto" SummaryType="Sum" />
            </TotalSummary>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDetDevol" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="VW_DEVOL_DETALLE_EXPORT_FILM" Where="Folio_Devol == @Folio_Devol">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="Folio_Devol" SessionField="Devolucion_Id" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
</asp:Content>
