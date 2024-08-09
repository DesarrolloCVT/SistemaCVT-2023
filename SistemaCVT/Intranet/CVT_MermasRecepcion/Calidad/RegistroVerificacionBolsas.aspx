<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="RegistroVerificacionBolsas.aspx.cs" Inherits="CVT_MermasRecepcion.Calidad.RegistroVerificacionBolsas" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-right: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Calidad</a></li>
            <li><span id="current">Verificacion Bolsas</span></li>
        </ul>
    </div>
    <div id="tableHeader">
        <span class="tableTitle">Verificacion Bolsas</span>
        <span class="tab-end"></span>
        <div id="options">
            <%--  <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" onclick="cmdExcel_Click" />
                Exportar Excel</a>--%>
            <a>
                <asp:ImageButton ID="cmdNew" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-agregar3.png" OnClick="cmdNew_Click" Height="35px" Width="80px" />
            </a>
        </div>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvRegistroVerificacion" runat="server" AutoGenerateColumns="False" DataSourceID="LqsVerificacion" KeyFieldName="Id_VerificacionBolsas" OnRowCommand="GvRegistroVerificacion_RowCommand" CssClass="auto-style1" OnHtmlRowCreated="GvRegistroVerificacion_HtmlRowCreated" OnRowInserting="GvRegistroVerificacion_RowInserting" OnRowDeleting="GvRegistroVerificacion_RowDeleting" OnRowUpdating="GvRegistroVerificacion_RowUpdating">
            <SettingsPager PageSize="50">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            <SettingsBehavior ConfirmDelete="True" AllowFocusedRow="True" />
            <Toolbars>
                <dx:GridViewToolbar>
                    <Items>
                   <%--     <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif" />
                        <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXls" />
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                <dx:GridViewToolbarItem Command="ExportToDocx" />
                                <dx:GridViewToolbarItem Command="ExportToRtf" />
                                <dx:GridViewToolbarItem Command="ExportToCsv" />
                                <dx:GridViewToolbarItem Command="ExportToPdf" />
                            </Items>
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

            <SettingsText ConfirmDelete="Solo usuarios verificadores pueden eliminar registros " />

            <Columns>
                <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0" ShowDeleteButton="True" ShowClearFilterButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id_VerificacionBolsas" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Fecha" VisibleIndex="3" Caption="Fecha Registro">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Observaciones" VisibleIndex="10">
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn Caption="Fecha Elaboracion" FieldName="Fecha_Elaboracion" VisibleIndex="4">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn Caption="Fecha Vencimiento" FieldName="Fecha_Vencimiento" VisibleIndex="5">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataComboBoxColumn FieldName="OF" VisibleIndex="2" Caption="OF" Width="200px">
                    <PropertiesComboBox DataSourceID="LqDsOF" ValueField="OF" Width="200px">
                        <Columns>
                            <dx:ListBoxColumn FieldName="OF" Caption="OF">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn FieldName="Producto" Caption="Producto">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Id_Personal" VisibleIndex="6" Caption="Monitor" Width="150px">
                    <PropertiesComboBox DataSourceID="Usuario" ValueField="IdUsuario" Width="150px" TextField="NombreUsuario">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Linea" VisibleIndex="7">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="1" Value="1" />
                            <dx:ListEditItem Text="2" Value="2" />
                            <dx:ListEditItem Text="3" Value="3" />
                            <dx:ListEditItem Text="4" Value="4" />
                            <dx:ListEditItem Text="5" Value="5" />
                            <dx:ListEditItem Text="6" Value="6" />
                            <dx:ListEditItem Text="7" Value="7" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="Inicio Colacion" FieldName="Colacion_inicio" VisibleIndex="8">
                    <PropertiesTextEdit DisplayFormatString="t">
                        <MaskSettings Mask="H:mm" />
                    </PropertiesTextEdit>
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Termino Colacion" FieldName="Colacion_Termino" VisibleIndex="9">
                    <PropertiesTextEdit DisplayFormatString="t">
                        <MaskSettings Mask="H:mm" />
                    </PropertiesTextEdit>
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Detalles" VisibleIndex="11">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/menu.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataHyperLinkColumn FieldName="PDF" VisibleIndex="12">
                    <Settings AllowAutoFilter="False" />
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detallePdf" CommandName="cmdDetallePdf" runat="server" ImageUrl="~/Images/documentpdf.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Verificado" VisibleIndex="13">
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
                <dx:GridViewDataTextColumn FieldName="Estado" Visible="False" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
            </Columns>
               <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default"/>

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsVerificacion" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" OrderBy="Id_VerificacionBolsas desc" TableName="CVT_RegistroVerificacionBolsas">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqDsOF" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName=""
            TableName="CVT_LISTADO_OF" OrderBy="OF">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsPersonal" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Personal" Where="monitor == @monitor">
            <WhereParameters>
                <asp:Parameter DefaultValue="true" Name="monitor" Type="Boolean" />
            </WhereParameters>
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="Usuario" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_Usuarios">
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
</asp:Content>
