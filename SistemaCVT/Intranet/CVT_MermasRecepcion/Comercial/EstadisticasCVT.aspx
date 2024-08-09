<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="EstadisticasCVT.aspx.cs" Inherits="CVT_MermasRecepcion.Comercial.EstadisticasCVT" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Data.Linq" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Comercial</a></li>
            <li><span id="current">Estadisticas CVT</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Estadisticas CVT</span>
        <span class="tab-end"></span>
    </div>
    <div>
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="lbl1" runat="server" Text="Fecha Inicio"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteFinicio" runat="server" Height="30px"></dx:ASPxDateEdit>
                </td>
                <td></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha Termino"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteFtermino" runat="server" Height="30px"></dx:ASPxDateEdit>
                </td>
                <td></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Tipo Informe"></dx:ASPxLabel>
                    <dx:ASPxComboBox ID="cboTipoInforme" runat="server" Height="30px" Width="250px">
                        <Items>
                            <dx:ListEditItem Text="Inf. Completo" Value="1" />
                            <dx:ListEditItem Text="Inf. Rapel" Value="2" />
                            <dx:ListEditItem Text="Inf.Comision" Value="3" />
                            <dx:ListEditItem Text="Inf.Seguro" Value="5" />
                            <dx:ListEditItem Text="Inf . Estadistica Fuerza de Ventas" Value="6" />
                            <dx:ListEditItem Text="Inf . Rentabilidad" Value="7" />
                        </Items>
                    </dx:ASPxComboBox>
                </td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Valor Pallet x KM">
                    </dx:ASPxLabel>
                    <dx:ASPxTextBox ID="txtValorKM" runat="server" Width="170px" Text="0">
                    </dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" Height="66px" OnClick="btnBuscar_Click" Width="103px">
                        <ClientSideEvents Click="function(s, e) {
	LoadingPanel.Show();
}" />
                    </dx:ASPxButton>
                </td>

            </tr>
        </table>
    </div>
    <br />
    <br />
    <div id="DivLoad"></div>
    <dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel"
        Modal="True" Text="Cargando Datos ..." Height="100px" HorizontalAlign="Center" VerticalAlign="Bottom" Width="424px" ContainerElementID="DivLoad" Theme="iOS">
    </dx:ASPxLoadingPanel>
    <div id="DivGrillaTodos" runat="server" visible="false">
        <div>
            <dx:ASPxGridView ID="GvDatoTodos" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" OnToolbarItemClick="GvDatoTodos_ToolbarItemClick">
                <SettingsPager PageSize="100">
                </SettingsPager>
                <Settings ShowFilterRow="True" />
                <SettingsPopup>
                    <FilterControl AutoUpdatePosition="False"></FilterControl>
                </SettingsPopup>
                <Toolbars>
                    <dx:GridViewToolbar Position="Top">
                        <Items>
                            <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                                <Items>
                                    <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                    <dx:GridViewToolbarItem Command="ExportToXls" />
                                    <dx:GridViewToolbarItem Command="ExportToCsv" />
                                </Items>

                                <Image IconID="actions_download_16x16office2013"></Image>
                            </dx:GridViewToolbarItem>
                        </Items>
                    </dx:GridViewToolbar>
                </Toolbars>
                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />

                <Columns>
                    <dx:GridViewDataTextColumn FieldName="TIPO" ReadOnly="True" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="TipoDocumento" ReadOnly="True" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Mes" ReadOnly="True" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Año" ReadOnly="True" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="F_Cont" ReadOnly="True" VisibleIndex="4">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataDateColumn FieldName="F_Venc" ReadOnly="True" VisibleIndex="5">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="Comp_Conta" ReadOnly="True" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Folio" ReadOnly="True" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Num_Interno" ReadOnly="True" VisibleIndex="8">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Indicador" ReadOnly="True" VisibleIndex="9">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="GrupoCliente" ReadOnly="True" VisibleIndex="10">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CodCliente" ReadOnly="True" VisibleIndex="11">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="RazonSocial" ReadOnly="True" VisibleIndex="12">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="GrupoArticulo" ReadOnly="True" VisibleIndex="13">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CodigoArticulo" ReadOnly="True" VisibleIndex="14">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Descripcion" ReadOnly="True" VisibleIndex="15">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Cantidad" ReadOnly="True" VisibleIndex="16">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="PrecioUnitario" ReadOnly="True" VisibleIndex="17">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="TotalLinea" ReadOnly="True" VisibleIndex="18">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Costo" ReadOnly="True" VisibleIndex="19">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CostoTotal" ReadOnly="True" VisibleIndex="20">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Prc_Rapel" ReadOnly="True" VisibleIndex="21">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="TotalRapel" ReadOnly="True" VisibleIndex="22">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Total_SinRapel" ReadOnly="True" VisibleIndex="23">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="PesoTotal" ReadOnly="True" VisibleIndex="24">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="CodDireccion" ReadOnly="True" VisibleIndex="25">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Direccion" ReadOnly="True" VisibleIndex="26">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Ciudad" ReadOnly="True" VisibleIndex="27">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Num_Region" ReadOnly="True" VisibleIndex="28">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Comuna" ReadOnly="True" VisibleIndex="29">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Transporte" ReadOnly="True" VisibleIndex="30">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Distancia" ReadOnly="True" VisibleIndex="31">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ValorTransporte" ReadOnly="True" VisibleIndex="31">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="ValorProductoTransporte" ReadOnly="True" VisibleIndex="31">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="PalletEstandar" ReadOnly="True" VisibleIndex="32">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BasePalletizado" ReadOnly="True" VisibleIndex="33">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Vendedor" ReadOnly="True" VisibleIndex="34">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Marca" ReadOnly="True" VisibleIndex="35">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Canal" ReadOnly="True" VisibleIndex="36">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="GrupoVenta" ReadOnly="True" VisibleIndex="37">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="EmpresaRelacionada" ReadOnly="True" VisibleIndex="38">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="TipoMarca" ReadOnly="True" VisibleIndex="39">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="UM_Vendida" ReadOnly="True" VisibleIndex="40">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Um_Embalaje" ReadOnly="True" VisibleIndex="41">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="EmbalajePorUM" ReadOnly="True" VisibleIndex="42">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="UnidadesVendidas" ReadOnly="True" VisibleIndex="43">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="TipoDocRef" ReadOnly="True" VisibleIndex="44">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="NumDocREF" ReadOnly="True" VisibleIndex="45">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Comentario" ReadOnly="True" VisibleIndex="46">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="PrcR_Acuerdo" ReadOnly="True" VisibleIndex="47">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="TotalR_Acuerdo" ReadOnly="True" VisibleIndex="48">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="PrcR_Centra" ReadOnly="True" VisibleIndex="49">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="TotalR_Centra" ReadOnly="True" VisibleIndex="50">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="PrcR_RepoInt" ReadOnly="True" VisibleIndex="51">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="TotalR_RepoInt" ReadOnly="True" VisibleIndex="52">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="PrcR_Daymon" ReadOnly="True" VisibleIndex="53">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="TotalR_Daymon" ReadOnly="True" VisibleIndex="54">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="PrcR_LogAuto" ReadOnly="True" VisibleIndex="55">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="TotalR_LogAuto" ReadOnly="True" VisibleIndex="56">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="PrcR_MermaCero" ReadOnly="True" VisibleIndex="57">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="TotalR_MermaCero" ReadOnly="True" VisibleIndex="58">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="PrcR_Plataforma" ReadOnly="True" VisibleIndex="59">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="TotalR_Plataforma" ReadOnly="True" VisibleIndex="60">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="PrcR_FCRappel" ReadOnly="True" VisibleIndex="61">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="TotalR_FCRappel" ReadOnly="True" VisibleIndex="62">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Pcr_Comision" ReadOnly="True" VisibleIndex="63">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="TipoComision" ReadOnly="True" VisibleIndex="64">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="TotalComision" ReadOnly="True" VisibleIndex="65">
                    </dx:GridViewDataTextColumn>
                </Columns>

            </dx:ASPxGridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SBO_CVTRADINGConnectionString %>" SelectCommand="SP_EstadisticasVentasCVT_Copia_Test" SelectCommandType="StoredProcedure" OnSelecting="SqlDataSource1_Selecting">
                <SelectParameters>
                    <%-- <asp:ControlParameter ControlID="dteFinicio" DbType="Date" DefaultValue="" Name="FechaDesde" PropertyName="Value" />
                    <asp:ControlParameter ControlID="dteFtermino" DbType="Date" Name="fechaHasta" PropertyName="Value" />--%>
                    <%--  <asp:ControlParameter ControlID="cboTipoInforme" Name="TipoInforme" PropertyName="Value" Type="Int32" />--%>
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
    <div id="DivGrillaRapel" runat="server" visible="false">
        <dx:ASPxGridView ID="GvEstadisticaRapel" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataRapel" OnToolbarItemClick="GvEstadisticaRapel_ToolbarItemClick">
            <SettingsPager PageSize="100">
            </SettingsPager>
            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
             <Toolbars>
                    <dx:GridViewToolbar Position="Top">
                        <Items>
                            <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                                <Items>
                                    <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                    <dx:GridViewToolbarItem Command="ExportToXls" />
                                    <dx:GridViewToolbarItem Command="ExportToCsv" />
                                </Items>

                                <Image IconID="actions_download_16x16office2013"></Image>
                            </dx:GridViewToolbarItem>
                        </Items>
                    </dx:GridViewToolbar>
                </Toolbars>
                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="TIPO" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Mes" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="F_Cont" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Folio" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodCliente" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="RazonSocial" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="GrupoArticulo" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodigoArticulo" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Descripcion" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PrecioUnitario" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalLinea" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodDireccion" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Ciudad" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Marca" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Vendedor" VisibleIndex="15">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TipoMarca" VisibleIndex="16">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NumDocREF" VisibleIndex="17">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PrcR_Centra" VisibleIndex="18">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalR_Centra" VisibleIndex="19">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PrcR_RepoInt" VisibleIndex="20">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalR_RepoInt" VisibleIndex="21">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PrcR_Daymon" VisibleIndex="22">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalR_Daymon" VisibleIndex="23">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PrcR_LogAuto" VisibleIndex="24">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalR_LogAuto" VisibleIndex="25">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PrcR_MermaCero" VisibleIndex="26">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalR_MermaCero" VisibleIndex="27">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PrcR_Plataforma" VisibleIndex="28">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalR_Plataforma" VisibleIndex="29">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PrcR_Acuerdo" VisibleIndex="30">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalR_Acuerdo" VisibleIndex="31">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PrcR_FCRappel" VisibleIndex="32">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalR_FCRappel" VisibleIndex="33">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Prc_Rapel" VisibleIndex="34">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalRapel" VisibleIndex="35">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Total_SinRapel" VisibleIndex="36">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataRapel" runat="server" ConnectionString="<%$ ConnectionStrings:SBO_CVTRADINGConnectionString %>" SelectCommand="SP_EstadisticasVentasCVT_Copia_Test" SelectCommandType="StoredProcedure" OnSelecting="SqlDataRapel_Selecting">
            <SelectParameters>
                <%--  <asp:ControlParameter ControlID="dteFinicio" DbType="Date" Name="FechaDesde" PropertyName="Value" />
                  <asp:ControlParameter ControlID="dteFtermino" DbType="Date" Name="fechaHasta" PropertyName="Value" />
                  <asp:Parameter Name="TipoInforme" Type="Int32" />--%>
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

    <div id="DivGrillaComision" runat="server" visible="false">
        <dx:ASPxGridView ID="GvEstadisticaComision" runat="server" AutoGenerateColumns="False" DataSourceID="SqlsDataComision" OnToolbarItemClick="GvEstadisticaComision_ToolbarItemClick">
            <SettingsPager PageSize="100">
            </SettingsPager>
            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
             <Toolbars>
                    <dx:GridViewToolbar Position="Top">
                        <Items>
                            <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                                <Items>
                                    <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                    <dx:GridViewToolbarItem Command="ExportToXls" />
                                    <dx:GridViewToolbarItem Command="ExportToCsv" />
                                </Items>

                                <Image IconID="actions_download_16x16office2013"></Image>
                            </dx:GridViewToolbarItem>
                        </Items>
                    </dx:GridViewToolbar>
                </Toolbars>
                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="TIPO" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Mes" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="F_Cont" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="F_Venc" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Folio" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodCliente" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="RazonSocial" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="GrupoArticulo" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodigoArticulo" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Descripcion" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalLinea" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="GrupoVenta" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Vendedor" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Total_SinRapel" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TipoComision" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Pcr_Comision" VisibleIndex="15">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalComision" VisibleIndex="16">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlsDataComision" runat="server" ConnectionString="<%$ ConnectionStrings:SBO_CVTRADINGConnectionString %>" SelectCommand="SP_EstadisticasVentasCVT_Copia_Test" SelectCommandType="StoredProcedure" OnSelecting="SqlsDataComision_Selecting">
            <SelectParameters>
                <asp:Parameter DbType="Date" Name="FechaDesde" />
                <asp:Parameter DbType="Date" Name="fechaHasta" />
                <asp:Parameter Name="TipoInforme" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <div id="DivGrillaSeguro" runat="server" visible="false">
        <dx:ASPxGridView ID="GvEstadisticasSeguro" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSeguro" OnToolbarItemClick="GvEstadisticaVendedores_ToolbarItemClick">
            <SettingsPager PageSize="100">
            </SettingsPager>
            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
              <Toolbars>
                    <dx:GridViewToolbar Position="Top">
                        <Items>
                            <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                                <Items>
                                    <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                    <dx:GridViewToolbarItem Command="ExportToXls" />
                                    <dx:GridViewToolbarItem Command="ExportToCsv" />
                                </Items>

                                <Image IconID="actions_download_16x16office2013"></Image>
                            </dx:GridViewToolbarItem>
                        </Items>
                    </dx:GridViewToolbar>
                </Toolbars>
                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Tipo" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Mes" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Año" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="F_Cont" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="F_Venc" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Folio" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Num_Inter" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodCliente" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="RazonSocial" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="GrupoArticulo" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodigoArticulo" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Descripcion" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PrecUnitario" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Costo" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalLinea" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LineaCreditoUF" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Nom_Inn" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CondicionPago" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Indicador" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FechaIni_LC" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FechaTer_LC" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSeguro" runat="server" ConnectionString="<%$ ConnectionStrings:SBO_CVTRADINGConnectionString %>" SelectCommand="SP_EstadisticasVentasCVT_Copia_Test" SelectCommandType="StoredProcedure" OnSelecting="SqlDataSeguro_Selecting">
            <SelectParameters>
                <asp:Parameter DbType="Date" Name="FechaDesde" />
                <asp:Parameter DbType="Date" Name="fechaHasta" />
                <asp:Parameter Name="TipoInforme" Type="Int32" />
                <asp:Parameter Name="ValorKM"  Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <div id="DivGrillaVendedores" runat="server" visible="false">
        <dx:ASPxGridView ID="GvEstadisticaVendedores" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataVendedores" OnToolbarItemClick="GvEstadisticaVendedores_ToolbarItemClick">
            <SettingsPager PageSize="100">
            </SettingsPager>
            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
              <Toolbars>
                    <dx:GridViewToolbar Position="Top">
                        <Items>
                            <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                                <Items>
                                    <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                    <dx:GridViewToolbarItem Command="ExportToXls" />
                                    <dx:GridViewToolbarItem Command="ExportToCsv" />
                                </Items>

                                <Image IconID="actions_download_16x16office2013"></Image>
                            </dx:GridViewToolbarItem>
                        </Items>
                    </dx:GridViewToolbar>
                </Toolbars>
                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="TIPO" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Mes" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Año" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="F_Cont" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="F_Venc" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Folio" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodCliente" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="RazonSocial" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="GrupoArticulo" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodigoArticulo" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Descripcion" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalLinea" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Total_SinRapel" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="GrupoVenta" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Vendedor" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataVendedores" runat="server" ConnectionString="<%$ ConnectionStrings:SBO_CVTRADINGConnectionString %>" SelectCommand="SP_EstadisticasVentasCVT_Copia_Test" SelectCommandType="StoredProcedure" OnSelecting="SqlDataVendedores_Selecting">
            <SelectParameters>
                <asp:Parameter DbType="Date" Name="FechaDesde" />
                <asp:Parameter DbType="Date" Name="fechaHasta" />
                <asp:Parameter Name="TipoInforme" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

    <div id="DivRentabilidad" runat="server" visible="false">
        <dx:ASPxGridView ID="GvEstadisticaRentabilidad" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataRentabilidad" OnToolbarItemClick="GvEstadisticaRentabilidad_ToolbarItemClick">
            <SettingsPager PageSize="100">
            </SettingsPager>
            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>
             <Toolbars>
                    <dx:GridViewToolbar Position="Top">
                        <Items>
                            <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                                <Items>
                                    <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                    <dx:GridViewToolbarItem Command="ExportToXls" />
                                    <dx:GridViewToolbarItem Command="ExportToCsv" />
                                </Items>

                                <Image IconID="actions_download_16x16office2013"></Image>
                            </dx:GridViewToolbarItem>
                        </Items>
                    </dx:GridViewToolbar>
                </Toolbars>
                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="F_Cont" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Folio" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Indicador" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodCliente" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="RazonSocial" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="GrupoArticulo" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodigoArticulo" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Descripcion" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Marca" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Vendedor" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="BasePalletizado" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PrecioUnitario" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalLinea" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Costo" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CostoTotal" VisibleIndex="15">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalRapel" VisibleIndex="16">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalComision" VisibleIndex="17">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Transporte" ReadOnly="True" VisibleIndex="18">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Distancia" ReadOnly="True" VisibleIndex="19">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ValorTransporte" ReadOnly="True" VisibleIndex="20">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ValorProductoTransporte" ReadOnly="True" VisibleIndex="21">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataRentabilidad" runat="server" ConnectionString="<%$ ConnectionStrings:SBO_CVTRADINGConnectionString %>" SelectCommand="SP_EstadisticasVentasCVT_Copia_Test" SelectCommandType="StoredProcedure" OnSelecting="SqlDataRentabilidad_Selecting">
            <SelectParameters>
                <asp:Parameter DbType="Date" Name="FechaDesde" />
                <asp:Parameter DbType="Date" Name="fechaHasta" />
                <asp:Parameter Name="TipoInforme" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>
