<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="PorcentajeUbicacionCV100.aspx.cs" Inherits="CVT_MermasRecepcion.ControlCierreMensual.BPT.PorcentajeUbicacionCV100" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="tableHeader">
        <span class="tableTitle">Porcentaje Ocupado</span>
        <span class="tab-end"></span>

    </div>
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>RRHH</a></li>
            <li><span id="current">Porcentaje Ocupado por Ubicacion</span></li>
        </ul>
    </div>
    <br />
    <div>
        <dx:ASPxLabel runat="server" Font-Bold="True" Text="Porcentajes CV100" Font-Size="Small"></dx:ASPxLabel>
        <%--  <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click" />
                Exportar Excel</a>


            <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="GvDatos">
            </dx:ASPxGridViewExporter>


        </div>--%>
    </div>
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" DataSourceID="LqDsRack" OnToolbarItemClick="GvDatos_ToolbarItemClick">
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
                        </dx:GridViewToolbarItem>
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
            <Columns>
                <dx:GridViewDataTextColumn Caption="Pasillo" FieldName="Layout_Y_Pasillo" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Bodega" FieldName="Warehouse_Description" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Espacios Disponibles" FieldName="Libre" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Espacios Ocupados" FieldName="Ocupado" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Total Espacios" FieldName="Total" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Porcentaje Ocupacion" FieldName="PorcOcupacion" VisibleIndex="5">
                    <PropertiesTextEdit DisplayFormatString="{0:n0}%">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsRack" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" TableName="CVT_VW_OcupacionRackCompletos">
        </asp:LinqDataSource>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxLabel runat="server" Font-Bold="True" Text="Porcentajes Rack/Pasillo" Font-Size="Small"></dx:ASPxLabel>
  <%--      <div id="options">
            <a>
                <asp:ImageButton ID="cmd_Excel2" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmd_Excel2_Click" />
                Exportar Excel</a>


            <dx:ASPxGridViewExporter ID="ASPxGridViewExporter2" runat="server" GridViewID="GvDatos2">
            </dx:ASPxGridViewExporter>


        </div>--%>
    </div>
    <div>
        <dx:ASPxGridView ID="GvDatos2" runat="server" AutoGenerateColumns="False" DataSourceID="LqDsPosRack" OnToolbarItemClick="GvDatos2_ToolbarItemClick">
            <SettingsPager PageSize="40">
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
                        </dx:GridViewToolbarItem>                     
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Layout_Y_Pasillo" VisibleIndex="0" Caption="Pasillo">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Layout_ShortDescription" VisibleIndex="1" Caption="Ubicacion Corta">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Layout_Description" VisibleIndex="2" Caption="Ubicacion">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CantUbicacion" VisibleIndex="3" Caption="Racks Actuales">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CapUbicacion" VisibleIndex="4" Caption="Capacidad Racks">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Disponible" VisibleIndex="5" Caption="Racks Disponibles">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PorcOcupacion" VisibleIndex="6" Caption="Porc. Ocupacion Racks">
                    <PropertiesTextEdit DisplayFormatString="{0:n0}%">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CapPasillo" VisibleIndex="7" Caption="Capacidad Pasillo">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CantPalletPasillo" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PorcOcupacionPasillo" VisibleIndex="9">
                    <PropertiesTextEdit DisplayFormatString="{0:n0}%">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />

        </dx:ASPxGridView>
        <asp:LinqDataSource ID="LqDsPosRack" runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTWMSDataContext" EntityTypeName="" TableName="CVT_VW_OcupacionPosicionesRack">
        </asp:LinqDataSource>
    </div>
</asp:Content>
