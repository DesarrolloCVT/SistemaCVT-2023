﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="SMMVenta.aspx.cs" Inherits="CVT_MermasRecepcion.MayoristaProduccion.SMMVenta" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function printReport() {
            window.open("Report.aspx", "PrintingFrame")
            var frameElement = document.getElementById("FrameToPrint");
            frameElement.addEventListener("load", function (e) {
                if (frameElement.contentDocument.contentType !== "text/html")
                    frameElement.contentWindow.print();
            });
        }
    </script>
    <style type="text/css">
        .auto-style5 {
            margin-bottom: 0px;
        }

        .auto-style6 {
            height: 57px;
        }

        .auto-style7 {
            width: 66px;
        }

        .auto-style8 {
            height: 38px;
        }

        .auto-style9 {
            width: 32px;
        }

        .auto-style10 {
            width: 16px;
        }

        .auto-style11 {
            width: 40px;
        }

        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li>&nbsp;<a href="../Blank.aspx">Inicio</a></li>
            <li><a>Produccion</a></li>
            <li><span id="current">B+ PREVENTA</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">B+ PREVENTA</span>
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
    <div style="margin-left:500px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel25" runat="server" Text="N° Preventa"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtNPreventaImp" runat="server" Width="170px" Theme="iOS"></dx:ASPxTextBox>
                </td>
                <td></td>
                <td style="padding-top: 15px">
                    <dx:ASPxButton ID="btnReimprimir" runat="server" Text="Reimprimir Preventa" Height="38px" Theme="iOS" OnClick="btnReimprimir_Click" Width="220px">
                        <Image IconID="print_print_svg_16x16">
                        </Image>
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <div style="margin-left: 150px">
        <dx:ASPxRadioButtonList ID="rbTipoVenta" runat="server" EnableTheming="True" ItemSpacing="5px" RepeatDirection="Horizontal" Theme="iOS" Width="313px" Border-BorderStyle="None" OnSelectedIndexChanged="rbTipoVenta_SelectedIndexChanged" AutoPostBack="True" EnableViewState="False">
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
    <div style="margin-left: 100px">
        <dx:ASPxRoundPanel ID="roundCliente" runat="server" ShowCollapseButton="true" Width="200px" HeaderText="CLIENTE" LoadContentViaCallback="True" Theme="iOS" AllowCollapsingByHeaderClick="True">
            <HeaderImage IconID="businessobjects_bo_employee_svg_16x16">
            </HeaderImage>
            <PanelCollection>
                <dx:PanelContent>
                    <div>
                        <dx:ASPxButtonEdit ID="txtBusCliente" runat="server" OnButtonClick="ASPxButtonEdit1_ButtonClick" Theme="iOS" Width="530px" Border-BorderColor="#0099ff" AutoPostBack="True" OnTextChanged="txtBusCliente_TextChanged" NullText="Buscar Cliente">
                            <Buttons>
                                <dx:EditButton ToolTip="Editar" Width="25px">
                                    <Image IconID="iconbuilder_actions_edit_svg_16x16">
                                    </Image>
                                </dx:EditButton>
                                <dx:EditButton ToolTip="Agregar" Width="25px">
                                    <Image IconID="iconbuilder_actions_add_svg_16x16">
                                    </Image>
                                </dx:EditButton>
                            </Buttons>
                            <ButtonStyle>
                                <BorderBottom BorderStyle="Double" />
                            </ButtonStyle>
                            <Border BorderColor="#0099FF"></Border>
                        </dx:ASPxButtonEdit>
                    </div>
                    <br />
                    <div runat="server" id="divDatos_Client">
                        <table>
                            <tr>
                                <td class="auto-style6">
                                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Código Cliente" Theme="iOS" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtCodigoCliente" runat="server" Width="400px" Theme="iOS" Text="C66666666-6" ReadOnly="true"></dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style6">
                                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Nombre Cliente" Theme="iOS" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtNombreCliente" runat="server" Width="400px" Theme="iOS" NullText="Nombre Cliente">
                                        <Border BorderColor="#0099FF"></Border>
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style6">
                                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Identificador" Theme="iOS" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtIdentificador" runat="server" Width="400px" Theme="iOS" Text="66666666-6" ReadOnly="true"></dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Dirección envío" Theme="iOS" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboDireccionEnvio" runat="server" ValueType="System.String" Theme="iOS" Width="525px" DataSourceID="direccionDespacho" ValueField="CodDireccion">
                                        <Columns>
                                            <dx:ListBoxColumn Caption="Direccion" FieldName="Street">
                                            </dx:ListBoxColumn>
                                            <dx:ListBoxColumn Caption="Comuna" FieldName="County">
                                            </dx:ListBoxColumn>
                                            <dx:ListBoxColumn Caption="Region" FieldName="City">
                                            </dx:ListBoxColumn>
                                        </Columns>
                                    </dx:ASPxComboBox>
                                    <asp:LinqDataSource ID="direccionDespacho" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName="" TableName="VW_DIRECCIONES_CLIENTES_SAP" Where="AdresType == @AdresType &amp;&amp; CardCode == @CardCode">
                                        <WhereParameters>
                                            <asp:Parameter DefaultValue="S" Name="AdresType" Type="Char" />
                                            <asp:ControlParameter ControlID="txtCodigoCliente" DefaultValue="C66666666-6" Name="CardCode" PropertyName="Text" Type="String" />
                                        </WhereParameters>
                                    </asp:LinqDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Dirección facturación" Theme="iOS" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboDireccionFacturacion" runat="server" ValueType="System.String" Theme="iOS" Width="525px" DataSourceID="direccionFacturacion" ValueField="CodDireccion">
                                        <Columns>
                                            <dx:ListBoxColumn Caption="Direccion" FieldName="Street">
                                            </dx:ListBoxColumn>
                                            <dx:ListBoxColumn Caption="Comuna" FieldName="County">
                                            </dx:ListBoxColumn>
                                            <dx:ListBoxColumn Caption="Region" FieldName="City">
                                            </dx:ListBoxColumn>
                                        </Columns>
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style6">
                                    <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Télefono" Theme="iOS" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtTelefono" runat="server" Width="400px" Theme="iOS" Text="984321168" ReadOnly="true"></dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style6">
                                    <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Email" Theme="iOS" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtEmail" runat="server" Width="400px" Theme="iOS" ReadOnly="true" NullText="Email"></dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Grupo Cliente" Theme="iOS" Font-Bold="true"></dx:ASPxLabel>
                                    <dx:ASPxComboBox ID="cboGrupoCliente" runat="server" ValueType="System.String" Theme="iOS" Width="400px" ReadOnly="true" DataSourceID="LqsGrupoCliente" TextField="GroupName" ValueField="GroupCode"></dx:ASPxComboBox>
                                    <asp:LinqDataSource ID="LqsGrupoCliente" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTMMETRODataContext" EntityTypeName="" Select="new (GroupCode, GroupName)" TableName="MMETRO_OCRG" Where="GroupCode == @GroupCode">
                                        <WhereParameters>
                                            <asp:SessionParameter DefaultValue="112" Name="GroupCode" SessionField="GrupoCli" Type="Int16" />
                                        </WhereParameters>
                                    </asp:LinqDataSource>
                                </td>
                            </tr>

                        </table>
                    </div>
                    <br />
                    <div style="margin-left: 140px">
                        <dx:ASPxButton ID="btnPickear" runat="server" Text="PICKEAR" Theme="iOS" Height="59px" Width="249px" BackColor="#FF9900" OnClick="btnPickear_Click" ValidationGroup="a1">
                            <Image IconID="iconbuilder_shopping_package_svg_white_32x32">
                            </Image>
                        </dx:ASPxButton>
                        <asp:LinqDataSource ID="direccionFacturacion" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName="" TableName="VW_DIRECCIONES_CLIENTES_SAP" Where="AdresType == @AdresType &amp;&amp; CardCode == @CardCode">
                            <WhereParameters>
                                <asp:Parameter DefaultValue="B" Name="AdresType" Type="Char" />
                                <asp:ControlParameter ControlID="txtCodigoCliente" DefaultValue="C66666666-6" Name="CardCode" PropertyName="Text" Type="String" />
                            </WhereParameters>
                        </asp:LinqDataSource>
                    </div>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxRoundPanel>


    </div>
    <div>
        <table>
        </table>
    </div>
    <br />
    <br />
    <div style="margin-left: 50px" id="divPickear" runat="server">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Codigo Producto" Theme="iOS" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtDun" runat="server" Width="200px" AutoPostBack="True" OnTextChanged="txtDun_TextChanged" ViewStateMode="Disabled" CssClass="auto-style5" Theme="iOS"></dx:ASPxTextBox>
                </td>
                <td class="auto-style11">

                </td>
                <td>
                    <dx:ASPxLabel ID="lblCantidadProd" runat="server" Text="" Theme="iOS" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
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
            <dx:ASPxGridView ID="GvDatos" runat="server" ViewStateMode="Disabled" AutoGenerateColumns="False" DataSourceID="LinqDataSource1" EnableTheming="True" KeyFieldName="Preventa_ID;CodProducto;UniMedida" OnRowUpdating="GvDatos_RowUpdating" Theme="iOS" Width="1467px" OnRowDeleted="GvDatos_RowDeleted" OnRowCommand="GvDatos_RowCommand">
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
                    <dx:GridViewDataTextColumn FieldName="Preventa_ID" VisibleIndex="1" Visible="False">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CodProducto" VisibleIndex="2">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Producto" VisibleIndex="3">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="5" LoadReadOnlyValueFromDataModel="False">
                        <EditFormSettings Visible="True" />
                        <EditCellStyle BackColor="White">
                        </EditCellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Precio" VisibleIndex="6">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Descuento" VisibleIndex="7">
                        <PropertiesTextEdit>
                            <ValidationSettings>
                                <RegularExpression ErrorText="solo numeros" ValidationExpression="\d+" />
                            </ValidationSettings>
                        </PropertiesTextEdit>
                        <EditFormSettings Visible="True" />
                        <EditCellStyle BackColor="White">
                        </EditCellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Total" VisibleIndex="8">
                        <PropertiesTextEdit DisplayFormatString="N0">
                        </PropertiesTextEdit>
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Medida" FieldName="UniMedida" VisibleIndex="4">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataHyperLinkColumn Caption="DescEspecial" VisibleIndex="13">
                        <PropertiesHyperLinkEdit>
                            <Style HorizontalAlign="Center" VerticalAlign="Middle">
                             </Style>
                        </PropertiesHyperLinkEdit>
                        <EditFormSettings Visible="False" />
                        <DataItemTemplate>
                            <asp:ImageButton ID="DescEspecial" CommandName="cmdDescEspecial" runat="server" ImageUrl="~/Images/descuento.png" />
                        </DataItemTemplate>
                        <CellStyle HorizontalAlign="Center" VerticalAlign="Middle">
                        </CellStyle>
                    </dx:GridViewDataHyperLinkColumn>
                    <dx:GridViewDataTextColumn Caption="Desc" FieldName="Descuento" VisibleIndex="10">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                </Columns>
                <TotalSummary>
                    <dx:ASPxSummaryItem DisplayFormat="SubTotal : {0}" FieldName="Total" ShowInColumn="Total" SummaryType="Sum" ValueDisplayFormat="N0" />
                    <dx:ASPxSummaryItem DisplayFormat="Cantidad : {0}" FieldName="CodBarra" ShowInColumn="Cod Producto" SummaryType="Count" ValueDisplayFormat="N0" />
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
            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName="" TableName="SMM_Preventa_Detalle" Where="Preventa_ID == @Preventa_ID" OrderBy="ByOrder desc">
                <WhereParameters>
                    <asp:SessionParameter DefaultValue="0" Name="Preventa_ID" SessionField="IdPreventa" Type="Int32" />
                </WhereParameters>
            </asp:LinqDataSource>
            <asp:LinqDataSource ID="LqsProductosSinDun" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTMMETRODataContext" EntityTypeName="" TableName="SMM_VW_DATO_BUSCAPROD_FULL">
            </asp:LinqDataSource>
        </div>
        <div style="margin-left: 150px">
            <table>
                <tr>
                    <td>
                        <dx:ASPxButton ID="btnCrear" runat="server" Text="CREAR" Height="50px" Theme="iOS" Width="150px" OnClick="btnCrear_Click">
                            <Image IconID="iconbuilder_shopping_shoppingcart_svg_white_32x32">
                            </Image>
                        </dx:ASPxButton>
                        <iframe id="FrameToPrint" name="PrintingFrame" style="position: absolute; left: -10000px; top: -10000px;"></iframe>
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
    <br />
    <br />
    <div>
        <dx:ASPxPopupControl ID="PopNuevo" runat="server"
            HeaderText="Crear Cliente" AllowDragging="True" Theme="iOS" Width="500px" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle">
            <HeaderImage IconID="businessobjects_bo_employee_svg_32x32">
            </HeaderImage>
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <dx:ASPxPageControl ID="citiesTabPage" Width="100%" runat="server" CssClass="dxtcFixed" ActiveTabIndex="1" EnableHierarchyRecreation="True" Theme="iOS">
                        <TabPages>
                            <dx:TabPage Text="Principal">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                        <br />
                                        <div>
                                            <table>

                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="lblr" runat="server" Text="*Rut: " Font-Bold="true" Theme="iOS"></dx:ASPxLabel>
                                                    </td>
                                                    <td></td>
                                                    <td>
                                                        <dx:ASPxTextBox runat="server" Width="200px" MaxLength="10" Height="30px" ID="txtRutCliNew" Theme="iOS" AutoPostBack="True" OnTextChanged="txtRutCliNew_TextChanged">
                                                            <MaskSettings Mask="00000000-a"></MaskSettings>

                                                            <ValidationSettings Display="Dynamic">
                                                                <RegularExpression ErrorText="ingrese rut" ValidationExpression="^[0-9]+-[0-9kK]{1}$"></RegularExpression>

                                                                <RequiredField IsRequired="True"></RequiredField>
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="*Nombre: " Font-Bold="true" Theme="iOS"></dx:ASPxLabel>
                                                    </td>
                                                    <td></td>
                                                    <td>
                                                        <dx:ASPxTextBox ID="txtNombreCliNew" runat="server" Width="400px" Theme="iOS">
                                                            <ValidationSettings Display="Dynamic">
                                                                <RequiredField IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="*Código: " Font-Bold="true" Theme="iOS"></dx:ASPxLabel>
                                                    </td>
                                                    <td></td>
                                                    <td>
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <dx:ASPxComboBox ID="cboSiglaCliente" runat="server" ValueType="System.String" EnableTheming="True" SelectedIndex="0" Theme="iOS" Width="66px">
                                                                        <Items>
                                                                            <dx:ListEditItem Selected="True" Text="C" Value="C" />
                                                                            <dx:ListEditItem Text="B" Value="B" />
                                                                        </Items>
                                                                    </dx:ASPxComboBox>
                                                                </td>
                                                                <td>
                                                                    <dx:ASPxTextBox ID="txtCodCliNew" runat="server" Width="200px" ReadOnly="true" Theme="iOS"></dx:ASPxTextBox>
                                                                </td>
                                                            </tr>
                                                        </table>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="*Razon Social: " Font-Bold="true" Theme="iOS"></dx:ASPxLabel>
                                                    </td>
                                                    <td></td>
                                                    <td>
                                                        <dx:ASPxTextBox ID="txtRazonCliNew" runat="server" Width="400px" Theme="iOS">
                                                        </dx:ASPxTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="*Grupo Cliente: " Font-Bold="true" Theme="iOS"></dx:ASPxLabel>
                                                    </td>
                                                    <td></td>
                                                    <td>
                                                        <dx:ASPxComboBox ID="cboGrupoClienteNew" runat="server" ValueType="System.String" DataSourceID="LqsGrupioCli" EnableTheming="True" TextField="GroupName" Theme="iOS" ValueField="GroupCode" Width="200px">
                                                            <ValidationSettings Display="Dynamic">
                                                                <RequiredField IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxComboBox>
                                                        <asp:LinqDataSource ID="LqsGrupioCli" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTMMETRODataContext" EntityTypeName="" Select="new (GroupCode, GroupName)" TableName="MMETRO_OCRG">
                                                        </asp:LinqDataSource>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel14" runat="server" Text="*Giro: " Font-Bold="true" Theme="iOS"></dx:ASPxLabel>
                                                    </td>
                                                    <td></td>
                                                    <td>
                                                        <dx:ASPxTextBox ID="txtGirocliNew" runat="server" Width="400px" Theme="iOS">
                                                        </dx:ASPxTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel15" runat="server" Text="*Telefono: " Font-Bold="true" Theme="iOS"></dx:ASPxLabel>
                                                    </td>
                                                    <td></td>
                                                    <td>
                                                        <dx:ASPxTextBox ID="txtTelefonoCliNew" runat="server" Width="200px" Theme="iOS" MaxLength="9">
                                                            <ValidationSettings Display="Dynamic">
                                                                <RegularExpression ValidationExpression="\d+" />
                                                                <RequiredField IsRequired="True" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel16" runat="server" Text="Email: " Font-Bold="true" Theme="iOS"></dx:ASPxLabel>
                                                    </td>
                                                    <td></td>
                                                    <td>
                                                        <dx:ASPxTextBox ID="txtEmailCliNew" runat="server" Width="399px" Theme="iOS">
                                                            <ValidationSettings Display="Dynamic">
                                                                <RegularExpression ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                                            </ValidationSettings>
                                                        </dx:ASPxTextBox>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <br />
                                        <br />
                                        <div style="margin-left: 100px">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxButton ID="btnContinuarCli" runat="server" Text="Continuar" Theme="iOS" Height="50px" BackColor="#ff9900" OnClick="btnContinuarCli_Click">

                                                            <Image IconID="scheduling_appointmentendcontinuearrow_svg_white_16x16">
                                                            </Image>

                                                        </dx:ASPxButton>
                                                    </td>
                                                    <td></td>
                                                    <td>
                                                        <dx:ASPxButton ID="btnCancelar" runat="server" Text="Cancelar" Theme="iOS" Height="50px" BackColor="#cccccc" CausesValidation="False" OnClick="btnCancelar_Click">
                                                            <Image IconID="outlookinspired_paymentunpaid_svg_white_32x32">
                                                            </Image>
                                                        </dx:ASPxButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Direccion">
                                <ContentCollection>
                                    <dx:ContentControl runat="server">
                                        <br />
                                        <div>
                                            <table>
                                                <tr>
                                                    <td class="auto-style8">
                                                        <dx:ASPxLabel ID="ASPxLabel22" runat="server" Text="Dirección: " Font-Bold="true" Theme="iOS"></dx:ASPxLabel>
                                                    </td>
                                                    <td class="auto-style8"></td>
                                                    <td class="auto-style8">
                                                        <dx:ASPxTextBox ID="txtDireccionCliNew" runat="server" Width="400px" Theme="iOS">
                                                        </dx:ASPxTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel18" runat="server" Text="Región: " Font-Bold="true" Theme="iOS"></dx:ASPxLabel>
                                                    </td>
                                                    <td></td>
                                                    <td>
                                                        <dx:ASPxComboBox ID="cboRegionNewCli" runat="server" ValueType="System.String" DataSourceID="LqsRegion" EnableTheming="True" TextField="Name" Theme="iOS" ValueField="Code" Width="400px"></dx:ASPxComboBox>
                                                        <asp:LinqDataSource ID="LqsRegion" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTMMETRODataContext" EntityTypeName="" TableName="MMETRO_OCST" Where="Country == @Country">
                                                            <WhereParameters>
                                                                <asp:Parameter DefaultValue="CL" Name="Country" Type="String" />
                                                            </WhereParameters>
                                                        </asp:LinqDataSource>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel19" runat="server" Text="Ciudad: " Font-Bold="true" Theme="iOS"></dx:ASPxLabel>
                                                    </td>
                                                    <td></td>
                                                    <td>
                                                        <dx:ASPxTextBox ID="txtCiudadCliNew" runat="server" Width="300px" Theme="iOS">
                                                        </dx:ASPxTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel20" runat="server" Text="Comuna: " Font-Bold="true" Theme="iOS"></dx:ASPxLabel>
                                                    </td>
                                                    <td></td>
                                                    <td>
                                                        <dx:ASPxTextBox ID="txtComunaCliNew" runat="server" Width="300px" Theme="iOS">
                                                        </dx:ASPxTextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxLabel ID="ASPxLabel21" runat="server" Text="Tipo: " Font-Bold="true" Theme="iOS"></dx:ASPxLabel>
                                                    </td>
                                                    <td></td>
                                                    <td>
                                                        <dx:ASPxComboBox ID="cboTipoDireccionNew" runat="server" ValueType="System.String" CssClass="auto-style5" EnableTheming="True" Theme="iOS" Width="200px" SelectedIndex="0">
                                                            <Items>
                                                                <dx:ListEditItem Text="Envío" Value="S" Selected="True" />
                                                                <dx:ListEditItem Text="Facturación" Value="B" Selected="True" />
                                                            </Items>
                                                        </dx:ASPxComboBox>
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td></td>
                                                    <td></td>
                                                    <td>
                                                        <dx:ASPxCheckBox ID="chkDatFacturacion" runat="server" Text="Usar datos para Facturación?" Theme="iOS" Width="267px"></dx:ASPxCheckBox>
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
                                            <div>
                                                <dx:ASPxButton ID="btnAgregarDir" runat="server" Text="Agregar" Theme="iOS" Height="30px" BackColor="#00bb3d" Width="100px" OnClick="btnAgregarDir_Click">
                                                    <Image IconID="iconbuilder_actions_addcircled_svg_white_16x16">
                                                    </Image>
                                                </dx:ASPxButton>
                                            </div>
                                            <br />
                                        </div>
                                        <br />
                                        <div>
                                            <dx:ASPxGridView ID="GvDatosDireccion" runat="server" AutoGenerateColumns="False" DataSourceID="LqsDireccionesCliente" KeyFieldName="CodCliente;CodDireccion" Theme="iOS">
                                                <SettingsCommandButton>
                                                    <EditButton Text=" ">
                                                        <Image IconID="iconbuilder_actions_edit_svg_32x32">
                                                        </Image>
                                                    </EditButton>
                                                    <DeleteButton Text=" ">
                                                        <Image IconID="iconbuilder_actions_deletecircled_svg_32x32">
                                                        </Image>
                                                    </DeleteButton>
                                                </SettingsCommandButton>
                                                <SettingsPopup>
                                                    <FilterControl AutoUpdatePosition="False"></FilterControl>
                                                </SettingsPopup>
                                                <Columns>
                                                    <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                    </dx:GridViewCommandColumn>
                                                    <dx:GridViewDataTextColumn FieldName="CodCliente" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Visible="False">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="CodDireccion" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Visible="False">
                                                        <EditFormSettings Visible="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Direccion" ShowInCustomizationForm="True" VisibleIndex="3">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Region" ShowInCustomizationForm="True" VisibleIndex="4">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Ciudad" ShowInCustomizationForm="True" VisibleIndex="5">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="Comuna" ShowInCustomizationForm="True" VisibleIndex="6">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="TipoDir" ShowInCustomizationForm="True" VisibleIndex="7">
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:ASPxGridView>
                                            <asp:LinqDataSource ID="LqsDireccionesCliente" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSMETRODataContext" EntityTypeName="" TableName="SMM_Clientes_Direccion" Where="CodCliente == @CodCliente" EnableDelete="True" EnableInsert="True" EnableUpdate="True">
                                                <WhereParameters>
                                                    <asp:SessionParameter DefaultValue="0" Name="CodCliente" SessionField="CodCliNew" Type="String" />
                                                </WhereParameters>
                                            </asp:LinqDataSource>
                                        </div>
                                        <br />
                                        <br />
                                        <div style="margin-left: 100px">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <dx:ASPxButton ID="btnCraerNw" runat="server" Text="Crear Cliente" Theme="iOS" Height="50px" BackColor="#178bff" OnClick="btnCrearNewCli_Click">
                                                            <Image IconID="save_saveall_svg_white_32x32">
                                                            </Image>
                                                        </dx:ASPxButton>
                                                    </td>
                                                    <td></td>
                                                    <td>
                                                        <dx:ASPxButton ID="CancelarDir" runat="server" Text="Cancelar" Theme="iOS" Height="50px" BackColor="#cccccc" CausesValidation="False" OnClick="CancelarDir_Click">
                                                            <Image IconID="outlookinspired_paymentunpaid_svg_white_32x32">
                                                            </Image>
                                                        </dx:ASPxButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                        </TabPages>
                    </dx:ASPxPageControl>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
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
    <div>
        <dx:ASPxPopupControl ID="PopConfirmaCreaCliente" runat="server"
            HeaderText="¿Está seguro de crear Cliente?" AllowDragging="True" Theme="iOS" Width="500px" Modal="True" CloseAction="CloseButton" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle">
            <HeaderImage IconID="businessobjects_bo_attention_svg_32x32">
            </HeaderImage>
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <div style="margin-left: 25px">
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxButton ID="btnConfirmaCreaClienteSi" runat="server" Text="Cancelar" Theme="iOS" Height="50px" Width="180px" BackColor="#cccccc" OnClick="btnConfirmaCreaClienteSi_Click">
                                        <Image IconID="outlookinspired_cancel_svg_32x32">
                                        </Image>
                                    </dx:ASPxButton>
                                </td>
                                <td class="auto-style9"></td>
                                <td>
                                    <dx:ASPxButton ID="btnConfirmaCreaClienteNo" runat="server" Text="Aceptar" Height="50px" Theme="iOS" Width="180px" BackColor="#0075ea" OnClick="btnConfirmaCreaClienteNo_Click">
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
    <div>
        <dx:ASPxPopupControl ID="PopDesc" runat="server" AllowDragging="True" CloseAction="None" CloseAnimationType="Fade" HeaderText="Verificacion " Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle">

            <ContentCollection>
                <dx:PopupControlContentControl>
                    <br />
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel24" runat="server" Text="Descuento" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtDescuentoEsp" runat="server" Width="170px" Height="25px" Theme="Default">
                                        <ValidationSettings Display="Dynamic" ValidationGroup="b2">
                                            <RegularExpression ValidationExpression="\d+" />
                                            <RequiredField IsRequired="True" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ID="ASPxLabel17" runat="server" Text="Usuario" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                    <dx:ASPxTextBox ID="txtUsuario" runat="server" Width="170px" Height="25px" Theme="Default">
                                        <ValidationSettings Display="Dynamic" ValidationGroup="b2">
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
                                    <dx:ASPxLabel ID="ASPxLabel23" runat="server" Text="Contraseña" Font-Bold="true" Font-Size="Medium"></dx:ASPxLabel>
                                    <asp:TextBox ID="txtContrasena" runat="server" CausesValidation="True" Height="25px" TextMode="Password" Width="170px" ValidationGroup="b2"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <div>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxButton ID="btnVerificar" runat="server" Text="Verificar" Theme="MaterialCompact" OnClick="btnVerificar_Click" Height="45px" ValidationGroup="b2"></dx:ASPxButton>
                                </td>
                                <td class="auto-style10"></td>
                                <td>
                                    <dx:ASPxButton ID="btnCancela" runat="server" Text="Cancelar" Theme="MaterialCompact" BackColor="Red" Height="45px" OnClick="btnCancela_Click" CausesValidation="False"></dx:ASPxButton>
                                </td>
                            </tr>
                        </table>

                    </div>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
    </div>
    <%-- <div>
        <dx:ASPxPopupControl ID="popPrint" runat="server"
            HeaderText="¿Está seguro de crear Cliente?" AllowDragging="True" Theme="iOS" Width="500px" Modal="True" CloseAction="CloseButton" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle">
            <HeaderImage IconID="businessobjects_bo_attention_svg_32x32">
            </HeaderImage>
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <div style="margin-left: 25px">
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Cancelar" Theme="iOS" Height="50px" Width="180px" BackColor="#cccccc" OnClick="btnConfirmaCreaClienteSi_Click">
                                        <Image IconID="outlookinspired_cancel_svg_32x32">
                                        </Image>
                                    </dx:ASPxButton>
                                </td>
                                <td class="auto-style9"></td>
                                <td>
                                    <dx:ASPxButton ID="ASPxButton2" runat="server" Text="Aceptar" Height="50px" Theme="iOS" Width="180px" BackColor="#0075ea" OnClick="btnConfirmaCreaClienteNo_Click">
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
    </div>--%>
</asp:Content>
