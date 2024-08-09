<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ControlPesoProdPalletizado.aspx.cs" Inherits="CVT_MermasRecepcion.Produccion.ControlPesoProdPalletizado" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%-- <script type="text/javascript">
        function printReport() {
            window.open("PrintReporteControl.aspx", "PrintingFrame")
            var frameElement = document.getElementById("FrameToPrint");
            frameElement.addEventListener("load", function (e) {
                if (frameElement.contentDocument.contentType !== "text/html")
                    frameElement.contentWindow.print();
            });
        }
     </script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Produccion</a></li>
            <li><span id="current">CONTROL PESO PRODUCTO PALLETIZADO</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">CONTROL PESO PRODUCTO PALLETIZADO</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="lqsControl" KeyFieldName="Id_ContrPesoPallet" OnRowInserting="GvDatos_RowInserting" OnRowCommand="GvDatos_RowCommand" OnRowDeleting="GvDatos_RowDeleting" OnRowUpdating="GvDatos_RowUpdating" OnHtmlRowCreated="GvDatos_HtmlRowCreated">
            <SettingsPager PageSize="100">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" />
            <SettingsBehavior ConfirmDelete="True" />
            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <Toolbars>
                <dx:GridViewToolbar Position="Top">
                    <Items>
                        <dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif">
                            <Image Url="../Images/pn-add-source-copy.gif"></Image>
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
            <SettingsText ConfirmDelete="Solo usuarios verificadores pueden eliminar registros " />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0" ShowClearFilterButton="True">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Id_ContrPesoPallet" ReadOnly="True" Visible="False" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Lote" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Fecha" VisibleIndex="5">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="FechaRegistro" Visible="False" VisibleIndex="7">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Id_Usuario" Visible="False" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="CodProducto" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="LqsProducto" ValueField="ArticleProvider_CodClient">
                        <Columns>
                            <dx:ListBoxColumn Caption="CodProducto" FieldName="ArticleProvider_CodClient" Width="250px">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Descripcion" FieldName="ArticleProvider_Description" Width="400px">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Etiquetador" FieldName="Id_Etiquetadora" VisibleIndex="6">
                    <PropertiesComboBox DataSourceID="LqDsStaff" TextField="NombreUsuario" ValueField="IdUsuario">
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Turno" VisibleIndex="4">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="1" Value="1" />
                            <dx:ListEditItem Text="2" Value="2" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Detalle" VisibleIndex="50">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detalle" CommandName="cmdDetalle" runat="server" ImageUrl="~/Images/boxadd.png" />
                    </DataItemTemplate>
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Pdf" VisibleIndex="52">
                    <EditFormSettings Visible="False" />
                    <DataItemTemplate>
                        <asp:ImageButton ID="detallePdf" CommandName="cmdpdf" runat="server" ImageUrl="~/Images/pdf.png" />
                    </DataItemTemplate>                    
                     
                </dx:GridViewDataHyperLinkColumn>
                <dx:GridViewDataHyperLinkColumn Caption="Verificado" VisibleIndex="51">
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
                <dx:GridViewDataComboBoxColumn FieldName="Estado" VisibleIndex="49">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="Creado" Value="Creado" />
                            <dx:ListEditItem Text="Verificado" Value="Verificado" />
                        </Items>
                    </PropertiesComboBox>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataComboBoxColumn>
            </Columns>
        </dx:ASPxGridView>
     <%--   <iframe id="FrameToPrint" name="PrintingFrame" style="position: absolute; left: -10000px; top: -10000px;"></iframe>--%>
        <asp:LinqDataSource ID="lqsControl" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" OrderBy="Id_ContrPesoPallet desc" TableName="CVT_ControlPeso_ProductoPalletizado">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="LqsProducto" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" Select="new (ArticleProvider_CodClient, ArticleProvider_Description)" TableName="ArticleProvider">
        </asp:LinqDataSource>

        <asp:LinqDataSource runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" TableName="CVT_Usuarios" EntityTypeName="" ID="LqDsStaff" Select="new (IdUsuario, NombreUsuario)">
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
