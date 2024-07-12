<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="EstadisticaVentasVendedoresBmas.aspx.cs" Inherits="CVT_MermasRecepcion.Comercial.EstadisticaVentasVendedoresBmas" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
     <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Mayorista</a></li>
            <li><span id="current">Estadisticas de Ventas</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Estadisticas de Ventas</span>
        <span class="tab-end"></span>
        <div id="options">
        <%--    <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="height: 20px;" />
                Exportar Excel</a>&nbsp;--%>
             <%-- <a>
                  <asp:ImageButton ID="cmdNew" runat="server"
                      ImageUrl="~/Images/nuevo.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>--%>
        </div>
    </div>
    <br />
    <div>
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Fecha Inicio"></asp:Label>
                </td>
                <td>
                    <dx:ASPxDateEdit ID="dteFinicio" runat="server"></dx:ASPxDateEdit>
                </td>
                <td>&nbsp;  &nbsp;  &nbsp;
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Fecha Termino"></asp:Label>
                </td>
                <td>
                    <dx:ASPxDateEdit ID="dteFTermino" runat="server"></dx:ASPxDateEdit>
                </td>
                <td>
                    <dx:ASPxButton ID="btnBuscar" runat="server" Text="ver" OnClick="btnBuscar_Click"></dx:ASPxButton>
                </td>
            </tr>
        </table>        
    </div>
    <br /> 
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" OnToolbarItemClick="GvDatos_ToolbarItemClick" AutoGenerateColumns="False">
            <SettingsPager PageSize="50">
            </SettingsPager>
            <SettingsBehavior AllowFocusedRow="True" />
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
                <dx:GridViewDataTextColumn FieldName="GrupoCliente" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cod_Cliente" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Razon_Social" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Telefono" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="E_Mail" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ItmsGrpCod" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ItmsGrpNam" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="U_SubCategoria" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="U_MarcaProducto" VisibleIndex="15">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Producto" VisibleIndex="16">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Descripcion" VisibleIndex="17">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="codum" VisibleIndex="18">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="BaseUM" VisibleIndex="19">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="20">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CantidadUnid" VisibleIndex="21">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Prec_Unitario" VisibleIndex="22">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Total_Linea" VisibleIndex="23">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Name_Indica" VisibleIndex="24">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Direccion" VisibleIndex="25">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Ciudad" VisibleIndex="26">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="TipoVenta" VisibleIndex="27">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Vendedor" VisibleIndex="28">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ProveedorPred" VisibleIndex="29">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NombreProveedor" VisibleIndex="30">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn VisibleIndex="31">
                </dx:GridViewDataTextColumn>
            </Columns>
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
