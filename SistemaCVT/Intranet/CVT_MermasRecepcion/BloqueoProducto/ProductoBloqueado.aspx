<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ProductoBloqueado.aspx.cs" Inherits="CVT_MermasRecepcion.BloqueoProducto.ProductoBloqueado" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 10px;
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
            <li><a>Bloqueo Productos</a></li>
            <li><span id="current">Productos Bloqueados</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Productos Bloqueados</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatosProdBloqueado" runat="server" AutoGenerateColumns="False" DataSourceID="LqsProdBloqueado" KeyFieldName="Id_ProdBloqueado" OnRowInserting="GvDatosProdBloqueado_RowInserting" OnRowCommand="GvDatosProdBloqueado_RowCommand" OnToolbarItemClick="GvDatosProdBloqueado_ToolbarItemClick" OnHtmlRowCreated="GvDatosProdBloqueado_HtmlRowCreated">
            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" ShowGroupPanel="True" AutoFilterCondition="Contains" />
            <SettingsBehavior ConfirmDelete="True" />
            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <ClientSideEvents ToolbarItemClick="function(s, e) {
	if (e.item.name == &quot;Nuevo&quot;) e.processOnServer = true; e.usePostBack=true;
 

}" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowInCustomizationForm="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn Caption="Folio" FieldName="Id_ProdBloqueado" ReadOnly="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaCreacion" VisibleIndex="4">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Observacion" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Tipo Bloqueo" FieldName="Id_TipoBloqueo" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="LqsTipoBloqueo" TextField="Descripcion" ValueField="Id_TipoBloqueo">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Detalle" VisibleIndex="10">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/boxadd.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataComboBoxColumn FieldName="CodCliente" VisibleIndex="7">
                    <PropertiesComboBox DataSourceID="LqsCliente0" ValueField="CardCode">
                        <Columns>
                            <dx:ListBoxColumn FieldName="CardCode">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn FieldName="CardName">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Usuario" FieldName="IdUsuario" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="LqsUsuario" TextField="NombreUsuario" ValueField="IdUsuario">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="FechaTerminoBloqueo" VisibleIndex="9">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Estado" VisibleIndex="8">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Pallets Bloqueados" Value="1" />
                            <dx:ListEditItem Text="Liberado" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Liberar" VisibleIndex="11">
                    <DataItemTemplate>
                        <asp:ImageButton ID="liberar" CommandName="cmdLiberar" runat="server" ImageUrl="~/Images/ico-vigente.png" />
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
                        <%--  <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXls" />
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />
                            </Items>
                            <Image IconID="actions_download_16x16office2013"></Image>
                        </dx:GridViewToolbarItem>--%>
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
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsProdBloqueado" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="CVT_Producto_Bloqueado" OrderBy="Id_ProdBloqueado desc">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsTipoBloqueo" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Producto_TipoBloqueo">
        </asp:LinqDataSource>

        <asp:LinqDataSource runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" Select="new (CardCode, CardName)" TableName="OCRD" EntityTypeName="" ID="LqsCliente0">
        </asp:LinqDataSource>

        <asp:LinqDataSource ID="LqsUsuario" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Usuarios">
        </asp:LinqDataSource>
    </div>

    <dx:ASPxPopupControl ID="PopNuevo" runat="server"
        HeaderText="Nuevo" AllowDragging="True" CloseAction="None">
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <br />
                <div>
                    <table>
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Tipo Bloqueo"></dx:ASPxLabel>
                                <dx:ASPxComboBox ID="cboTipoBloqueo" runat="server" ValueType="System.String" Width="200px" Height="30px" DataSourceID="LqsTipoBloqueo" OnSelectedIndexChanged="cboTipoBloqueo_SelectedIndexChanged" TextField="Descripcion" ValueField="Id_TipoBloqueo" AutoPostBack="True">
                                    <ValidationSettings Display="Dynamic">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                            </td>
                            <td class="auto-style5"></td>
                            <td>
                                <dx:ASPxLabel ID="lblCliente" runat="server" Text="Cliente" Visible="false"></dx:ASPxLabel>
                                <dx:ASPxComboBox ID="cboCliente" runat="server" ValueType="System.String" Visible="false" Width="400px" Height="30px" DataSourceID="LqsCliente" ValueField="CardCode">
                                    <Columns>
                                        <dx:ListBoxColumn Caption="Codigo" FieldName="CardCode">
                                        </dx:ListBoxColumn>
                                        <dx:ListBoxColumn Caption="Nombre" FieldName="CardName" Width="400px">
                                        </dx:ListBoxColumn>
                                    </Columns>
                                </dx:ASPxComboBox>

                            </td>
                        </tr>
                    </table>
                </div>
                <br />
                <div>
                    <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Comentarios"></dx:ASPxLabel>
                    <dx:ASPxMemo ID="txtComentarios" runat="server" Height="71px" Width="611px"></dx:ASPxMemo>

                </div>
                <br />
                <div style="margin-left: 150px">
                    <table>
                        <tr>
                            <td>
                                <dx:ASPxButton ID="btnGuardar" runat="server" Text="GUARDAR" Height="40px" OnClick="btnGuardar_Click" Theme="iOS" Width="140px"></dx:ASPxButton>
                            </td>
                            <td class="auto-style6"></td>
                            <td>
                                <dx:ASPxButton ID="btnCancelar" runat="server" Text="Cancelar" Height="40px" OnClick="btnCancelar_Click" Theme="iOS" Width="140px" BackColor="Red" CausesValidation="False"></dx:ASPxButton>
                            </td>
                        </tr>
                    </table>


                </div>
                <asp:LinqDataSource ID="LqsCliente" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" Select="new (CardCode, CardName)" TableName="OCRD" Where="CardType == @CardType &amp;&amp; validFor == @validFor">
                    <WhereParameters>
                        <asp:Parameter DefaultValue="C" Name="CardType" Type="Char" />
                        <asp:Parameter DefaultValue="Y" Name="validFor" Type="Char" />
                    </WhereParameters>
                </asp:LinqDataSource>
            </dx:PopupControlContentControl>
        </ContentCollection>
    </dx:ASPxPopupControl>
</asp:Content>
