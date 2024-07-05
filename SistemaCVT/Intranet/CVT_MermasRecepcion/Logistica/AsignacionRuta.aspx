<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="AsignacionRuta.aspx.cs" Inherits="CVT_MermasRecepcion.Logistica.AsignacionRuta" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Logistica</a></li>
            <li><span id="current">Asignacion Ruta</span></li>
        </ul>
    </div>
    <br />
    <br />
    <div id="tableHeader">
        <span class="tableTitle">Asignacion Ruta</span>
        <span class="tab-end"></span>
       
        <br />
    </div>
    <div>
    <table>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxDateEdit ID="cbo_fecha" runat="server" AutoPostBack="True"></dx:ASPxDateEdit>
            </td>
            <td>
                <dx:ASPxButton ID="btn_refrescar" runat="server" Text="REFRESCAR" OnClick="btn_refrescar_Click"></dx:ASPxButton>
            </td>
        </tr>
        <tr>
            <td colspan="4">

                <dx:ASPxRadioButtonList ID="rb_TipoCamion" runat="server" OnSelectedIndexChanged="rb_TipoCamion_SelectedIndexChanged" AutoPostBack="True">
                    <Items>
                        <dx:ListEditItem Text="Patente" Value="1" />
                        <dx:ListEditItem Text="Virtual" Value="2" />
                    </Items>
                </dx:ASPxRadioButtonList>

            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Camion"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cbo_camion" runat="server" DataSourceID="lqdscamion" ValueField="Patente" AutoPostBack="True" OnSelectedIndexChanged="cbo_camion_SelectedIndexChanged">
                    <Columns>
                        <dx:ListBoxColumn FieldName="Patente">
                        </dx:ListBoxColumn>
                        <dx:ListBoxColumn FieldName="CapacidadPallet">
                        </dx:ListBoxColumn>
                    </Columns>
                </dx:ASPxComboBox>
                <asp:LinqDataSource ID="lqdscamion" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_DescripcionDeCamiones" Where="Tipo == @Tipo">
                    <WhereParameters>
                        <asp:Parameter DefaultValue="1" Name="Tipo" Type="Int32" />
                    </WhereParameters>
                </asp:LinqDataSource>
                <dx:ASPxComboBox ID="cbo_Cvirtual" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cbo_Cvirtual_SelectedIndexChanged">
                    <Items>
                        <dx:ListEditItem Text="1" Value="1" />
                        <dx:ListEditItem Text="2" Value="2" />
                        <dx:ListEditItem Text="3" Value="3" />
                        <dx:ListEditItem Text="4" Value="4" />
                        <dx:ListEditItem Text="5" Value="5" />
                        <dx:ListEditItem Text="6" Value="6" />
                        <dx:ListEditItem Text="7" Value="7" />
                        <dx:ListEditItem Text="8" Value="8" />
                        <dx:ListEditItem Text="9" Value="9" />
                        <dx:ListEditItem Text="10" Value="10" />
                        <dx:ListEditItem Text="11" Value="11" />
                        <dx:ListEditItem Text="12" Value="12" />
                        <dx:ListEditItem Text="13" Value="13" />
                        <dx:ListEditItem Text="14" Value="14" />
                        <dx:ListEditItem Text="15" Value="15" />
                        <dx:ListEditItem Text="16" Value="16" />
                        <dx:ListEditItem Text="17" Value="17" />
                        <dx:ListEditItem Text="18" Value="18" />
                        <dx:ListEditItem Text="19" Value="19" />
                        <dx:ListEditItem Text="20" Value="20" />
                        <dx:ListEditItem Text="21" Value="21" />
                        <dx:ListEditItem Text="22" Value="22" />
                        <dx:ListEditItem Text="23" Value="23" />
                        <dx:ListEditItem Text="24" Value="24" />
                        <dx:ListEditItem Text="25" Value="25" />
                        <dx:ListEditItem Text="26" Value="26" />
                        <dx:ListEditItem Text="27" Value="27" />
                        <dx:ListEditItem Text="28" Value="28" />
                        <dx:ListEditItem Text="29" Value="29" />
                        <dx:ListEditItem Text="30" Value="30" />
                    </Items>
                </dx:ASPxComboBox>
            </td>
             <td>
                <dx:ASPxLabel ID="lbl_carro" runat="server" Text="Carro"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cbo_Carro" runat="server" DataSourceID="LqDsCarro" ValueField="Patente" AutoPostBack="True" OnSelectedIndexChanged="cbo_Carro_SelectedIndexChanged">
                    <Columns>
                        <dx:ListBoxColumn FieldName="Patente">
                        </dx:ListBoxColumn>
                        <dx:ListBoxColumn FieldName="CapacidadPallet">
                        </dx:ListBoxColumn>
                    </Columns>
                </dx:ASPxComboBox>
                <asp:LinqDataSource ID="LqDsCarro" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_DescripcionDeCamiones" Where="Tipo == @Tipo">
                    <WhereParameters>
                        <asp:Parameter DefaultValue="2" Name="Tipo" Type="Int32" />
                    </WhereParameters>
                </asp:LinqDataSource>
            </td>
            <td>
                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Capacidad:"></dx:ASPxLabel>
                
            </td>
            <td>
                <dx:ASPxLabel ID="lbl_CantPallet" runat="server" Text=""></dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Pedido"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cbo_pedido" runat="server" AutoPostBack="True" DataSourceID="lqdspedido" ValueField="NumPedido">
                    <Columns>
                        <dx:ListBoxColumn FieldName="NumPedido" Caption="Pedido"></dx:ListBoxColumn>
                        <dx:ListBoxColumn Caption="Pedido SAP" FieldName="DocNum">
                        </dx:ListBoxColumn>
                        <dx:ListBoxColumn FieldName="Cliente"></dx:ListBoxColumn>
                        <dx:ListBoxColumn FieldName="DirDespacho">
                        </dx:ListBoxColumn>
                        <dx:ListBoxColumn Caption="Cant Pallets" FieldName="CantidadPallets">
                        </dx:ListBoxColumn>
                        <dx:ListBoxColumn FieldName="PesoTotalPallets">
                        </dx:ListBoxColumn>
                        <dx:ListBoxColumn Caption="OC" FieldName="NumAtCard">
                        </dx:ListBoxColumn>
                    </Columns>
                </dx:ASPxComboBox>
                <asp:LinqDataSource ID="lqdspedido" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_VW_PedidoOrdenCarga" Where="FEntrega == @FEntrega &amp;&amp; Asignado == @Asignado">
                    <WhereParameters>
                        <asp:ControlParameter ControlID="cbo_fecha" DefaultValue="01-01-1990" Name="FEntrega" PropertyName="Value" Type="DateTime" />
                        <asp:Parameter DefaultValue="0" Name="Asignado" Type="Int32" />
                    </WhereParameters>
                </asp:LinqDataSource>
            </td>
        </tr>
        <tr>
            <td>
                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Prioridad Carga"></dx:ASPxLabel>
            </td>
            <td>
                <dx:ASPxComboBox ID="cbo_prioridad" runat="server">
                    <Items>
                        <dx:ListEditItem Text="1" Value="1" />
                        <dx:ListEditItem Text="2" Value="2" />
                        <dx:ListEditItem Text="3" Value="3" />
                        <dx:ListEditItem Text="4" Value="4" />
                        <dx:ListEditItem Text="5" Value="5" />
                        <dx:ListEditItem Text="6" Value="6" />
                        <dx:ListEditItem Text="7" Value="7" />
                        <dx:ListEditItem Text="8" Value="8" />
                        <dx:ListEditItem Text="9" Value="9" />
                        <dx:ListEditItem Text="10" Value="10" />
                    </Items>
                </dx:ASPxComboBox>
            </td>
        </tr>
    </table>
        </div>
    <div>

        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="LqDsDetallePedido">
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="NumPedido" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DocNum" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FEntrega" VisibleIndex="2">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="TipoPallet" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodProducto" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CantPedidoSAP" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CantidadPallets" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PesoTotalPallets" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TipoSoportante" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsDetallePedido" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_VW_PedidoDetalleOrdenCarga" Where="NumPedido == @NumPedido">
            <WhereParameters>
                <asp:ControlParameter ControlID="cbo_pedido" DefaultValue="0" Name="NumPedido" PropertyName="Value" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>

    </div>
    <div>
        <dx:ASPxButton ID="btn_asignar" runat="server" Text="Asignar a Camion" OnClick="btn_asignar_Click"></dx:ASPxButton>
    </div>
    <div>
        <p>  RESUMEN CAMION</p>
    </div>
    <div>
        <dx:ASPxGridView ID="GVResumenCamion" runat="server" AutoGenerateColumns="False" DataSourceID="LqDsResumen" KeyFieldName="Camion;FechaEntrega" OnRowCommand="GVResumenCamion_RowCommand">
            <SettingsPager PageSize="100">
            </SettingsPager>
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Camion" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaEntrega" VisibleIndex="1">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="CantPedidos" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CantPallets" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PesoTotal" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Detalle" VisibleIndex="5">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/boxadd.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
            </Columns>
        </dx:ASPxGridView>

        <asp:LinqDataSource ID="LqDsResumen" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_VW_ResumenCamionesFecha" Where="FechaEntrega == @FechaEntrega">
            <WhereParameters>
                <asp:ControlParameter ControlID="cbo_fecha" DefaultValue="01-01-1990" Name="FechaEntrega" PropertyName="Value" Type="DateTime" />
            </WhereParameters>
        </asp:LinqDataSource>
        <dx:ASPxPopupControl ID="popup_editaasignacion" runat="server" HeaderText="Edita Asignacion">
            
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <div>
                        <table>
                            <tr>
                                <td colspan="6">
                                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Asignar"></dx:ASPxLabel>
                                 </td>
                              
                            </tr>
                            <tr>
                                <th>Patente Camion</th>
                                <th>Patente Carro</th>
                                <th>Chofer</th>
                                <th>Cant Peonetas</th>
                                <th>Hora Salida</th>
                                <th>Observacion</th>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxComboBox ID="Cbo_CamionEditar" runat="server" DataSourceID="lqdscamion" ValueField="Patente" AutoPostBack="True" OnSelectedIndexChanged="cbo_Carro_SelectedIndexChanged" TextField="Patente">
                                    </dx:ASPxComboBox>
                                </td>
                                <td>
                                    <dx:ASPxComboBox ID="cbo_CarroAsig" runat="server" DataSourceID="LqDsCarro" ValueField="Patente" AutoPostBack="True" OnSelectedIndexChanged="cbo_Carro_SelectedIndexChanged" TextField="Patente">
                                    </dx:ASPxComboBox>
                                </td>
                                <td>
                                    <dx:ASPxComboBox ID="cbo_Chofer" runat="server" ValueField="Patente" AutoPostBack="True" OnSelectedIndexChanged="cbo_Carro_SelectedIndexChanged" TextField="Patente">
                                        <Items>
                                            <dx:ListEditItem Text="Michael Romero" Value="Michael Romero" />
                                            <dx:ListEditItem Text="Adrian Gonzalez" Value="Adrian Gonzalez" />
                                            <dx:ListEditItem Text="Rafael Aranda" Value="Rafael Aranda" />
                                            <dx:ListEditItem Text="Moises Pena" Value="Moises Pena" />
                                            <dx:ListEditItem Text="Fernando Valderrama" Value="Fernando Valderrama" />
                                            <dx:ListEditItem Text="Leonardo Catalan" Value="Leonardo Catalan" />
                                            <dx:ListEditItem Text="Patricio Huenuqueo" Value="Patricio Huenuqueo" />
                                            <dx:ListEditItem Text="Jorge Catalan" Value="Jorge Catalan" />
                                            <dx:ListEditItem Text="Juan Viera" Value="Juan Viera" />
                                            <dx:ListEditItem Text="Juan Plaza" Value="Juan Plaza" />
                                            <dx:ListEditItem Text="Javier Plaza" Value="Javier Plaza" />
                                            <dx:ListEditItem Text="Agusto Plaza" Value="Agusto Plaza" />
                                            <dx:ListEditItem Text="Luis Marchant" Value="Luis Marchant" />
                                            <dx:ListEditItem Text="Edison Rifo" Value="Edison Rifo" />
                                            <dx:ListEditItem Text="Externo" Value="Externo" />
                                            <dx:ListEditItem Text="Retira Cliente" Value="Retira Cliente" />
                                        </Items>
                                    </dx:ASPxComboBox>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="txt_cantPeonetas" runat="server" Width="170px"></dx:ASPxTextBox>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="txt_HoraSalida" runat="server" Width="170px"></dx:ASPxTextBox>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="txt_Observacion" runat="server" Width="170px"></dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6">
                                    <dx:ASPxButton ID="btn_AsignarPatente" runat="server" Text="Asignar" OnClick="btn_AsignarPatente_Click"></dx:ASPxButton>
                                </td>
                                
                            </tr>
                        </table>
                        
                        
                        
                    </div>
                    <div>
                        <dx:ASPxGridView ID="GvRutasAsignadas" runat="server" AutoGenerateColumns="False" DataSourceID="LqDsRutasAsignadas" KeyFieldName="Asignacion_ID" OnRowDeleted="GvRutasAsignadas_RowDeleted" OnRowUpdated="GvRutasAsignadas_RowUpdated">
<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>
                            <Columns>
                                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                </dx:GridViewCommandColumn>
                                <dx:GridViewDataTextColumn FieldName="Asignacion_ID" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                    <EditFormSettings Visible="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Camion_ID" ShowInCustomizationForm="True" VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataDateColumn FieldName="FechaEntrega" ShowInCustomizationForm="True" VisibleIndex="3">
                                </dx:GridViewDataDateColumn>
                                <dx:GridViewDataTextColumn FieldName="Pedido" ShowInCustomizationForm="True" VisibleIndex="4">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Cliente" ShowInCustomizationForm="True" VisibleIndex="5">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Direccion" ShowInCustomizationForm="True" VisibleIndex="6">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="CantidadPallet" ShowInCustomizationForm="True" VisibleIndex="7">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="PesoPallet" ShowInCustomizationForm="True" VisibleIndex="8">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="PrioridadCarga" ShowInCustomizationForm="True" VisibleIndex="9">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:ASPxGridView>
                        <asp:LinqDataSource ID="LqDsRutasAsignadas" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableUpdate="True" TableName="CVT_AsignacionRuta" Where="Camion_ID == @Camion_ID &amp;&amp; FechaEntrega == @FechaEntrega">
                            <WhereParameters>
                                <asp:SessionParameter DefaultValue="0" Name="Camion_ID" SessionField="Patente" Type="String" />
                                <asp:SessionParameter DefaultValue="01-01-1990" Name="FechaEntrega" SessionField="FechaEntrega" Type="DateTime" />
                            </WhereParameters>
                        </asp:LinqDataSource>
                    </div>
                </dx:PopupControlContentControl>
            </ContentCollection>
            
        </dx:ASPxPopupControl>

    </div>
</asp:Content>
