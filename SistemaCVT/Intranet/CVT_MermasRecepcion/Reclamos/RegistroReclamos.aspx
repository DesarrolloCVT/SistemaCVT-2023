<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="RegistroReclamos.aspx.cs" Inherits="CVT_MermasRecepcion.Reclamos.RegistroReclamos" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Reclamos</a></li>
            <li><span id="current">Registo Reclamos</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Registro Reclamos</span>
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
        <dx:ASPxGridView ID="GvDatosReclamos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsReclamos" KeyFieldName="Id_Reclamo" OnRowInserting="GvDatos_RowInserting" OnRowCommand="GvDatos_RowCommand" OnCommandButtonInitialize="GvDatos_CommandButtonInitialize" OnHtmlRowCreated="GvDatos_HtmlRowCreated" OnToolbarItemClick="GvDatosReclamos_ToolbarItemClick">
            <ClientSideEvents ToolbarItemClick="function(s, e) {
	if (e.item.name == &quot;Nuevo&quot;) e.processOnServer = true; e.usePostBack=true;}" />
            <Toolbars>
                <dx:GridViewToolbar Position="Top">
                    <Items>
                        <%-- <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif">
                            <Image Url="../Images/pn-add-source-copy.gif"></Image>
                        </dx:GridViewToolbarItem>--%>
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
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" />
            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
            <SettingsPopup>
                <CustomizationWindow Width="850px" />

                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0" ShowClearFilterButton="True" ShowUpdateButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="Folio" FieldName="Id_Reclamo" ReadOnly="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaRegReclamo" VisibleIndex="2" Caption="Fecha Registro">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="EnviaReclamo" Visible="False" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaEnvasado" VisibleIndex="9">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Lote" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Comentarios" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="EstadoReclamo" VisibleIndex="11">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Creado" Value="1" />
                            <dx:ListEditItem Text="Devuelto" Value="2" />
                            <dx:ListEditItem Text="Reenviado" Value="3" />
                            <dx:ListEditItem Text="Terminado" Value="4" />
                        </Items>
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="EncargadoReclamo" VisibleIndex="4">
                    <PropertiesComboBox DataSourceID="LqsUsuarios" TextField="NombreUsuario" ValueField="IdUsuario" Width="150px">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Producto" VisibleIndex="7">
                    <PropertiesComboBox DataSourceID="LqDsProductos" ValueField="ArticleProvider_CodClient">
                        <Columns>
                            <dx:ListBoxColumn Caption="CodProducto" FieldName="ArticleProvider_CodClient" Width="200px">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Decripcion" FieldName="ArticleProvider_Description" Width="450px">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Destinatario" VisibleIndex="13">
                    <EditFormSettings Visible="False" />
                    <EditCellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </EditCellStyle>
                    <DataItemTemplate>
                        <asp:ImageButton ID="destinatario" CommandName="cmdDestinatario" runat="server" ImageUrl="~/Images/CamionEnvio.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Detalle" VisibleIndex="14">
                    <EditFormSettings Visible="False" />
                    <EditCellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </EditCellStyle>
                    <DataItemTemplate>
                        <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/paquete.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Documentos" VisibleIndex="15">
                    <EditFormSettings Visible="False" />
                    <EditCellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </EditCellStyle>
                    <DataItemTemplate>
                        <asp:ImageButton ID="documentos" CommandName="cmdDocumentos" runat="server" ImageUrl="~/Images/documento.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Terminar" VisibleIndex="16">
                    <PropertiesHyperLinkEdit ImageWidth="32px">
                    </PropertiesHyperLinkEdit>
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="enviado" CommandName="cmdEnviado" runat="server" ImageUrl="~/Images/ico-vigente.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataComboBoxColumn FieldName="MotivoReclamo" VisibleIndex="5" Caption="Tipo">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Reclamo" Value="1" />
                            <dx:ListEditItem Text="Donacion" Value="2" />
                            <dx:ListEditItem Text="Muestra" Value="3" />
                            <dx:ListEditItem Text="Otros" Value="4" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataDateColumn FieldName="FechaSolicitud" VisibleIndex="3">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="ObservacionEstado" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsReclamos" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Reclamo" EnableDelete="True" EnableInsert="True" EnableUpdate="True" OrderBy="Id_Reclamo desc">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsUsuarios" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Usuarios" Where="IdPerfil != @IdPerfil">
            <WhereParameters>
                <asp:Parameter DefaultValue="0" Name="IdPerfil" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqDsProductos" runat="server" EntityTypeName=""
            ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext"
            TableName="ArticleProvider">
        </asp:LinqDataSource>
    </div>
    <br />
    <dx:ASPxPopupControl ID="PopNuevo" runat="server" AllowDragging="True" HeaderText="Nuevo" Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="TopSides" Theme="Office2010Blue" Width="704px" CloseAction="None">
        <ContentCollection>
            <dx:PopupControlContentControl>
                <br />
                <div style="margin-left: 20px">
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Tipo"></dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboReclamo" runat="server" ValueType="System.String" Height="30px" Width="180px" OnSelectedIndexChanged="cboReclamo_SelectedIndexChanged" AutoPostBack="True">
                                        <Items>
                                            <dx:ListEditItem Text="Reclamo" Value="1" />
                                            <dx:ListEditItem Text="Donacion" Value="2" />
                                            <dx:ListEditItem Text="Muestra" Value="3" />
                                            <dx:ListEditItem Text="Otros" Value="4" />
                                        </Items>
                                        <ValidationSettings Display="Dynamic">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </td>
                                <td class="auto-style5"></td>
                                <td>
                                    <dx:ASPxLabel ID="lblFsolicitud" runat="server" Text="Fecha Solicitud" Visible="false"></dx:ASPxLabel>
                                    <dx:ASPxDateEdit ID="dteFechSolicitud" runat="server" Height="30px" Visible="false"></dx:ASPxDateEdit>
                                </td>
                                <td class="auto-style5"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Encargado Reclamo"></dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboEncargadoReclamo" runat="server" ValueType="System.String" DataSourceID="LqsUsuarios" Height="30px" TextField="NombreUsuario" ValueField="IdUsuario" Width="250px">
                                        <ValidationSettings Display="Dynamic">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <br />
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Producto"></dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboProducto" runat="server" ValueType="System.String" DataSourceID="LqDsProductos" Height="30px" ValueField="ArticleProvider_CodClient" Width="250px">
                                        <Columns>
                                            <dx:ListBoxColumn Caption="Codigo Producto" FieldName="ArticleProvider_CodClient">
                                            </dx:ListBoxColumn>
                                            <dx:ListBoxColumn Caption="Producto" FieldName="ArticleProvider_Description" Width="450px">
                                            </dx:ListBoxColumn>
                                        </Columns>
                                        <ValidationSettings Display="Dynamic">
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </td>
                                <td class="auto-style8"></td>
                                <td class="auto-style7">
                                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Fecha Envasado"></dx:ASPxLabel>
                                    <dx:ASPxDateEdit ID="dteFechaEnvasado" runat="server" Height="30px">
                                        <ValidationSettings Display="Dynamic">
                                        </ValidationSettings>
                                    </dx:ASPxDateEdit>
                                </td>
                                <td class="auto-style8"></td>
                                <td class="auto-style7">
                                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Lote"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtLote" runat="server" Width="180px" Height="30px">
                                        <ValidationSettings Display="Dynamic">
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <br />
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Comentarios"></dx:ASPxLabel>
                                    <dx:ASPxMemo ID="txtComentarios" runat="server" Height="71px" Width="635px"></dx:ASPxMemo>
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
                                <dx:ASPxButton ID="btnGuardar" runat="server" Text="Guardar" Height="40px" Width="100px" OnClick="btnGuardar_Click">
                                    <Image IconID="pdfviewer_import_svg_32x32">
                                    </Image>
                                </dx:ASPxButton>
                            </td>
                            <td class="auto-style6"></td>
                            <%--      <td class="auto-style9">
                                <dx:ASPxButton ID="btnLimpiar" runat="server" Text="Limpiar Datos" Height="40px" Width="100px" OnClick="btnLimpiar_Click" CausesValidation="False">
                                    <Image IconID="dashboards_removedataitems_svg_32x32">
                                    </Image>
                                </dx:ASPxButton>
                            </td>--%>
                            <td class="auto-style6"></td>
                            <td>
                                <dx:ASPxButton ID="btnCancelar" runat="server" Text="Cancelar" Height="40px" Width="100px" CausesValidation="False" OnClick="btnCancelar_Click">
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

    <dx:ASPxPopupControl ID="popArchivos" runat="server" AllowDragging="True" CloseAction="CloseButton" CloseAnimationType="Fade" DragElement="Window" HeaderText="Archivos Adjuntos" Modal="True" PopupAction="None" PopupAnimationType="Slide" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="TopSides" Theme="Office2010Blue" Width="500px">
        <ContentCollection>
            <dx:PopupControlContentControl>
                <div>
                    <div>
                        <div style="margin-left: 30px">
                            <div>
                                <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Subir Archivo " Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                            </div>
                            <dx:ASPxUploadControl ID="FileUpload1" runat="server" Width="400px" Height="80px" OnFileUploadComplete="FileUpload1_FileUploadComplete" ShowProgressPanel="True" ShowUploadButton="True" Theme="iOS" AddUploadButtonsHorizontalPosition="Center" UploadMode="Auto">
                                <ValidationSettings MaxFileSize="4194304" MaxFileSizeErrorText="Excede el tamaño maximo, which is {0} bytes" GeneralErrorText="Excede el tamaño maximo">
                                </ValidationSettings>
                                <ClientSideEvents FileUploadComplete="function(s, e) {
}" />
                                <UploadButton Text="Subir archivo">
                                    <Image IconID="pdfviewer_previous_svg_32x32">
                                    </Image>
                                </UploadButton>
                                <AdvancedModeSettings PacketSize="4194304" EnableFileList="True" EnableMultiSelect="True">
                                </AdvancedModeSettings>
                            </dx:ASPxUploadControl>
                        </div>
                        <br />
                        <div>
                            <div>
                                <dx:ASPxButton ID="btnRecargaGrilla" runat="server" Text="Recargar Vista" Height="47px" Theme="Material" Width="199px" OnClick="btnRecargaGrilla_Click"></dx:ASPxButton>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div>
                        <dx:ASPxGridView ID="GvDatosAdj" runat="server" AutoGenerateColumns="False" DataSourceID="LqsRutaAdjunto" KeyFieldName="Id_RutaArchivoReclamo" OnRowCommand="GvDatosAdj_RowCommand" Theme="Aqua" Width="450px" OnRowDeleting="GvDatosAdj_RowDeleting">
                            <SettingsBehavior ConfirmDelete="True" />
                            <SettingsPopup>
                                <FilterControl AutoUpdatePosition="False"></FilterControl>
                            </SettingsPopup>
                            <Columns>
                                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataTextColumn FieldName="Id_Reclamo" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="RutaArchivo" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataHyperLinkColumn Caption="Archivos" VisibleIndex="5" Width="25px">
                                    <PropertiesHyperLinkEdit>
                                        <Style HorizontalAlign="Center" VerticalAlign="Middle">
                                            </Style>
                                    </PropertiesHyperLinkEdit>
                                    <EditFormSettings Visible="False" />
                                    <DataItemTemplate>
                                        <asp:ImageButton ID="archivosHistorial" CommandName="cmdArchivosHistorial" runat="server" ImageUrl="~/Images/descargar.png" />
                                    </DataItemTemplate>
                                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                                    </CellStyle>
                                </dx:GridViewDataHyperLinkColumn>
                                <dx:GridViewDataTextColumn FieldName="NombreArchivo" ShowInCustomizationForm="True" VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Extencion" ShowInCustomizationForm="True" VisibleIndex="4">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:ASPxGridView>
                        <asp:LinqDataSource ID="LqsRutaAdjunto" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Reclamo_Archivos" Where="Id_Reclamo == @Id_Reclamo" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
                            <WhereParameters>
                                <asp:SessionParameter DefaultValue="0" Name="Id_Reclamo" SessionField="idReclamo" Type="Int32" />
                            </WhereParameters>
                        </asp:LinqDataSource>
                    </div>
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>


</asp:Content>
