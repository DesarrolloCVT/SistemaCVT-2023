<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InventarioEquipoAdjuntos.aspx.cs" Inherits="CVT_MermasRecepcion.Informatica.InventarioEquipoAdjuntos" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Informatica</a></li>
            <li><span id="current">Adjuntos</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Adjuntos</span>
        <span class="tab-end"></span>
        <%--    <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="height: 20px;" />
                Exportar Excel</a>&nbsp;
              <a>
                  <asp:ImageButton ID="cmdNew" runat="server"
                      ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="height: 16px;" />Nuevo</a>
        </div>--%>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsAdjuntos" KeyFieldName="RutaArchivo" OnToolbarItemClick="GvDatos_ToolbarItemClick" OnRowCommand="GvDatos_RowCommand" OnRowDeleting="GvDatos_RowDeleting">

            <ClientSideEvents ToolbarItemClick="function(s, e) {
	if (e.item.name == &quot;Nuevo&quot;) e.processOnServer = true; e.usePostBack=true;
 

}" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="id_Adjunto" ReadOnly="True" VisibleIndex="1" Visible="False">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodInventario" VisibleIndex="2" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NombreArchivo" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ExtencionArchivo" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TipoArchivo" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Archivo" VisibleIndex="6" Width="25px">
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
            <SettingsBehavior ConfirmDelete="True" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsAdjuntos" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_INF_AdjuntosInventarioEquipos" Where="CodInventario == @CodInventario" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="CodInventario" SessionField="CodInventario" Type="String" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
    <br />
    <div>
        <dx:ASPxPopupControl ID="popAgregar" runat="server" AllowDragging="True" CloseAction="CloseButton" CloseAnimationType="Fade" HeaderText="Verificacion " Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle" Width="500px">
            <ContentCollection>
                <dx:PopupControlContentControl>
                    <br />
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Licencia" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                    &nbsp;<asp:FileUpload ID="FileUploadLicencia" runat="server" />
                                </td>
                                <td>
                                    <dx:ASPxButton ID="btnSubirLicencia" runat="server" Text="Guardar" OnClick="btnSubirLicencia_Click"></dx:ASPxButton>
                                </td>
                            </tr>

                        </table>
                    </div>
                    <br />
                    <br />
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Equipo" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                    &nbsp;
                                    <asp:FileUpload ID="FileUploadEquipo" runat="server" />
                                </td>
                                <td>
                                    <dx:ASPxButton ID="btnSubirEquipo" runat="server" Text="Guardar" OnClick="btnSubirEquipo_Click"></dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <br />
                    <div style="margin-left: 150px">
                        <dx:ASPxButton ID="btnSalir" runat="server" Text="Salir" Height="31px" OnClick="btnSalir_Click" Theme="iOS" Width="129px"></dx:ASPxButton>
                    </div>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
</asp:Content>
