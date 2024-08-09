<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="RebajaFilm.aspx.cs" Inherits="CVT_MermasRecepcion.SAP.RebajaFilm" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Contabilidad</a></li>
            <li><span id="current">Resumen Rebaja Film</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Resumen Rebaja Film</span>
        <span class="tab-end"></span>
       <%-- <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server" ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" />
                Exportar Excel DETALLE</a>
        </div>--%>
    </div>
    <br />
    <br />
    <div style="margin-left:25px">

        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="MES">
                    </dx:ASPxLabel>
                      <dx:ASPxComboBox ID="cbo_mes" runat="server">
                        <Items>
                            <dx:ListEditItem Text="1" Value="1" />
                            <dx:ListEditItem Text="2" Value="2" />
                            <dx:ListEditItem Text="3" Value="3" />
                            <dx:ListEditItem Text="4" Value="4" />
                            <dx:ListEditItem Text="5" Value="5" />
                            <dx:ListEditItem Text="6" Value="6" />
                            <dx:ListEditItem Text="7" Value="7" />
                            <dx:ListEditItem Text="8" Value="8" />
                            <dx:ListEditItem Text="9" Value="9" />
                            <dx:ListEditItem Text="10" Value="10" />
                            <dx:ListEditItem Text="11" Value="11" />
                            <dx:ListEditItem Text="12" Value="12" />
                        </Items>
                    </dx:ASPxComboBox>
                </td>
                <td>
                  
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="AÑO">
                    </dx:ASPxLabel>
                       <dx:ASPxComboBox ID="cbo_año" runat="server">
                        <Items>
                            <dx:ListEditItem Text="2019" Value="2019" />
                            <dx:ListEditItem Text="2020" Value="2020" />
                            <dx:ListEditItem Text="2021" Value="2021" />
                            <dx:ListEditItem Text="2022" Value="2022" />
                            <dx:ListEditItem Text="2023" Value="2023" />
                            <dx:ListEditItem Text="2024" Value="2024" />
                            <dx:ListEditItem Text="2025" Value="2025" />
                            <dx:ListEditItem Text="2026" Value="2026" />
                            <dx:ListEditItem Text="2027" Value="2027" />
                            <dx:ListEditItem Text="2028" Value="2028" />
                            <dx:ListEditItem Text="2029" Value="2029" />
                            <dx:ListEditItem Text="2030" Value="2030" />
                        </Items>
                    </dx:ASPxComboBox>
                </td>
                <td>
                    <dx:ASPxButton ID="ASPxButton1" runat="server" OnClick="ASPxButton1_Click"
                        Text="GENERAR" Height="33px">
                    </dx:ASPxButton>
                </td>
            </tr>         
        </table>

    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqDsRebajaFilm" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsPager Mode="ShowAllRecords" PageSize="1000">
            </SettingsPager>
            <SettingsBehavior AllowFocusedRow="True" />
            <SettingsCookies CookiesID="RebajaFilm" Version="1" />
            <Toolbars>
                <dx:GridViewToolbar >
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
                <dx:GridViewDataTextColumn FieldName="Bodega" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Año" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Mes" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Grupo" VisibleIndex="3" Width="100">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalPallets" VisibleIndex="4">
                    <PropertiesTextEdit DisplayFormatString="N1">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CtaCostoVenta" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Porcentaje" VisibleIndex="6">
                    <PropertiesTextEdit DisplayFormatString="N1">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ItemCode" VisibleIndex="7" Caption="Cod Film">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ItemName" VisibleIndex="8" Caption="Film" Width="250px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CantidadFilmTotal" VisibleIndex="9">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CantidadFilmConsumir" VisibleIndex="10">
                    <PropertiesTextEdit DisplayFormatString="N1">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CtaExistenciaFilm" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <br />
        <asp:LinqDataSource ID="LqDsRebajaFilm" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName=""
            TableName="CVT_VW_ResumenConsumoFilm"
            Where="MES == @MES &amp;&amp; AÑO == @AÑO">
            <WhereParameters>
                <asp:ControlParameter ControlID="cbo_mes" DefaultValue="0" Name="MES"
                    PropertyName="Value" Type="Int32" />
                <asp:ControlParameter ControlID="cbo_año" DefaultValue="0" Name="AÑO"
                    PropertyName="Value" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>

        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server"
            GridViewID="GvDatos">
        </dx:ASPxGridViewExporter>

    </div>
</asp:Content>
