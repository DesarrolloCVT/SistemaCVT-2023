<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EstadisticaVentasRapel.aspx.cs" Inherits="CVT_MermasRecepcion.Comercial.EstadisticaVentasRapel" %>

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
            <li><a>Comercial</a></li>
            <li><span id="current">Estadisticas de Ventas Rapel</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Estadisticas de Ventas Rapel</span>
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
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsPager PageSize="50">
            </SettingsPager>
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
                <dx:GridViewDataTextColumn FieldName="Cod_Cliente" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Razon_Social" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cod.Familia" FieldName="ItmsGrpCod" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Familia" FieldName="ItmsGrpNam" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Producto" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Descripcion" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="15">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Prec_Unitario" VisibleIndex="16">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Costo" VisibleIndex="17">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Total_Linea" VisibleIndex="18">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Name_Indica" VisibleIndex="19">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Prc_Rapel" VisibleIndex="20">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Prec_SinRapel" VisibleIndex="21">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ShipToCode" VisibleIndex="22">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Direccion" VisibleIndex="23">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Ciudad" VisibleIndex="24">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TipoVenta" VisibleIndex="25">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CostoFinal" VisibleIndex="26">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Peso" VisibleIndex="27">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Marca" VisibleIndex="28">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Canal" VisibleIndex="29">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TipoNegocio" VisibleIndex="30">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Vendedor" VisibleIndex="31">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TipoMarca" VisibleIndex="32">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="OC_Referencia" VisibleIndex="33">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="VendedorDireccion" VisibleIndex="34">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MedidaVentas" VisibleIndex="35">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CantidadMedidaVentas" VisibleIndex="36">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MedidaEmbalaje" VisibleIndex="37">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CantidadxPaquete" VisibleIndex="38">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PastaColiseo" VisibleIndex="39">
                    <PropertiesTextEdit DisplayFormatString="N4">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TPastaColiseo" VisibleIndex="40">
                    <PropertiesTextEdit DisplayFormatString="N4">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LA_Coliseo_CM" VisibleIndex="41">
                    <PropertiesTextEdit DisplayFormatString="N4">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TLA_Coliseo_CM" VisibleIndex="42">
                    <PropertiesTextEdit DisplayFormatString="N4">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LA_Coliseo_W" VisibleIndex="43">
                    <PropertiesTextEdit DisplayFormatString="N4">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TLA_Coliseo_W" VisibleIndex="44">
                    <PropertiesTextEdit DisplayFormatString="N4">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LA_MMPP_W" VisibleIndex="45">
                    <PropertiesTextEdit DisplayFormatString="N4">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TLA_MMPP_W" VisibleIndex="46">
                    <PropertiesTextEdit DisplayFormatString="N4">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Centralizacion" VisibleIndex="47">
                    <PropertiesTextEdit DisplayFormatString="N4">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TCentralizacion" VisibleIndex="48">
                    <PropertiesTextEdit DisplayFormatString="N4">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Merma" VisibleIndex="49">
                    <PropertiesTextEdit DisplayFormatString="N4">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TMerma" VisibleIndex="50">
                    <PropertiesTextEdit DisplayFormatString="N4">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Distrib_Cent_MMPP" VisibleIndex="51">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TDistrib_Cent_MMPP" VisibleIndex="52">
                    <PropertiesTextEdit DisplayFormatString="N4">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Distrib_Cent_Rest_Surtido" VisibleIndex="53">
                    <PropertiesTextEdit DisplayFormatString="N4">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TDistrib_Cent_Rest_Surtido" VisibleIndex="54">
                    <PropertiesTextEdit DisplayFormatString="N4">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Extranet_Rest_Surtido" VisibleIndex="55">
                    <PropertiesTextEdit DisplayFormatString="N4">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TExtranet_Rest_Surtido" VisibleIndex="56">
                    <PropertiesTextEdit DisplayFormatString="N4">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Rebate_Fijo" VisibleIndex="57">
                    <PropertiesTextEdit DisplayFormatString="N4">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TRebate_Fijo" VisibleIndex="58">
                    <PropertiesTextEdit DisplayFormatString="N4">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Reposicion_Int_SellOut" VisibleIndex="59">
                    <PropertiesTextEdit DisplayFormatString="N4">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TReposicion_Int_SellOut" VisibleIndex="60">
                    <PropertiesTextEdit DisplayFormatString="N4">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NoDevolucion" VisibleIndex="61">
                    <PropertiesTextEdit DisplayFormatString="N4">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TNoDevolucion" VisibleIndex="62">
                    <PropertiesTextEdit DisplayFormatString="N4">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PEL" VisibleIndex="63">
                    <PropertiesTextEdit DisplayFormatString="N4">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TPEL" VisibleIndex="64">
                    <PropertiesTextEdit DisplayFormatString="N4">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CobroFianza" VisibleIndex="65">
                    <PropertiesTextEdit DisplayFormatString="N4">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TCobroFianza" VisibleIndex="66">
                    <PropertiesTextEdit DisplayFormatString="N4">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalRapel" VisibleIndex="67">
                    <PropertiesTextEdit DisplayFormatString="N4">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TTotalRapel" VisibleIndex="68">
                    <PropertiesTextEdit DisplayFormatString="N4">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FolioRefFC" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ComentariosNC" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalSinRapel" VisibleIndex="69">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PrcComision" VisibleIndex="71" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TotalComision" VisibleIndex="72" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TipoComision" VisibleIndex="70" Visible="False">
                </dx:GridViewDataTextColumn>
            </Columns>
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
        </dx:ASPxGridView>
    </div>
</asp:Content>
