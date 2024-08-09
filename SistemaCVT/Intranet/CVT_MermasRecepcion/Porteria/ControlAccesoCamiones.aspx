<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ControlAccesoCamiones.aspx.cs" Inherits="CVT_MermasRecepcion.Porteria.ControlAccesoCamiones" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1 {
            width: 100%;
        }
        .auto-style5 {
            height: 32px;
        }
    </style>
    <script type="text/javascript">
        function OnFileUploadComplete(s, e) {
            document.getElementById('image').src = e.callbackData;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Porteria</a></li>
            <li><span id="current">Registro Camiones</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Resgistro Camiones</span>
        <span class="tab-end"></span>
        <%--        <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" />
                Exportar Excel</a>
            <a>
                <asp:ImageButton ID="cmdNew" runat="server"
                    ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" />Nuevo</a>

        </div>--%>
    </div>
    <div>

        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqDsControlAcceso" KeyFieldName="AccesoCamion_Id"
            OnRowCommand="ASPxGridView1_RowCommand" OnToolbarItemClick="ASPxGridView1_ToolbarItemClick">
            <ClientSideEvents ToolbarItemClick="function(s, e) {
	if (e.item.name == &quot;Nuevo&quot;) e.processOnServer = true; e.usePostBack=true;
 

}" />
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            <Toolbars>
                <dx:GridViewToolbar >
                    <Items>
                        <dx:GridViewToolbarItem Command="Custom" Name="Nuevo" Text="Nuevo" Image-Url="../../Images/pn-add-source-copy.gif" >
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
            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="C.Acceso" FieldName="AccesoCamion_Id"
                    ReadOnly="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataCheckColumn Caption="C. Propio" FieldName="Propio"
                    VisibleIndex="3">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataTextColumn FieldName="Patente" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Chofer" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Camion_Id" Visible="False"
                    VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Chofer_Id" Visible="False"
                    VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataCheckColumn FieldName="Devolucion" VisibleIndex="10">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataTextColumn FieldName="Patente_Rampla" Visible="False"
                    VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Comentario" Visible="False"
                    VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Motivo" VisibleIndex="2">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Recepcion" Value="1" />
                            <dx:ListEditItem Text="Despacho" Value="2" />
                            <dx:ListEditItem Text="Devolucion" Value="3" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Estado" VisibleIndex="12">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem ImageUrl="~/MenuImg/semaforov.png" Text="Abierto" Value="1" />
                            <dx:ListEditItem ImageUrl="~/MenuImg/semaforor.png" Text="Cerrado" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Cerrar" VisibleIndex="15">
                    <DataItemTemplate>
                        <asp:ImageButton ID="Cerrar" CommandName="cmdCerrar" runat="server" ImageUrl="~/MenuImg/activity.gif" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataDateColumn FieldName="FechaIngreso" VisibleIndex="8">
                    <PropertiesDateEdit DisplayFormatString="dd/MM/yy HH:mm">
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="FechaSalida" VisibleIndex="9">
                    <PropertiesDateEdit DisplayFormatString="dd/MM/yy HH:mm">
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="FechaEntrega" VisibleIndex="11">
                    <PropertiesDateEdit DisplayFormatString="dd/MM/yy HH:mm">
                    </PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsControlAcceso" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
            TableName="CVT_ControlAcceso" OrderBy="AccesoCamion_Id desc">
        </asp:LinqDataSource>
        <dx:ASPxPopupControl ID="popup_nuevo" runat="server" HeaderText="Nuevo"
            Width="900px">
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <table class="style1">
                        <tr>
                            <td colspan="4">
                                <dx:ASPxRoundPanel ID="ASPxRoundPanel3" runat="server"
                                    HeaderText="Control Acceso" ShowCollapseButton="True" Width="200px">
                                    <PanelCollection>
                                        <dx:PanelContent runat="server">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Motivo">
                                                        </dx:ASPxLabel>
                                                    </td>
                                                    <td>
                                                        <dx:ASPxComboBox ID="cbo_Motivo" runat="server">
                                                            <Items>
                                                                <dx:ListEditItem Text="Recepcion" Value="1" />
                                                                <dx:ListEditItem Text="Despacho" Value="2" />
                                                                <dx:ListEditItem Text="Devolucion" Value="3" />
                                                            </Items>
                                                        </dx:ASPxComboBox>
                                                    </td>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="C. Propio">
                                                        </dx:ASPxLabel>
                                                    </td>
                                                    <td>
                                                        <dx:ASPxCheckBox ID="chk_propio" runat="server" CheckState="Unchecked">
                                                        </dx:ASPxCheckBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="RUN Chofer">
                                                        </dx:ASPxLabel>
                                                    </td>
                                                    <td>
                                                        <dx:ASPxTextBox ID="txt_runchofer" runat="server" Width="170px">
                                                        </dx:ASPxTextBox>
                                                    </td>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Nom. Chofer">
                                                        </dx:ASPxLabel>
                                                    </td>
                                                    <td>
                                                        <dx:ASPxTextBox ID="txt_nombrechofer" runat="server" Width="170px">
                                                        </dx:ASPxTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Patente Camion">
                                                        </dx:ASPxLabel>
                                                    </td>
                                                    <td>
                                                        <dx:ASPxTextBox ID="txt_patentecamion" runat="server" Width="170px">
                                                        </dx:ASPxTextBox>
                                                    </td>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Patente Rampla">
                                                        </dx:ASPxLabel>
                                                    </td>
                                                    <td>
                                                        <dx:ASPxTextBox ID="txt_patenterampla" runat="server" Width="170px">
                                                        </dx:ASPxTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel15" runat="server" Text="Comentario">
                                                        </dx:ASPxLabel>
                                                    </td>
                                                    <td>
                                                        <dx:ASPxMemo ID="txt_comentariocontrol" runat="server" Height="71px"
                                                            Width="170px">
                                                        </dx:ASPxMemo>
                                                    </td>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel17" runat="server" Text="Fecha Hora Entrega">
                                                        </dx:ASPxLabel>
                                                    </td>
                                                    <td>
                                                        <dx:ASPxDateEdit ID="cbo_fechaentrega" runat="server">
                                                        </dx:ASPxDateEdit>
                                                        <dx:ASPxTimeEdit ID="cbo_horaentrega" runat="server">
                                                        </dx:ASPxTimeEdit>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel18" runat="server" Text="Sello">
                                                        </dx:ASPxLabel>
                                                    </td>
                                                    <td>
                                                        <dx:ASPxTextBox ID="txt_patenterampla0" runat="server" Width="170px">
                                                        </dx:ASPxTextBox>
                                                    </td>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel19" runat="server" Text="N Despacho">
                                                        </dx:ASPxLabel>
                                                    </td>
                                                    <td>
                                                        <dx:ASPxTextBox ID="txt_patenterampla1" runat="server" Width="170px">
                                                        </dx:ASPxTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxButton ID="btn_GrabarCA" runat="server" Text="Grabar"
                                                            OnClick="btn_GrabarCA_Click">
                                                        </dx:ASPxButton>
                                                    </td>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel8" runat="server">
                                                        </dx:ASPxLabel>
                                                    </td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                            </table>
                                        </dx:PanelContent>
                                    </PanelCollection>
                                </dx:ASPxRoundPanel>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="4">
                                <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server"
                                    HeaderText="Documentos Relacionados" Width="200px" Visible="False">
                                    <PanelCollection>
                                        <dx:PanelContent runat="server">
                                            <table class="style1">
                                                <tr>
                                                    <td class="auto-style5">
                                                        <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Tipo Documento">
                                                        </dx:ASPxLabel>
                                                    </td>
                                                    <td class="auto-style5">
                                                        <dx:ASPxComboBox ID="cbo_tipodoc" runat="server">
                                                            <Items>
                                                                <dx:ListEditItem Text="Factura" Value="Factura" />
                                                                <dx:ListEditItem Text="Guia Despacho" Value="GuiaDespacho" />
                                                                <dx:ListEditItem Text="Cheque" Value="Cheque" />
                                                                <dx:ListEditItem Text="Otro" Value="Otro" />
                                                            </Items>
                                                        </dx:ASPxComboBox>
                                                    </td>
                                                    <td class="auto-style5">
                                                        <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="Num. Documento">
                                                        </dx:ASPxLabel>
                                                    </td>
                                                    <td class="auto-style5">
                                                        <dx:ASPxTextBox ID="txt_numdoc" runat="server" Width="170px">
                                                        </dx:ASPxTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel14" runat="server" Text="Comentario">
                                                        </dx:ASPxLabel>
                                                    </td>
                                                    <td>
                                                        <dx:ASPxMemo ID="txt_comentariodoc" runat="server" Height="71px" Width="170px">
                                                        </dx:ASPxMemo>
                                                    </td>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel16" runat="server" Text="Subir Archivo">
                                                        </dx:ASPxLabel>
                                                    </td>
                                                    <td>
                                                        <dx:ASPxUploadControl ID="Upload" runat="server" ShowUploadButton="True" OnFileUploadComplete="Upload_FileUploadComplete">
                                                            <ValidationSettings AllowedFileExtensions=".jpg,.jpeg,.jpe,.gif">
                                                            </ValidationSettings>
                                                            <ClientSideEvents FileUploadComplete="OnFileUploadComplete" />
                                                        </dx:ASPxUploadControl>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>
                                                        <dx:ASPxButton ID="btn_agregarDoc" runat="server" Text="AGREGAR"
                                                            OnClick="btn_agregarDoc_Click">
                                                        </dx:ASPxButton>
                                                    </td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4">
                                                        <dx:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False"
                                                            DataSourceID="LqDsDoc" KeyFieldName="DocControlAcceso_Id"
                                                            OnRowCommand="ASPxGridView2_RowCommand">
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn FieldName="DocControlAcceso_Id" ReadOnly="True"
                                                                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                                                    <EditFormSettings Visible="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="ControlAcceso_Id"
                                                                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="TipoDocumento"
                                                                    ShowInCustomizationForm="True" VisibleIndex="2">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="NumDocumento"
                                                                    ShowInCustomizationForm="True" VisibleIndex="3">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="Comentario"
                                                                    ShowInCustomizationForm="True" VisibleIndex="4">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataDateColumn FieldName="Fecha" ShowInCustomizationForm="True"
                                                                    VisibleIndex="5">
                                                                </dx:GridViewDataDateColumn>
                                                                <dx:GridViewDataTextColumn FieldName="Extencion" ShowInCustomizationForm="True"
                                                                    Visible="False" VisibleIndex="6">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="Mime" ShowInCustomizationForm="True"
                                                                    Visible="False" VisibleIndex="7">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataHyperLinkColumn Caption="Doc" VisibleIndex="8">
                                                                    <DataItemTemplate>
                                                                        <asp:ImageButton ID="Doc" CommandName="cmdDoc" runat="server" ImageUrl="~/Images/reception.png" />
                                                                    </DataItemTemplate>
                                                                </dx:GridViewDataHyperLinkColumn>
                                                            </Columns>
                                                        </dx:ASPxGridView>
                                                        <asp:LinqDataSource ID="LqDsDoc" runat="server"
                                                            ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
                                                            TableName="CVT_DocControlAcceso"
                                                            Where="ControlAcceso_Id == @ControlAcceso_Id">
                                                            <WhereParameters>
                                                                <asp:SessionParameter DefaultValue="0" Name="ControlAcceso_Id"
                                                                    SessionField="ControlId" Type="Int32" />
                                                            </WhereParameters>
                                                        </asp:LinqDataSource>
                                                        <div>
                                                            <dx:ASPxButton ID="btn_ocultar" runat="server" Text="Cerrar Imagen"
                                                                OnClick="btn_ocultar_Click">
                                                            </dx:ASPxButton>
                                                            <dx:ASPxBinaryImage ID="ASPxBinaryImage1" runat="server">
                                                            </dx:ASPxBinaryImage>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </dx:PanelContent>
                                    </PanelCollection>
                                </dx:ASPxRoundPanel>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" HeaderText="Peonetas"
                                    Width="200px" Visible="False">
                                    <PanelCollection>
                                        <dx:PanelContent runat="server">
                                            <table class="style1">
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="RUN">
                                                        </dx:ASPxLabel>
                                                    </td>
                                                    <td>
                                                        <dx:ASPxTextBox ID="txt_runpeoneta" runat="server" Width="170px">
                                                        </dx:ASPxTextBox>
                                                    </td>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Nombre">
                                                        </dx:ASPxLabel>
                                                    </td>
                                                    <td>
                                                        <dx:ASPxTextBox ID="txt_nombrepeoneta" runat="server" Width="170px">
                                                        </dx:ASPxTextBox>
                                                    </td>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Comentarios">
                                                        </dx:ASPxLabel>
                                                    </td>
                                                    <td>
                                                        <dx:ASPxMemo ID="txt_comentariopeoneta" runat="server" Height="71px"
                                                            Width="170px">
                                                        </dx:ASPxMemo>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>&nbsp;</td>
                                                    <td>
                                                        <dx:ASPxButton ID="btn_agregarpeoneta" runat="server" Text="AGREGAR"
                                                            OnClick="btn_agregarpeoneta_Click">
                                                        </dx:ASPxButton>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="6">
                                                        <dx:ASPxGridView ID="Gv_Peoneta" runat="server" AutoGenerateColumns="False"
                                                            DataSourceID="LqDsPeonetas" KeyFieldName="Peoneta_Id">
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn FieldName="Peoneta_Id" ReadOnly="True"
                                                                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                                                    <EditFormSettings Visible="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="ControlAcceso_Id"
                                                                    ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="RUN" ShowInCustomizationForm="True"
                                                                    VisibleIndex="2">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="Nombre" ShowInCustomizationForm="True"
                                                                    VisibleIndex="3">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="Observacion"
                                                                    ShowInCustomizationForm="True" VisibleIndex="4">
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                        </dx:ASPxGridView>
                                                        <asp:LinqDataSource ID="LqDsPeonetas" runat="server"
                                                            ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
                                                            TableName="CVT_PeonetaControlAcceso"
                                                            Where="ControlAcceso_Id == @ControlAcceso_Id">
                                                            <WhereParameters>
                                                                <asp:SessionParameter DefaultValue="0" Name="ControlAcceso_Id"
                                                                    SessionField="ControlId" Type="Int32" />
                                                            </WhereParameters>
                                                        </asp:LinqDataSource>
                                                    </td>
                                                </tr>
                                            </table>
                                        </dx:PanelContent>
                                    </PanelCollection>
                                </dx:ASPxRoundPanel>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>

    </div>
</asp:Content>
