<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="ResumenAsistenciaArea.aspx.cs" Inherits="CVT_MermasRecepcion.RRHH.ResumenAsistenciaArea" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 16px;
        }
        .auto-style6 {
            width: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>RHH</a></li>
            <li><span id="current">Resumen Asistencia Area</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Resumen Asistencia Area</span>
        <span class="tab-end"></span>
        <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click1"
                    Style="height: 20px;" />
                Exportar Excel</a>&nbsp;

             
             <%-- <a>
                  <asp:ImageButton ID="cmdNew" runat="server"
                      ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>--%>
        </div>
    </div>
    <br>
    <div>
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha Inicio"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteInicio" runat="server" Height="30px"></dx:ASPxDateEdit>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Fecha Termino"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteTermino" runat="server" Height="30px"></dx:ASPxDateEdit>
                </td>
                <td class="auto-style6"></td>
                <td>
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" Height="49px" Width="67px"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>
        <dx:ASPxPivotGrid ID="PvDatos" runat="server" ClientIDMode="AutoID">

            <Fields>
                <dx:PivotGridField ID="fieldRUN" FieldName="RUN" Name="fieldRUN" Visible="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldTrabajador" Area="DataArea" AreaIndex="0" FieldName="Trabajador" Name="fieldTrabajador" SummaryType="Count">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldLabor" Area="RowArea" AreaIndex="1" FieldName="Labor" Name="fieldLabor">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldArea" Area="RowArea" AreaIndex="0" FieldName="Area" Name="fieldArea">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldFecha" Area="ColumnArea" AreaIndex="0" FieldName="Fecha" Name="fieldFecha">
                </dx:PivotGridField>
            </Fields>
            <OptionsPager RowsPerPage="30">
            </OptionsPager>
        </dx:ASPxPivotGrid>
        <dx:ASPxPivotGridExporter ID="ASPxPivotGridExporter" runat="server"
            ASPxPivotGridID="PvDatos">
        </dx:ASPxPivotGridExporter>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Registro Inconsistencia" Font-Size="Large"></dx:ASPxLabel>
    </div>
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Fecha" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Hora_Entrada" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Hora_Salida" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cant.Registros" FieldName="CantidaRegistro" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Area" FieldName="Id_Area" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="Areas" TextField="Nombre" ValueField="Id_Area">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Labores" FieldName="Id_Labores" VisibleIndex="3">
                    <PropertiesComboBox DataSourceID="Labores" TextField="Nombre" ValueField="Id_Labores">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Run" FieldName="Id_Personal" VisibleIndex="1">
                    <PropertiesComboBox DataSourceID="Personal" ValueField="pin">
                        <Columns>
                            <dx:ListBoxColumn Caption="RUN" FieldName="pin">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Nombre" FieldName="name">
                            </dx:ListBoxColumn>
                            <dx:ListBoxColumn Caption="Apellido" FieldName="last_name">
                            </dx:ListBoxColumn>
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
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
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsPager PageSize="50">
            </SettingsPager>
            <Settings ShowFilterRow="True" ShowGroupPanel="True" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="Areas" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_AreaTrabajo">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="Labores" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" EntityTypeName="" TableName="CVT_LaboresExternas">
        </asp:LinqDataSource>
        <asp:LinqDataSource ID="Personal" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTControlBIODataContext" EntityTypeName="" TableName="pers_person" Select="new (name, last_name, pin)">
        </asp:LinqDataSource>
    </div>
    <br />
</asp:Content>
