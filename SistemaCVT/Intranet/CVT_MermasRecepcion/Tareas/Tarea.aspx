<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Tarea.aspx.cs" Inherits="CVT_MermasRecepcion.Tareas.Tarea" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Css/Styles.css" rel="stylesheet" />
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
            <li><span id="current">Tareas</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Tareas</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <div>
        <table>
            <tr>
                <td>
                    <dx:ASPxButton ID="btnNuevo" runat="server" Text="Nuevo" Height="50px" Theme="iOS" Width="128px" OnClick="btnNuevo_Click">
                        <Image IconID="snap_snapinsertfooter_svg_white_32x32">
                        </Image>
                    </dx:ASPxButton>
                </td>
                <td>
                    <dx:ASPxButton ID="btnTodos" runat="server" Text="Todos" Height="50px" Theme="iOS" Width="128px" OnClick="btnTodos_Click">
                        <Image IconID="spreadsheet_repeatallitemlabelspivottable_svg_white_32x32">
                        </Image>
                    </dx:ASPxButton>
                </td>
                <td>
                    <dx:ASPxButton ID="btnCompletos" runat="server" Text="Terminados" Height="50px" Theme="iOS" Width="128px" OnClick="btnCompletos_Click">
                        <Image IconID="outlookinspired_markcomplete_svg_white_32x32">
                        </Image>
                    </dx:ASPxButton>
                </td>
                <td>
                    <dx:ASPxButton ID="btnIncompletos" runat="server" Text="Sin Terminar" Height="50px" Theme="iOS" Width="128px" OnClick="btnIncompletos_Click">
                        <Image IconID="iconbuilder_security_warningcircled2_svg_white_32x32">
                        </Image>
                    </dx:ASPxButton>
                </td>
                <td>                   
                    <dx:ASPxComboBox ID="btnEstados" runat="server" Height="50px" Theme="iOS" Border-BorderColor="#3366ff" AutoPostBack="True" NullText="Estados" OnSelectedIndexChanged="btnEstados_SelectedIndexChanged">
                        <Items>
                            <dx:ListEditItem Text="No Comenzado" Value="1" />
                            <dx:ListEditItem Text="Completo" Value="2" />
                            <dx:ListEditItem Text="En Progreso" Value="3" />
                            <dx:ListEditItem Text="Necesita Asistencia" Value="4" />
                            <dx:ListEditItem Text="Aplazado" Value="5" />
                        </Items>
                        <DropDownButton>
                            <Image IconID="snap_quickfilter_svg_32x32">
                            </Image>
                        </DropDownButton>
                        <Border BorderColor="#3366FF"></Border>
                    </dx:ASPxComboBox>
                </td>
                <td>
                    <dx:ASPxButton ID="btnInforme" runat="server" Text="Informe" Height="50px" Theme="iOS" Width="128px" OnClick="btnInforme_Click">
                        <Image IconID="richedit_inserttextbox_svg_white_32x32">
                        </Image>
                    </dx:ASPxButton>
                </td>

            </tr>
        </table>
    </div>

    <dx:ASPxPopupControl ID="TaskNewPopup" ClientInstanceName="taskEditPopup" runat="server" PopupHorizontalAlign="WindowCenter" ShowCloseButton="false" CloseOnEscape="true"
        PopupVerticalAlign="Middle" CloseAction="None" Modal="True" PopupAnimationType="Fade" CssClass="taskEditFormPopup" AllowDragging="True" Theme="iOS" HeaderText="Nuevo">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxFormLayout ID="TaskEditFormLayout" runat="server" AlignItemCaptionsInAllGroups="True" ColCount="2">
                    <Styles>
                        <LayoutGroup CssClass="group"></LayoutGroup>
                    </Styles>
                    <Items>
                        <dx:LayoutItem Caption="Area" runat="server">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxComboBox ID="CboArea" runat="server" IncrementalFilteringMode="Contains" Theme="iOS" DataSourceID="LqsAreaTrabajo" TextField="Nombre" ValueField="Id_Area" AutoPostBack="True" OnSelectedIndexChanged="CboArea_SelectedIndexChanged">
                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip">
                                            <RequiredField IsRequired="True" ErrorText="area is required" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Asunto">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTextBox ID="txtAsunto" runat="server" Width="300px" MaxLength="100" Theme="iOS">
                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip">
                                            <RequiredField IsRequired="True" ErrorText="Subject is required" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Asignado">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxComboBox ID="cboAsignado" runat="server" IncrementalFilteringMode="Contains" Theme="iOS" DataSourceID="LqsPersonal" ValueField="IdUsuario" TextField="NombreUsuario">
                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip">
                                            <RequiredField IsRequired="True" ErrorText="Assign to is required" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem RowSpan="1" VerticalAlign="Top" Caption="Detalle">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxMemo ID="txtDetalle" runat="server" Height="150px" Width="300px" MaxLength="500" Theme="iOS">
                                    </dx:ASPxMemo>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:EmptyLayoutItem>
                        </dx:EmptyLayoutItem>
                        <dx:LayoutItem RowSpan="4" VerticalAlign="Top" Caption="Resolucion">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxMemo ID="txtResolucion" runat="server" Height="100px" Width="300px" MaxLength="500" Theme="iOS">
                                    </dx:ASPxMemo>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:EmptyLayoutItem>
                        </dx:EmptyLayoutItem>
                        <dx:LayoutItem Caption="Fecha Inicio">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxDateEdit ID="dteInicio" runat="server" Theme="iOS">
                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip">
                                            <RequiredField IsRequired="True" ErrorText="Start date is required" />
                                        </ValidationSettings>
                                    </dx:ASPxDateEdit>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Fecha Termino">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxDateEdit ID="dteTermino" runat="server" Theme="iOS">
                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip">
                                            <RequiredField IsRequired="True" ErrorText="Due date is required" />
                                        </ValidationSettings>
                                    </dx:ASPxDateEdit>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Tiempo Estimado horas">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTextBox ID="txtTiempoEstimado" runat="server" Theme="iOS">
                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip" Display="Dynamic">
                                            <RegularExpression ValidationExpression="\d+" />
                                            <RequiredField IsRequired="True" ErrorText="Requerido" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:EmptyLayoutItem>
                        </dx:EmptyLayoutItem>
                        <dx:LayoutItem Caption="Prioridad">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxComboBox ID="cboPrioridad" runat="server" ImageUrlField="ImageUrl" Theme="iOS">
                                        <Items>
                                            <dx:ListEditItem ImageUrl="~/Images/Priority1.png" Text="Baja" Value="1" />
                                            <dx:ListEditItem ImageUrl="~/Images/Priority2.png" Text="Media" Value="2" />
                                            <dx:ListEditItem ImageUrl="~/Images/Priority3.png" Text="Alta" Value="3" />
                                            <dx:ListEditItem ImageUrl="~/Images/Priority4.png" Text="Urgente" Value="4" />
                                        </Items>
                                    </dx:ASPxComboBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="% Completo" RowSpan="2" VerticalAlign="Top" Width="400px">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTrackBar ID="tbPorcentaje" runat="server" Position="0" PositionStart="0" Step="10"
                                        ShowChangeButtons="false" ScalePosition="RightOrBottom" LargeTickInterval="50" Width="305px" Theme="iOS">
                                    </dx:ASPxTrackBar>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Estado">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxComboBox ID="cboEstado" runat="server" Theme="iOS">
                                        <Items>
                                            <dx:ListEditItem Text="No Comenzado" Value="1" Selected="true" />
                                            <dx:ListEditItem Text="Completo" Value="2" />
                                            <dx:ListEditItem Text="En Progreso" Value="3" />
                                            <dx:ListEditItem Text="Necesita Asistencia" Value="4" />
                                            <dx:ListEditItem Text="Aplazado" Value="5" />
                                        </Items>
                                    </dx:ASPxComboBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:ASPxFormLayout>
                <div class="buttonsContainer">
                    <dx:ASPxButton ID="TaskSaveButton" runat="server" AutoPostBack="false" Text="Guardar" Width="100px" Theme="iOS" OnClick="TaskSaveButton_Click">
                    </dx:ASPxButton>
                    <dx:ASPxButton ID="TaskCancelButton" runat="server" AutoPostBack="False" UseSubmitBehavior="False" Text="Cancelar" Width="100px" Theme="iOS" CausesValidation="False" OnClick="TaskCancelButton_Click">
                    </dx:ASPxButton>
                </div>
                <div style="clear: both">
                </div>
                <asp:LinqDataSource ID="LqsAreaTrabajo" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_AreaTrabajo">
                </asp:LinqDataSource>
                <asp:LinqDataSource ID="LqsPersonal" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="VW_USUARIOS_ACTIVOS_CVT" Where="IdPerfil != @IdPerfil">
                    <WhereParameters>
                        <asp:Parameter DefaultValue="0" Name="IdPerfil" Type="Int32" />
                    </WhereParameters>
                </asp:LinqDataSource>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>


    <dx:ASPxCardView ID="crwDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsTareas" KeyFieldName="NTarea" CssClass="tasksCardViewer" Width="130%">

        <SettingsPopup>
            <FilterControl AutoUpdatePosition="False"></FilterControl>
        </SettingsPopup>

        <SettingsExport ExportSelectedCardsOnly="False"></SettingsExport>

        <CardLayoutProperties>
            <Items>
                <dx:CardViewColumnLayoutItem CssClass="taskCardHeader" Caption="">
                    <Template>
                        <span style="font-weight: bold"><%# Eval("Asunto")%></span>
                        <dx:ASPxImage ID="PriorityImage" runat="server" ImageUrl="<%# GetPriorityImageUrl(Container) %>" />
                    </Template>
                </dx:CardViewColumnLayoutItem>
                <dx:CardViewColumnLayoutItem CssClass="taskCardContent" Caption="">
                    <Template>
                        <table class="taskCardData">
                            <tr>
                                <td>
                                    <span>Fecha inicio</span>
                                    <%# ((DateTime) Eval("FInicio")).ToShortDateString() %>
                                </td>

                                <td>
                                    <span>Fecha Termino</span>
                                    <%# ((DateTime) Eval("FTermino")).ToShortDateString() %>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <span>Asignado A:</span>
                                    <span class="fullName"><%# Eval("Asignado") %></span>
                                </td>
                            </tr>
                        </table>
                        <div class="taskCardProgress">
                            <%#: Eval("PrcCumpli") %>%
                        <dx:ASPxProgressBar ID="ASPxProgressBar2" ShowPosition="false" runat="server" Position='<%# (int) Eval("PrcCumpli") %>' Height="15px" Width="100%" ForeColor="Red" Theme="Office365"></dx:ASPxProgressBar>
                        </div>
                    </Template>
                </dx:CardViewColumnLayoutItem>
                <dx:CardViewColumnLayoutItem CssClass="taskCardFooter">
                    <Template>
                        <%--<dx:ASPxCheckBox runat="server" ID="CompletedCheckBox" ReadOnly="true" CssClass="taskCardComplete"
                            Checked="<%# GetCheckedState(Container) %>" Text="completado">
                        </dx:ASPxCheckBox>--%>
                        <span>ESTADO: </span>
                        <span class="fullName"><%# Eval("NomEstado")%></span>

                        <dx:ASPxButton runat="server" ID="btnView" Text="Ver Tarea" AutoPostBack="false" UseSubmitBehavior="False" EnableTheming="false" CssClass="blueButton" Theme="Office365" BackColor="#3366ff" OnClick="btnView_Click">
                        </dx:ASPxButton>
                        <dx:ASPxButton runat="server" ID="EditButton" Text="Editar" AutoPostBack="false" UseSubmitBehavior="False" EnableTheming="false" CssClass="blueButton" Theme="Office365" BackColor="#3366ff" OnClick="EditButton_Click">
                        </dx:ASPxButton>
                        <dx:ASPxButton runat="server" ID="DeleteButton" Text="Eliminar" AutoPostBack="false" UseSubmitBehavior="False" EnableTheming="false" CssClass="blueButton" Theme="Office365" BackColor="#3366ff" OnClick="DeleteButton_Click">
                        </dx:ASPxButton>
                    </Template>
                </dx:CardViewColumnLayoutItem>
            </Items>
            <SettingsItems ShowCaption="False"></SettingsItems>
            <Styles>
                <LayoutItem>
                    <Paddings Padding="0"></Paddings>
                </LayoutItem>
                <LayoutGroup>
                    <Cell>
                        <Paddings Padding="0"></Paddings>
                    </Cell>
                </LayoutGroup>
            </Styles>
        </CardLayoutProperties>
        <%--    <Settings LayoutMode="Flow" VerticalScrollBarMode="Auto"></Settings>--%>
        <SettingsBehavior AllowFocusedCard="True"></SettingsBehavior>
        <SettingsPager AlwaysShowPager="True" ShowNumericButtons="False">
            <SettingsTableLayout RowsPerPage="5" />
            <FirstPageButton Visible="True"></FirstPageButton>
            <LastPageButton Visible="True"></LastPageButton>
            <SettingsFlowLayout ItemsPerPage="20"></SettingsFlowLayout>
            <Summary Position="Inside" Text="Pagina {0} of {1}"></Summary>
        </SettingsPager>
        <Styles>
            <Table>
                <Border BorderWidth="0"></Border>
            </Table>
            <FlowCard Width="380" Height="175" CssClass="dvCard">
                <Border BorderWidth="1"></Border>
            </FlowCard>
            <FocusedCard CssClass="focusCard">
            </FocusedCard>
            <PagerBottomPanel HorizontalAlign="Right"></PagerBottomPanel>
        </Styles>

        <StylesExport>
            <Card BorderSize="1" BorderSides="All"></Card>

            <Group BorderSize="1" BorderSides="All"></Group>

            <TabbedGroup BorderSize="1" BorderSides="All"></TabbedGroup>

            <Tab BorderSize="1"></Tab>
        </StylesExport>
    </dx:ASPxCardView>
    <asp:LinqDataSource ID="LqsTareas" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="VW_RESUMEN_TAREAS" EnableDelete="True" EnableInsert="True" EnableUpdate="True" OrderBy="IdTarea desc">
    </asp:LinqDataSource>

    <dx:ASPxPopupControl ID="popConfirm" runat="server" Text="Deseas eliminar?" Theme="Office365" AllowDragging="True" CloseAction="None" CloseAnimationType="Fade" Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="TopSides">
        <ContentCollection>
            <dx:PopupControlContentControl>
                <table>
                    <tr>
                        <td>
                            <dx:ASPxButton ID="btnSi" runat="server" Text="Si" Height="30px" OnClick="btnSi_Click" Width="70px"></dx:ASPxButton>
                        </td>
                        <td class="auto-style5"></td>
                        <td>
                            <dx:ASPxButton ID="btnNo" runat="server" Text="No" Height="30px" OnClick="btnNo_Click" Width="70px"></dx:ASPxButton>
                        </td>
                    </tr>
                </table>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
    <dx:ASPxPopupControl ID="popEdit" ClientInstanceName="taskEditPopup" runat="server" PopupHorizontalAlign="WindowCenter" ShowCloseButton="false" CloseOnEscape="true"
        PopupVerticalAlign="Middle" CloseAction="None" Modal="True" PopupAnimationType="Fade" CssClass="taskEditFormPopup" AllowDragging="True" Theme="iOS" HeaderText="Nuevo">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" AlignItemCaptionsInAllGroups="True" ColCount="2" Height="371px">
                    <Styles>
                        <LayoutGroup CssClass="group"></LayoutGroup>
                    </Styles>
                    <Items>
                        <dx:LayoutItem Caption="Area">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxComboBox ID="cboAreaEdit" runat="server" IncrementalFilteringMode="Contains" Theme="iOS" DataSourceID="LqsAreaTrabajo0" TextField="Nombre" ValueField="Id_Area" AutoPostBack="True" OnSelectedIndexChanged="cboAreaEdit_SelectedIndexChanged">
                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip">
                                            <RequiredField IsRequired="True" ErrorText="area is required" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Asunto">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTextBox ID="txtasuntoEdit" runat="server" Width="300px" MaxLength="100" Theme="iOS">
                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip">
                                            <RequiredField IsRequired="True" ErrorText="Subject is required" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Asignado">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxComboBox ID="cboAsignadoEdit" runat="server" IncrementalFilteringMode="Contains" Theme="iOS" DataSourceID="LqsPersonal0" ValueField="IdUsuario">
                                        <Columns>
                                            <dx:ListBoxColumn FieldName="NombreUsuario">
                                            </dx:ListBoxColumn>
                                        </Columns>
                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip">
                                            <RequiredField IsRequired="True" ErrorText="Assign to is required" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem RowSpan="1" VerticalAlign="Top" Caption="Detalle">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxMemo ID="txtDetEdit" runat="server" Height="100px" Width="300px" MaxLength="500" Theme="iOS">
                                    </dx:ASPxMemo>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:EmptyLayoutItem>
                        </dx:EmptyLayoutItem>
                        <dx:LayoutItem RowSpan="4" VerticalAlign="Top" Caption="Resolucion">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxMemo ID="txtResolucionEdit" runat="server" Height="100px" Width="300px" MaxLength="500" Theme="iOS">
                                    </dx:ASPxMemo>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:EmptyLayoutItem>
                        </dx:EmptyLayoutItem>
                        <dx:LayoutItem Caption="Fecha Inicio">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxDateEdit ID="dteFIniEdit" runat="server" Theme="iOS">
                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip">
                                            <RequiredField IsRequired="True" ErrorText="Start date is required" />
                                        </ValidationSettings>
                                    </dx:ASPxDateEdit>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Fecha Termino">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxDateEdit ID="dteFtermEdit" runat="server" Theme="iOS">
                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip">
                                            <RequiredField IsRequired="True" ErrorText="Due date is required" />
                                        </ValidationSettings>
                                    </dx:ASPxDateEdit>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Tiempo Estimado">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTextBox ID="txtTiempoEstimadoEdit" runat="server" Theme="iOS">
                                        <ValidationSettings ErrorDisplayMode="ImageWithTooltip" Display="Dynamic">
                                            <RegularExpression ValidationExpression="\d+" />
                                            <RequiredField IsRequired="True" ErrorText="Requerido" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:EmptyLayoutItem>
                        </dx:EmptyLayoutItem>
                        <dx:LayoutItem Caption="Prioridad">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxComboBox ID="cboPrioridadEdit" runat="server" ImageUrlField="ImageUrl" Theme="iOS">
                                        <Items>
                                            <dx:ListEditItem ImageUrl="~/Images/Priority1.png" Text="Baja" Value="1" />
                                            <dx:ListEditItem ImageUrl="~/Images/Priority2.png" Text="Media" Value="2" />
                                            <dx:ListEditItem ImageUrl="~/Images/Priority3.png" Text="Alta" Value="3" />
                                            <dx:ListEditItem ImageUrl="~/Images/Priority4.png" Text="Urgente" Value="4" />
                                        </Items>
                                    </dx:ASPxComboBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:EmptyLayoutItem>
                        </dx:EmptyLayoutItem>
                        <dx:LayoutItem Caption="Estado">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxComboBox ID="cboEstadoEdit" runat="server" Theme="iOS">
                                        <Items>
                                            <dx:ListEditItem Text="No Comenzado" Value="1" />
                                            <dx:ListEditItem Text="Completo" Value="2" />
                                            <dx:ListEditItem Text="En Progreso" Value="3" />
                                            <dx:ListEditItem Text="Necesita Asistencia" Value="4" />
                                            <dx:ListEditItem Text="Aplazado" Value="5" />
                                        </Items>
                                    </dx:ASPxComboBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="% Completo" RowSpan="2" VerticalAlign="Top" Width="400px">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxTrackBar ID="tbComplEdit" runat="server" Position="0" PositionStart="0" Step="10"
                                        ShowChangeButtons="false" ScalePosition="RightOrBottom" LargeTickInterval="50" Width="305px" Theme="iOS">
                                    </dx:ASPxTrackBar>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:ASPxFormLayout>
                <div class="buttonsContainer">
                    <dx:ASPxButton ID="btnGuardarEdit" runat="server" AutoPostBack="false" Text="Guardar" Width="100px" Theme="iOS" OnClick="btnGuardarEdit_Click">
                    </dx:ASPxButton>
                    <dx:ASPxButton ID="btnCancelarEdit" runat="server" AutoPostBack="False" UseSubmitBehavior="False" Text="Cancelar" Width="100px" Theme="iOS" CausesValidation="False" OnClick="btnCancelarEdit_Click">
                    </dx:ASPxButton>
                    <asp:LinqDataSource ID="LqsAreaTrabajo0" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" Select="new (Id_Area, Nombre)" TableName="CVT_AreaTrabajo">
                    </asp:LinqDataSource>
                    <asp:LinqDataSource ID="LqsPersonal0" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="VW_USUARIOS_ACTIVOS_CVT">
                    </asp:LinqDataSource>
                </div>
                <div style="clear: both">
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>

</asp:Content>
