<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CuentasClientes.aspx.cs" Inherits="CVT_MermasRecepcion.Tesoreria.CuentasClientes" %>
<%@ Register assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">


        .auto-style1 {
            width: 100%;
        }
        .auto-style3 {
            height: 60px;
        }
        .auto-style2 {
            height: 27px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
            <div id="breadcrumbs">
    <ul>
        <li><a href="../Blank.aspx">nicio</a></li>
        <li><a>Tesoreria</a></li>
        <li><span id="current">Cuenta Clientes</span></li>
    </ul>
</div>

<div id="tableHeader">
    <span class="tableTitle">Cuenta Clientes</span>
    <span class="tab-end"></span>
        
</div>
<div>

    <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" Width="600px" HeaderText="Filtros" AllowCollapsingByHeaderClick="True">
        <PanelCollection>
            <dx:PanelContent runat="server">
                <table class="auto-style1">
                    <tr>
                        <td>
                            <dx:ASPxLabel ID="ASPxLabel11" runat="server" Text="Fecha Vencimiento Desde">
                            </dx:ASPxLabel>
                        </td>
                        <td>
                            <dx:ASPxDateEdit ID="cbo_fdesde0" runat="server">
                                <ValidationSettings>
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </dx:ASPxDateEdit>
                        </td>
                        <td>
                            <dx:ASPxLabel ID="ASPxLabel12" runat="server" Text="Hasta">
                            </dx:ASPxLabel>
                        </td>
                        <td>
                            <dx:ASPxDateEdit ID="cbo_fhasta0" runat="server">
                                <ValidationSettings>
                                    <RequiredField IsRequired="True" />
                                </ValidationSettings>
                            </dx:ASPxDateEdit>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                            <dx:ASPxLabel ID="ASPxLabel13" runat="server" Text="Vendedor">
                            </dx:ASPxLabel>
                        </td>
                        <td class="auto-style3">
                            <dx:ASPxComboBox ID="cbo_grupo0" runat="server" AutoPostBack="True" DataSourceID="LqDsVendedor" OnSelectedIndexChanged="cbo_grupo_SelectedIndexChanged" TextField="SlpName" ValueField="SlpCode">
                            </dx:ASPxComboBox>
                            <asp:LinqDataSource ID="LqDsVendedor" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" Select="new (SlpCode, SlpName)" TableName="OSLP" Where="GroupCode == @GroupCode">
                                <WhereParameters>
                                    <asp:Parameter DefaultValue="1" Name="GroupCode" Type="Int16" />
                                </WhereParameters>
                            </asp:LinqDataSource>
                        </td>
                        <td class="auto-style3"></td>
                        <td class="auto-style3">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                            <dx:ASPxLabel ID="ASPxLabel14" runat="server" Text="Cliente Desde">
                            </dx:ASPxLabel>
                        </td>
                        <td class="auto-style3">
                            <dx:ASPxComboBox ID="cbo_pdesde0" runat="server" DataSourceID="LqDsProveedores" ValueField="CardCode">
                                <Columns>
                                    <dx:ListBoxColumn Caption="Cod Proveedor" FieldName="CardCode" Width="150px">
                                    </dx:ListBoxColumn>
                                    <dx:ListBoxColumn Caption="Proveedor" FieldName="CardName" Width="300px">
                                    </dx:ListBoxColumn>
                                </Columns>
                            </dx:ASPxComboBox>
                            <asp:LinqDataSource ID="LqDsProveedores" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" Select="new (CardCode, CardName)" TableName="OCRD" Where="SlpCode == @SlpCode">
                                <WhereParameters>
                                    <asp:ControlParameter ControlID="cbo_grupo0" DefaultValue="0" Name="SlpCode" PropertyName="Value" Type="Int32" />
                                </WhereParameters>
                            </asp:LinqDataSource>
                        </td>
                        <td class="auto-style3">
                            <dx:ASPxLabel ID="ASPxLabel15" runat="server" Text="Hasta">
                            </dx:ASPxLabel>
                        </td>
                        <td class="auto-style3">
                            <dx:ASPxComboBox ID="cbo_phasta0" runat="server" DataSourceID="LqDsProveedores" ValueField="CardCode">
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
                            <dx:ASPxButton ID="btn_Filtrar0" runat="server" OnClick="btn_Filtrar_Click" Text="Filtrar">
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

</div>
 <%--   <div id="options">         
          <a><asp:ImageButton ID="cmdExcel" runat="server" 
              ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" onclick="cmdExcel_Click"/> Exportar Excel</a>
             
     
    </div>--%>
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatosCuentaClientes" runat="server" AutoGenerateColumns="False" DataSourceID="LqDsCuentas" OnToolbarItemClick="GvDatos_ToolbarItemClick" OnCustomSummaryCalculate="GvDatos_CustomSummaryCalculate" EnableCallBacks="False">
            <SettingsPager PageSize="10000" AlwaysShowPager="True">
            </SettingsPager>
            <Settings ShowGroupPanel="True" GroupSummaryTextSeparator="    ;    " />
            <SettingsBehavior AllowFocusedRow="True" />
            <Toolbars>
                <dx:GridViewToolbar >
                    <Items>                        
                        <dx:GridViewToolbarItem Text="Exportar"  Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>                             
                                <dx:GridViewToolbarItem Command="ExportToXls" />
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />                                
                                <dx:GridViewToolbarItem Command="ExportToCsv" />                                                     
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
                <dx:GridViewDataTextColumn FieldName="Tipo" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DocEntry" Visible="False" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="N SAP" FieldName="NumDoc" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FolioDoc" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodGrupProveedor" Visible="False" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="GrupProveedor" VisibleIndex="7" Caption="Grupo Cliente">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodProveedor" VisibleIndex="8" Caption="Cod Cliente">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Proveedor" VisibleIndex="9" Caption="Cliente">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LineaCredito" VisibleIndex="11" Visible="False">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SlpCode" Visible="False" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Vendedor" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FechaCon" VisibleIndex="14">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="FechaVenc" VisibleIndex="15">
                </dx:GridViewDataDateColumn>
                   <dx:GridViewDataTextColumn FieldName="SemanaVenc" VisibleIndex="16">
                </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="MesVenc" VisibleIndex="17">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="AñoVenc" VisibleIndex="18">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Moneda" VisibleIndex="19">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Total" VisibleIndex="20">
                    <PropertiesTextEdit DisplayFormatString="N2">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Abonos" VisibleIndex="21">
                    <PropertiesTextEdit DisplayFormatString="N2">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Pendiente" VisibleIndex="22">
                    <PropertiesTextEdit DisplayFormatString="N2">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LineaCreditoUF" ShowInCustomizationForm="True" VisibleIndex="23">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LineaCreditoPesos" ShowInCustomizationForm="True" VisibleIndex="24" Visible="False">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UF" ShowInCustomizationForm="True" VisibleIndex="25">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SeguroFecha" ShowInCustomizationForm="True" VisibleIndex="26" Caption="Linea Credito">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DocRelacionado" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Empresa" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MaximoPrima" VisibleIndex="27">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CantAnualIndemnizacion" VisibleIndex="28">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MaximoIndemnizacion" VisibleIndex="29">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="GrpEmpresa" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="OC" FieldName="OC" VisibleIndex="30">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cond Pago" FieldName="CondicionPago" VisibleIndex="31">
                </dx:GridViewDataTextColumn>
            </Columns>
                      <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default"/>

<SettingsPopup>
<FilterControl AutoUpdatePosition="False"></FilterControl>
</SettingsPopup>

            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <GroupSummary>
                <dx:ASPxSummaryItem DisplayFormat="Total deuda: {0:N0}" FieldName="Pendiente" ShowInColumn="Proveedor" SummaryType="Sum" ValueDisplayFormat="N0" />
                <dx:ASPxSummaryItem DisplayFormat="Asegurado : {0:N0}" FieldName="SeguroFecha" ShowInColumn="Proveedor" SummaryType="Average" ValueDisplayFormat="N0" />
                <dx:ASPxSummaryItem DisplayFormat="Disponible : {0:N0}" ShowInColumn="Proveedor" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="Total a recaudar :{0:N0}" FieldName="Pendiente" ShowInColumn="Vendedor" SummaryType="Sum" ValueDisplayFormat="N0" />
            </GroupSummary>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsCuentas" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName="" TableName="CVT_VW_CuentasClientes" OrderBy="FechaVenc">
        </asp:LinqDataSource>

        <dx:ASPxGridViewExporter runat="server" GridViewID="GvDatos" ExportedRowType="All" ID="ASPxGridViewExporter1"></dx:ASPxGridViewExporter>

    </div>
</asp:Content>
