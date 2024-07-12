<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SMMExpRapidaDetalle.aspx.cs" Inherits="CVT_MermasRecepcion.MayoristaOP.SMMExpRapidaDetalle" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>WMS</a></li>
            <li><a href="ExpedicionRapida.aspx">Espedidcion Rapida</a></li>
            <li><span id="current">Detalle Expedicion Rapida</span></li>
        </ul>
    </div>
    <br />
    <div id="tableHeader">
        <span class="tableTitle">Detalle Expedicion Rapida</span>
        <span class="tab-end"></span>
        <div id="options">
            <a>
                <asp:ImageButton ID="Atras" runat="server" ImageUrl="~/Images/back.png" OnClick="Atras_Click" Height="25px" Width="26px" />Volver</a>

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
                <td class="auto-style5"></td>
              <%--  <td>
                    <asp:Label ID="Label4" runat="server" Text="Documento: " Font-Bold="true" Font-Size="X-Large"></asp:Label>
                </td>
                <td>
                    <dx:ASPxLabel ID="lblNDoc" runat="server" Text=" " Font-Size="X-Large"></dx:ASPxLabel>
                </td>--%>
                <%--<td class="auto-style5"></td>--%>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Bodega: " Font-Bold="true" Font-Size="X-Large"></asp:Label>
                </td>
                <td>
                    <dx:ASPxLabel ID="lblNombreBodega" runat="server" Text=" " Font-Size="X-Large"></dx:ASPxLabel>
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
                    <asp:Label ID="Label3" runat="server" Text="ID Bulto" Font-Bold="true" Font-Size="Medium"></asp:Label>
                </td>
                <td></td>
                <td>
                    <dx:ASPxTextBox ID="txtIdProd" runat="server" Width="170px" Height="28px" OnTextChanged="txtIdProd_TextChanged" AutoPostBack="True" MaxLength="10">
                        <ValidationSettings Display="Dynamic">
                            <RegularExpression ErrorText="" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
            </tr>
        </table>
    </div>
    <br />
  
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDetalle" KeyFieldName="Package_SSCC" OnHtmlRowCreated="GvDatos_HtmlRowCreated" OnRowCommand="GvDatos_RowCommand" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings ShowFooter="True" />
            <SettingsBehavior AllowFocusedRow="True" />
            <Toolbars>
                <dx:GridViewToolbar >
                    <Items>
                     <%--   <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif" />--%>
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
                <dx:GridViewDataTextColumn FieldName="Expedition_Id" Visible="False" VisibleIndex="0" Caption="N°Expedicion">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Package_SSCC" VisibleIndex="2" Caption="N° Bulto">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ItemCode" VisibleIndex="4" Caption="CodProducto">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ItemName" VisibleIndex="5" Caption="Descripcion">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ExpeditionDetail_Quantity" VisibleIndex="7" Caption="Cantidad">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Eliminar" VisibleIndex="1" Width="70px">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="Eliminar" CommandName="cmdEliminar" runat="server" ImageUrl="~/Images/eliminar.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataTextColumn FieldName="Package_Lot" VisibleIndex="6" Caption="Lote">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Empaque" FieldName="UomCode" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="CantxEmpaque" FieldName="BaseUnMed" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Un TotalxPallet" FieldName="CantUniTot" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
            </Columns>
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="TOTAL SOPORTADO: {0}" FieldName="ItemName" ShowInColumn="Descripcion" SummaryType="Count" />
                <dx:ASPxSummaryItem DisplayFormat="TOTAL ENVASES: {0}" FieldName="ExpeditionDetail_Quantity" ShowInColumn="Cantidad" SummaryType="Sum" />
            </TotalSummary>
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
        <asp:LinqDataSource ID="LqsDetalle" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName="" TableName="SMM_VW_EXPEDITIONDETAILEXPORT" Where="Expedition_Id == @Expedition_Id">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="Expedition_Id" SessionField="Expedition_Id" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
      
</asp:Content>
