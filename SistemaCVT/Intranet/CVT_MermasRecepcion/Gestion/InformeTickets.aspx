<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="InformeTickets.aspx.cs" Inherits="CVT_MermasRecepcion.Gestion.InformeTickets" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 15px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Gestion</a></li>
            <li><span id="current">Informe Tickets</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Informe Tickets</span>
        <span class="tab-end"></span>
        <%--        <div id="options">
            <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click1"
                    Style="height: 20px;" />
                Exportar Excel</a>&nbsp;

        </div>--%>
    </div>
    <br />
    <div>
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha Inicio"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteInicio" runat="server"></dx:ASPxDateEdit>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Fecha Termino"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteTermino" runat="server"></dx:ASPxDateEdit>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Area(opcional)"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboArea" runat="server" DataSourceID="LqsAreaSolicitada" TextField="Nombre" ValueField="Id_Area">
                        <ClearButton DisplayMode="Always">
                        </ClearButton>
                    </dx:ASPxComboBox>
                </td>
                <td></td>
                <td>
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" Height="41px" Width="88px" OnClick="btnBuscar_Click"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvTotalTick" runat="server" AutoGenerateColumns="False" OnToolbarItemClick="GvTotalTick_ToolbarItemClick">
            <Settings ShowTitlePanel="True" />
            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <Toolbars>
                <dx:GridViewToolbar>
                    <Items>
                        <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXls" />
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />
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
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <SettingsText Title="Total Tickets" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Total_Abiertos" VisibleIndex="2" Caption="Abiertos">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Total_EnProceso" VisibleIndex="3" Caption="En Proceso">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Total_Terminados" VisibleIndex="4" Caption="Terminados">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Area Asignada" FieldName="Id_Area" VisibleIndex="0">
                    <PropertiesComboBox DataSourceID="LqsAreaSolicitada" TextField="Nombre" ValueField="Id_Area">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="TotalTickets" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
            </Columns>

        </dx:ASPxGridView>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvTotalTiempo" runat="server" AutoGenerateColumns="False" OnToolbarItemClick="GvTotalTiempo_ToolbarItemClick">
            <Settings ShowTitlePanel="True" />
            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
            <Toolbars>
                <dx:GridViewToolbar>
                    <Items>
                        <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXls" />
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />
                            </Items>
                            <Image IconID="actions_download_16x16office2013"></Image>
                        </dx:GridViewToolbarItem>
                        <dx:GridViewToolbarItem Alignment="Left">
                            <Template>
                                <dx:ASPxButtonEdit ID="tbToolbarSearch1" runat="server" NullText="Search..." Height="100%">
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
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch1" />
            <SettingsText Title="Promedio Tiempo de respuesta en minutos" />
            <Columns>
                <dx:GridViewDataTextColumn Caption="Tiemp Prom Respuesta(Min)" FieldName="TProm_Respuesta" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Area Asignada" FieldName="Id_Area" VisibleIndex="0">
                    <PropertiesComboBox DataSourceID="LqsAreaSolicitada" TextField="Nombre" ValueField="Id_Area">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Categoria Ticket" FieldName="id_CategoriaTicket" VisibleIndex="1">
                    <PropertiesComboBox DataSourceID="LqsCategoria" TextField="Nombre" ValueField="id_CategoriaTicket">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Tipo Problema" FieldName="id_TipoProblema" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="LqsTipoProblema" TextField="NombreProblema" ValueField="id_TipoProblema">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
        </dx:ASPxGridView>
        <br />

        <asp:LinqDataSource runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" TableName="CVT_AreaTrabajo" EntityTypeName="" ID="LqsAreaSolicitada"></asp:LinqDataSource>

        <asp:LinqDataSource runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" TableName="CVT_Tickets_Categoria" EntityTypeName="" ID="LqsCategoria">
        </asp:LinqDataSource>

        <asp:LinqDataSource runat="server" ContextTypeName="DBMermasRecepcion.DBMLCVTDESAINTDataContext" TableName="CVT_Tickets_TipoProblema" EntityTypeName="" ID="LqsTipoProblema">
        </asp:LinqDataSource>

    </div>
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvFull" runat="server" AutoGenerateColumns="False" OnToolbarItemClick="GvFull_ToolbarItemClick" Width="1562px">
            <Settings ShowTitlePanel="True" />
            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
                  <Toolbars>
                <dx:GridViewToolbar>
                    <Items>
                        <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXls" />
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />
                            </Items>
                            <Image IconID="actions_download_16x16office2013"></Image>
                        </dx:GridViewToolbarItem>
                        <dx:GridViewToolbarItem Alignment="Left">
                            <Template>
                                <dx:ASPxButtonEdit ID="tbToolbarSearch2" runat="server" NullText="Search..." Height="100%">
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
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch2" />
            <SettingsText Title="Detalle Tickets" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Id_Ticket" VisibleIndex="0" Caption="Folio">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Categoria" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Problema" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="USuario" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FechHoraCreacion" VisibleIndex="4" Caption="Fech Creacion">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FechaTermino" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Estado" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Prioridad" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="AreaAsignada" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="EncargadoTicket" VisibleIndex="9" Caption="Encargado">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FechaTomaTicket" VisibleIndex="10" Caption="F TomaTicket">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Respuesta" VisibleIndex="11" MaxWidth="500" MinWidth="500" Width="500px">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>
    <br />

    <div></div>
</asp:Content>
