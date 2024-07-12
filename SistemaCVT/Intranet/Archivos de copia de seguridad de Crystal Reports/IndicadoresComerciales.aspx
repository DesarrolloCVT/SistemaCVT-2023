<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="IndicadoresComerciales.aspx.cs" Inherits="CVT_MermasRecepcion.Mayorista.IndicadoresComerciales" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Mayorista</a></li>
            <li><span id="current">Indicadores Comerciales</span></li>
        </ul>
    </div>
    <div id="tableHeader">
        <span class="tableTitle">Indicadores Comerciales</span>
        <span class="tab-end"></span>
        <div id="options">
            <%--     <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px; height: 20px;" />
                Exportar Excel</a>&nbsp;--%>
            <%--     <a>
                  <asp:ImageButton ID="cmdNew" runat="server"
                      ImageUrl="~/Images/nuevo.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>--%>
        </div>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Indicadores Globales Venta" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
        <br />
        <dx:ASPxGridView ID="GvDatosA" runat="server" OnToolbarItemClick="GvDatosA_ToolbarItemClick" AutoGenerateColumns="False">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Hoy" VisibleIndex="0">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Ayer" VisibleIndex="1">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="AcumuladoMes" VisibleIndex="2">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MesAnteriorMismoDia" VisibleIndex="3">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PromedioDiario" VisibleIndex="4">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ProyeccionMes" VisibleIndex="5">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="AcumuladaMesAnterior" VisibleIndex="6">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DiasHabilesHoy" VisibleIndex="7">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="DiasHabilesMes" VisibleIndex="8">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
            </Columns>
            <Toolbars>
                <dx:GridViewToolbar >
                    <Items>
                        <dx:GridViewToolbarItem Text="Exportar" Name="ExportA" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXls" />
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                <dx:GridViewToolbarItem Command="ExportToCsv" />
                            </Items>
                            <Image IconID="actions_download_16x16office2013"></Image>
                        </dx:GridViewToolbarItem>
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
        </dx:ASPxGridView>
    </div>
    <br />
    <br />
    <div>
        <div style="display: inline-block">
            <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Ventas por Tipo de Clientes Mes Actual" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
            <br />
            <dx:ASPxGridView ID="GvDatosB" runat="server" OnToolbarItemClick="GvDatosB_ToolbarItemClick" AutoGenerateColumns="False">        
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="TipoCliente" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="TotalVentaMesActual" VisibleIndex="1">
                        <PropertiesTextEdit DisplayFormatString="N0">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                </Columns>
                <Toolbars>
                    <dx:GridViewToolbar >
                        <Items>
                            <dx:GridViewToolbarItem Text="Exportar" Name="ExportB" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                                <Items>
                                    <dx:GridViewToolbarItem Command="ExportToXls" />
                                    <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                    <dx:GridViewToolbarItem Command="ExportToCsv" />
                                </Items>
                                <Image IconID="actions_download_16x16office2013"></Image>
                            </dx:GridViewToolbarItem>
                        </Items>
                    </dx:GridViewToolbar>
                </Toolbars>
                <Settings ShowFilterRow="True" />
                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            </dx:ASPxGridView>
        </div>
        <div style="margin-left: 35px; display: inline-block">
            <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Ventas por Tipo de Clientes Mes Anterior" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
            <br />
            <dx:ASPxGridView ID="GvDatosC" runat="server" OnToolbarItemClick="GvDatosC_ToolbarItemClick" AutoGenerateColumns="False">          
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="TipoCliente" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="TotalVentaMesAnterior" VisibleIndex="1">
                        <PropertiesTextEdit DisplayFormatString="N0">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                </Columns>
                <Toolbars>
                    <dx:GridViewToolbar >
                        <Items>
                            <dx:GridViewToolbarItem Text="Exportar" Name="ExportC" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                                <Items>
                                    <dx:GridViewToolbarItem Command="ExportToXls" />
                                    <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                    <dx:GridViewToolbarItem Command="ExportToCsv" />
                                </Items>
                                <Image IconID="actions_download_16x16office2013"></Image>
                            </dx:GridViewToolbarItem>
                        </Items>
                    </dx:GridViewToolbar>
                </Toolbars>
                <Settings ShowFilterRow="True" />
                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            </dx:ASPxGridView>
        </div>
    </div>
    <br />
    <br />
    <br />
    <br />
    <div>
        <div style="display: inline-block">
            <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Ventas por Grupo de Articulo Mes Actual" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
            <br />
            <dx:ASPxGridView ID="GvDatosD" runat="server" OnToolbarItemClick="GvDatosD_ToolbarItemClick" AutoGenerateColumns="False">
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="GrupoArticulo" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="TotalVentaMesActual" VisibleIndex="1">
                        <PropertiesTextEdit DisplayFormatString="N0">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                </Columns>
                <Toolbars>
                    <dx:GridViewToolbar >
                        <Items>
                            <dx:GridViewToolbarItem Text="Exportar" Name="ExportD" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                                <Items>
                                    <dx:GridViewToolbarItem Command="ExportToXls" />
                                    <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                    <dx:GridViewToolbarItem Command="ExportToCsv" />
                                </Items>
                                <Image IconID="actions_download_16x16office2013"></Image>
                            </dx:GridViewToolbarItem>
                        </Items>
                    </dx:GridViewToolbar>
                </Toolbars>
                <Settings ShowFilterRow="True" />
                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            </dx:ASPxGridView>
        </div>
        <div style="margin-left: 35px; display: inline-block">
            <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Ventas por Grupo de Articulo Mes Anterior" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
            <br />
            <dx:ASPxGridView ID="GvDatosE" runat="server" OnToolbarItemClick="GvDatosE_ToolbarItemClick" AutoGenerateColumns="False">
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="GrupoArticulo" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="TotalVentaMesAnterior" VisibleIndex="1">
                        <PropertiesTextEdit DisplayFormatString="N0">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                </Columns>
                <Toolbars>
                    <dx:GridViewToolbar >
                        <Items>
                            <dx:GridViewToolbarItem Text="Exportar" Name="ExportE" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                                <Items>
                                    <dx:GridViewToolbarItem Command="ExportToXls" />
                                    <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                    <dx:GridViewToolbarItem Command="ExportToCsv" />
                                </Items>
                                <Image IconID="actions_download_16x16office2013"></Image>
                            </dx:GridViewToolbarItem>
                        </Items>
                    </dx:GridViewToolbar>
                </Toolbars>
                <Settings ShowFilterRow="True" />
                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            </dx:ASPxGridView>
        </div>
    </div>
    <br />
    <br />
    <br />
    <br />
    <div>
        <div style="display: inline-block">
            <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text="Ventas por Tipo de Clientes - Grupo Articulo Mes Actual" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
            <br />
            <dx:ASPxGridView ID="GvDatosF" runat="server" OnToolbarItemClick="GvDatosF_ToolbarItemClick" Width="200px" AutoGenerateColumns="False">
                  <Columns>
                      <dx:GridViewDataTextColumn FieldName="TipoCliente" VisibleIndex="0">
                      </dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn FieldName="GrupoArticulo" VisibleIndex="1">
                      </dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn FieldName="TotalVentaMesActual" VisibleIndex="2">
                          <PropertiesTextEdit DisplayFormatString="N0">
                          </PropertiesTextEdit>
                      </dx:GridViewDataTextColumn>
                  </Columns>
                  <Toolbars>
                    <dx:GridViewToolbar >
                        <Items>
                            <dx:GridViewToolbarItem Text="Exportar" Name="ExportF" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                                <Items>
                                    <dx:GridViewToolbarItem Command="ExportToXls" />
                                    <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                    <dx:GridViewToolbarItem Command="ExportToCsv" />
                                </Items>
                                <Image IconID="actions_download_16x16office2013"></Image>
                            </dx:GridViewToolbarItem>
                        </Items>
                    </dx:GridViewToolbar>
                </Toolbars>
                <Settings ShowFilterRow="True" />
                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            </dx:ASPxGridView>
        </div>
        <div style="display: inline-block;margin-left:5px" >
            <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text="Ventas por Tipo de Clientes - Grupo Articulo Mes Anterior" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
            <br />
            <dx:ASPxGridView ID="GvDatosG" runat="server" OnToolbarItemClick="GvDatosG_ToolbarItemClick" Width="200px" AutoGenerateColumns="False">
                  <Columns>
                      <dx:GridViewDataTextColumn FieldName="TipoCliente" VisibleIndex="0">
                      </dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn FieldName="GrupoArticulo" VisibleIndex="1">
                      </dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn FieldName="TotalVentaMesAnterior" VisibleIndex="2">
                          <PropertiesTextEdit DisplayFormatString="N0">
                          </PropertiesTextEdit>
                      </dx:GridViewDataTextColumn>
                  </Columns>
                  <Toolbars>
                    <dx:GridViewToolbar >
                        <Items>
                            <dx:GridViewToolbarItem Text="Exportar" Name="ExportG" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                                <Items>
                                    <dx:GridViewToolbarItem Command="ExportToXls" />
                                    <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                    <dx:GridViewToolbarItem Command="ExportToCsv" />
                                </Items>
                                <Image IconID="actions_download_16x16office2013"></Image>
                            </dx:GridViewToolbarItem>
                        </Items>
                    </dx:GridViewToolbar>
                </Toolbars>
                <Settings ShowFilterRow="True" />
                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            </dx:ASPxGridView>
        </div>
    </div>
    <br />
    <br />
    <br />
    <br />
    <div>
        <div style="display: inline-block">
            <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Ventas Por Proveedor Mes Actual" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
            <br />
            <dx:ASPxGridView ID="GvDatosH" runat="server" OnToolbarItemClick="GvDatosH_ToolbarItemClick" Width="100px" AutoGenerateColumns="False">
                  <Columns>
                      <dx:GridViewDataTextColumn FieldName="ProveedorPred" VisibleIndex="0">
                      </dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn FieldName="NombreProveedor" VisibleIndex="1">
                      </dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn Caption="Mes Actual" FieldName="TotalVentaMesActual" VisibleIndex="2">
                          <PropertiesTextEdit DisplayFormatString="N0">
                          </PropertiesTextEdit>
                      </dx:GridViewDataTextColumn>
                  </Columns>
                  <Toolbars>
                    <dx:GridViewToolbar >
                        <Items>
                            <dx:GridViewToolbarItem Text="Exportar" Name="ExportH" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                                <Items>
                                    <dx:GridViewToolbarItem Command="ExportToXls" />
                                    <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                    <dx:GridViewToolbarItem Command="ExportToCsv" />
                                </Items>
                                <Image IconID="actions_download_16x16office2013"></Image>
                            </dx:GridViewToolbarItem>
                        </Items>
                    </dx:GridViewToolbar>
                </Toolbars>
                <Settings ShowFilterRow="True" />
                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            </dx:ASPxGridView>
        </div>
        <div style="display: inline-block;margin-left:5px">
            <dx:ASPxLabel ID="ASPxLabel9" runat="server" Text="Ventas Por Proveedor Mes Anterior" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
            <br />
            <dx:ASPxGridView ID="GvDatosI" runat="server" OnToolbarItemClick="GvDatosI_ToolbarItemClick" Width="100px" AutoGenerateColumns="False">
                  <Columns>
                      <dx:GridViewDataTextColumn FieldName="ProveedorPred" VisibleIndex="0">
                      </dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn FieldName="NombreProveedor" VisibleIndex="1">
                      </dx:GridViewDataTextColumn>
                      <dx:GridViewDataTextColumn Caption="Mes Anterior" FieldName="TotalVentaMesAnterior" VisibleIndex="2">
                          <PropertiesTextEdit DisplayFormatString="N0">
                          </PropertiesTextEdit>
                      </dx:GridViewDataTextColumn>
                  </Columns>
                  <Toolbars>
                    <dx:GridViewToolbar>
                        <Items>
                            <dx:GridViewToolbarItem Text="Exportar" Name="ExportI" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                                <Items>
                                    <dx:GridViewToolbarItem Command="ExportToXls" />
                                    <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                    <dx:GridViewToolbarItem Command="ExportToCsv" />
                                </Items>
                                <Image IconID="actions_download_16x16office2013"></Image>
                            </dx:GridViewToolbarItem>
                        </Items>
                    </dx:GridViewToolbar>
                </Toolbars>
                <Settings ShowFilterRow="True" />
                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            </dx:ASPxGridView>
        </div>
    </div>
    <br />
    <br />
    <br />
    <br />
    <div>
          <dx:ASPxLabel ID="ASPxLabel10" runat="server" Text="Venta - Costo - Margen" Font-Size="Large" Font-Bold="true"></dx:ASPxLabel>
        <dx:ASPxGridView ID="GvDatosJ" runat="server" OnToolbarItemClick="GvDatosJ_ToolbarItemClick" AutoGenerateColumns="False">
              <Columns>
                  <dx:GridViewDataTextColumn FieldName="TipoCliente" VisibleIndex="0">
                  </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn FieldName="GrupoArticulo" VisibleIndex="1">
                  </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn FieldName="Mes" VisibleIndex="2">
                  </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn FieldName="CodProducto" VisibleIndex="3">
                  </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn FieldName="Producto" VisibleIndex="4">
                  </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn FieldName="TotalVentaMes" VisibleIndex="5">
                      <PropertiesTextEdit DisplayFormatString="N0">
                      </PropertiesTextEdit>
                  </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn FieldName="Cantidad" VisibleIndex="6">
                      <PropertiesTextEdit DisplayFormatString="N0">
                      </PropertiesTextEdit>
                  </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn FieldName="PrecioPromedioVenta" VisibleIndex="7">
                      <PropertiesTextEdit DisplayFormatString="N3">
                      </PropertiesTextEdit>
                  </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn FieldName="CostoTotal" VisibleIndex="8">
                      <PropertiesTextEdit DisplayFormatString="N3">
                      </PropertiesTextEdit>
                  </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn FieldName="CostoPromedio" VisibleIndex="9">
                      <PropertiesTextEdit DisplayFormatString="N3">
                      </PropertiesTextEdit>
                  </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn FieldName="Margen" VisibleIndex="10">
                      <PropertiesTextEdit DisplayFormatString="N6">
                      </PropertiesTextEdit>
                  </dx:GridViewDataTextColumn>
                  <dx:GridViewDataTextColumn FieldName="MargenPlata" VisibleIndex="11">
                      <PropertiesTextEdit DisplayFormatString="N0">
                      </PropertiesTextEdit>
                  </dx:GridViewDataTextColumn>
              </Columns>
              <Toolbars>
                    <dx:GridViewToolbar>
                        <Items>
                            <dx:GridViewToolbarItem Text="Exportar" Name="ExportJ" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                                <Items>
                                    <dx:GridViewToolbarItem Command="ExportToXls" />
                                    <dx:GridViewToolbarItem Command="ExportToXlsx" />
                                    <dx:GridViewToolbarItem Command="ExportToCsv" />
                                </Items>
                                <Image IconID="actions_download_16x16office2013"></Image>
                            </dx:GridViewToolbarItem>
                        </Items>
                    </dx:GridViewToolbar>
                </Toolbars>
                <Settings ShowFilterRow="True" />
                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
        </dx:ASPxGridView>
    </div>

</asp:Content>
