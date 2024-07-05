<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AgendamientoProduccion.aspx.cs" Inherits="CVT_MermasRecepcion.SAP.AgendamientoProduccion" %>

<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>
<%@ Register Assembly="DevExpress.XtraScheduler.v22.1.Core, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraScheduler" TagPrefix="cc1" %>
<%@ Register Assembly="DevExpress.XtraScheduler.v22.1.Core.Desktop, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraScheduler" TagPrefix="cc1" %>
<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 21px;
        }

        .auto-style6 {
            width: 20px;
        }

        .auto-style7 {
            width: 15px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>SAP</a></li>
            <li><span id="current">Agendamiento Produccion</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Agendamientos</span>
        <span class="tab-end"></span>

        <%--     <div id="options">
            <a>
                <asp:ImageButton ID="cmdNuevo" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-agregar3.png"
                    OnClick="cmdNuevo_Click" />
            </a>
        </div>--%>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqDsAgendamiento" KeyFieldName="AgendamientoId"
            Style="margin-bottom: 0px" Width="250px" OnToolbarItemClick="GvDatos_ToolbarItemClick" OnHtmlRowCreated="GvDatos_HtmlRowCreated" OnRowCommand="GvDatos_RowCommand">
            <ClientSideEvents ToolbarItemClick="function(s, e) {
	if (e.item.name == &quot;Nuevo&quot;) e.processOnServer = true; e.usePostBack=true;
 

}" />
            <SettingsPager PageSize="100">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" />
            <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="AgendamientoId" ReadOnly="True" VisibleIndex="1" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Inicio" VisibleIndex="7" Caption="Fech.Inicio">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="Termino" VisibleIndex="8" Caption="Fech.Termino">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Asunto" VisibleIndex="3">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Descripcion" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ProductoCode" VisibleIndex="4" Caption="Cod.Producto">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="OF_DocEntry" VisibleIndex="2" Caption="OF">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaLimite" VisibleIndex="9">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="CantidadPlanificada" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CantidadProducida" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Turno" VisibleIndex="15">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Semana" VisibleIndex="16">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Recurso" FieldName="RecursoId" VisibleIndex="10">
                    <PropertiesComboBox DataSourceID="LqDsRecursos" TextField="Nombre_Recurso" ValueField="RecursoId">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Estado" VisibleIndex="6">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Creado" Value="0" />
                            <dx:ListEditItem Text="Terminado" Value="1" />
                        </Items>
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Tipo_Produccion" VisibleIndex="11">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Producto Terminado" Value="1" />
                            <dx:ListEditItem Text="Semi Elaborado" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Estado_OF" VisibleIndex="14">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Planificada" Value="1" />
                            <dx:ListEditItem Text="Liberada" Value="2" />
                            <dx:ListEditItem Text="Terminada" Value="3" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Terminar" VisibleIndex="20">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="Confirma" CommandName="cmdConfirma" runat="server"
                            ImageUrl="~/Images/checklist.png" OnClientClick="LoadingPanel.Show();" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
            </Columns>
            <Toolbars>
                <dx:GridViewToolbar >
                    <Items>
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
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
    </div>
    <div>
        <asp:LinqDataSource ID="LqDsRecursos" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
            TableName="CVT_Recurso">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqDsAgendamiento" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext"
            TableName="CVT_Agendamiento" EnableDelete="True" EnableInsert="True"
            EnableUpdate="True" EnableViewState="False"
            StoreOriginalValuesInViewState="False" EntityTypeName="">
        </asp:LinqDataSource>

        <asp:LinqDataSource runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext"
            TableName="CVT_LineasProduccion" EntityTypeName="" ID="LqDsLineas">
        </asp:LinqDataSource>

        <asp:LinqDataSource runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext"
            TableName="vp_Productos_Elaboracion_Propia" EntityTypeName="" ID="LqDsProducto">
        </asp:LinqDataSource>

        <%--        <dx:ASPxPopupControl ID="PopUp_Editar" runat="server"
            ClientInstanceName="popEdita" HeaderText="Editar"
            OnWindowCallback="PopUp_Editar_WindowCallback" Width="523px"
            AllowDragging="True" PopupAction="None" PopupHorizontalAlign="WindowCenter"
            PopupVerticalAlign="WindowCenter">
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <table class="dxeBinImgCPnlSys">
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel17" runat="server" Text="Semana">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="txtsemana" runat="server" Width="170px">
                                </dx:ASPxTextBox>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Inicio">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxDateEdit ID="cboinicio" runat="server" EditFormat="DateTime">
                                </dx:ASPxDateEdit>
                            </td>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Termino">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxDateEdit ID="cbotermino" runat="server" EditFormat="DateTime">
                                </dx:ASPxDateEdit>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Producto">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxComboBox ID="cboproducto" runat="server" DataSourceID="LqDsProducto"
                                    ValueField="ItemCode">
                                    <Columns>
                                        <dx:ListBoxColumn FieldName="ItemCode" Name="Codigo" />
                                        <dx:ListBoxColumn FieldName="ItemName" Name="Producto" />
                                    </Columns>
                                </dx:ASPxComboBox>
                            </td>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Fecha Limite">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxDateEdit ID="cboflimite" runat="server">
                                </dx:ASPxDateEdit>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Cant. Planificada">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="txtcantplanificada" runat="server" Width="170px">
                                </dx:ASPxTextBox>
                            </td>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Estado">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxComboBox ID="cboestado" runat="server" SelectedIndex="0">
                                    <Items>
                                        <dx:ListEditItem Selected="True" Text="Creada" Value="0" />
                                        <dx:ListEditItem Text="Sincronizada" Value="1" />
                                        <dx:ListEditItem Text="En Proceso" Value="2" />
                                        <dx:ListEditItem Text="Terminada" Value="3" />
                                    </Items>
                                </dx:ASPxComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Recurso">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxComboBox ID="cborecurso" runat="server" DataSourceID="LqDsRecursos"
                                    TextField="Nombre_Recurso" ValueField="RecursoId">
                                </dx:ASPxComboBox>
                            </td>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Tipo Produccion">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxComboBox ID="cbotipoproduccion" runat="server">
                                    <Items>
                                        <dx:ListEditItem Text="Producto Terminado" Value="1" />
                                        <dx:ListEditItem Text="Semi Elaborado" Value="2" />
                                    </Items>
                                </dx:ASPxComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel16" runat="server" Text="Turno">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxComboBox ID="cboturno" runat="server" SelectedIndex="0">
                                    <Items>
                                        <dx:ListEditItem Selected="True" Text="Dia" Value="1" />
                                        <dx:ListEditItem Text="Noche" Value="2" />
                                        <dx:ListEditItem Text="Ambos" Value="3" />
                                    </Items>
                                </dx:ASPxComboBox>
                            </td>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel14" runat="server" Text="Lineas">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxCheckBoxList ID="chklineas" runat="server" DataSourceID="LqDsLineas"
                                    TextField="Numero_Linea" ValueField="LineaId" ValueType="System.Int32"
                                    RepeatColumns="2">
                                </dx:ASPxCheckBoxList>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="OF">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="txtof" runat="server" Width="170px">
                                </dx:ASPxTextBox>
                            </td>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="Cant. Producida">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="txtcantproducida" runat="server" Width="170px">
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Estado OF">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxComboBox ID="cboestadoof" runat="server">
                                    <Items>
                                        <dx:ListEditItem Text="Planificada" Value="P" />
                                        <dx:ListEditItem Text="Liberada" Value="L" />
                                        <dx:ListEditItem Text="Terminada" Value="C" />
                                    </Items>
                                </dx:ASPxComboBox>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Comentarios">
                                </dx:ASPxLabel>
                            </td>
                            <td colspan="3">
                                <dx:ASPxTextBox ID="txtcomentario" runat="server" AutoResizeWithContainer="True"
                                    Height="48px" Width="280px">
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <dx:ASPxButton ID="btn_actualizar" runat="server" Text="Actualizar"
                                    OnClick="btn_actualizar_Click">
                                </dx:ASPxButton>
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                <dx:ASPxButton ID="btn_cancelarE" runat="server" Text="Cancelar"
                                    OnClick="btn_cancelarE_Click">
                                </dx:ASPxButton>
                            </td>
                        </tr>
                    </table>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>--%>
        <dx:ASPxPopupControl ID="PopUp_Nuevo" runat="server"
            HeaderText="Nuevo" Width="728px"
            AllowDragging="True" PopupAction="None" PopupHorizontalAlign="WindowCenter"
            PopupVerticalAlign="WindowCenter">
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="OF" Font-Bold="true" Font-Size="Medium">
                                    </dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtOf" runat="server" Width="170px" Height="30px">
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="auto-style6"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Estado OF" Font-Bold="true" Font-Size="Medium">
                                    </dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboestadoof" runat="server" Height="30px" SelectedIndex="1">
                                        <Items>
                                            <dx:ListEditItem Text="Planificada" Value="1" />
                                            <dx:ListEditItem Text="Liberada" Value="2" Selected="True" />
                                            <dx:ListEditItem Text="Terminada" Value="3" />
                                        </Items>
                                    </dx:ASPxComboBox>
                                </td>
                                <td class="auto-style6"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel18" runat="server" Text="Semana" Font-Bold="true" Font-Size="Medium">
                                    </dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtsemana1" runat="server" Width="170px" Height="30px">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel19" runat="server" Text="Fecha Inicio" Font-Bold="true" Font-Size="Medium">
                                    </dx:ASPxLabel>
                                    <dx:ASPxDateEdit ID="cboinicio1" runat="server" EditFormat="DateTime" Height="30px">
                                    </dx:ASPxDateEdit>
                                </td>
                                <td class="auto-style6"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel20" runat="server" Text="Fecha Termino" Font-Bold="true" Font-Size="Medium">
                                    </dx:ASPxLabel>
                                    <dx:ASPxDateEdit ID="cbotermino1" runat="server" EditFormat="DateTime" Height="30px">
                                    </dx:ASPxDateEdit>
                                </td>
                                <td class="auto-style6"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel22" runat="server" Text="Fecha Limite" Font-Bold="true" Font-Size="Medium">
                                    </dx:ASPxLabel>
                                    <dx:ASPxDateEdit ID="cboflimite1" runat="server" Height="30px">
                                    </dx:ASPxDateEdit>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel21" runat="server" Text="Producto" Font-Bold="true" Font-Size="Medium">
                                    </dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboproducto1" runat="server" DataSourceID="LqDsProducto"
                                        ValueField="ItemCode" TextField="ItemName" AutoPostBack="True"
                                        OnSelectedIndexChanged="cboproducto1_SelectedIndexChanged" Height="30px" Width="350px">
                                        <Columns>
                                            <dx:ListBoxColumn FieldName="ItemCode" Name="Codigo" />
                                            <dx:ListBoxColumn FieldName="ItemName" Name="Producto" />
                                        </Columns>
                                    </dx:ASPxComboBox>
                                </td>
                                <td class="auto-style6"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel25" runat="server" Text="Cant. Planificada" Font-Bold="true" Font-Size="Medium">
                                    </dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtcantplanificada1" runat="server" AutoPostBack="True"
                                        OnTextChanged="txtcantplanificada1_TextChanged" Text="1" Width="170px" Height="30px">
                                    </dx:ASPxTextBox>
                                </td>
                                <td class="auto-style6"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel24" runat="server" Text="Estado" Font-Bold="true" Font-Size="Medium">
                                    </dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboestado1" runat="server" Enabled="False"
                                        SelectedIndex="0" Height="30px">
                                        <Items>
                                            <dx:ListEditItem Selected="True" Text="Creada" Value="0" />
                                            <dx:ListEditItem Text="Terminada" Value="1" />
                                        </Items>
                                    </dx:ASPxComboBox>
                                </td>

                            </tr>
                        </table>
                    </div>
                    <br />
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel23" runat="server" Text="Recurso" Font-Bold="true" Font-Size="Medium">
                                    </dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cborecurso1" runat="server" DataSourceID="LqDsRecursos"
                                        TextField="Nombre_Recurso" ValueField="RecursoId" Height="30px">
                                    </dx:ASPxComboBox>
                                </td>
                                <td class="auto-style6"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel26" runat="server" Text="Tipo Produccion" Font-Bold="true" Font-Size="Medium">
                                    </dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cbotipoproduccion1" runat="server" Height="30px">
                                        <Items>
                                            <dx:ListEditItem Text="Producto Terminado" Value="1" />
                                            <dx:ListEditItem Text="Semi Elaborado" Value="2" />
                                        </Items>
                                    </dx:ASPxComboBox>
                                </td>
                                <td class="auto-style6"></td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel27" runat="server" Text="Turno" Font-Bold="true" Font-Size="Medium">
                                    </dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboturno1" runat="server" SelectedIndex="0" Height="30px">
                                        <Items>
                                            <dx:ListEditItem Selected="True" Text="Dia" Value="1" />
                                            <dx:ListEditItem Text="Noche" Value="2" />
                                            <dx:ListEditItem Text="Ambos" Value="3" />
                                        </Items>
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel28" runat="server" Text="Lineas" Font-Bold="true" Font-Size="Medium">
                                    </dx:ASPxLabel>
                                    <dx:ASPxCheckBoxList ID="chklineas1" runat="server"
                                        DataSourceID="LqDsLineas" TextField="Numero_Linea" ValueField="LineaId"
                                        ValueType="System.Int32" RepeatColumns="2" Border-BorderStyle="None" Theme="MaterialCompact">
                                        <Border BorderStyle="None"></Border>
                                    </dx:ASPxCheckBoxList>
                                </td>
                                <td class="auto-style6"></td>
                                <td>
                                    <dx:ASPxLabel runat="server" Text="Comentarios" ID="ASPxLabel32" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                    <dx:ASPxTextBox runat="server" Width="280px" AutoResizeWithContainer="True"
                                        Height="74px" ID="txtcomentario1">
                                    </dx:ASPxTextBox>

                                </td>
                                <td class="auto-style7"></td>
                                <td class="auto-style5">
                                    <dx:ASPxButton ID="btn_Agregar" runat="server" Text="Agregar"
                                        OnClick="btn_Agregar_Click" Height="50px" Width="150px">
                                    </dx:ASPxButton>
                                </td>
                                <td></td>
                                <td>
                                    <dx:ASPxButton ID="btn_cancelarA" runat="server" Text="Cancelar"
                                        OnClick="btn_cancelarA_Click" Height="50px" Width="150px">
                                    </dx:ASPxButton>
                                </td>

                            </tr>
                        </table>
                    </div>
                    <br />

                    <table class="dxeBinImgCPnlSys">



                        <tr>
                            <td colspan="2">
                                <dx:ASPxLabel ID="ASPxLabel33" runat="server"
                                    Text="Previsión de Materiales (Receta Estandar)">
                                </dx:ASPxLabel>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <dx:ASPxGridView ID="GvPrevision" runat="server" AutoGenerateColumns="False"
                                    Font-Size="Smaller" Width="510px">
                                    <SettingsPager Mode="ShowAllRecords">
                                    </SettingsPager>
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Codigo" FieldName="ItemCode"
                                            ShowInCustomizationForm="True" VisibleIndex="0">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Producto" FieldName="ItemName"
                                            ShowInCustomizationForm="True" VisibleIndex="1">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Stock Actual" FieldName="StockActual"
                                            ShowInCustomizationForm="True" VisibleIndex="2">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Cant x Unidad" FieldName="CantBase"
                                            ShowInCustomizationForm="True" VisibleIndex="3">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Requerido " FieldName="CantReqPlan"
                                            ShowInCustomizationForm="True" VisibleIndex="4">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Requerido otras OF" FieldName="CantOtrasOF"
                                            ShowInCustomizationForm="True" VisibleIndex="5">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Requerido Total" FieldName="ReqTotal"
                                            ShowInCustomizationForm="True" VisibleIndex="6">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:ASPxGridView>
                            </td>
                        </tr>
                    </table>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
</asp:Content>
