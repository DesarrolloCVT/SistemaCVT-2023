<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="SMMNotaCredito.aspx.cs" Inherits="CVT_MermasRecepcion.MayoristaProduccion.SMMNotaCredito" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 146px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li>&nbsp;<a href="../Blank.aspx">Inicio</a></li>
            <li><a>Produccion</a></li>
            <li><span id="current">B+ NOTA CREDITO</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">B+ NOTA CREDITO</span>
        <span class="tab-end"></span>
        <%--   <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px" />
                Exportar Excel</a>
        </div>--%>
    </div>
    <br />
    <div style="margin-left: 150px">
        <dx:ASPxRadioButtonList ID="rbTipoDoc" runat="server" EnableTheming="True" ItemSpacing="5px" RepeatDirection="Horizontal" Theme="iOS" Width="313px" Border-BorderStyle="None" AutoPostBack="True" EnableViewState="False">
            <Items>
                <dx:ListEditItem Text="BOLETA" Value="B" />
                <dx:ListEditItem Text="FACTURA" Value="F" />
            </Items>
            <ValidationSettings ValidationGroup="a1" Display="Dynamic" ErrorText="Seleccione" SetFocusOnError="True">
                <ErrorImage IconID="iconbuilder_security_warningcircled1_svg_32x32">
                </ErrorImage>
                <RequiredField IsRequired="True" ErrorText="Seleccione" />
            </ValidationSettings>

            <Border BorderStyle="None"></Border>
        </dx:ASPxRadioButtonList>
    </div>
    <div style="margin-left: 150px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Folio" Theme="iOS"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtfolio" runat="server" Width="170px" Theme="iOS">
                        <ValidationSettings Display="Dynamic" ValidationGroup="a1">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td></td>
                <td style="padding-top: 15px">
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" Height="47px" Theme="iOS" Width="154px" OnClick="btnBuscar_Click" ValidationGroup="a1">
                        <Image IconID="iconbuilder_actions_zoom_svg_white_32x32">
                        </Image>
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatosCliente" runat="server" DataSourceID="LqsDatosCliente" AutoGenerateColumns="False" KeyFieldName="ID_NotaCredito" Theme="iOS">
            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <Settings ShowTitlePanel="True" />
            <SettingsText Title="Datos Cliente" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="ID_NotaCredito" ReadOnly="True" Visible="False" VisibleIndex="0">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FolioDocumento" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TipoDocumento" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodCliente" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NombreCliente" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Direccion_Despacho" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Direccion_Facturacion" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaDocumento" VisibleIndex="7">
                </dx:GridViewDataDateColumn>
            </Columns>
                <Styles>
                <Header BackColor="#FF9900" Font-Bold="True" ForeColor="Black">
                </Header>                
            </Styles>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDatosCliente" runat="server" EntityTypeName="" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" TableName="SMM_NotaCredito_DatoCliente" Where="ID_NotaCredito == @ID_NotaCredito">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="ID_NotaCredito" SessionField="IdNota" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatosCompra" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDatosCompra" KeyFieldName="ID_NotaCredito;CodProducto" Theme="iOS" OnRowDeleting="GvDatosCompra_RowDeleting" OnRowUpdating="GvDatosCompra_RowUpdating">
            <SettingsEditing Mode="Batch">
                <BatchEditSettings KeepChangesOnCallbacks="True" StartEditAction="Click" />
            </SettingsEditing>
              <Settings ShowTitlePanel="True" />
            <SettingsText Title="Datos Compra" />
            <Settings ShowFooter="True" />
            <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" />
            <SettingsCommandButton>
                <DeleteButton Text=" ">
                    <Image IconID="iconbuilder_actions_deletecircled_svg_32x32">
                    </Image>
                </DeleteButton>
            </SettingsCommandButton>
            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="ID_NotaCredito" ReadOnly="True" Visible="False" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodProducto" ReadOnly="True" VisibleIndex="2">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Producto" VisibleIndex="3">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="4">
                    <PropertiesTextEdit DisplayFormatString="N2">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Precio" VisibleIndex="5">
                    <PropertiesTextEdit DisplayFormatString="N2">
                    </PropertiesTextEdit>
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Total" VisibleIndex="7">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Descuento" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
            </Columns>
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="SubTotal : {0}" FieldName="Total" ShowInColumn="Total" SummaryType="Sum" ValueDisplayFormat="N0" />
            </TotalSummary>
            <Styles>          
                <Header BackColor="#FF9900" Font-Bold="True" ForeColor="Black">
                </Header>             
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
                <Footer Font-Bold="True">
                </Footer>
                <BatchEditCell Font-Bold="True">
                </BatchEditCell>
                <BatchEditModifiedCell Font-Bold="True">
                </BatchEditModifiedCell>
            </Styles>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqsDatosCompra" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName="" TableName="SMM_NotaCredito_DatoCompra" Where="ID_NotaCredito == @ID_NotaCredito" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
            <WhereParameters>
                <asp:SessionParameter DefaultValue="0" Name="ID_NotaCredito" SessionField="IdNota" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
    <br />
    <br />
    <div style="margin-left:150px">
        <table>
            <tr>
                <td>
                    &nbsp;</td>
                <td class="auto-style5"></td>
                <td style="padding-top:15px">
                    <dx:ASPxButton ID="btnConfirma" runat="server" Text="Confirma" Theme="iOS" Height="45px" Width="166px" OnClick="btnConfirma_Click">
                        <Image IconID="diagramicons_check_svg_white_32x32">
                        </Image>
                    </dx:ASPxButton>
                </td>
                <td></td>
                 <td  style="padding-top:15px">
                    <dx:ASPxButton ID="btnAnula" runat="server" Text="Anula" Theme="iOS" Height="45px" Width="159px" BackColor="#ff3300" OnClick="btnAnula_Click">
                        <Image IconID="iconbuilder_actions_deletecircled_svg_white_32x32">
                        </Image>
                     </dx:ASPxButton>
                </td>
                
            </tr>
        </table>
    </div>
       <div>
        <dx:ASPxPopupControl ID="popAnulaNota" runat="server"
            HeaderText="¿Está seguro que desea anular?" AllowDragging="True" Theme="iOS" Width="500px" Modal="True" CloseAction="CloseButton" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle">
            <HeaderImage IconID="businessobjects_bo_attention_svg_32x32">
            </HeaderImage>
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <div style="margin-left: 25px">
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxButton ID="btnNoAnula" runat="server" Text="Cancelar" Theme="iOS" Height="50px" Width="180px" BackColor="#cccccc" OnClick="btnNoAnula_Click">
                                        <Image IconID="outlookinspired_cancel_svg_32x32">
                                        </Image>
                                    </dx:ASPxButton>
                                </td>
                                <td class="auto-style9"></td>
                                <td>
                                    <dx:ASPxButton ID="btnSiAnula" runat="server" Text="Aceptar" Height="50px" Theme="iOS" Width="180px" BackColor="#0075ea" OnClick="btnSiAnula_Click">
                                        <Image IconID="iconbuilder_actions_check_svg_32x32">
                                        </Image>
                                    </dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                    </div>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>


</asp:Content>
