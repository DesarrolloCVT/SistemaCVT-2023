<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SMM_CotizacionCajasDetalle.aspx.cs" Inherits="CVT_MermasRecepcion.Mayorista.SMM_CotizacionCajasDetalle" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Mayorista</a></li>
            <li><span id="current">Cotizacion Cajas Detalle</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Cotizacion Cajas Detalle</span>
        <span class="tab-end"></span>
        <div id="options">
            <%-- <a>
                <asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" />
                Exportar Excel</a>--%>
            <a>
                <asp:ImageButton ID="Atras" runat="server" ImageUrl="~/Images/back.png" OnClick="Atras_Click" Height="25px" Width="26px" />Volver</a>

        </div>
    </div>
    <br />
    <div style="margin-left: 150px">
        <dx:ASPxLabel ID="lblNCoti" runat="server" Text="ASPxLabel" Font-Size="XX-Large"></dx:ASPxLabel>
    </div>
    <br />
    <div style="margin-left: 30px">
        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ShowCollapseButton="true" Width="200px" AllowCollapsingByHeaderClick="True" Theme="Office2003Blue" HeaderText="DATOS FACTURACIÓN">
            <PanelCollection>
                <dx:PanelContent>
                    <div>
                        <div style="margin-left: 30px">
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="lblfac" runat="server" Text="Direccion Facturacion" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtdireccionFact" runat="server" Width="500px" Height="25px">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="auto-style6"></td>
                                    <td>
                                        <dx:ASPxButton ID="btnGuardarDireFac" runat="server" Text="Guardar" Height="40px" Theme="MaterialCompact" OnClick="btnGuardarDireFac_Click" CausesValidation="False"></dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <div style="margin-left: 30px">
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Direccion Envio" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtDirecEnvio" runat="server" Width="500px" Height="25px">
                                            <ValidationSettings Display="Dynamic" ValidationGroup="a">
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="auto-style6"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Cantidad" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtCantidad" runat="server" Width="70px" Height="25px" MaxLength="10">
                                            <ValidationSettings Display="Dynamic" ValidationGroup="a">
                                                <RegularExpression ErrorText="solo numeros" ValidationExpression="\d+" />
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="auto-style6"></td>
                                    <td>
                                        <dx:ASPxButton ID="btnGuardarDirEnvio" runat="server" Text="Guardar" Height="40px" Theme="MaterialCompact" OnClick="btnGuardarDirEnvio_Click" ValidationGroup="a"></dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <div style="margin-left: 30px">
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="lblPrecVenta" runat="server" Text="Precio Venta" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtPrecioVenta" runat="server" Width="170px" Height="25px">
                                            <ValidationSettings Display="Dynamic" ValidationGroup="b">
                                                <RegularExpression ErrorText="Solo Numeros" ValidationExpression="\d+" />
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="auto-style6"></td>
                                    <td>
                                        <dx:ASPxLabel ID="lblFormPago" runat="server" Text="Forma de Pago" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtFormaDePago" runat="server" Width="170px" Height="25px">
                                            <ValidationSettings Display="Dynamic" ValidationGroup="b">
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>

                                </tr>
                            </table>
                        </div>
                    </div>
                    <br />
                    <div>
                        <div style="margin-left: 150px">
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxButton ID="btnGuardar" runat="server" Text="Guardar Cotizacion" OnClick="btnGuardar_Click" Theme="iOS" Height="52px" Width="215px" ValidationGroup="b"></dx:ASPxButton>
                                    </td>
                                    <td class="auto-style7"></td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>

                        </div>
                    </div>
                    <br />
                    <br />
                    <div>
                        <div style="margin-left: 30px">
                            <dx:ASPxGridView ID="GvDatosDireccion" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDireccion" KeyFieldName="Id_Direccion_Coti" Theme="Office2010Black">
                                <SettingsEditing Mode="PopupEditForm">
                                </SettingsEditing>
                                <SettingsBehavior ConfirmDelete="True" />
                                <Columns>
                                    <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn FieldName="Id_Direccion_Coti" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                        <EditFormSettings Visible="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Id_Cotizacion" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Direccion" ShowInCustomizationForm="True" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="CantCajas" ShowInCustomizationForm="True" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataComboBoxColumn FieldName="TipoDireccion" ShowInCustomizationForm="True" VisibleIndex="3">
                                        <PropertiesComboBox>
                                            <Items>
                                                <dx:ListEditItem Text="Direccion Facturacion" Value="F" />
                                                <dx:ListEditItem Text="Direccion Envio" Value="E" />
                                            </Items>
                                        </PropertiesComboBox>
                                    </dx:GridViewDataComboBoxColumn>
                                </Columns>
                            </dx:ASPxGridView>

                            <asp:LinqDataSource ID="LqsDireccion" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName="" TableName="SMM_Cotizacion_Cajas_Direccion" Where="Id_Cotizacion == @Id_Cotizacion" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
                                <WhereParameters>
                                    <asp:SessionParameter DefaultValue="0" Name="Id_Cotizacion" SessionField="Id_Cotizacion" Type="Int32" />
                                </WhereParameters>
                            </asp:LinqDataSource>
                        </div>
                    </div>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxRoundPanel>
    </div>
    <br />
    <br />
    <div style="margin-left:30px">
     <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" ShowCollapseButton="true" Width="200px" AllowCollapsingByHeaderClick="True" Theme="Office2003Blue" HeaderText="CREAR CAJA PREDETERMINADA">
            <PanelCollection>
                <dx:PanelContent>              
                    <div>
                        <div style="margin-left:50px">
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Producto"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboProducto" runat="server" ValueType="System.String" DataSourceID="LqsProducto" Height="30px" ValueField="itemcode" Width="502px">
                                            <Columns>
                                                <dx:ListBoxColumn Caption="CodProducto" FieldName="itemcode">
                                                </dx:ListBoxColumn>
                                                <dx:ListBoxColumn Caption="Producto" FieldName="itemname">
                                                </dx:ListBoxColumn>
                                            </Columns>
                                        </dx:ASPxComboBox>
                                        <asp:LinqDataSource ID="LqsProducto" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTMMETRODataContext" EntityTypeName="" TableName="VW_LISTA_TIPO_DE_CAJAS">
                                        </asp:LinqDataSource>
                                    </td>
                                     <td class="auto-style7"></td>
                                    <td>
                                        <dx:ASPxButton ID="btnGuardarDeterminado" runat="server" Text="Crear Cajas" Theme="iOS" Height="52px" Width="151px" OnClick="btnGuardarDeterminado_Click" ></dx:ASPxButton>
                                    </td>
                                    <td class="auto-style7"></td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </div>
                    </div>                          
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxRoundPanel>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsCotizacionCajasDet" KeyFieldName="Id_Det_Cotizacion" OnRowInserting="GvDatos_RowInserting" OnCustomSummaryCalculate="GvDatos_CustomSummaryCalculate" OnCommandButtonInitialize="GvDatos_CommandButtonInitialize">
            <SettingsPager PageSize="100">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings AutoFilterCondition="Contains" ShowFilterRow="True" ShowFooter="True" />
            <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
            <Toolbars>
                <dx:GridViewToolbar  Position="Top">
                    <Items>
                        <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif">
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

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="0" ShowEditButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id_Det_Cotizacion" ReadOnly="True" Visible="False" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cotizacion_Id" Visible="False" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CostoUnitario" VisibleIndex="5" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Precio" VisibleIndex="7" Caption="Precio Bruto">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="CodProducto" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="LinqDataSource1" ValueField="ItemCode">
                        <Columns>
                            <dx:ListBoxColumn FieldName="ItemCode" Name="CodProducto">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn FieldName="ItemName" Name="Producto" Width="450px">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="CostoTotal" VisibleIndex="6" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MargenProducto" ShowInCustomizationForm="True" VisibleIndex="9">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PrecioTotal" VisibleIndex="8">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
            </Columns>
            <TotalSummary>
                <dx:ASPxSummaryItem FieldName="CostoTotal" ShowInColumn="CostoTotal" SummaryType="Sum" ValueDisplayFormat="N0" DisplayFormat="CostoTotal : {0:N0}" />
                <dx:ASPxSummaryItem DisplayFormat="Precio Total : {0:N0}" FieldName="PrecioTotal" ShowInColumn="Precio Total" SummaryType="Sum" ValueDisplayFormat="N0" />
                <%--  <dx:ASPxSummaryItem FieldName="MargenProducto" ShowInColumn="Margen Producto" SummaryType="Custom" Tag="MargTotal" />--%>
                <dx:ASPxSummaryItem DisplayFormat="Total Margen : {0:N2}" ShowInColumn="Margen Producto" SummaryType="Custom" Tag="TotalMargen" ValueDisplayFormat="N2" />
            </TotalSummary>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsCotizacionCajasDet" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName="" TableName="SMM_Cotizacion_Cajas_Detalle" Where="Cotizacion_Id == @Cotizacion_Id" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="Cotizacion_Id" SessionField="Id_Cotizacion" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName="" TableName="SMM_VW_Productos_Cotizacion_Cajas">
        </asp:LinqDataSource>
    </div>
</asp:Content>
