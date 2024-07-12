<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InfConsumoOF.aspx.cs" Inherits="CVT_MermasRecepcion.Reporteria.InfConsumoOF" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 110px;
        }

        .auto-style6 {
            width: 17px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Informes</a></li>
            <li><span id="current">Consumo Produccion</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Consumo Produccion</span>
        <span class="tab-end"></span>
   <%--     <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px" />
                Exportar Excel</a>
        </div>--%>
    </div>
    <br />
    <div>

        <table class="dxeBinImgCPnlSys">
            <tr>
                <td class="auto-style5">
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Desde" Font-Size="Medium">
                    </dx:ASPxLabel>
                </td>
                <td class="auto-style6"></td>
                <td class="auto-style6">
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Hasta" Font-Size="Medium">
                    </dx:ASPxLabel>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <dx:ASPxDateEdit ID="cb_desde" runat="server">
                    </dx:ASPxDateEdit>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <dx:ASPxDateEdit ID="cb_hasta" runat="server">
                    </dx:ASPxDateEdit>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6">
                    <dx:ASPxButton ID="btn_filtrar" runat="server" OnClick="btn_filtrar_Click"
                        Text="Filtrar">
                    </dx:ASPxButton>
                </td>
            </tr>
        </table>
        <br />
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False"
            DataSourceID="LqDsConsumo" OnToolbarItemClick="ASPxGridView1_ToolbarItemClick">
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
                <dx:GridViewDataTextColumn FieldName="OF" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="FECHA" VisibleIndex="1">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Codigo" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Producto" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Planificado" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodigoConsumido" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ProductoConsumido" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CantidadConsumida" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsConsumo" runat="server"
            ContextTypeName="DBMermasRecepcion.DBMLCVTSAPDataContext" EntityTypeName=""
            TableName="CVT_VW_ConsumidoOF"
            Where="FECHA &gt;= @FECHA &amp;&amp; FECHA &lt;= @FECHA1">
            <WhereParameters>
                <asp:ControlParameter ControlID="cb_desde" Name="FECHA" PropertyName="Value"
                    Type="DateTime" />
                <asp:ControlParameter ControlID="cb_hasta" Name="FECHA1" PropertyName="Value"
                    Type="DateTime" />
            </WhereParameters>
        </asp:LinqDataSource>

        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server"
            GridViewID="ASPxGridView1">
        </dx:ASPxGridViewExporter>

    </div>
</asp:Content>
