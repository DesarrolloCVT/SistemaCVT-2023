<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="DetalleReclamo.aspx.cs" Inherits="CVT_MermasRecepcion.Reclamos.DetalleReclamo" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 16px;
        }
        .auto-style6 {
            width: 18px;
        }
        .auto-style7 {
            width: 25px;
        }
        .auto-style8 {
            width: 31px;
        }
        .auto-style9 {
            width: 49px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Reclamos</a></li>
            <li><span id="current">Reclamos</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Productos Reclamo N°: 
        <dx:ASPxLabel ID="lbl_NReclamo" runat="server" Font-Bold="True" Font-Size="Medium">
        </dx:ASPxLabel>
        </span>
        <span class="tab-end"></span>
        <div id="options">
            <%--  <a>
               <asp:ImageButton ID="cmdImprimir" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-print.png" OnClick="cmdImprimir_Click"
                    Style="width: 20px" />
                Imprimir Recepcion</a>--%>
            <a style="margin-left: 150px">
                <asp:ImageButton ID="cmdVolver" runat="server"
                    ImageUrl="~/Images/back.png" OnClick="cmdVolver_Click" Style="width: 16px" CausesValidation="False" />
                volver</a>&nbsp;         
        </div>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatoDetalleReclamo" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDetalleReclamo" KeyFieldName="ID_DetReclamo" OnRowInserting="GvDatoDetalleReclamo_RowInserting" OnToolbarItemClick="GvDatoDetalleReclamo_ToolbarItemClick">
            <ClientSideEvents ToolbarItemClick="function(s, e) {
	if (e.item.name == &quot;Nuevo&quot;) e.processOnServer = true; e.usePostBack=true;}" />
            <SettingsBehavior ConfirmDelete="True" />
            <Toolbars>
                <dx:GridViewToolbar Position="Top">
                    <Items>
                        <dx:GridViewToolbarItem Command="Custom" Name="Nuevo" Text="Nuevo" Image-Url="../../Images/pn-add-source-copy.gif">
                            <Image Url="../../Images/pn-add-source-copy.gif"></Image>
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
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <SettingsBehavior ConfirmDelete="True" />

            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>

            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="ID_DetReclamo" ReadOnly="True" VisibleIndex="1" ShowInCustomizationForm="True" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ID_Reclamo" VisibleIndex="2" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NPallet" VisibleIndex="3" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="7" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodProducto" ShowInCustomizationForm="True" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Descripcion" ShowInCustomizationForm="True" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UnidadDeMedida" ShowInCustomizationForm="True" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Origen" ShowInCustomizationForm="True" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Observaciones" ShowInCustomizationForm="True" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDetalleReclamo" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Reclamo_DetalleProd" Where="ID_Reclamo == @ID_Reclamo" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="ID_Reclamo" SessionField="idReclamo" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqDsProductos" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" TableName="ArticleProvider">
        </asp:LinqDataSource>
    </div>
    <dx:ASPxPopupControl ID="PopNuevo" runat="server" AllowDragging="True" HeaderText="Nuevo" Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="TopSides" Theme="Office2010Blue" Width="452px" CloseAction="None">
        <ContentCollection>
            <dx:PopupControlContentControl>
                <br />
                <div style="margin-left: 20px">

                    <br />
                    <br />
                    <div>
                        <table>
                            <tr>
                                <td class="auto-style9">
                                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="N° Pallet"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtNpallet" runat="server" Width="180px" Height="30px" OnTextChanged="txtNpallet_TextChanged" AutoPostBack="True">
                                        <ValidationSettings Display="Dynamic">
                                            <RegularExpression ErrorText="Solo Numeros" ValidationExpression="\d+" />
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="auto-style5"></td>
                                <td>
                                    <dx:ASPxLabel ID="lblCantidad" runat="server" Text="Cantidad" Visible="false"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtCantidad" runat="server" Width="170px" Height="30px" Visible="false"></dx:ASPxTextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div style="margin-left: 20px">
                    <br />
                    <br />
                    <div>
                        <table>
                            <tr>
                                <td class="auto-style7">
                                    <dx:ASPxLabel ID="lblCodProd" runat="server" Text="" Font-Size="Large"></dx:ASPxLabel>
                                </td>
                                <td class="auto-style8"></td>
                                <td>
                                    <dx:ASPxLabel ID="lblDescripcion" runat="server" Text="" Font-Size="Large"></dx:ASPxLabel>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <br />
                <br />
                <br />
                <div style="margin-left: 100px">
                    <table>
                        <tr>
                            <td>
                                <dx:ASPxButton ID="btnGuardar" runat="server" Text="Guardar" Height="40px" Width="100px" OnClick="btnGuardar_Click" >
                                    <Image IconID="pdfviewer_import_svg_32x32">
                                    </Image>
                                </dx:ASPxButton>
                            </td>
                            <td class="auto-style6"></td>
                            <td>
                                <dx:ASPxButton ID="btnCancelar" runat="server" Text="Cancelar" Height="40px" Width="100px" CausesValidation="False" OnClick="btnCancelar_Click" >
                                    <Image IconID="outlookinspired_cancel_svg_32x32">
                                    </Image>
                                </dx:ASPxButton>
                            </td>
                        </tr>
                    </table>
                </div>
                <br />
                <br />
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
</asp:Content>
