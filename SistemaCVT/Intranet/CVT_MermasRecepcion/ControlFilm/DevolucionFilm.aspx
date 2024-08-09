<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="DevolucionFilm.aspx.cs" Inherits="CVT_MermasRecepcion.ControlFilm.DevolucionFilm" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            <li><a>WMS</a></li>
            <li><span id="current">Devolucion Film</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Devolucion Film</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <div style="margin-left: 50px">
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Desde"></asp:Label>
                    <dx:ASPxDateEdit ID="dteDesde" runat="server"></dx:ASPxDateEdit>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Hasta"></asp:Label>
                    <dx:ASPxDateEdit ID="dteHasta" runat="server"></dx:ASPxDateEdit>
                </td>
                <td>
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" Height="41px" Width="83px"></dx:ASPxButton>
                </td>

            </tr>
        </table>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDevolucion" KeyFieldName="id_DevoFilm" OnRowInserting="GvDatos_RowInserting" OnRowCommand="GvDatos_RowCommand" OnHtmlRowCreated="GvDatos_HtmlRowCreated" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <Settings AutoFilterCondition="Contains" ShowFilterRow="True" />
            <Toolbars>
                <dx:GridViewToolbar>
                    <Items>
                        <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif">
                            <Image Url="../Images/pn-add-source-copy.gif"></Image>
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
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings AutoFilterCondition="Contains" ShowFilterRow="True" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Columns>
                <dx:GridViewDataTextColumn Caption="Folio" FieldName="id_DevoFilm" ReadOnly="True" VisibleIndex="2">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaInicio" VisibleIndex="4">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="FechaTermino" VisibleIndex="5">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Comentarios" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Bodega" FieldName="idBodega" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="LqDsSite" TextField="Site_Description" ValueField="Site_Id">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Motivo" VisibleIndex="6">
                    <PropertiesComboBox>
                        <Items>
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
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Estado" VisibleIndex="7">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Abierto" Value="1" />
                            <dx:ListEditItem Text="Cerrado" Value="2" />
                            <dx:ListEditItem Text="Cancelado" Value="3" />
                        </Items>
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Usuario" FieldName="IdUsuario" VisibleIndex="8">
                    <PropertiesComboBox DataSourceID="LqsUsuario" TextField="NombreUsuario" ValueField="IdUsuario">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Proveedor" VisibleIndex="9">
                    <PropertiesComboBox DataSourceID="LqsProveedorFilm" TextField="CardName" ValueField="CardCode">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Detalle" VisibleIndex="11">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/boxadd.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Confirma" VisibleIndex="13">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="Confirma" CommandName="cmdConfirma" runat="server"
                            ImageUrl="~/Images/confirm.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Eliminar" VisibleIndex="1">
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
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDevolucion" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_FILM_DEVOLUCION" EnableDelete="True" EnableInsert="True" EnableUpdate="True" Where="FechaInicio &gt;= @FechaInicio &amp;&amp; FechaInicio &lt;= @FechaInicio1">
            <WhereParameters>
                <asp:ControlParameter ControlID="dteDesde" DefaultValue="01-01-1990" Name="FechaInicio" PropertyName="Value" Type="DateTime" />
                <asp:ControlParameter ControlID="dteHasta" DefaultValue="01-01-1990" Name="FechaInicio1" PropertyName="Value" Type="DateTime" />
            </WhereParameters>
        </asp:LinqDataSource>

        <asp:LinqDataSource runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" TableName="Site" EntityTypeName="" ID="LqDsSite" Where="Site_Id==5 || Site_Id==4 || Site_Id==17"></asp:LinqDataSource>

        <asp:LinqDataSource ID="LqsUsuario" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Usuarios">
        </asp:LinqDataSource>

        <asp:LinqDataSource ID="LqsProveedorFilm" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" Select="new (CardCode, CardName)" TableName="OCRD" Where="QryGroup4 == @QryGroup4 &amp;&amp; CardType == @CardType">
            <WhereParameters>
                <asp:Parameter DefaultValue="Y" Name="QryGroup4" Type="Char" />
                <asp:Parameter DefaultValue="C" Name="CardType" Type="Char" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
</asp:Content>
