<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="Pedidos.aspx.cs" Inherits="CVT_MermasRecepcion.WMS.Pedidos" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style14 {
            width: 91px;
        }

        .auto-style15 {
            width: 67px;
            height: 46px;
        }

        .auto-style16 {
            height: 46px;
        }

        .auto-style17 {
            height: 58px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>WMS</a></li>
            <li><span id="current">Pedidos</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Pedidos</span>
        <span class="tab-end"></span>
        <%--        <dx:GridViewToolbarItem Command="New" />--%>
    </div>
    <br />
    <div>
        <dx:ASPxPanel ID="ASPxPanel2" runat="server" Width="200px">
            <PanelCollection>
                <dx:PanelContent ID="PanelContent1" runat="server">
                    <div>
                        <p>Filtros</p>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha Desde">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxDateEdit ID="cb_fdesde" runat="server">
                                    </dx:ASPxDateEdit>
                                </td>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Fecha Hasta">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxDateEdit ID="cb_fhasta" runat="server">
                                    </dx:ASPxDateEdit>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>
                                    <dx:ASPxButton ID="btn_filtrar" runat="server" Text="Filtrar"
                                        OnClick="btn_filtrar_Click">
                                    </dx:ASPxButton>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </div>
                    <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False"
                        DataSourceID="LqDsPedidos" Width="100%"
                        OnRowCommand="GvDatos_RowCommand"
                        OnHtmlRowCreated="GvDatos_HtmlRowCreated" KeyFieldName="Pedido" OnToolbarItemClick="GvDatos_ToolbarItemClick">
                        <SettingsPager PageSize="25">
                        </SettingsPager>
                        <SettingsEditing Mode="PopupEditForm">
                        </SettingsEditing>
                        <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
                        <SettingsBehavior AllowFocusedRow="True" />
                        <SettingsCookies CookiesID="Pedidos" Enabled="True" Version="3" />
                        <Toolbars>
                            <dx:GridViewToolbar>
                                <Items>
                                    <%--        <dx:GridViewToolbarItem Command="New" />--%>
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
                            <dx:GridViewDataTextColumn FieldName="Pedido"
                                ShowInCustomizationForm="True" VisibleIndex="1" Caption="Pedido WMS">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="P_SAP"
                                ShowInCustomizationForm="True" VisibleIndex="2" Caption="Pedido SAP">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn FieldName="FEntrega" ShowInCustomizationForm="True"
                                VisibleIndex="6" Visible="False">
                                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm">
                                </PropertiesDateEdit>
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn FieldName="Cliente"
                                ShowInCustomizationForm="True" VisibleIndex="5">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn
                                FieldName="Expedicion" ShowInCustomizationForm="True"
                                VisibleIndex="8">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Vuelta"
                                ShowInCustomizationForm="True" VisibleIndex="10" Caption="N° Vuelta">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="GrueroAsignado"
                                ShowInCustomizationForm="True" VisibleIndex="15">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataHyperLinkColumn Caption="Detalle" VisibleIndex="16">
                                <EditFormSettings Visible="False" />
                                <DataItemTemplate>
                                    <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/boxadd.png" />
                                </DataItemTemplate>
                            </dx:GridViewDataHyperLinkColumn>
                            <dx:GridViewDataHyperLinkColumn Caption="Anula" VisibleIndex="17">
                                <EditFormSettings Visible="False" />
                                <DataItemTemplate>
                                    <asp:ImageButton ID="Anula" CommandName="cmdAnula" runat="server" ImageUrl="~/Images/node_delete.png" />
                                </DataItemTemplate>
                            </dx:GridViewDataHyperLinkColumn>
                            <dx:GridViewDataHyperLinkColumn Caption="Confirma" VisibleIndex="18">
                                <EditFormSettings Visible="False" />
                                <DataItemTemplate>
                                    <asp:ImageButton ID="Confirma" CommandName="cmdConfirma" runat="server"
                                        ImageUrl="~/Images/confirm.png" OnClientClick="LoadingPanel.Show();" />
                                </DataItemTemplate>
                            </dx:GridViewDataHyperLinkColumn>
                            <dx:GridViewDataHyperLinkColumn Caption="Editar" VisibleIndex="0">
                                <EditFormSettings Visible="False" />
                                <DataItemTemplate>
                                    <asp:ImageButton ID="AgHora" CommandName="cmdAgregaHora" runat="server"
                                        ImageUrl="~/Images/edita.png" />
                                </DataItemTemplate>
                                <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                                </CellStyle>
                            </dx:GridViewDataHyperLinkColumn>
                            <dx:GridViewDataComboBoxColumn FieldName="Estado"
                                ShowInCustomizationForm="True" VisibleIndex="4">
                                <PropertiesComboBox>
                                    <Items>
                                        <dx:ListEditItem Text="Abierto" Value="1" />
                                        <dx:ListEditItem Text="Despachado" Value="3" />
                                        <dx:ListEditItem Text="Anulado" Value="6" />
                                        <dx:ListEditItem Text="Terminado" Value="2" />
                                        <dx:ListEditItem Text="Terminado Incompleto" Value="4" />
                                        <dx:ListEditItem Text="Consolidado" Value="5" />
                                        <dx:ListEditItem Text="En Picking" Value="8" />
                                        <dx:ListEditItem Text="Picking OLA" Value="7" />
                                    </Items>
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn FieldName="SyncStat"
                                ShowInCustomizationForm="True" VisibleIndex="9">
                                <PropertiesComboBox>
                                    <Items>
                                        <dx:ListEditItem Text="Sincronizado" Value="S" />
                                        <dx:ListEditItem Text="Pendiente" Value="U" />
                                    </Items>
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataComboBoxColumn FieldName="Tipo" ShowInCustomizationForm="True"
                                VisibleIndex="11">
                                <PropertiesComboBox>
                                    <Items>
                                        <dx:ListEditItem Text="Servicio" Value="1" />
                                        <dx:ListEditItem Text="Repaletizado" Value="2" />
                                        <dx:ListEditItem Text="Despacho" Value="3" />
                                        <dx:ListEditItem Text="Reserva Recepcion" Value="4" />
                                        <dx:ListEditItem Text="Planta Productiva" Value="5" />
                                        <dx:ListEditItem Text="Consolidado" Value="6" />
                                        <dx:ListEditItem Text="Despacho Cajas" Value="7" />
                                        <dx:ListEditItem Text="CrossDocking" Value="8" />
                                        <dx:ListEditItem Text="Ajuste Salida" Value="9" />
                                    </Items>
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataDateColumn FieldName="FTermino" ShowInCustomizationForm="True"
                                VisibleIndex="7">
                                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm">
                                </PropertiesDateEdit>
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn FieldName="Bodega" ShowInCustomizationForm="True" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="CantPalletBlanco" ShowInCustomizationForm="True" VisibleIndex="12">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="CantPalletChep" ShowInCustomizationForm="True" VisibleIndex="14">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="CantBlancoTipoChep" ShowInCustomizationForm="True" VisibleIndex="13">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <Styles>
                            <FocusedRow BackColor="#FF9933">
                            </FocusedRow>
                        </Styles>
                        <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

                        <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
                    </dx:ASPxGridView>
                    <asp:LinqDataSource ID="LqDsPedidos" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
                        TableName="CVT_EncabezadoPedido"
                        Where="FEntrega &lt;= @FEntrega &amp;&amp; FEntrega &gt;= @FEntrega1"
                        EnableInsert="True">
                        <WhereParameters>
                            <asp:ControlParameter ControlID="cb_fhasta" Name="FEntrega"
                                PropertyName="Value" Type="DateTime" />
                            <asp:ControlParameter ControlID="cb_fdesde" Name="FEntrega1"
                                PropertyName="Value" Type="DateTime" />
                        </WhereParameters>
                    </asp:LinqDataSource>
                    <asp:LinqDataSource ID="LqDsSite" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
                        TableName="Site">
                    </asp:LinqDataSource>
                    <asp:LinqDataSource ID="LqDsStaff" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName=""
                        TableName="Staff">
                    </asp:LinqDataSource>
                    <asp:LinqDataSource ID="LqDsEntidad" runat="server"
                        ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
                        TableName="CVT_Entidad">
                    </asp:LinqDataSource>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxPanel>
    </div>
    <dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel"
        Modal="True">
    </dx:ASPxLoadingPanel>
    <div>
        <dx:ASPxPopupControl ID="PopAgHora" runat="server" Width="469px" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" AllowDragging="True" CloseAction="CloseButton" HeaderText="Editar" Modal="True">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <div style="margin-left: 50px">
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Inicio Armado" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    </td>
                                    <td class="auto-style14"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Termino Armado" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div>
                            <table class="auto-style17">
                                <tr>
                                    <td class="auto-style16">
                                        <asp:Label ID="Label1" runat="server" Text="Hora"></asp:Label>
                                        <dx:ASPxTextBox ID="txtHoraInicioArmado" runat="server" Width="60px"></dx:ASPxTextBox>
                                    </td>
                                    <td style="align-content: center" class="auto-style16">
                                        <br />
                                        :</td>
                                    <td class="auto-style16">
                                        <asp:Label ID="Label2" runat="server" Text="Minutos"></asp:Label>
                                        <dx:ASPxTextBox ID="txtMinutosInicioArmado" runat="server" Width="60px"></dx:ASPxTextBox>
                                    </td>
                                    <td class="auto-style15"></td>
                                    <td class="auto-style16">
                                        <asp:Label ID="Label3" runat="server" Text="Hora"></asp:Label>
                                        <dx:ASPxTextBox ID="txtHoraTerArmado" runat="server" Width="60px"></dx:ASPxTextBox>
                                    </td>
                                    <td style="align-content: center" class="auto-style16">
                                        <br />
                                        :</td>
                                    <td class="auto-style16">
                                        <asp:Label ID="Label4" runat="server" Text="Minutos"></asp:Label>
                                        <dx:ASPxTextBox ID="txtMinTerArmado" runat="server" Width="60px"></dx:ASPxTextBox>
                                    </td>

                                </tr>
                            </table>
                        </div>
                    </div>
                    <br />
                    <div style="margin-left: 50px">
                        <div>
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Inicio Carga" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    </td>
                                    <td class="auto-style14"></td>
                                    <td>
                                        <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Termino Carga" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div>
                            <table class="auto-style17">
                                <tr>
                                    <td class="auto-style16">
                                        <asp:Label ID="Label5" runat="server" Text="Hora"></asp:Label>
                                        <dx:ASPxTextBox ID="txtHoraInicioCarga" runat="server" Width="60px"></dx:ASPxTextBox>
                                    </td>
                                    <td style="align-content: center" class="auto-style16">
                                        <br />
                                        :</td>
                                    <td class="auto-style16">
                                        <asp:Label ID="Label6" runat="server" Text="Minutos"></asp:Label>
                                        <dx:ASPxTextBox ID="txtMinInicioCarga" runat="server" Width="60px"></dx:ASPxTextBox>
                                    </td>
                                    <td class="auto-style15"></td>
                                    <td class="auto-style16">
                                        <asp:Label ID="Label7" runat="server" Text="Hora"></asp:Label>
                                        <dx:ASPxTextBox ID="txtHoraTerminoCarga" runat="server" Width="60px"></dx:ASPxTextBox>
                                    </td>
                                    <td style="align-content: center" class="auto-style16">
                                        <br />
                                        :</td>
                                    <td class="auto-style16">
                                        <asp:Label ID="Label8" runat="server" Text="Minutos"></asp:Label>
                                        <dx:ASPxTextBox ID="txtminTerCarga" runat="server" Width="60px"></dx:ASPxTextBox>
                                    </td>

                                </tr>
                            </table>
                        </div>
                        <br />
                        <div style="margin-left: 70px">
                            <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Gruero Encargado" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                            <dx:ASPxComboBox ID="cboGruero" runat="server" ValueType="System.String" DataSourceID="lqsGruero" TextField="Staff_Name" ValueField="Staff_Id"></dx:ASPxComboBox>
                            <asp:LinqDataSource ID="lqsGruero" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" Select="new (Staff_Id, Staff_Name, Staff_LastName)" TableName="Staff" Where="Profiles_Id == @Profiles_Id &amp;&amp; Staff_Enabled == @Staff_Enabled">
                                <WhereParameters>
                                    <asp:Parameter DefaultValue="13" Name="Profiles_Id" Type="Int32" />
                                    <asp:Parameter DefaultValue="1" Name="Staff_Enabled" Type="Int32" />
                                </WhereParameters>
                            </asp:LinqDataSource>
                        </div>
                        <div>

                            <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Armador de Pedido">
                            </dx:ASPxLabel>
                            <dx:ASPxComboBox ID="cbo_ArmadoPedido" runat="server">
                                <Items>
                                    <dx:ListEditItem Text="Armadores de Pedido" Value="Armadores de Pedido" />
                                    <dx:ListEditItem Text="Picking" Value="Picking" />
                                    <dx:ListEditItem Text="Merma u Otro" Value="Merma u Otro" />
                                </Items>
                            </dx:ASPxComboBox>

                        </div>
                        <br />
                        <br />
                        <div style="margin-left: 60px">
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxButton ID="btnGuardar" runat="server" Text="Guardar" OnClick="btnGuardar_Click"></dx:ASPxButton>
                                    </td>
                                    <td></td>
                                    <td>
                                        <dx:ASPxButton ID="btnSalir" runat="server" Text="Cancelar" OnClick="btnSalir_Click"></dx:ASPxButton>
                                    </td>
                                    <td></td>
                                    <td>
                                        <dx:ASPxButton ID="btnLimpiar" runat="server" Text="limpiar" OnClick="btnLimpiar_Click"></dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>

</asp:Content>
