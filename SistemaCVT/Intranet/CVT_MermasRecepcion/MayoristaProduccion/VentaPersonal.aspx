<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="VentaPersonal.aspx.cs" Inherits="CVT_MermasRecepcion.MayoristaProduccion.VentaPersonal" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 10px;
        }

        .auto-style6 {
            width: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li>&nbsp;<a href="../Blank.aspx">Inicio</a></li>
            <li><a>Produccion</a></li>
            <li><span id="current">B+ VENTA PERSONAL</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">B+ VENTA PERSONAL</span>
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
    <div style="margin-left: 25px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Personal" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboCliente" runat="server" Height="30px" Theme="iOS" Width="488px" DataSourceID="LqsDatosPersonalVent" ValueField="Run">
                        <Columns>
                            <dx:ListBoxColumn Caption="Rut" FieldName="Run" Width="150px">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Nombre" FieldName="NomCliente" Width="400px">
                            </dx:ListBoxColumn>
                        </Columns>
                    </dx:ASPxComboBox>

                    <asp:LinqDataSource ID="LqsDatosPersonalVent" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTMMETRODataContext" EntityTypeName="" TableName="VW_LIST_CLIENTE_INTERNO">
                    </asp:LinqDataSource>

                </td>
                <td></td>
                <td>
                    <dx:ASPxButton ID="btnSelecionar" runat="server" Text="Seleccionar" Height="59px" Theme="iOS" Width="136px" OnClick="btnSelecionar_Click"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 25px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Cod Cliente: " Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtCodCliente" runat="server" Width="170px" Height="30px" Theme="iOS" ReadOnly="true">
                        <ValidationSettings Display="Dynamic" ValidationGroup="a1">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Nombre Cliente: " Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtNombreCliente" runat="server" Width="300px" Height="30px" Theme="iOS" ReadOnly="true">
                        <ValidationSettings Display="Dynamic" ValidationGroup="a1">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Rut: " Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtRunCli" runat="server" Width="170px" Height="30px" Theme="iOS" ReadOnly="true">
                        <ValidationSettings Display="Dynamic" ValidationGroup="a1">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Telefono: " Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtTelefono" runat="server" Width="170px" Height="30px" Theme="iOS" ReadOnly="true">
                        <ValidationSettings Display="Dynamic" ValidationGroup="a1">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div style="margin-left: 25px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Credito Asignado: " Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtCreditoAsignado" runat="server" Width="170px" Height="30px" Theme="iOS" ReadOnly="true">
                        <ValidationSettings Display="Dynamic" ValidationGroup="a1">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Credito Disponible:" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtCreditoDisponible" runat="server" Width="182px" Height="30px" Theme="iOS" ReadOnly="true">
                        <ValidationSettings Display="Dynamic" ValidationGroup="a1">
                            <RequiredField IsRequired="True" />
                        </ValidationSettings>
                    </dx:ASPxTextBox>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <br />
    <div style="margin-left: 140px">
        <dx:ASPxButton ID="btnPickear" runat="server" Text="PICKEAR" Theme="iOS" Height="59px" Width="249px" BackColor="#FF9900" ValidationGroup="a1" OnClick="btnPickear_Click">
            <Image IconID="iconbuilder_shopping_package_svg_white_32x32">
            </Image>
        </dx:ASPxButton>
    </div>
    <br />
    <br />
    <br />
    <div style="margin-left: 50px" id="divPickear" runat="server">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Codigo Producto" Theme="iOS" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtDun" runat="server" Width="260px" AutoPostBack="True" ViewStateMode="Disabled" CssClass="auto-style5" Theme="iOS" OnTextChanged="txtDun_TextChanged"></dx:ASPxTextBox>
                </td>
            </tr>
        </table>
        <br />
        <table>
            <tr>
                <td>
                    <dx:ASPxComboBox ID="cboProductosinDun" runat="server" Caption="Busca Producto" DataSourceID="LqsProductosSinDun" EnableTheming="True" Theme="iOS" Width="703px" ValueField="Codigo" Font-Bold="True">
                        <Columns>
                            <dx:ListBoxColumn FieldName="ItemCode" Width="150px" Caption="CodProducto">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn FieldName="ItemName" Width="650px" Caption="Producto">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn FieldName="Price" Width="120px" Caption="Precio">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Medida" FieldName="UomCode">
                            </dx:ListBoxColumn>
                        </Columns>
                        <ClearButton DisplayMode="Always">
                        </ClearButton>
                    </dx:ASPxComboBox>
                </td>
                <td>
                    <dx:ASPxButton ID="btnAgregaProdSinDun" runat="server" Height="34px" OnClick="btnAgregaProdSinDun_Click" Theme="iOS">
                        <Image IconID="iconbuilder_actions_addcircled_svg_white_16x16">
                        </Image>
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>
        <br />

        <div>
            <dx:ASPxGridView ID="GvDatos" runat="server" ViewStateMode="Disabled" AutoGenerateColumns="False" EnableTheming="True" OnRowUpdating="GvDatos_RowUpdating" Theme="iOS" Width="1467px" OnRowDeleted="GvDatos_RowDeleted" DataSourceID="LinqDataSource1" KeyFieldName="Id_Venta;Cod_Producto;UniMedida">
                <SettingsPager AlwaysShowPager="True" Mode="ShowAllRecords" PageSize="90000">
                </SettingsPager>
                <SettingsEditing Mode="Batch">
                    <BatchEditSettings KeepChangesOnCallbacks="True" StartEditAction="Click" />
                </SettingsEditing>
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
                    <dx:GridViewDataTextColumn FieldName="Id_Venta" ReadOnly="True" Visible="False" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="CodProducto" FieldName="Cod_Producto" ReadOnly="True" VisibleIndex="2">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Medida" FieldName="UniMedida" ReadOnly="True" VisibleIndex="4">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Producto" VisibleIndex="3">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Precio" VisibleIndex="6">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Total" VisibleIndex="8">
                        <PropertiesTextEdit DisplayFormatString="N0">
                        </PropertiesTextEdit>
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CodBarra" Visible="False" VisibleIndex="9">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CodUniMed" Visible="False" VisibleIndex="10">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Descuento" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                </Columns>
                <TotalSummary>
                    <dx:ASPxSummaryItem DisplayFormat="SubTotal : {0}" FieldName="Total" ShowInColumn="Total" SummaryType="Sum" ValueDisplayFormat="N0" />
                </TotalSummary>
                <Styles>
                    <Header BackColor="#FF9900" Font-Bold="True">
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
        </div>

        <asp:LinqDataSource ID="LqsProductosSinDun" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTMMETRODataContext" EntityTypeName="" TableName="SMM_VW_DATO_BUSCAPROD_VENTAPERSONAL_FULL">
        </asp:LinqDataSource>


            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="SMM_VentaPersonal_Detalle" Where="Id_Venta == @Id_Venta" OrderBy="ByOrder desc">
                <WhereParameters>
                    <asp:SessionParameter DefaultValue="0" Name="Id_Venta" SessionField="IdVentaP" Type="Int32" />
                </WhereParameters>
            </asp:LinqDataSource>


        <div style="margin-left: 150px">
            <table>
                <tr>
                    <td>
                        <dx:ASPxButton ID="btnCrear" runat="server" Text="Guardar" Height="50px" Theme="iOS" Width="150px" OnClick="btnCrear_Click">
                            <Image IconID="iconbuilder_shopping_shoppingcart_svg_white_32x32">
                            </Image>
                        </dx:ASPxButton>
                        <%--  <iframe id="FrameToPrint" name="PrintingFrame" style="position: absolute; left: -10000px; top: -10000px;"></iframe>--%>
                        <%--  <input id="Button1" type="button" value="Print Report with iFrame" onclick="printReport()" />--%>
                    </td>
                    <td class="auto-style7"></td>
                    <td>
                        <dx:ASPxButton ID="btnAnular" runat="server" Text="ANULAR" Height="50px" Theme="iOS" Width="172px" BackColor="Red" OnClick="btnAnular_Click">
                            <Image IconID="iconbuilder_actions_deletecircled_svg_white_32x32">
                            </Image>
                        </dx:ASPxButton>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div>
        <dx:ASPxPopupControl ID="popAnulaPreventa" runat="server"
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
