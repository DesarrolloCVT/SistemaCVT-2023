<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="RendicionCostoDetalle.aspx.cs" Inherits="CVT_MermasRecepcion.Tesoreria.RendicionCostoDetalle" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Tesoreria</a></li>
            <li><span id="current">Detalle Rendicion de Costos</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Detalle Rendicion N°: 
        <dx:ASPxLabel ID="lbl_Rendi" runat="server" Text="" Font-Bold="true" Font-Size="Medium">
        </dx:ASPxLabel>
        </span>
        <span class="tab-end"></span>
        <div id="options">
            <a style="margin-left: 150px">
                <asp:ImageButton ID="cmdVolver" runat="server"
                    ImageUrl="~/Images/back.png" OnClick="cmdVolver_Click" Style="width: 16px" CausesValidation="False" />
                volver</a>&nbsp;         
        </div>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDetRendi" KeyFieldName="ID_Det_Rendi" OnRowInserting="GvDatos_RowInserting" OnRowCommand="GvDatos_RowCommand">
            <SettingsPager PageSize="25">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains"/>
            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
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

            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="ID_Det_Rendi" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Id_Rendi" Visible="False" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaRend" VisibleIndex="3" Caption="Fecha Doc.">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Comprobante" VisibleIndex="4" Caption="Comprobante N°">
                    <PropertiesTextEdit>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="OrdenCompra" VisibleIndex="7" Caption="N° Orden Compra">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Monto" VisibleIndex="8">
                    <PropertiesTextEdit>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataMemoColumn FieldName="ConceptoIngreso" VisibleIndex="6">
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataMemoColumn FieldName="Observacion" VisibleIndex="9">
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataComboBoxColumn FieldName="TipoDoc" VisibleIndex="5">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Boleta" Value="Boleta" />
                            <dx:ListEditItem Text="Factura" Value="Factura" />
                            <dx:ListEditItem Text="Vale x" Value="Vale x" />
                        </Items>
                        <ValidationSettings>
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Subir Adjunto" VisibleIndex="50">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="adjunto" CommandName="cmdAdjunto" runat="server" ImageUrl="~/Images/fileup.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Ver Adjunto" VisibleIndex="52">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="VerAdjunto" CommandName="cmdVerAdjunto" runat="server" ImageUrl="~/Images/verAD.png" />
                    </DataItemTemplate>
                    <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                    </CellStyle>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataTextColumn Caption="Nombre Adjunto" FieldName="NombreDoc" VisibleIndex="51">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDetRendi" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_RendicionCostos_Detalle" Where="Id_Rendi == @Id_Rendi" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="Id_Rendi" SessionField="idRendi" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <br />
    </div>

    <div>
        <dx:ASPxPopupControl ID="popAdjunto" runat="server" AllowDragging="True" CloseAction="None" Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="TopSides" Width="500px" HeaderText="Archivo Adjunto" Theme="Office2010Blue">
            <ContentCollection>
                <dx:PopupControlContentControl>
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
                    <br />
                    <div style="margin-left:130px">
                        <dx:ASPxButton ID="btnCerrar" runat="server" Text="Cerrar" Height="56px" Theme="iOS" Width="203px" OnClick="btnCerrar_Click"></dx:ASPxButton>
                    </div>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
</asp:Content>
