<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PermisoTrabajoSeguro.aspx.cs" Inherits="CVT_MermasRecepcion.PRiesgo.PermisoTrabajoSeguro" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            height: 45px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Prevencion de Riesgos</a></li>
            <li><span id="current">Permiso Trabajo Seguro</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Permiso Trabajo Seguro</span>
        <span class="tab-end"></span>
        <%--<dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Subir PTS" Theme="iOS" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>--%>
    </div>
    <br />
    <br />
    <div style="margin-left: 50px">
        <div style="display: inline-block; margin-right: 25px">
            <dx:ASPxDateEdit ID="dteFechaInicio" runat="server" Caption="Fecha Inicio" Theme="iOS">
                <CaptionSettings Position="Top" ShowColon="False" VerticalAlign="Middle" />
                <CaptionStyle Font-Bold="True">
                </CaptionStyle>
            </dx:ASPxDateEdit>
        </div>
        <div style="display: inline-block; margin-right: 25px">
            <dx:ASPxDateEdit ID="dteTermino" runat="server" Caption="Fecha Termino" Theme="iOS">
                <CaptionSettings Position="Top" ShowColon="False" VerticalAlign="Middle" />
                <CaptionStyle Font-Bold="True">
                </CaptionStyle>
            </dx:ASPxDateEdit>
        </div>
    </div>
    <div>
    </div>
    <br />
    <div style="margin-left: 150px">
        <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" Height="40px" Theme="iOS"></dx:ASPxButton>
    </div>
    <br />
    <div>
        <dx:ASPxPopupControl ID="PopNuevo" runat="server" AllowDragging="True" CloseAction="None" CloseAnimationType="Fade" HeaderText="Nuevo Registro " Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle" Theme="iOS" Width="835px">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <%--    <div style="margin-left: 25px">
                        <div style="display: inline-block; margin-right: 25px" class="auto-style5">
                            <dx:ASPxTextBox ID="txtPtsNn" runat="server" Width="100" Caption="N PTS" Height="30px" Theme="iOS">
                                <CaptionSettings Position="Top" />
                                <ValidationSettings>
                                    <RegularExpression ErrorText="solo numeros" ValidationExpression="\d+" />
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                                <CaptionStyle Font-Bold="True">
                                </CaptionStyle>
                            </dx:ASPxTextBox>
                        </div>                  
                    </div>--%>
                    <br />
                    <div style="margin-left: 25px">
                        <div style="display: inline-block; margin-right: 25px" class="auto-style5">
                            <dx:ASPxTextBox ID="txtEmpresa" runat="server" Width="300px" Caption="Empresa" Height="30px" Theme="iOS">
                                <CaptionSettings Position="Top" />
                                <CaptionStyle Font-Bold="True">
                                </CaptionStyle>
                            </dx:ASPxTextBox>
                        </div>
                        <div style="display: inline-block; margin-right: 25px" class="auto-style5">
                            <dx:ASPxTextBox ID="txtAreaTrabajo" runat="server" Width="350px" Caption="AreaTrabajo" Height="30px" Theme="iOS">
                                <CaptionSettings Position="Top" />
                                <CaptionStyle Font-Bold="True">
                                </CaptionStyle>
                            </dx:ASPxTextBox>
                        </div>

                    </div>
                    <br />
                    <div style="margin-left: 25px">
                        <div style="display: inline-block; margin-right: 25px" class="auto-style5">
                            <dx:ASPxTextBox ID="txtTarea" runat="server" Width="350px" Caption="Tarea" Height="30px" Theme="iOS">
                                <CaptionSettings Position="Top" />
                                <CaptionStyle Font-Bold="True">
                                </CaptionStyle>
                            </dx:ASPxTextBox>
                        </div>
                        <div style="display: inline-block; margin-right: 25px" class="auto-style5">
                            <dx:ASPxTextBox ID="txtResponsable" runat="server" Width="300px" Caption="Responsable" Height="30px" Theme="iOS">
                                <CaptionSettings Position="Top" />
                                <CaptionStyle Font-Bold="True">
                                </CaptionStyle>
                            </dx:ASPxTextBox>
                        </div>
                    </div>
                    <br />
                    <div style="margin-left: 25px">

                        <div style="display: inline-block; margin-right: 25px" class="auto-style5">
                            <dx:ASPxTextBox ID="txtTipoTrabajo" runat="server" Width="350px" Caption="Tipo Trabajo" Height="30px" Theme="iOS">
                                <CaptionSettings Position="Top" />
                                <CaptionStyle Font-Bold="True">
                                </CaptionStyle>
                            </dx:ASPxTextBox>
                        </div>
                        <div style="display: inline-block; margin-right: 25px" class="auto-style5">
                            <dx:ASPxTextBox ID="txtComentarios" runat="server" Width="350px" Caption="Comentarios" Height="30px" Theme="iOS">
                                <CaptionSettings Position="Top" />
                                <CaptionStyle Font-Bold="True">
                                </CaptionStyle>
                            </dx:ASPxTextBox>
                        </div>
                    </div>
                    <br />
                    <div style="margin-left: 25px">
                        <div style="display: inline-block; margin-right: 25px">
                            <dx:ASPxDateEdit ID="FInicio" runat="server" Caption="Fecha Inicio" Theme="iOS">
                                <CaptionSettings Position="Top" ShowColon="False" VerticalAlign="Middle" />
                                <CaptionStyle Font-Bold="True">
                                </CaptionStyle>
                            </dx:ASPxDateEdit>
                        </div>
                        <div style="display: inline-block; margin-right: 25px">
                            <dx:ASPxDateEdit ID="FTermino" runat="server" Caption="Fecha Termino" Theme="iOS">
                                <CaptionSettings Position="Top" ShowColon="False" VerticalAlign="Middle" />
                                <CaptionStyle Font-Bold="True">
                                </CaptionStyle>
                            </dx:ASPxDateEdit>
                        </div>
                    </div>
                    <br />
                    <br />
                    <div>
                        <div style="margin-left: 50px">
                            <%--<dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Subir PTS" Theme="iOS" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>--%>
                            <dx:ASPxButton ID="btnVerSubir" runat="server" Text="Cargar PTS" Height="20px" Theme="iOS" Width="175px" OnClick="btnVerSubir_Click"></dx:ASPxButton>
                        </div>
                        <br />
                        <div style="margin-left: 30px">
                            <dx:ASPxUploadControl ID="FileUpload1" runat="server" Width="400px" Height="80px" OnFileUploadComplete="FileUpload1_FileUploadComplete" ShowProgressPanel="True" ShowUploadButton="True" Theme="iOS" AddUploadButtonsHorizontalPosition="Center" CancelButtonHorizontalPosition="Left">
                                <ValidationSettings MaxFileSize="4194304" MaxFileSizeErrorText="Excede el tamaño maximo, which is {0} bytes" GeneralErrorText="Excede el tamaño maximo">
                                </ValidationSettings>
                                <UploadButton Text="Subir PTS">
                                    <Image IconID="pdfviewer_previous_svg_32x32">
                                    </Image>
                                </UploadButton>
                                <AdvancedModeSettings PacketSize="4194304">
                                </AdvancedModeSettings>
                            </dx:ASPxUploadControl>
                        </div>
                    </div>
                    <br />
                    <br />
                    <div>
                        <div>
                            <dx:ASPxButton ID="btnRefrescar" runat="server" Text="Recargar Tabla" OnClick="btnRefrescar_Click" Theme="Material" Width="209px"></dx:ASPxButton>
                        </div>
                        <dx:ASPxGridView ID="GvDatoPTS" runat="server" AutoGenerateColumns="False" DataSourceID="LqsPTSArchivos" KeyFieldName="ID_Archivo" EnableViewState="False" ViewStateMode="Disabled" OnRowDeleting="GvDatoPTS_RowDeleting">
                            <SettingsBehavior ConfirmDelete="True" />
                            <SettingsCommandButton>
                                <DeleteButton Text=" ">
                                    <Image IconID="iconbuilder_actions_deletecircled_svg_32x32">
                                    </Image>
                                </DeleteButton>
                            </SettingsCommandButton>
                            <SettingsPopup>
                                <FilterControl AutoUpdatePosition="False"></FilterControl>
                            </SettingsPopup>
                            <%-- <Toolbars>
                                <dx:GridViewToolbar Name="toolbar">                                   
                                    <Items>                                      
                                        <dx:GridViewToolbarItem Command="Refresh" BeginGroup="true" AdaptivePriority="2" />                                   
                                       
                                    </Items>
                                </dx:GridViewToolbar>
                            </Toolbars>--%>
                            <Columns>
                                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataTextColumn FieldName="ID_Archivo" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="PTS N°" FieldName="Id_Pts" ShowInCustomizationForm="True" VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="NombreArchivo" ShowInCustomizationForm="True" VisibleIndex="3">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Extencion" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:ASPxGridView>
                        <asp:LinqDataSource ID="LqsPTSArchivos" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_PermisoTrabajoSeguro_PTS" Where="Id_Pts == @Id_Pts">
                            <WhereParameters>
                                <asp:SessionParameter DefaultValue="0" Name="Id_Pts" SessionField="IdPTS" Type="Int32" />
                            </WhereParameters>
                        </asp:LinqDataSource>
                    </div>
                    <br />
                    <br />
                    <div style="margin-left: 50px">
                        <div style="display: inline-block; margin-right: 25px">
                            <dx:ASPxButton ID="btnGuardar" runat="server" Text="Guardar" Height="65px" Theme="iOS" Width="175px" OnClick="btnGuardar_Click"></dx:ASPxButton>
                        </div>
                        <div style="display: inline-block">
                            <dx:ASPxButton ID="btnCancelar" runat="server" Text="Cancelar" Height="65px" Theme="iOS" Width="175px" BackColor="Red" OnClick="btnCancelar_Click"></dx:ASPxButton>
                        </div>
                    </div>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>

    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" OnToolbarItemClick="GvDatos_ToolbarItemClick" AutoGenerateColumns="False" DataSourceID="LqsPTS" KeyFieldName="Id_Pts" OnRowCommand="GvDatos_RowCommand" OnHtmlRowCreated="GvDatos_HtmlRowCreated">
            <ClientSideEvents ToolbarItemClick="function(s, e) {
	if (e.item.name == &quot;Nuevo&quot;) e.processOnServer = true; e.usePostBack=true;
 

}" />

            <SettingsPager PageSize="100">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            <SettingsBehavior ConfirmDelete="True" />
            <SettingsPopup>
                <EditForm Width="700px">
                </EditForm>

                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <Columns>
                <dx:GridViewCommandColumn ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="N° PTS" FieldName="Id_Pts" ReadOnly="True" VisibleIndex="1" ShowInCustomizationForm="True">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Empresa" VisibleIndex="2" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="AreaTrabajo" VisibleIndex="3" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Tarea" VisibleIndex="4" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Responsable" VisibleIndex="5" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TipoTrabajo" VisibleIndex="6" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaInicio" VisibleIndex="8" ShowInCustomizationForm="True">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="FechaTermino" VisibleIndex="9" ShowInCustomizationForm="True">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn Caption="Duracion (dias)" FieldName="DiasDuracion" VisibleIndex="10" ShowInCustomizationForm="True">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Comentario" VisibleIndex="12" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaRegistro" Visible="False" VisibleIndex="13" ShowInCustomizationForm="True">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="ID_UsuarioRegistra" Visible="False" VisibleIndex="14" ShowInCustomizationForm="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Estado" VisibleIndex="11">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Iniciado" Value="Iniciado" />
                            <dx:ListEditItem Text="Terminado" Value="Terminado" />
                        </Items>
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Ver PTS" VisibleIndex="15">
                    <PropertiesHyperLinkEdit>
                        <Style HorizontalAlign="Center" VerticalAlign="Middle">
                             </Style>
                    </PropertiesHyperLinkEdit>
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="verPTS" CommandName="cmdVerPTS" runat="server" ImageUrl="~/Images/portapapeles.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Agregar AST" VisibleIndex="16">
                    <PropertiesHyperLinkEdit>
                        <Style HorizontalAlign="Center" VerticalAlign="Middle">
                             </Style>
                    </PropertiesHyperLinkEdit>
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="AddAST" CommandName="cmdAddAST" runat="server" ImageUrl="~/Images/EDADD.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataTextColumn FieldName="TotalAST" VisibleIndex="7">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Finalizar Permiso" VisibleIndex="17">
                    <PropertiesHyperLinkEdit>
                        <Style HorizontalAlign="Center" VerticalAlign="Middle">
                             </Style>
                    </PropertiesHyperLinkEdit>
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="Verificado" CommandName="cmdVerificado" runat="server" ImageUrl="~/Images/activo.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
            </Columns>
            <Toolbars>
                <dx:GridViewToolbar>
                    <Items>
                        <dx:GridViewToolbarItem Command="Custom" Name="Nuevo" Text="Nuevo" Image-Url="../../Images/pn-add-source-copy.gif">
                            <Image Url="../../Images/pn-add-source-copy.gif"></Image>
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
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsPTS" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_PermisoTrabajoSeguro" Where="FechaInicio &gt;= @FechaInicio" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
            <WhereParameters>
                <asp:ControlParameter ControlID="dteFechaInicio" DefaultValue="01-01-1990" Name="FechaInicio" PropertyName="Value" Type="DateTime" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>

    <div>
        <dx:ASPxPopupControl ID="popVerificar" runat="server" AllowDragging="True" CloseAction="CloseButton" CloseAnimationType="Fade" HeaderText="Verificacion " Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <br />
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Usuario" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtUsuario" runat="server" Width="170px" Height="25px" Theme="Default">
                                        <ValidationSettings Display="Dynamic">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
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
                                    <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Contraseña" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                    <asp:TextBox ID="txtContrasena" runat="server" CausesValidation="True" Height="25px" TextMode="Password" Width="170px"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div style="margin-left: 35px">
                        <dx:ASPxButton ID="btnVerificar" runat="server" Text="Verificar" Theme="MaterialCompact" OnClick="btnVerificar_Click"></dx:ASPxButton>
                    </div>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>

    <div>
        <dx:ASPxPopupControl ID="popNPts" runat="server" AllowDragging="True" CloseAction="CloseButton" CloseAnimationType="Fade" HeaderText="Ingreso Registro PTS " Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <br />
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="N° PTS" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtNumeroTrabajo" runat="server" Width="170px" Height="25px" Theme="Default">
                                        <ValidationSettings Display="Dynamic">
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <br />
                    <div style="margin-left: 35px">
                        <dx:ASPxButton ID="btnInicioRegistro" runat="server" Text="Iniciar Registro" Theme="MaterialCompact" OnClick="btnInicioRegistro_Click"></dx:ASPxButton>
                    </div>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>

    <div>
        <dx:ASPxPopupControl ID="popListaPTS" runat="server" AllowDragging="True" CloseAction="CloseButton" CloseAnimationType="Fade" HeaderText="PTS Cargadas " Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <br />
                    <div>
                        <br />
                        <div style="margin-left: 30px">
                            <dx:ASPxUploadControl ID="ASPxUploadControl2" runat="server" Width="400px" Height="80px" ShowProgressPanel="True" ShowUploadButton="True" Theme="iOS" AddUploadButtonsHorizontalPosition="Center" CancelButtonHorizontalPosition="Left" OnFileUploadComplete="ASPxUploadControl2_FileUploadComplete">
                                <ValidationSettings MaxFileSize="4194304" MaxFileSizeErrorText="Excede el tamaño maximo, which is {0} bytes" GeneralErrorText="Excede el tamaño maximo">
                                </ValidationSettings>
                                <UploadButton Text="Subir PTS">
                                    <Image IconID="pdfviewer_previous_svg_32x32">
                                    </Image>
                                </UploadButton>
                                <AdvancedModeSettings PacketSize="4194304">
                                </AdvancedModeSettings>
                            </dx:ASPxUploadControl>
                        </div>
                    </div>
                    <br />
                    <br />
                    <div>
                        <dx:ASPxButton ID="btnRecargar" runat="server" Text="Recargar Tabla" Theme="Material" Width="209px" OnClick="btnRecargar_Click"></dx:ASPxButton>
                    </div>
                    <br />
                    <div>

                        <dx:ASPxGridView ID="GvDatoPTS0" runat="server" AutoGenerateColumns="False" DataSourceID="LqsPTSArchivos0" EnableViewState="False" KeyFieldName="ID_Archivo" OnRowDeleting="GvDatoPTS0_RowDeleting" ViewStateMode="Disabled" OnRowCommand="GvDatoPTS0_RowCommand">
                            <SettingsBehavior ConfirmDelete="True" />
                            <SettingsCommandButton>
                                <DeleteButton Text=" ">
                                    <Image IconID="iconbuilder_actions_deletecircled_svg_32x32">
                                    </Image>
                                </DeleteButton>
                            </SettingsCommandButton>
                            <SettingsPopup>
                                <FilterControl AutoUpdatePosition="False">
                                </FilterControl>
                            </SettingsPopup>
                            <Columns>
                                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataTextColumn FieldName="ID_Archivo" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="PTS N°" FieldName="Id_Pts" ShowInCustomizationForm="True" VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="NombreArchivo" ShowInCustomizationForm="True" VisibleIndex="3">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Extencion" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataHyperLinkColumn Caption="Ver Permiso" VisibleIndex="17">
                                    <PropertiesHyperLinkEdit>
                                        <Style HorizontalAlign="Center" VerticalAlign="Middle">
                             </Style>
                                    </PropertiesHyperLinkEdit>
                                    <EditFormSettings Visible="False" />
                                    <DataItemTemplate>
                                        <asp:ImageButton ID="verPermiso" CommandName="cmdVerPermiso" runat="server" ImageUrl="~/Images/search.png" />
                                    </DataItemTemplate>
                                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                                    </CellStyle>
                                </dx:GridViewDataHyperLinkColumn>
                            </Columns>
                        </dx:ASPxGridView>
                        <asp:LinqDataSource ID="LqsPTSArchivos0" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_PermisoTrabajoSeguro_PTS" Where="Id_Pts == @Id_Pts">
                            <WhereParameters>
                                <asp:SessionParameter DefaultValue="0" Name="Id_Pts" SessionField="IdPTS" Type="Int32" />
                            </WhereParameters>
                        </asp:LinqDataSource>

                    </div>

                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
</asp:Content>
