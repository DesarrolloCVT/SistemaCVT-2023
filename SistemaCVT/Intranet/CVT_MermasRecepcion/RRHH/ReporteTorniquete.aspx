<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ReporteTorniquete.aspx.cs" Inherits="CVT_MermasRecepcion.RRHH.ReporteTorniquete" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1 {
            width: 100%;
        }

        .style2 {
            height: 27px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>RRHH</a></li>
            <li><span id="current">Informe Torniquete</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Informe Torniquete</span>
        <span class="tab-end"></span>
    </div>

    <div>

        <dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server"
            ShowCollapseButton="true" Width="100%" HeaderText="Informe por Fecha">
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <table class="style1">
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha Inicio">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxDateEdit ID="cbofinicio" runat="server">
                                    <ValidationSettings ValidationGroup="a">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxDateEdit>
                            </td>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Fecha Termino">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxDateEdit ID="cboftermino" runat="server">
                                    <ValidationSettings ValidationGroup="a">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxDateEdit>
                            </td>
                            <td>
                                <dx:ASPxButton ID="btn_procesar" runat="server" OnClick="btn_procesar_Click"
                                    Text="Procesar" ValidationGroup="a">
                                </dx:ASPxButton>
                            </td>
                        </tr>
                    </table>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxRoundPanel>
        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server"
            HeaderText="Informe por Area" ShowCollapseButton="true" Width="100%">
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <table class="style1">
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Fecha Inicio">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxDateEdit ID="cbofinicio0" runat="server">
                                    <ValidationSettings ValidationGroup="b">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxDateEdit>
                            </td>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="RUT - Nombre">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxComboBox ID="cbo_rutnombre" runat="server" DataSourceID="LqDsUsuario"
                                    TextField="Name" ValueField="Badgenumber">
                                    <Columns>
                                        <dx:ListBoxColumn Caption="RUT" FieldName="Badgenumber" Name="RUT" />
                                        <dx:ListBoxColumn Caption="Nombre" FieldName="Name" Name="Nombre" />
                                        <dx:ListBoxColumn Caption="Apellido" FieldName="lastname" Name="Apellido" />
                                    </Columns>
                                </dx:ASPxComboBox>
                                <asp:LinqDataSource ID="LqDsUsuario" runat="server"
                                    ContextTypeName="DBMermasRecepcion.DBControlAccesoDataContext"
                                    EntityTypeName="" TableName="USERINFO" Select="new (Badgenumber, Name, lastname)">
                                </asp:LinqDataSource>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="style2">
                                <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Fecha Termino">
                                </dx:ASPxLabel>
                            </td>
                            <td class="style2">
                                <dx:ASPxDateEdit ID="cboftermino0" runat="server">
                                    <ValidationSettings ValidationGroup="b">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxDateEdit>
                            </td>
                            <td class="style2"></td>
                            <td class="style2"></td>
                            <td class="style2"></td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Empresa">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxComboBox ID="cbo_empresa" runat="server" AutoPostBack="True"
                                    DataSourceID="LqDsEmpresa" TextField="DEPTNAME" ValueField="DEPTID">
                                    <ValidationSettings ValidationGroup="b">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                                <asp:LinqDataSource ID="LqDsEmpresa" runat="server"
                                    ContextTypeName="DBMermasRecepcion.DBControlAccesoDataContext"
                                    EntityTypeName="" TableName="DEPARTMENTS" Where="SUPDEPTID == @SUPDEPTID">
                                    <WhereParameters>
                                        <asp:Parameter DefaultValue="0" Name="SUPDEPTID" Type="Int32" />
                                    </WhereParameters>
                                </asp:LinqDataSource>
                            </td>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Area">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxComboBox ID="cbo_area" runat="server" DataSourceID="LqDsArea"
                                    TextField="DEPTNAME" ValueField="DEPTID">
                                </dx:ASPxComboBox>
                                <asp:LinqDataSource ID="LqDsArea" runat="server"
                                    ContextTypeName="DBMermasRecepcion.DBControlAccesoDataContext"
                                    EntityTypeName="" TableName="DEPARTMENTS"
                                    Where="SUPDEPTID != @SUPDEPTID &amp;&amp; SUPDEPTID == @SUPDEPTID1">
                                    <WhereParameters>
                                        <asp:Parameter DefaultValue="0" Name="SUPDEPTID" Type="Int32" />
                                        <asp:ControlParameter ControlID="cbo_empresa" DefaultValue="0"
                                            Name="SUPDEPTID1" PropertyName="Value" Type="Int32" />
                                    </WhereParameters>
                                </asp:LinqDataSource>
                            </td>
                            <td>
                                <dx:ASPxButton ID="btn_procesar0" runat="server" OnClick="btn_procesar0_Click"
                                    Text="Generar Informe PDF" ValidationGroup="b">
                                </dx:ASPxButton>
                                <br />
                                <dx:ASPxButton ID="btn_procesar1" runat="server" OnClick="btn_procesar1_Click"
                                    Text="Informe en Grilla" ValidationGroup="b">
                                </dx:ASPxButton>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="5">&nbsp;</td>
                        </tr>
                    </table>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxRoundPanel>
    <%--    <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="height: 20px" />
                Exportar Excel</a>

        </div>--%>
        <br />
        <div>
            <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
            </dx:ASPxGridViewExporter>

            <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False"
                OnPageIndexChanged="GvDatos_PageIndexChanged" OnToolbarItemClick="GvDatos_ToolbarItemClick">
                <SettingsPager PageSize="30">
                </SettingsPager>
                <SettingsBehavior AllowFocusedRow="True" />
                <Toolbars>
                    <dx:GridViewToolbar>
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
                    <dx:GridViewDataTextColumn FieldName="RUT" ShowInCustomizationForm="True"
                        VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Nombre" ShowInCustomizationForm="True"
                        VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Apellido" ShowInCustomizationForm="True"
                        VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="NombreDepto"
                        ShowInCustomizationForm="True" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="DeptoSuperior"
                        ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Empresa" FieldName="NombreDeptoSuperior"
                        ShowInCustomizationForm="True" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Cargo" ShowInCustomizationForm="True"
                        VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="NoTarjeta" ShowInCustomizationForm="True"
                        VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Entrada" FieldName="Estado"
                        ShowInCustomizationForm="True" VisibleIndex="9">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn Caption="Fecha Hora Entrada" FieldName="Tiempo"
                        ShowInCustomizationForm="True" VisibleIndex="10">
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm">
                        </PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn Caption="Salida" FieldName="Estado1"
                        ShowInCustomizationForm="True" VisibleIndex="11">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn Caption="Fecha Hora Salida"
                        FieldName="Tiempo_Salida" ShowInCustomizationForm="True" VisibleIndex="12">
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy HH:mm">
                        </PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="NivelAcceso"
                        ShowInCustomizationForm="True" Visible="False" VisibleIndex="13">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Minutos en Planta"
                        FieldName="Minutos_En_Planta" ShowInCustomizationForm="True"
                        VisibleIndex="14">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Horas" ShowInCustomizationForm="True"
                        VisibleIndex="15">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Minutos" ShowInCustomizationForm="True"
                        VisibleIndex="16">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Valor Hora" FieldName="Valor_Hora"
                        ShowInCustomizationForm="True" VisibleIndex="19">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Valor Minutos" FieldName="Valor_Minutos"
                        ShowInCustomizationForm="True" VisibleIndex="20">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Total" FieldName="Valor_Total"
                        ShowInCustomizationForm="True" VisibleIndex="21">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Min Decimal Hora"
                        FieldName="Min_DecimalHora" VisibleIndex="17">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Total Horas" FieldName="Total_Horas"
                        VisibleIndex="18">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Fecha" VisibleIndex="8">
                        <PropertiesTextEdit DisplayFormatString="dd/MM/yyyy">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                </Columns>
                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
                <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
                <Styles>
                    <FocusedRow BackColor="#FF9933">
                    </FocusedRow>
                </Styles>
            </dx:ASPxGridView>
        </div>
    </div>
</asp:Content>
