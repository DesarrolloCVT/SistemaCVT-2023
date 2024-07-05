<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InformePersonasPlanta.aspx.cs" Inherits="CVT_MermasRecepcion.RRHH.InformePersonasPlanta" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
  <%--      <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" />
                Exportar Excel</a>

        </div>--%>
    </div>
    <div>
        <dx:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" ShowCollapseButton="true"
            Width="100%" HeaderText="Filtros">
            <PanelCollection>
                <dx:PanelContent runat="server">
                    <table class="dxic-fileManager">
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Fecha">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxDateEdit ID="cboinicio" runat="server">
                                    <ValidationSettings ValidationGroup="a">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxDateEdit>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Empresa">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxComboBox ID="cbo_empresa" runat="server"
                                    DataSourceID="LqDsEmpresa" TextField="DEPTNAME" ValueField="DEPTID"
                                    ValueType="System.Int32">
                                    <ValidationSettings ValidationGroup="a">
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
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <dx:ASPxButton ID="btn_Procesar" runat="server" Text="Procesar"
                                    OnClick="btn_Procesar_Click" ValidationGroup="a">
                                </dx:ASPxButton>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <div>
                        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False"
                            DataSourceID="LqDsPersonas" KeyFieldName="DeptoSuperior" OnToolbarItemClick="GvDatos_ToolbarItemClick">
                            <SettingsPager PageSize="25">
                            </SettingsPager>
                            <SettingsBehavior AllowFocusedRow="True" />
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
                                <dx:GridViewDataTextColumn FieldName="DeptoSuperior" VisibleIndex="0"
                                    Visible="False">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="NombreDeptoSuperior" VisibleIndex="1"
                                    Caption="Empresa">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="NombreDepto" VisibleIndex="2"
                                    Caption="Area">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataDateColumn FieldName="fecha" VisibleIndex="3" Caption="Fecha">
                                </dx:GridViewDataDateColumn>
                                <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="4">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
                            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
                            <Styles>
                                <FocusedRow BackColor="#FF9933">
                                </FocusedRow>
                            </Styles>
                        </dx:ASPxGridView>
                        <asp:LinqDataSource ID="LqDsPersonas" runat="server"
                            ContextTypeName="DBMermasRecepcion.DBControlAccesoDataContext"
                            EntityTypeName="" TableName="vw_PersonasPorDia"
                            Where="fecha == @fecha1 &amp;&amp; DeptoSuperior == @DeptoSuperior">
                            <WhereParameters>
                                <asp:ControlParameter ControlID="cboinicio"
                                    Name="fecha1" PropertyName="Value" Type="DateTime" />
                                <asp:ControlParameter ControlID="cbo_empresa" DefaultValue="9999"
                                    Name="DeptoSuperior" PropertyName="Value" Type="Int32" />
                            </WhereParameters>
                        </asp:LinqDataSource>
                        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server"
                            GridViewID="GvDatos">
                        </dx:ASPxGridViewExporter>
                    </div>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxRoundPanel>
    </div>
</asp:Content>
