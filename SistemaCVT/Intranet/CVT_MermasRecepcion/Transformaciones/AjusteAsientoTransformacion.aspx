<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="AjusteAsientoTransformacion.aspx.cs" Inherits="CVT_MermasRecepcion.Transformaciones.AjusteAsientoTransformacion" %>

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
            <li><a>Transformacion</a></li>
            <li><span id="current">Transformacion Ajuste Asiento Contable</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Asiento Contable con Diferencia</span>
        <span class="tab-end"></span>
        <%--    <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="height: 20px" />
                Exportar Excel</a>

        </div>--%>
    </div>
    <div>

        <table class="style1">
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="MES">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="AÑO">
                    </dx:ASPxLabel>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxComboBox ID="cbo_mes" runat="server">
                        <Items>
                            <dx:ListEditItem Text="Enero" Value="1" />
                            <dx:ListEditItem Text="Febrero" Value="2" />
                            <dx:ListEditItem Text="Marzo" Value="3" />
                            <dx:ListEditItem Text="Abril" Value="4" />
                            <dx:ListEditItem Text="Mayo" Value="5" />
                            <dx:ListEditItem Text="Junio" Value="6" />
                            <dx:ListEditItem Text="Julio" Value="7" />
                            <dx:ListEditItem Text="Agosto" Value="8" />
                            <dx:ListEditItem Text="Septiembre" Value="9" />
                            <dx:ListEditItem Text="Octubre" Value="10" />
                            <dx:ListEditItem Text="Noviembre" Value="11" />
                            <dx:ListEditItem Text="Diciembre" Value="12" />
                        </Items>
                        <ValidationSettings Display="Dynamic">
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
                <td>
                    <dx:ASPxComboBox ID="cbo_año" runat="server">
                        <Items>
                            <dx:ListEditItem Text="2019" Value="2019" />
                            <dx:ListEditItem Text="2020" Value="2020" />
                            <dx:ListEditItem Text="2021" Value="2021" />
                            <dx:ListEditItem Text="2022" Value="2022" />
                            <dx:ListEditItem Text="2023" Value="2023" />
                            <dx:ListEditItem Text="2024" Value="2024" />
                            <dx:ListEditItem Text="2025" Value="2025" />
                        </Items>
                        <ValidationSettings Display="Dynamic">
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
                <td>
                    <dx:ASPxButton ID="btn_filtrar" runat="server" Text="Filtrar"
                        OnClick="btn_filtrar_Click">
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>

    </div>
    <br />
    <div>
       <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Resumen" Font-Size="Medium"></dx:ASPxLabel>
        <dx:ASPxGridView ID="GvResumen" runat="server" DataSourceID="LqDsResumen"
            AutoGenerateColumns="False" OnToolbarItemClick="GvResumen_ToolbarItemClick">
            <SettingsBehavior AllowFocusedRow="True" />
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
                        <%--<dx:GridViewToolbarItem Alignment="Left">
                            <Template>
                                <dx:ASPxButtonEdit ID="tbToolbarSearch" runat="server" NullText="Search..." Height="100%">
                                    <Buttons>
                                        <dx:SpinButtonExtended Image-IconID="find_find_16x16gray" />
                                    </Buttons>
                                </dx:ASPxButtonEdit>
                            </Template>
                        </dx:GridViewToolbarItem>--%>
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="CtaPEP" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Debit" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Credit" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Diff" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CtaExistencia" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Mes" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Año" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <%--<SettingsSearchPanel CustomEditorID="tbToolbarSearch" />--%>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsResumen" runat="server" EntityTypeName=""
            ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext"
            TableName="CVT_VW_TransformacionesAsientoConDiferenciaResumen"
            Where="Mes == @Mes &amp;&amp; Año == @Año">
            <WhereParameters>
                <asp:ControlParameter ControlID="cbo_mes" DefaultValue="0" Name="Mes"
                    PropertyName="Value" Type="Int32" />
                <asp:ControlParameter ControlID="cbo_año" DefaultValue="0" Name="Año"
                    PropertyName="Value" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Detalle" Font-Size="Medium"></dx:ASPxLabel>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqDsTransformaciones"
            OnRowCommand="GvDatos_RowCommand"
            OnHtmlRowCreated="GvDatos_HtmlRowCreated" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsPager PageSize="25">
            </SettingsPager>
            <SettingsEditing Mode="PopupEditForm">
            </SettingsEditing>
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            <SettingsBehavior AllowFocusedRow="True" />
            <Toolbars>
                <dx:GridViewToolbar >
                    <Items>
                        <%--<dx:GridViewToolbarItem Command="New" Image-Url="../Images/pn-add-source-copy.gif" />--%>
                        <dx:GridViewToolbarItem Text="Exportar"  Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
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
                        <%--<dx:GridViewToolbarItem Alignment="Left">
                            <Template>
                                <dx:ASPxButtonEdit ID="tbToolbarSearch" runat="server" NullText="Search..." Height="100%">
                                    <Buttons>
                                        <dx:SpinButtonExtended Image-IconID="find_find_16x16gray" />
                                    </Buttons>
                                </dx:ASPxButtonEdit>
                            </Template>
                        </dx:GridViewToolbarItem>--%>
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="CtaPEP"
                    VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Debit" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Credit" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Diff" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="U_IdWms" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CtaExistencia" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Mes" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Año" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
<%--            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />--%>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsTransformaciones" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext"
            EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntityTypeName=""
            TableName="CVT_VW_TransformacionesAsientoConDiferencia"
            Where="Año == @Año &amp;&amp; Mes == @Mes">
            <WhereParameters>
                <asp:ControlParameter ControlID="cbo_año" DefaultValue="0" Name="Año"
                    PropertyName="Value" Type="Int32" />
                <asp:ControlParameter ControlID="cbo_mes" DefaultValue="0" Name="Mes"
                    PropertyName="Value" Type="Int32" />
            </WhereParameters>
        </asp:LinqDataSource>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server">
        </dx:ASPxGridViewExporter>

    </div>
    <dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel"
        Modal="True">
    </dx:ASPxLoadingPanel>
</asp:Content>


