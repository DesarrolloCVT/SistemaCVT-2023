<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EstadisticasVentasRapel2023.aspx.cs" Inherits="CVT_MermasRecepcion.Comercial.EstadisticasVentasRapel2023" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Comercial</a></li>
            <li><span id="current">Estadisticas de Ventas Rapel desde el 2023</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Estadisticas de Ventas Rapel desde el 2023</span>
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

    <div style="margin-left: 50px">
        <table>
            <tr>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Fecha inicio" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteFini" runat="server"></dx:ASPxDateEdit>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Fecha Termino" Font-Size="Medium" Font-Bold="true"></dx:ASPxLabel>
                    <dx:ASPxDateEdit ID="dteTermino" runat="server"></dx:ASPxDateEdit>
                </td>
                <td class="auto-style5"></td>
                <td>
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" Height="50px" OnClick="btnBuscar_Click" Width="93px"></dx:ASPxButton>
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatosEstVentas2023" runat="server" AutoGenerateColumns="False" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
           
            </SettingsPopup>
                 <settingspager pagesize="50">
                </settingspager>
                <toolbars>
                    <dx:GridViewToolbar Position="Top">
                        <items>
                            <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                                <items>
                                    <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                    <dx:GridViewToolbarItem Command="ExportToXls" />
                                    <dx:GridViewToolbarItem Command="ExportToCsv" />
                                </items>

                                <image iconid="actions_download_16x16office2013"></image>
                            </dx:GridViewToolbarItem>
                            <dx:GridViewToolbarItem Alignment="Left">
                                <template>
                                    <dx:ASPxButtonEdit ID="tbToolbarSearch" runat="server" NullText="Search..." Height="100%">
                                        <buttons>
                                            <dx:SpinButtonExtended Image-IconID="find_find_16x16gray" />
                                        </buttons>
                                    </dx:ASPxButtonEdit>
                                </template>
                            </dx:GridViewToolbarItem>
                        </items>
                    </dx:GridViewToolbar>
                </toolbars>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsBehavior AllowFocusedRow="True" />

            <SettingsPopup>
                <FilterControl AutoUpdatePosition="False"></FilterControl>
            </SettingsPopup>

            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Tipo" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Mes" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Fecha_Contab" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Fec_Vencto" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Comp_Contable" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Folio" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Num_Interno" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cod_Cliente" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Razon_Social" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ItmsGrpCod" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ItmsGrpNam" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Producto" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Descripcion" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Prec_Unitario" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Costo" VisibleIndex="15">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Total_Linea" VisibleIndex="16">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Name_Indica" VisibleIndex="17">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Prc_Rapel" VisibleIndex="18">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Prec_SinRapel" VisibleIndex="19">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ShipToCode" VisibleIndex="20">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Direccion" VisibleIndex="21">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Ciudad" VisibleIndex="22">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TipoVenta" VisibleIndex="23">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CostoFinal" VisibleIndex="24">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Peso" VisibleIndex="25">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Marca" VisibleIndex="26">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Canal" VisibleIndex="27">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TipoNegocio" VisibleIndex="28">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Vendedor" VisibleIndex="29">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TipoMarca" VisibleIndex="30">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="OC_Referencia" VisibleIndex="31">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="VendedorDireccion" VisibleIndex="32">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MedidaVentas" VisibleIndex="33">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CantidadMedidaVentas" VisibleIndex="34">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MedidaEmbalaje" VisibleIndex="35">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CantidadxPaquete" VisibleIndex="36">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FolioRefFC" VisibleIndex="37">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ComentariosNC" VisibleIndex="38">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Centralizacion" VisibleIndex="39">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="RepoInt" VisibleIndex="41">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Daymon" VisibleIndex="43">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Log_Auto" VisibleIndex="45">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Merma_Cero" VisibleIndex="47">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalRapel" VisibleIndex="55">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TTotalRapel" VisibleIndex="56">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalSinRapel" VisibleIndex="57">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TipoComision" VisibleIndex="58">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PrcComision" VisibleIndex="59">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalComision" VisibleIndex="60">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TCentralizacion" VisibleIndex="40">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TRepoInt" VisibleIndex="42">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TDaymon" VisibleIndex="44">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TLog_Auto" VisibleIndex="46">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TMermaCero" VisibleIndex="48">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Plataforma" VisibleIndex="49">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TPlataforma" VisibleIndex="50">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Acuerdo" VisibleIndex="51">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TAcuerdo" VisibleIndex="52">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FcRapel" VisibleIndex="53">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TFcRapel" VisibleIndex="54">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>
</asp:Content>
