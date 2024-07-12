<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InfListadoCobranza.aspx.cs" Inherits="CVT_MermasRecepcion.Reporteria.InfListadoCobranza" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script language="javascript" type="text/javascript">
        function PersonalizaGrilla(s, e) {
            if (GvDatos.IsCustomizationWindowVisible())
                GvDatos.HideCustomizationWindow();
            else
                GvDatos.ShowCustomizationWindow();
            UpdateButtonText();
        }
        function grid_CustomizationWindowCloseUp(s, e) {
            UpdateButtonText();
        }
        function UpdateButtonText() {
            var text = GvDatos.IsCustomizationWindowVisible() ? "Ocultar" : "Mostrar";
            text += " Personalizar Grilla";
            lbl_grilla.SetText(text);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Informes</a></li>
            <li><span id="current">Cobranza</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Listado Cobranza</span>
        <span class="tab-end"></span>
        <div id="options">
            <a>
                <asp:ImageButton ID="cmdGrilla" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-grilla.png" OnClientClick="PersonalizaGrilla()" />
                <dx:ASPxLabel ID="lbl_grilla" runat="server" Text="Mostrar Personalizar Grilla" ClientInstanceName="lbl_grilla"></dx:ASPxLabel>
            </a>
            <%--<a>
                <asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" />
                Exportar Excel</a>--%>
        </div>
    </div>
    <div>
        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ShowCollapseButton="true"
            Width="100%" HeaderText="Filtros">
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <table class="dxic-fileManager">
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Vendedor (opcional)">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxComboBox ID="cbo_vendedor" runat="server" DataSourceID="LqDsOSLP"
                                    ValueField="SlpCode">
                                    <Columns>
                                        <dx:ListBoxColumn Caption="Codigo" FieldName="SlpCode" />
                                        <dx:ListBoxColumn Caption="Nombre" FieldName="SlpName" Width="400px" />
                                    </Columns>
                                    <Items>
                                        <dx:ListEditItem Text="Todos" Value="0" />
                                    </Items>
                                </dx:ASPxComboBox>
                                <asp:LinqDataSource ID="LqDsOSLP" runat="server"
                                    ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName=""
                                    TableName="OSLP" Where="Active == @Active &amp;&amp; GroupCode == @GroupCode">
                                    <WhereParameters>
                                        <asp:Parameter DefaultValue="Y" Name="Active" Type="Char" />
                                        <asp:Parameter DefaultValue="1" Name="GroupCode" Type="Int16" />
                                    </WhereParameters>
                                </asp:LinqDataSource>
                            </td>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Cliente (opcional)">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxComboBox ID="cbo_cliente" runat="server" DataSourceID="LqDsOCRD"
                                    ValueField="CardCode">
                                    <Columns>
                                        <dx:ListBoxColumn Caption="Codigo" FieldName="CardCode" />
                                        <dx:ListBoxColumn Caption="Cliente" FieldName="CardName" Width="400px" />
                                    </Columns>
                                    <Items>
                                        <dx:ListEditItem Text="Todos" Value="-" />
                                    </Items>
                                </dx:ASPxComboBox>
                                <asp:LinqDataSource ID="LqDsOCRD" runat="server"
                                    ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName=""
                                    TableName="OCRD" Where="CardType == @CardType &amp;&amp; validFor == @validFor">
                                    <WhereParameters>
                                        <asp:Parameter DefaultValue="C" Name="CardType" Type="Char" />
                                        <asp:Parameter DefaultValue="Y" Name="validFor" Type="Char" />
                                    </WhereParameters>
                                </asp:LinqDataSource>
                            </td>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Fecha">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxDateEdit ID="cbo_fecha" runat="server">
                                    <ValidationSettings ValidationGroup="a">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxDateEdit>
                            </td>
                            <td>
                                <dx:ASPxButton ID="btn_procesar" runat="server" Text="Procesar"
                                    OnClick="btn_procesar_Click" ValidationGroup="a">
                                </dx:ASPxButton>
                            </td>
                        </tr>

                    </table>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxRoundPanel>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False"
            OnPageIndexChanged="GvDatos_PageIndexChanged" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsPager PageSize="30">
            </SettingsPager>
            <Settings ShowFooter="True" ShowGroupFooter="VisibleIfExpanded"
                ShowGroupPanel="True" />
            <SettingsBehavior AllowFocusedRow="True" />
            <Toolbars>
                <dx:GridViewToolbar>
                    <Items>
                        <%--<dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif" />--%>
                        <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXls" />
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                <dx:GridViewToolbarItem Command="ExportToDocx" />
                                <dx:GridViewToolbarItem Command="ExportToRtf" />
                                <dx:GridViewToolbarItem Command="ExportToCsv" />
                                <dx:GridViewToolbarItem Command="ExportToPdf" />
                            </Items>
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
            <Columns>
                <dx:GridViewDataTextColumn Caption="Cod. Cliente" FieldName="Cod_Cliente"
                    VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cliente" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Limite Compra" FieldName="LimitComp"
                    VisibleIndex="2" Visible="False">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Linea de Credito" FieldName="Linea_Credito"
                    VisibleIndex="3">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Fecha Doc." FieldName="FechaDocto"
                    VisibleIndex="4">
                    <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Fecha Vcto." FieldName="Fecha_Vcto"
                    VisibleIndex="5">
                    <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Tipo Documento" FieldName="Tipo_Documento"
                    VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Folio" VisibleIndex="7">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Total" VisibleIndex="8">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Pagado" VisibleIndex="9">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Saldo" VisibleIndex="10">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cod Vendedor" FieldName="SlpCode"
                    VisibleIndex="11" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Vendedor" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PagoRecibido" VisibleIndex="13">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MedioPago" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MontoPago" VisibleIndex="15"
                    Visible="False">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="N Doc. Pago" FieldName="No_DoctoPago"
                    VisibleIndex="16" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="F. Vcto. Pago" FieldName="Vencto_DoctoPago"
                    VisibleIndex="17" Visible="False">
                    <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Folio2" VisibleIndex="18" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FechaPago" VisibleIndex="19"
                    Visible="False">
                    <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="N0" FieldName="Saldo" ShowInColumn="Saldo"
                    ShowInGroupFooterColumn="Saldo" SummaryType="Sum" Tag="Saldo" />
            </TotalSummary>
            <GroupSummary>
                <dx:ASPxSummaryItem FieldName="Saldo" SummaryType="Sum" Tag="Saldo" />
            </GroupSummary>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="GvDatos">
        </dx:ASPxGridViewExporter>
    </div>
</asp:Content>
