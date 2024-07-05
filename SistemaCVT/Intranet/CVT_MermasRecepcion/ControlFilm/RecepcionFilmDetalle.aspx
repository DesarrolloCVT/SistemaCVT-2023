<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RecepcionFilmDetalle.aspx.cs" Inherits="CVT_MermasRecepcion.ControlFilm.RecepcionFilmDetalle" %>

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
            <li><a>Sistema</a></li>
            <li><span id="current">Recepcion Film Detalle</span></li>
        </ul>
    </div>
    <div id="tableHeader">
        <span class="tableTitle" id="detalleRec" runat="server">Recepcion Film Detalle</span>
        <span class="tab-end"></span>
        <div id="options">
            <a style="margin-left: 150px">
                <asp:ImageButton ID="cmdVolver" runat="server"
                    ImageUrl="~/Images/back.png" OnClick="cmdVolver_Click" Height="27px" Width="34px" />
                volver</a>&nbsp;      
        </div>
    </div>
    <br />
    <div style="margin-left: 50px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Producto" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboProducto" runat="server" DataSourceID="LqsProducto" Height="30px" TextField="ItemName" ValueField="ItemCode">
                        <ValidationSettings Display="Dynamic">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Lote Interno" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtLoteInterno" runat="server" Width="170px" Height="30px"></dx:ASPxTextBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Lote Proveedor" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtLotProveedor" runat="server" Width="170px" Height="30px"></dx:ASPxTextBox>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 50px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Fecha Produccion" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteFechaProd" runat="server" Height="30px"></dx:ASPxDateEdit>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Fecha Vencimiento" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteFechaVen" runat="server" Height="30px"></dx:ASPxDateEdit>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 50px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Peso Bruto" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtPesoBruto" runat="server" Width="170px" Height="30px">
                        <ValidationSettings Display="Dynamic">
                            <RegularExpression ErrorText="Solo numeros o Coma decimal ( , )" ValidationExpression="^[0-9]\d*(,\d+)?$" />
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Peso Cono" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtPesoCono" runat="server" Width="170px" Height="30px">
                        <ValidationSettings Display="Dynamic">
                            <RegularExpression ErrorText="Solo numeros o Coma decimal ( , )" ValidationExpression="^[0-9]\d*(,\d+)?$" />
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxButton ID="btnGuardar" runat="server" Text="Guardar" Height="40px" Width="100px" OnClick="btnGuardar_Click"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDetRecepcionFilm" KeyFieldName="NBobina" OnCommandButtonInitialize="GvDatos_CommandButtonInitialize" OnHtmlRowCreated="GvDatos_HtmlRowCreated" OnRowCommand="GvDatos_RowCommand" OnToolbarItemClick="GvDatos_ToolbarItemClick" OnRowUpdating="GvDatos_RowUpdating">
            <Settings ShowFooter="True" />
            <Toolbars>
                <dx:GridViewToolbar >
                    <Items>
                        <%--        <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif">
                            <Image Url="../Images/pn-add-source-copy.gif"></Image>
                        </dx:GridViewToolbarItem>--%>
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
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0" ShowDeleteButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="NBobina" ReadOnly="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FolioRecep_Film" VisibleIndex="2" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LoteInterno" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LoteProveedor" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Fecha_Produc" VisibleIndex="6">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="Fecha_Venc" VisibleIndex="7">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="PesoBrutoInicial" VisibleIndex="8">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PesoCono" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PesoNeto" VisibleIndex="10" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Producto" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="LqsProducto" TextField="ItemName" ValueField="ItemCode">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Confirma" VisibleIndex="12">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="Confirma" CommandName="cmdConfirma" runat="server"
                            ImageUrl="~/Images/confirm.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataTextColumn Caption="Peso Neto Inicial" FieldName="PesoNetoInicial" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
            </Columns>
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="Peso Bruto Total : {0}" FieldName="PesoBrutoInicial" ShowInColumn="PesoBrutoInicial" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="Peso Neto Total : {0}" FieldName="PesoNetoInicial" ShowInColumn="PesoNetoInicial" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="Total Pallets: {0}" FieldName="NBobina" ShowInColumn="NBobina" SummaryType="Count" />
            </TotalSummary>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDetRecepcionFilm" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_FILM_BOBINA" Where="FolioRecep_Film == @FolioRecep_Film">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="FolioRecep_Film" SessionField="RecepcionId" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsProducto" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" Select="new (ItemName, ItemCode)" TableName="OITM" Where="QryGroup14 == @QryGroup14">
            <WhereParameters>
                <asp:Parameter DefaultValue="Y" Name="QryGroup14" Type="Char" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
</asp:Content>
