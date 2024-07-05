<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="TransferenciaFilm.aspx.cs" Inherits="CVT_MermasRecepcion.ControlFilm.TransferenciaFilm" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 15px;
        }

        .auto-style6 {
            width: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Control Film</a></li>
            <li><span id="current">Transferencia Film</span></li>
        </ul>
    </div>
    <div id="tableHeader">
        <span class="tableTitle">Transferencia Film</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <div style="margin-left: 150px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha Inicio"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteInicio" runat="server" Height="30px"></dx:ASPxDateEdit>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Fecha Termino"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteTermino" runat="server" Height="30px"></dx:ASPxDateEdit>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" Height="38px" Width="71px" OnClick="btnBuscar_Click"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsTransferencia" KeyFieldName="Id_TransferenciaFilm" OnToolbarItemClick="GvDatos_ToolbarItemClick" OnRowCommand="GvDatos_RowCommand" OnHtmlRowCreated="GvDatos_HtmlRowCreated" OnCommandButtonInitialize="GvDatos_CommandButtonInitialize">

            <ClientSideEvents ToolbarItemClick="function(s, e) {
	if (e.item.name == &quot;Nuevo&quot;) e.processOnServer = true; e.usePostBack=true;
 

}" />
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
            <SettingsPager PageSize="50">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings AutoFilterCondition="Contains" ShowFilterRow="True" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0" ShowEditButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="Folio" FieldName="Id_TransferenciaFilm" ReadOnly="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaTransferencia" VisibleIndex="5">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="FechaConfirmacion" VisibleIndex="13">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="NumeroOF" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NSolicitud" VisibleIndex="4">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Estado" VisibleIndex="7">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Abierta" Value="1" />
                            <dx:ListEditItem Text="Pend.Recep" Value="2" />
                            <dx:ListEditItem Text="Confirmada" Value="3" />
                            <dx:ListEditItem Text="Anulada" Value="4" />
                        </Items>
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="BodOrigen" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="LqDsSite0" TextField="Site_Description" ValueField="Site_Id">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="BodDestino" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="LqDsSite0" TextField="Site_Description" ValueField="Site_Id">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="UsuarioEnvia" VisibleIndex="6">
                    <PropertiesComboBox DataSourceID="LqsUsuario0" TextField="NombreUsuario" ValueField="IdUsuario">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="UsuarioRecep" VisibleIndex="12">
                    <PropertiesComboBox DataSourceID="LqsUsuario0" TextField="NombreUsuario" ValueField="IdUsuario">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="EntidadMot" VisibleIndex="8">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Produccion" Value="1" />
                            <dx:ListEditItem Text="No Conforme" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Detalle" VisibleIndex="15">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/boxadd.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Anula" VisibleIndex="16">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="Anula" CommandName="cmdAnula" runat="server" ImageUrl="~/Images/node_delete.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Confirma" VisibleIndex="17">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="Envia" CommandName="cmdEnvia" runat="server"
                            ImageUrl="~/Images/confirm.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <%--                <dx:GridViewDataHyperLinkColumn Caption="Recepcionar" VisibleIndex="19">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="Confirma" CommandName="cmdConfirma" runat="server"
                            ImageUrl="~/Images/checklist.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>--%>
                <dx:GridViewDataComboBoxColumn Caption="Cantidad" FieldName="Id_TransferenciaFilm" VisibleIndex="10">
                    <PropertiesComboBox DataSourceID="LqsCantidad" TextField="Cantidad" ValueField="Id_TransferenciaFilm">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Tipo Defecto" VisibleIndex="9" FieldName="TipoDefecto">
                    <PropertiesComboBox DataSourceID="LqsMotivoMerma0" TextField="Descripcion" ValueField="id_Motivo">
                       <%-- <Items>
                            <dx:ListEditItem Text="Puesta En Marcha" Value="1" />
                            <dx:ListEditItem Text="Prob.impresion-Laminacion" Value="2" />
                            <dx:ListEditItem Text="Problema de COF" Value="3" />
                            <dx:ListEditItem Text="Cambio de Film" Value="4" />
                            <dx:ListEditItem Text="Problema Embobinado" Value="5" />
                            <dx:ListEditItem Text="De Proceso" Value="6" />
                            <dx:ListEditItem Text="Diferencia de Espesor" Value="7" />
                            <dx:ListEditItem Text="De proveedor" Value="8" />
                            <dx:ListEditItem Text="Problema de Sellado" Value="9" />
                            <dx:ListEditItem Text="Vida Util" Value="10" />
                        </Items>--%>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsTransferencia" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_FILM_TRANSFERENCIA" Where="FechaTransferencia &gt;= @FechaTransferencia &amp;&amp; FechaTransferencia &lt;= @FechaTransferencia1" OrderBy="Id_TransferenciaFilm desc" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
            <WhereParameters>
                <asp:ControlParameter ControlID="dteInicio" DefaultValue="01-01-1990" Name="FechaTransferencia" PropertyName="Value" Type="DateTime" />
                <asp:ControlParameter ControlID="dteTermino" DefaultValue="01-01-1990" Name="FechaTransferencia1" PropertyName="Value" Type="DateTime" />
            </WhereParameters>
        </asp:LinqDataSource>

        <asp:LinqDataSource ID="LqsCantidad" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="VW_CANT_BOBINAS_TRANSFERENCIA">
        </asp:LinqDataSource>

        <asp:LinqDataSource runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" TableName="Site" Where="Site_Id==5 || Site_Id==4 || Site_Id==17 || Site_Id==3" EntityTypeName="" ID="LqDsSite0"></asp:LinqDataSource>

        <asp:LinqDataSource runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" TableName="CVT_Usuarios" EntityTypeName="" ID="LqsUsuario0"></asp:LinqDataSource>

                        <asp:LinqDataSource runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" TableName="CVT_ControlEnvasadoPT_MotivoMerma" Where="Estado == @Estado" EntityTypeName="" ID="LqsMotivoMerma0"><WhereParameters>
<asp:Parameter DefaultValue="1" Name="Estado" Type="Int32"></asp:Parameter>
</WhereParameters>
</asp:LinqDataSource>

    </div>

    <div>
        <dx:ASPxPopupControl ID="PopNuevo" runat="server" AllowDragging="True" CloseAction="None" HeaderText="Nuevo" Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle" Width="520px">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <br />
                    <div style="margin-left: 50px">
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="N° Solicitud"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboNumSolicitud" runat="server" ValueType="System.String" DataSourceID="LqsNumSolicitud" Height="30px" AutoPostBack="True" OnSelectedIndexChanged="cboNumSolicitud_SelectedIndexChanged" TextField="Id_Solicitud" ValueField="Id_Solicitud">
                                            <ClearButton DisplayMode="Always">
                                            </ClearButton>
                                            <ValidationSettings Display="Dynamic">
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="OF"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtOF" runat="server" Width="170px" Height="30px">
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
                                        <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Bodega Origen"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboBodOrigen" runat="server" ValueType="System.String" DataSourceID="LqDsSite" TextField="Site_Description" ValueField="Site_Id" Height="30px">
                                            <ValidationSettings Display="Dynamic">
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Bodega Destino"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboBodDestino" runat="server" ValueType="System.String" DataSourceID="LqDsSite" TextField="Site_Description" ValueField="Site_Id" Height="30px">
                                            <ValidationSettings Display="Dynamic">
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <div id="dvDatoSol" runat="server">
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Usuario Solicita"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtUsuario" runat="server" Width="170px" Height="30px" ReadOnly="True">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Fecha Solicitud"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtFechaSoli" runat="server" Width="170px" Height="30px" ReadOnly="True">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Cant.Solicitada(Kilos)"></dx:ASPxLabel>
                                        <dx:ASPxTextBox ID="txtCantSolicitada" runat="server" Width="170px" Height="30px" ReadOnly="True">
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
                                        <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Entidad-Motivo"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboEntidad" runat="server" ValueType="System.String" Height="30px" OnSelectedIndexChanged="cboEntidad_SelectedIndexChanged" AutoPostBack="True">
                                            <Items>
                                                <dx:ListEditItem Text="Produccion" Value="1" />
                                                <dx:ListEditItem Text="No Conforme" Value="2" />
                                            </Items>
                                            <ValidationSettings Display="Dynamic">
                                                <RequiredField IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="auto-style5"></td>
                                    <td id="tipDef" runat="server">
                                        <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Tipo Defecto"></dx:ASPxLabel>
                                        <dx:ASPxComboBox ID="cboTipoDef" runat="server" ValueType="System.String" Height="30px" DataSourceID="LqsMotivoMerma" TextField="Descripcion" ValueField="id_Motivo">
                                        <%--    <Items>
                                                <dx:ListEditItem Text="Puesta En Marcha" Value="1" />
                                                <dx:ListEditItem Text="Problema de Impresion" Value="2" />
                                                <dx:ListEditItem Text="Problema de COF" Value="3" />
                                                <dx:ListEditItem Text="Cambio de Film" Value="4" />
                                                <dx:ListEditItem Text="Problema Embobinado" Value="5" />
                                                <dx:ListEditItem Text="De Proceso" Value="6" />
                                                <dx:ListEditItem Text="Diferencia de Espesor" Value="7" />
                                                <dx:ListEditItem Text="De proveedor" Value="8" />
                                                <dx:ListEditItem Text="Problema de Sellado" Value="9" />
                                                <dx:ListEditItem Text="Vida Util" Value="10" />


                                            </Items>--%>
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
                                        <dx:ASPxButton ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click1" Height="50px" Width="100px" Theme="iOS"></dx:ASPxButton>
                                    </td>
                                    <td class="auto-style6"></td>
                                    <td>
                                        <dx:ASPxButton ID="btnCancelar" runat="server" Text="Cancelar" Height="50px" Width="100px" BackColor="Red" OnClick="btnCancelar_Click" Theme="iOS" CausesValidation="False"></dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <asp:LinqDataSource ID="LqsNumSolicitud" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_FILM_SOLICITUD_TRANSFERENCIA" Where="Estado == @Estado">
                            <WhereParameters>
                                <asp:Parameter DefaultValue="1" Name="Estado" Type="Int32" />
                            </WhereParameters>
                        </asp:LinqDataSource>
                        <asp:LinqDataSource ID="LqDsSite" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" TableName="Site" Where="Site_Id==5 || Site_Id==4 || Site_Id==17 || Site_Id==3 || Site_Id==85">
                        </asp:LinqDataSource>
                        <asp:LinqDataSource ID="LqsUsuario" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Usuarios">
                        </asp:LinqDataSource>
                        <asp:LinqDataSource ID="LqsMotivoMerma" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_ControlEnvasadoPT_MotivoMerma" Where="Estado == @Estado">
                            <WhereParameters>
                                <asp:Parameter DefaultValue="1" Name="Estado" Type="Int32" />
                            </WhereParameters>
                        </asp:LinqDataSource>
                    </div>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>


</asp:Content>
