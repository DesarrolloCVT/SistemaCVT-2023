<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="CVT_MermasRecepcion.Contacto" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 28px;
        }

        .auto-style6 {
            width: 170px;
        }

        .auto-style8 {
            width: 18px;
        }

        .auto-style9 {
            width: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <%--  <li><a>Contacto</a></li>--%>
            <li><span id="current">Contacto</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Contacto</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <div style="margin-left: 50px">
        <table>
            <tr>
                <td>
                    <%--<dx:ASPxButton ID="btnVerTickets" runat="server" Text="Ver Tickets" Height="35px" OnClick="btnVerTickets_Click" Theme="iOS"></dx:ASPxButton>--%>
                </td>
                <td class="auto-style9"></td>
                <td>
                    <a>
                        <asp:ImageButton ID="cmdNuevo" runat="server"
                            ImageUrl="~/App_Themes/IDA/ui/ico-agregar3.png"
                            OnClick="cmdNuevo_Click" />
                    </a>
                </td>
            </tr>
        </table>

    </div>
    <div>
        <dx:ASPxPopupControl ID="popContacto" runat="server" AllowDragging="True" CloseAction="None" Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Width="500px" HeaderText="Contacto" Theme="Office2010Blue">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <br />
                    <div style="margin-left: 30px">
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="Label6" runat="server" Text="Area a Solicitar"></asp:Label>
                                    <dx:ASPxComboBox ID="cboAreaSolicitada" runat="server" ValueType="System.String" DataSourceID="LqsAreaSolicitada" TextField="Nombre" ValueField="Id_Area" AutoPostBack="True"></dx:ASPxComboBox>
                                    <asp:LinqDataSource ID="LqsAreaSolicitada" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_AreaTrabajo">
                                    </asp:LinqDataSource>
                                </td>
                                <td class="auto-style8"></td>
                                <td class="auto-style6">


                                    <asp:Label ID="Label1" runat="server" Text="Categoria"></asp:Label>
                                    <dx:ASPxComboBox ID="cboCategoria" runat="server" ValueType="System.String" AutoPostBack="True" DataSourceID="LqsCategoria" TextField="Nombre" ValueField="id_CategoriaTicket">
                                        <ValidationSettings>
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                    <asp:LinqDataSource ID="LqsCategoria" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Tickets_Categoria" Where="Id_Area == @Id_Area">
                                        <WhereParameters>
                                            <asp:ControlParameter ControlID="cboAreaSolicitada" DefaultValue="0" Name="Id_Area" PropertyName="Value" Type="Int32" />
                                        </WhereParameters>
                                    </asp:LinqDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td>

                                    <asp:Label ID="Label2" runat="server" Text="Tipo de Problema"></asp:Label>
                                    <dx:ASPxComboBox ID="cboTipoProblema" runat="server" ValueType="System.String" DataSourceID="LqsTipoProblema" TextField="NombreProblema" ValueField="id_TipoProblema">
                                        <ValidationSettings>
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                    <asp:LinqDataSource ID="LqsTipoProblema" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Tickets_TipoProblema" Where="id_CategoriaTicket == @id_CategoriaTicket">
                                        <WhereParameters>
                                            <asp:ControlParameter ControlID="cboCategoria" DefaultValue="0" Name="id_CategoriaTicket" PropertyName="Value" Type="Int32" />
                                        </WhereParameters>
                                    </asp:LinqDataSource>
                                </td>
                                <td class="auto-style8"></td>
                                 <td>

                                    <asp:Label ID="Label7" runat="server" Text="Prioridad"></asp:Label>
                                     <dx:ASPxComboBox ID="cboPrioridad" runat="server" ValueType="System.String">
                                         <Items>
                                             <dx:ListEditItem ImageUrl="~/Images/Priority1.png" Text="Baja" Value="1" />
                                             <dx:ListEditItem ImageUrl="~/Images/Priority3.png" Text="Media" Value="2" />
                                             <dx:ListEditItem ImageUrl="~/Images/Priority4.png" Text="Alta" Value="3" />
                                         </Items>
                                         <ValidationSettings Display="Dynamic">
                                             <RequiredField IsRequired="True" />
                                         </ValidationSettings>
                                     </dx:ASPxComboBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div style="margin-left: 30px">
                        <asp:Label ID="Label3" runat="server" Text="Descripcion" Font-Size="Medium"></asp:Label>
                    </div>
                    <br />
                    <div style="margin-left: 30px">
                        <dx:ASPxMemo ID="txtDescripcion" runat="server" Height="104px" Width="395px">
                            <ValidationSettings>
                                <RequiredField IsRequired="True" />
                            </ValidationSettings>
                        </dx:ASPxMemo>
                        <%--  <asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" Height="100px" Width="356px" CausesValidation="True" ValidateRequestMode="Enabled"></asp:TextBox>--%>
                    </div>
                    <br />
                    <div style="margin-left: 30px">
                        <asp:Label ID="Label4" runat="server" Text="Adjuntar Archivo" Font-Size="Medium"></asp:Label><asp:Label ID="Label5" runat="server" Text=" (Captura de pantalla,Video,Archivo, etc.)"></asp:Label>
                    </div>
                    <br />
                    <div style="margin-left: 30px">
                        <dx:ASPxUploadControl ID="FileUpload1" runat="server" Width="293px" Height="71px" OnFileUploadComplete="FileUpload1_FileUploadComplete" ShowProgressPanel="True" ShowUploadButton="True" Theme="iOS">
                            <ValidationSettings MaxFileSize="4194304" MaxFileSizeErrorText="Excede el tamaño maximo, which is {0} bytes" GeneralErrorText="Excede el tamaño maximo">
                            </ValidationSettings>
                            <AdvancedModeSettings PacketSize="4194304">
                            </AdvancedModeSettings>
                        </dx:ASPxUploadControl>
                        <%--<asp:FileUpload ID="FileUpload1" runat="server" />--%>
                    </div>
                    <br />
                    <div style="margin-left: 50px">

                        <dx:ASPxButton ID="btnSubir" runat="server" Text="Documentos Adjuntos" OnClick="btnSubir_Click" Height="31px" Width="179px" Theme="iOS" CausesValidation="False"></dx:ASPxButton>

                    </div>
                    <br />
                    <div style="margin-left: 50px">
                        <dx:ASPxGridView ID="GvAdjunto" runat="server" AutoGenerateColumns="False" DataSourceID="LqsAdjuntos" KeyFieldName="Id_AdjuntoTicket" Theme="Office2010Silver" OnRowDeleting="GvAdjunto_RowDeleting">
                            <SettingsCommandButton>
                                <DeleteButton>
                                    <Image Url="~/Images/delete2.png">
                                    </Image>
                                </DeleteButton>
                            </SettingsCommandButton>

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

                            <SettingsText CommandDelete=" " />
                            <Columns>
                                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataTextColumn FieldName="Id_AdjuntoTicket" ReadOnly="True" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                    <EditFormSettings Visible="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Id_Ticket" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Ruta" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Nombre" ShowInCustomizationForm="True" VisibleIndex="4">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Extencion" ShowInCustomizationForm="True" VisibleIndex="5" Visible="False">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:ASPxGridView>
                        <asp:LinqDataSource ID="LqsAdjuntos" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Tickets_ArchivoAdjunto" Where="Id_Ticket == @Id_Ticket" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
                            <WhereParameters>
                                <asp:SessionParameter DefaultValue="0" Name="Id_Ticket" SessionField="ticketID" Type="Int32" />
                            </WhereParameters>
                        </asp:LinqDataSource>
                    </div>
                    <br />
                    <br />
                    <br />
                    <div style="margin-left: 110px">
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxButton ID="btnEnviar" runat="server" Text="Enviar" Height="30px" Width="70px" OnClick="btnEnviar_Click"></dx:ASPxButton>
                                </td>
                                <td class="auto-style8"></td>
                                <td>
                                    <dx:ASPxButton ID="btnLimpiar" runat="server" Text="Limpiar" Height="30px" Width="70px" OnClick="btnLimpiar_Click" CausesValidation="False"></dx:ASPxButton>
                                </td>
                                <td class="auto-style8"></td>
                                <td>
                                    <dx:ASPxButton ID="btnSalir" runat="server" Text="Cancelar" Width="70px" Height="30px" OnClick="btnSalir_Click" CausesValidation="False"></dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" Theme="Aqua" KeyFieldName="Folio" OnRowCommand="GvDatos_RowCommand" OnHtmlRowCreated="GvDatos_HtmlRowCreated">
            <SettingsPager PageSize="100">
            </SettingsPager>
            <Settings ShowFilterRow="True" />
            <SettingsBehavior ConfirmDelete="True" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowInCustomizationForm="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Folio" VisibleIndex="2">
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FechaCreacion" VisibleIndex="5">
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="IdArea" Visible="False" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="id_CategoriaTicket" Visible="False" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Categoria" VisibleIndex="9">
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="id_TipoProblema" Visible="False" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TipoProblema" VisibleIndex="11">
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Id_Usuario" Visible="False" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NombreUsuario" VisibleIndex="13">
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Tomar Ticket" VisibleIndex="14">
                    <PropertiesHyperLinkEdit>
                        <Style HorizontalAlign="Center" VerticalAlign="Middle">
                             </Style>
                    </PropertiesHyperLinkEdit>
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="TomarTicket" CommandName="cmdTomarTicket" runat="server" ImageUrl="~/Images/activo.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Responder" VisibleIndex="15">
                    <PropertiesHyperLinkEdit>
                        <Style HorizontalAlign="Center" VerticalAlign="Middle">
                             </Style>
                    </PropertiesHyperLinkEdit>
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="respuesta" CommandName="cmdRespuesta" runat="server" ImageUrl="~/Images/edit-add2.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Historial" VisibleIndex="16">
                    <PropertiesHyperLinkEdit>
                        <Style HorizontalAlign="Center" VerticalAlign="Middle">
                             </Style>
                    </PropertiesHyperLinkEdit>
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="historial" CommandName="cmdHistorial" runat="server" ImageUrl="~/Images/portapapeles.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Eliminar" VisibleIndex="1" Visible="False">
                    <PropertiesHyperLinkEdit>
                        <Style HorizontalAlign="Center" VerticalAlign="Middle">
                             </Style>
                    </PropertiesHyperLinkEdit>
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="eliminar" CommandName="cmdEliminar" runat="server" ImageUrl="~/Images/eliminar.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>

                <dx:GridViewDataComboBoxColumn FieldName="Estado" VisibleIndex="3">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Abierto" Value="Abierto" />
                            <dx:ListEditItem Text="En Proceso" Value="En Proceso" />
                            <dx:ListEditItem Text="Terminado" Value="Terminado" />
                            <dx:ListEditItem Text="Anulado" Value="Anulado" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>

                <dx:GridViewDataComboBoxColumn FieldName="AreaResponsable" VisibleIndex="7">
                    <PropertiesComboBox DataSourceID="lqsAreas" TextField="Nombre" ValueField="Nombre">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>

                <dx:GridViewDataComboBoxColumn Caption="Prioridad" FieldName="Prioridad" VisibleIndex="4">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem ImageUrl="~/Images/Priority1.png" Text="Baja" Value="1" />
                            <dx:ListEditItem ImageUrl="~/Images/Priority3.png" Text="Media" Value="2" />
                            <dx:ListEditItem ImageUrl="~/Images/Priority4.png" Text="Alta" Value="3" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>

            </Columns>
        </dx:ASPxGridView>
              <asp:LinqDataSource ID="lqsAreas" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_AreaTrabajo">
                                    </asp:LinqDataSource>
    </div>
    <br />
    <div>
        <dx:ASPxPopupControl ID="popHistorial" runat="server" AllowDragging="True" HeaderText="Historial" Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="TopSides" Theme="Office2010Blue" Width="950px">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <br />
                    <div>
                        <dx:ASPxGridView ID="GvDatosHistorial" runat="server" AutoGenerateColumns="False" EnableTheming="True" Theme="Aqua" Width="900px">
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="Folio" ShowInCustomizationForm="True" VisibleIndex="0">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Fecha" ShowInCustomizationForm="True" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Tipo" ShowInCustomizationForm="True" VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Usuario" ShowInCustomizationForm="True" VisibleIndex="3">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Descripcion" ShowInCustomizationForm="True" VisibleIndex="4">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:ASPxGridView>
                    </div>
                    <br />
                    <div>
                        <dx:ASPxButton ID="btnVerHistorialAdjuntos" runat="server" Text="Ver Archivos Adjuntos" Theme="iOS" OnClick="btnVerHistorialAdjuntos_Click"></dx:ASPxButton>
                     
                    </div>

                    <%--                    <div>
                        <asp:Image ID="Image1" runat="server" />
                    </div>--%>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
    <div>
        <dx:ASPxPopupControl ID="pupArchivos" runat="server" AllowDragging="True" CloseAction="CloseButton" CloseAnimationType="Fade" DragElement="Window" HeaderText="Archivos Adjuntos" Modal="True" PopupAction="None" PopupAnimationType="Slide" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="TopSides" Theme="Office2010Blue" Width="500px">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <div>
                        <br />
                        <div>
                            <dx:ASPxGridView ID="GvDatosAdj" runat="server" AutoGenerateColumns="False" DataSourceID="LqsRutaAdjunto" KeyFieldName="Ruta" OnRowCommand="GvDatosAdj_RowCommand" Theme="Aqua" Width="450px">
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="Id_Ticket" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Ruta" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Nombre" ShowInCustomizationForm="True" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Extencion" ShowInCustomizationForm="True" VisibleIndex="4">
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
                                    <dx:GridViewDataTextColumn FieldName="Operacion" ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:ASPxGridView>
                            <asp:LinqDataSource ID="LqsRutaAdjunto" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="VW_Archivos_Env_Ticket" Where="Id_Ticket == @Id_Ticket">
                                <WhereParameters>
                                    <asp:SessionParameter DefaultValue="0" Name="Id_Ticket" SessionField="IdHisAdjunto" Type="Int32" />
                                </WhereParameters>
                            </asp:LinqDataSource>
                        </div>
                    </div>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
</asp:Content>
