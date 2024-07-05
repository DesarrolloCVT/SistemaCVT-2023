<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EmpresasRelacionadas.aspx.cs" Inherits="CVT_MermasRecepcion.Gestion.EmpresasRelacionadas" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Gestion</a></li>
            <li><span id="current">Empresas Relacionadas</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Empresas Relacionadas</span>
        <span class="tab-end"></span>
        <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click1"
                    Style="height: 20px;" />
                Exportar Excel</a>&nbsp;

        </div>
    </div>
    <br />
    <br />
    <div style="margin-left: 100px">
        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="EN BASE SALDO SN" Font-Bold="true" Font-Size="X-Large"></dx:ASPxLabel>
    </div>
    <div>
        <dx:ASPxPivotGrid ID="PvDatos" runat="server" ClientIDMode="AutoID" OnCustomCellStyle="PvDatos_CustomCellStyle">
            <Fields>
                <dx:PivotGridField ID="fieldEmpresa" Area="RowArea" AreaIndex="0" FieldName="Empresa" Name="fieldEmpresa">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldEmpresaNombre" Area="RowArea" AreaIndex="1" FieldName="Empresa_Nombre" Name="fieldEmpresaNombre">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldRelacionada" Area="ColumnArea" AreaIndex="0" FieldName="Relacionada" Name="fieldRelacionada">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldRelacionadaNombre" Area="ColumnArea" AreaIndex="1" FieldName="Relacionada_Nombre" Name="fieldRelacionadaNombre">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldSaldo" Area="DataArea" AreaIndex="0" CellFormat-FormatString="N0" CellFormat-FormatType="Custom" FieldName="Saldo" Name="fieldSaldo">
                </dx:PivotGridField>
            </Fields>

        </dx:ASPxPivotGrid>
        <br />
        <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter1" runat="server"
            ASPxPivotGridID="PvDatos">
            <OptionsPrint MergeColumnFieldValues="False">
            </OptionsPrint>
        </dx:ASPxPivotGridExporter>
    </div>
    <br />
    <br />
    <br />
    <div id="options2">
        <a>
            <asp:ImageButton ID="ImageButton1" runat="server"
                ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png"
                Style="height: 20px;" OnClick="ImageButton1_Click" />
            Exportar Excel</a>&nbsp;

    </div>
    <div style="margin-left: 100px">
        <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="EN BASE DOCUMENTOS" Font-Bold="true" Font-Size="X-Large"></dx:ASPxLabel>
    </div>
    <div>
        <dx:ASPxPivotGrid ID="PvDatos2" runat="server" ClientIDMode="AutoID" OnCustomCellStyle="PvDatos2_CustomCellStyle">
            <Fields>
                <dx:PivotGridField ID="fEmpresa" FieldName="Empresa" Name="fEmpresa" Area="RowArea" AreaIndex="0">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fEmpresaNombre" FieldName="Empresa_Nombre" Name="fEmpresaNombre" Area="RowArea" AreaIndex="1">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fModo" FieldName="Modo" Name="fModo" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fRelacionada" FieldName="Relacionada" Name="fRelacionada" Area="ColumnArea" AreaIndex="0">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fRelacionadaNombre" FieldName="Relacionada_Nombre" Name="fRelacionadaNombre" Area="ColumnArea" AreaIndex="1">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fNSAP" FieldName="NSAP" Name="fNSAP" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fFContabilizacion" FieldName="FContabilizacion" Name="fFContabilizacion" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fFolio" FieldName="Folio" Name="fFolio" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fTotal" FieldName="Total" Name="fTotal" Area="DataArea" AreaIndex="0" CellFormat-FormatString="N0" CellFormat-FormatType="Custom">
                </dx:PivotGridField>
            </Fields>

        </dx:ASPxPivotGrid>
    </div>
    <br />
    <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter2" runat="server"
        ASPxPivotGridID="PvDatos2">
        <OptionsPrint MergeColumnFieldValues="False">
        </OptionsPrint>
    </dx:ASPxPivotGridExporter>
    <br />
    <br />
    <div style="margin-left: 100px">
        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="DETALLE DOCUMENTOS" Font-Bold="true" Font-Size="X-Large"></dx:ASPxLabel>
    </div>
    <div>
        <dx:ASPxGridView ID="GvDetalleDoc" runat="server" OnToolbarItemClick="GvDetalleDoc_ToolbarItemClick" AutoGenerateColumns="False">
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Empresa" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Empresa_Nombre" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Modo" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Relacionada" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Relacionada_Nombre" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NSAP" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FContabilizacion" VisibleIndex="7">
                    <PropertiesTextEdit DisplayFormatString="dd-MM-yyyy">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Folio" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Total" VisibleIndex="9">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
            </Columns>
            <Toolbars>
                <dx:GridViewToolbar Position="Top">
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
             <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default"/>
            <Settings ShowFilterRow="True" ShowGroupPanel="True" AutoFilterCondition="Contains" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
              <FormatConditions>
                <dx:GridViewFormatConditionHighlight FieldName="Total" Expression="[Total] < 0" Format="RedText" />
            </FormatConditions>
        </dx:ASPxGridView>
    </div>
</asp:Content>
