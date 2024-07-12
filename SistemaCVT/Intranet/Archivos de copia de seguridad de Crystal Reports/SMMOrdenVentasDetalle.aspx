<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SMMOrdenVentasDetalle.aspx.cs" Inherits="CVT_MermasRecepcion.MayoristaOP.SMMOrdenVentasDetalle" %>

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
            <li><span id="current">Orden de Venta</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Detalle Orden de Venta
        <dx:ASPxLabel ID="lbl_FolioOrden" runat="server" Text="" Font-Bold="true" Font-Size="Medium">
        </dx:ASPxLabel>
        </span>
        <span class="tab-end"></span>
        <div id="options">
            <%--    <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif">
                            <Image Url="../Images/pn-add-source-copy.gif"></Image>
                        </dx:GridViewToolbarItem>--%>
            <a style="margin-left: 150px">
                <asp:ImageButton ID="cmdVolver" runat="server"
                    ImageUrl="~/Images/back.png" OnClick="cmdVolver_Click" Style="width: 16px" CausesValidation="False" />
                volver</a>&nbsp;
         
        </div>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDetellaOrden" KeyFieldName="IdDetalleOrden" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsPager PageSize="100">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings AutoFilterCondition="Contains" />
            <SettingsBehavior ConfirmDelete="True" />
            <ClientSideEvents ToolbarItemClick="function(s, e) {
	if (e.item.name == &quot;Nuevo&quot;) e.processOnServer = true; e.usePostBack=true;
 

}" />
            <Toolbars>
                <dx:GridViewToolbar>
                    <Items>
                        <%--    <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif">
                            <Image Url="../Images/pn-add-source-copy.gif"></Image>
                        </dx:GridViewToolbarItem>--%>
                        <dx:GridViewToolbarItem Command="Custom" Name="Nuevo" Text="Nuevo" Image-Url="../../Images/pn-add-source-copy.gif">
                            <Image Url="../../Images/pn-add-source-copy.gif"></Image>
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

            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>

            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="IdOrdenVentas" Visible="False" VisibleIndex="1" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="IdDetalleOrden" ReadOnly="True" Visible="False" VisibleIndex="2" ShowInCustomizationForm="True">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Upc" VisibleIndex="4" ShowInCustomizationForm="True">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PrecioVenta" VisibleIndex="6" ShowInCustomizationForm="True">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Margen" VisibleIndex="7" ShowInCustomizationForm="True">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Stock" VisibleIndex="8" ShowInCustomizationForm="True">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Contribucion" VisibleIndex="9" ShowInCustomizationForm="True">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="CodProducto" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="LinqDataSource1" ValueField="Codproducto">
                        <Columns>
                            <dx:ListBoxColumn FieldName="Codproducto">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn FieldName="Producto">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Familia" VisibleIndex="5">
                    <PropertiesComboBox DataSourceID="lsqFamilia" TextField="ItmsGrpNam" ValueField="ItmsGrpCod">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="10" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="% Desc." FieldName="Porc_Descuento" VisibleIndex="11" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Tipo Impuesto" FieldName="ImptoTipo" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="%Impuesto" FieldName="ImptoProcentaje" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Total impuesto" FieldName="TotalImpto" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDetellaOrden" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName="" TableName="SMM_Orden_de_Ventas_Detalle" Where="IdOrdenVentas == @IdOrdenVentas" EnableDelete="True" EnableInsert="True" EnableUpdate="True" OrderBy="IdDetalleOrden">
            <WhereParameters>
                <asp:SessionParameter Name="IdOrdenVentas" SessionField="IdOrden" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTMMETRODataContext" EntityTypeName="" TableName="VW_SMM_PRODUCTOS_ORDEN_DE_VENTAS">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="lsqFamilia" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTMMETRODataContext" EntityTypeName="" Select="new (ItmsGrpCod, ItmsGrpNam)" TableName="MMETRO_OITB">
        </asp:LinqDataSource>
        <br />
        <br />
        <div style="margin-left: 1200px">
            <div>
                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="SubTotal" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                <dx:ASPxTextBox ID="txtSubtotal" runat="server" Width="90px" ReadOnly="true" Height="30" Font-Bold="true" Border-BorderStyle="None"></dx:ASPxTextBox>
            </div>
            <div>
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Impuesto" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                <dx:ASPxTextBox ID="txtImpto" runat="server" Width="90px" ReadOnly="true" Height="30" Font-Bold="true" Border-BorderStyle="None"></dx:ASPxTextBox>
            </div>
            <div>
                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Total" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                <dx:ASPxTextBox ID="txtTotal" runat="server" Width="90px" ReadOnly="true" Height="30" Font-Bold="true" Border-BorderStyle="None"></dx:ASPxTextBox>
            </div>
        </div>
        <dx:ASPxPopupControl ID="PopNuevo" runat="server" AllowDragging="True" HeaderText="Nuevo" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle">
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxComboBox ID="cboProducto" runat="server" ValueType="System.String" DataSourceID="LinqDataSource1" Height="30px" ValueField="Codproducto" Width="450px">
                                        <Columns>
                                            <dx:ListBoxColumn FieldName="Codproducto">
                                            </dx:ListBoxColumn>
                                            <dx:ListBoxColumn FieldName="Producto" Width="450px">
                                            </dx:ListBoxColumn>
                                        </Columns>
                                        <ValidationSettings Display="Dynamic">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div style="displaymargin-left: 10px">
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Cantidad"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtCantidad" runat="server" Width="80px" Height="30px">
                                        <ValidationSettings Display="Dynamic">
                                            <RegularExpression ErrorText="SOLO NUMEROS" ValidationExpression="\d+" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="auto-style5"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="% Descuento"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtPorcDesc" runat="server" Width="80px" Height="30px">
                                        <ValidationSettings Display="Dynamic">
                                            <RegularExpression ErrorText="SOLO NUMEROS" ValidationExpression="\d+" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <br />
                    <div style="margin-left: 150px">
                        <dx:ASPxButton ID="btnGuardar" runat="server" Height="40px" Text="GUARDAR" Theme="Glass" Width="140px" OnClick="btnGuardar_Click">
                        </dx:ASPxButton>
                    </div>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
</asp:Content>
