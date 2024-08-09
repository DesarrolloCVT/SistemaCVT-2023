<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="MetodoPagoFacturasProveedores.aspx.cs" Inherits="CVT_MermasRecepcion.Tesoreria.MetodoPagoFacturasProveedores" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }

        .auto-style2 {
            height: 27px;
        }

        .auto-style3 {
            height: 60px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Tesoreria</a></li>
            <li><span id="current">Cambio Metodo Pago Facturas Proveedores</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Cambio Metodo Pago Facturas Proveedores</span>
        <span class="tab-end"></span>

    </div>
    <div>

        <dx:ASPxRoundPanel ID="Round1" runat="server" Width="600px" HeaderText="Filtros" ShowCollapseButton="True">
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <table class="auto-style1">
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha Vencimiento Desde">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxDateEdit ID="cbo_fdesde" runat="server">
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxDateEdit>
                            </td>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Hasta">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxDateEdit ID="cbo_fhasta" runat="server">
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxDateEdit>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Grupo Proveedores">
                                </dx:ASPxLabel>
                            </td>
                            <td class="auto-style3">
                                <dx:ASPxComboBox ID="cbo_grupo" runat="server" AutoPostBack="True" DataSourceID="LqDsGrupoProveedor" OnSelectedIndexChanged="cbo_grupo_SelectedIndexChanged" TextField="GroupName" ValueField="GroupCode">
                                </dx:ASPxComboBox>
                                <asp:LinqDataSource ID="LqDsGrupoProveedor" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" Select="new (GroupCode, GroupName)" TableName="OCRG" Where="GroupType == @GroupType">
                                    <WhereParameters>
                                        <asp:Parameter DefaultValue="S" Name="GroupType" Type="Char" />
                                    </WhereParameters>
                                </asp:LinqDataSource>
                            </td>
                            <td class="auto-style3"></td>
                            <td class="auto-style3">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3">
                                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Proveedor Desde">
                                </dx:ASPxLabel>
                            </td>
                            <td class="auto-style3">
                                <dx:ASPxComboBox ID="cbo_pdesde" runat="server" DataSourceID="LqDsProveedores" ValueField="CardCode">
                                    <Columns>
                                        <dx:ListBoxColumn Caption="Cod Proveedor" FieldName="CardCode" Width="150px">
                                        </dx:ListBoxColumn>
                                        <dx:ListBoxColumn Caption="Proveedor" FieldName="CardName" Width="300px">
                                        </dx:ListBoxColumn>
                                    </Columns>
                                </dx:ASPxComboBox>
                                <asp:LinqDataSource ID="LqDsProveedores" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" Select="new (CardCode, CardName)" TableName="OCRD" Where="GroupCode == @GroupCode">
                                    <WhereParameters>
                                        <asp:ControlParameter ControlID="cbo_grupo" DefaultValue="-1" Name="GroupCode" PropertyName="Value" Type="Int16" />
                                    </WhereParameters>
                                </asp:LinqDataSource>
                            </td>
                            <td class="auto-style3">
                                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Hasta">
                                </dx:ASPxLabel>
                            </td>
                            <td class="auto-style3">
                                <dx:ASPxComboBox ID="cbo_phasta" runat="server" DataSourceID="LqDsProveedores" ValueField="CardCode">
                                    <Columns>
                                        <dx:ListBoxColumn Caption="Cod Proveedor" FieldName="CardCode" Width="150px">
                                        </dx:ListBoxColumn>
                                        <dx:ListBoxColumn Caption="Proveedor" FieldName="CardName" Width="300px">
                                        </dx:ListBoxColumn>
                                    </Columns>
                                </dx:ASPxComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2"></td>
                            <td class="auto-style2">
                                <dx:ASPxButton ID="btn_Filtrar1" runat="server" OnClick="btn_Filtrar_Click" Text="Filtrar">
                                </dx:ASPxButton>
                            </td>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style2">
                                <dx:ASPxButton ID="btn_limpiar0" runat="server" OnClick="btn_limpiar_Click" Text="Limpiar Filtros">
                                </dx:ASPxButton>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxRoundPanel>

        <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" Width="600px" HeaderText="Selección de Metodo de Pago" ShowCollapseButton="True">
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <table class="auto-style1">
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Metodo Pago">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxComboBox ID="cbo_mpago" runat="server" DataSourceID="LqDsMetodoPago" TextField="Descript" ValueField="PayMethCod">
                                </dx:ASPxComboBox>
                                <asp:LinqDataSource ID="LqDsMetodoPago" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" Select="new (PayMethCod, Descript)" TableName="OPYM">
                                </asp:LinqDataSource>
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                <dx:ASPxButton ID="btn_procesar" runat="server" OnClick="btn_Procesar_Click" Text="Procesar">
                                    <ClientSideEvents Click="function(s, e) {
	LoadingPanel.Show();
}" />
                                </dx:ASPxButton>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2"></td>
                            <td class="auto-style2"></td>
                            <td class="auto-style2"></td>
                            <td class="auto-style2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxRoundPanel>

    </div>
<%--    <div id="options">
        <a>
            <asp:ImageButton ID="cmdExcel" runat="server"
                ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" />
            Exportar Excel</a>


    </div>--%>
    <br />
    <br />
    <dx:ASPxPanel ID="ASPxPanel2" runat="server" Width="200px">
        <PanelCollection>
            <dx:PanelContent ID="PanelContent1" runat="server">
                <div>
                    <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqDsFacturasProveedores" KeyFieldName="DocEntry" OnToolbarItemClick="GvDatos_ToolbarItemClick">
                        <SettingsPager PageSize="25">
                        </SettingsPager>
                        <SettingsBehavior AllowFocusedRow="True" />
                        <SettingsCookies CookiesID="CMP" Version="1" />
                        <Toolbars>
                            <dx:GridViewToolbar >
                                <Items>                                    
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
                        <Columns>
                            <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowSelectCheckbox="True" VisibleIndex="0">
                            </dx:GridViewCommandColumn>
                            <dx:GridViewDataTextColumn FieldName="DocEntry" VisibleIndex="1" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="NumDoc" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="FolioDoc" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="CodGrupProveedor" VisibleIndex="4" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="GrupProveedor" VisibleIndex="5">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="CodProveedor" VisibleIndex="6">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Proveedor" VisibleIndex="7" Width="300px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn FieldName="FechaCon" VisibleIndex="8">
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataDateColumn FieldName="FechaVenc" VisibleIndex="9">
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn FieldName="Total" VisibleIndex="11">
                                <PropertiesTextEdit DisplayFormatString="N2">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Abonos" VisibleIndex="12">
                                <PropertiesTextEdit DisplayFormatString="N2">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Pendiente" VisibleIndex="13">
                                <PropertiesTextEdit DisplayFormatString="N2">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="CodMetodoPago" VisibleIndex="14">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="MetodoPago" VisibleIndex="15">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="NumReferencia" VisibleIndex="16">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Moneda" FieldName="Moneda" ShowInCustomizationForm="True" VisibleIndex="10">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
                        <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
                        <Styles>
                            <FocusedRow BackColor="#FF9933">
                            </FocusedRow>
                        </Styles>
                    </dx:ASPxGridView>
                    <asp:LinqDataSource ID="LqDsFacturasProveedores" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" TableName="CVT_VW_FacturasPendientesPago">
                    </asp:LinqDataSource>
                    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" ExportedRowType="All" GridViewID="GvDatos">
                    </dx:ASPxGridViewExporter>
                </div>
            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxPanel>
    <dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel"
        Modal="True">
    </dx:ASPxLoadingPanel>
</asp:Content>
