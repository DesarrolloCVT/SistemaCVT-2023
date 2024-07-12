<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ControlEnvPT.aspx.cs" Inherits="CVT_MermasRecepcion.Produccion.ControlEnvPT" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Produccion</a></li>
            <li><span id="current">Control Envasado Producto Terminado</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Control Envasado Producto Terminado</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <div style="margin-left: 100px">
        <dx:ASPxButton ID="btnNuevo" runat="server" Text="Nuevo" OnClick="btnNuevo_Click" Theme="MaterialCompact" Height="45px" Width="121px"></dx:ASPxButton>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxPopupControl ID="popu1" runat="server" AllowDragging="True" CloseAction="CloseButton" CloseAnimationType="Slide" HeaderText="Nuevo" Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle" Theme="iOS">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <div style="margin-left: 50px">
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Operador" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboOperador" runat="server" DataSourceID="LqsPersonal" ValueField="Id_Personal" NullText="Seleccione">
                                        <Columns>
                                            <dx:ListBoxColumn Caption="Nombre" FieldName="Nombre">
                                            </dx:ListBoxColumn>
                                            <dx:ListBoxColumn Caption="Apellido" FieldName="apellido">
                                            </dx:ListBoxColumn>
                                        </Columns>
                                        <ValidationSettings>
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </td>
                                <td class="auto-style5"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="OF" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboOF" runat="server" DataSourceID="LqsListaOFLiberadas" ValueField="OF" NullText="Seleccione">
                                        <Columns>
                                            <dx:ListBoxColumn Caption="OF" FieldName="OF">
                                            </dx:ListBoxColumn>
                                            <dx:ListBoxColumn Caption="Cod Producto" FieldName="CodProducto">
                                            </dx:ListBoxColumn>
                                            <dx:ListBoxColumn Caption="Producto" FieldName="Producto">
                                            </dx:ListBoxColumn>
                                        </Columns>
                                        <ValidationSettings>
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </td>
                                <td class="auto-style5"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Turno" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboTurno" runat="server" Width="60px" NullText="Seleccione">
                                        <Items>
                                            <dx:ListEditItem Text="1" Value="1" />
                                            <dx:ListEditItem Text="2" Value="2" />
                                        </Items>
                                        <ValidationSettings>
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </td>
                                <td class="auto-style5"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Sala" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboSala" runat="server" DataSourceID="LqsSalaEnvasado" TextField="NUM_SALA" ValueField="NUM_SALA" Width="60px" NullText="Seleccione">
                                        <ValidationSettings>
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </td>
                                <td class="auto-style5"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Linea" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboLinea" runat="server" DataSourceID="LqsSalaEnvasado" TextField="Cant_Linea" ValueField="Cant_Linea" Width="60px" NullText="Seleccione">
                                        <ValidationSettings>
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div style="margin-left: 50px">
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Hora Inicio" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <asp:TextBox ID="txtHoraInicio" runat="server" TextMode="Time"></asp:TextBox>
                                </td>
                                <td class="auto-style5"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Hora Termino" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <asp:TextBox ID="txtHoraTermino" runat="server" TextMode="Time"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div style="margin-left: 50px">
                        <table>
                            <tr>
                                <td class="auto-style6">
                                    <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Abocador" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboAbocador" runat="server" DataSourceID="LqsPersonal" ValueField="Id_Personal" NullText="Seleccione">
                                        <Columns>
                                            <dx:ListBoxColumn Caption="Nombre" FieldName="Nombre">
                                            </dx:ListBoxColumn>
                                            <dx:ListBoxColumn Caption="Apellido" FieldName="apellido">
                                            </dx:ListBoxColumn>
                                        </Columns>
                                        <ValidationSettings>
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </td>
                                <td class="auto-style7"></td>
                                <td class="auto-style6">
                                    <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Origen 1" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboOrigen1" runat="server" DataSourceID="LqsPaisOrigen" TextField="Name" ValueField="Code" NullText="Seleccione">
                                    </dx:ASPxComboBox>
                                </td>
                                <td class="auto-style7"></td>
                                <td class="auto-style6">
                                    <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Origen 2" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboOrigen2" runat="server" DataSourceID="LqsPaisOrigen" TextField="Name" ValueField="Code" NullText="Seleccione"></dx:ASPxComboBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div style="margin-left: 50px">
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Lote MP/N° Silo" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtLoteMateriaPrima" runat="server" Width="170px" Height="25px">
                                        <ValidationSettings Display="Dynamic">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>

                                </td>
                                <td class="auto-style7"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Marca" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="Marca" runat="server" Width="170px" Height="25px">
                                        <ValidationSettings Display="Dynamic">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div style="margin-left: 50px">
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="Materia Prima" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtMateriaPrima" runat="server" Width="269px" Height="25px">
                                        <ValidationSettings Display="Dynamic">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>

                                </td>
                                <%--  <td class="auto-style7"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel14" runat="server" Text="Total Saldo" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtTotalSaldo" runat="server" Width="170px"></dx:ASPxTextBox>
                                </td>--%>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div style="margin-left: 50px">
                        <dx:ASPxButton ID="btnAgregarEnv" runat="server" Text="Guardar" Theme="iOS" OnClick="btnAgregarEnv_Click"></dx:ASPxButton>
                    </div>
                    <br />
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDatosControlEnvPT" KeyFieldName="ID_ControlEnvPT" OnRowCommand="GvDatos_RowCommand" OnRowDeleting="GvDatos_RowDeleting" OnRowUpdating="GvDatos_RowUpdating" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsPager PageSize="50">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" />       
            <SettingsBehavior ConfirmDelete="True" />       
            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <SettingsText ConfirmDelete="Solo usuarios verificadores pueden eliminar registros " />
            <Toolbars>
                <dx:GridViewToolbar Position="Top">
                    <Items>
                        <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                <dx:GridViewToolbarItem Command="ExportToXls" />
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
             <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default"/>
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowInCustomizationForm="True" VisibleIndex="0" ShowEditButton="True" ShowClearFilterButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="ID_ControlEnvPT" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Operador" VisibleIndex="6">
                    <PropertiesComboBox DataSourceID="LqsPersonal" ValueField="Id_Personal">
                        <Columns>
                            <dx:ListBoxColumn Caption="NOMBRE" FieldName="Nombre">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="APELLIDO" FieldName="apellido">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Abocador" VisibleIndex="16">
                    <PropertiesComboBox DataSourceID="LqsPersonal" ValueField="Id_Personal">
                        <Columns>
                            <dx:ListBoxColumn Caption="NOMBRE" FieldName="Nombre">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="APELLIDO" FieldName="apellido">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Origen1" VisibleIndex="19">
                    <PropertiesComboBox DataSourceID="LqsPaisOrigen" TextField="Name" ValueField="Code">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Origen2" VisibleIndex="20">
                    <PropertiesComboBox DataSourceID="LqsPaisOrigen" TextField="Name" ValueField="Code">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Control Film" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                    <EditCellStyle VerticalAlign="Middle">
                    </EditCellStyle>
                    <DataItemTemplate>
                        <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/menu.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Control Peso" VisibleIndex="2">
                    <EditFormSettings Visible="False" />
                    <EditCellStyle VerticalAlign="Middle">
                    </EditCellStyle>
                    <DataItemTemplate>
                        <asp:ImageButton ID="detallePeso" CommandName="cmdDetallePeso" runat="server" ImageUrl="~/Images/reloj-de-pared.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Aseo" VisibleIndex="3">
                    <EditFormSettings Visible="False" />
                    <EditCellStyle VerticalAlign="Middle">
                    </EditCellStyle>
                    <DataItemTemplate>
                        <asp:ImageButton ID="detalleAseo" CommandName="cmdDetalleAseo" runat="server" ImageUrl="~/Images/limpiar.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Puesta en Marcha" VisibleIndex="4">
                    <EditFormSettings Visible="False" />
                    <EditCellStyle VerticalAlign="Middle">
                    </EditCellStyle>
                    <DataItemTemplate>
                        <asp:ImageButton ID="detallePuestaEnMArcha" CommandName="cmdDetallePuestaEnMarcha" runat="server" ImageUrl="~/Images/engranaje.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>

                <dx:GridViewDataDateColumn FieldName="FechaRegistro" ShowInCustomizationForm="True" VisibleIndex="17">
                    <PropertiesDateEdit DisplayFormatString="">
                    </PropertiesDateEdit>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="HoraInicio" VisibleIndex="11">
                    <PropertiesTextEdit>
                        <MaskSettings Mask="HH:mm" />
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Turno" VisibleIndex="8">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="1" Value="1" />
                            <dx:ListEditItem Text="2" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Sala" VisibleIndex="9">
                    <PropertiesComboBox DataSourceID="LqsSalaEnvasado" TextField="NUM_SALA" ValueField="NUM_SALA">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Linea" VisibleIndex="10">
                    <PropertiesComboBox DataSourceID="LqsSalaEnvasado" TextField="Cant_Linea" ValueField="Cant_Linea">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="HoraTermino" VisibleIndex="12">
                    <PropertiesTextEdit>
                        <MaskSettings Mask="HH:mm" />
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="OF" VisibleIndex="7" Width="100px">
                    <PropertiesComboBox DataSourceID="ListadoOF" TextField="OF" ValueField="OF" Width="100px">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="LoteMP" VisibleIndex="21">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Marca" VisibleIndex="22">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalPallet" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalSaldo" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalMerma" VisibleIndex="15">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataHyperLinkColumn VisibleIndex="23" Caption="Informe">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detallePdf" CommandName="cmdDetallePdf" runat="server" ImageUrl="~/Images/documentpdf.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataTextColumn FieldName="MateriaPrima" VisibleIndex="18">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Estado" VisibleIndex="24">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="ABIERTO" Value="1" />
                            <dx:ListEditItem Text="CERRADO" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDatosControlEnvPT" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" OrderBy="ID_ControlEnvPT desc" TableName="CVT_ControlEnvasadoPT">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsListaOFLiberadas" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" TableName="CVT_ListaOFLiberadas">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsSalaEnvasado" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_SALASENVASADO">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsPaisOrigen" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" TableName="_PAIS_ORIGENPROD">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsPersonal" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Personal">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="ListadoOF" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" TableName="CVT_LISTADO_OF">
        </asp:LinqDataSource>

    </div>
</asp:Content>
