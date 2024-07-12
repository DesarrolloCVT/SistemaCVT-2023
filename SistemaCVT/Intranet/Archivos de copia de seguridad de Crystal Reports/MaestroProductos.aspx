<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MaestroProductos.aspx.cs" Inherits="CVT_MermasRecepcion.MayoristaReportes.MaestroProductos" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li></li>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Mayorista</a></li>
            <li><span id="current">Maestro Productos</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Maestro Productos</span>
        <span class="tab-end"></span>
    </div>
    <br />
    <br />
    <div style="margin-left: 50px">
        <dx:ASPxButton ID="btnVer" runat="server" Text="Ver Grilla" Height="52px" Theme="MaterialCompact" Width="214px" OnClick="btnVer_Click">
            <Image IconID="print_preview_16x16">
            </Image>
        </dx:ASPxButton>
    </div>
    <br />
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsPager PageSize="500">
            </SettingsPager>
            <Settings AutoFilterCondition="Contains" ShowFilterRow="True" />
            <Toolbars>
                <dx:GridViewToolbar Position="Top">
                    <Items>
                        <dx:GridViewToolbarItem Text="Exportar" Name="Export" Image-IconID="actions_download_16x16office2013" Alignment="Left" DropDownMode="False" BeginGroup="True" GroupName="a1" Target="_parent">
                            <Items>
                                <dx:GridViewToolbarItem Command="ExportToXls" />
                                <dx:GridViewToolbarItem Command="ExportToXlsx" />
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
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsBehavior AllowFocusedRow="True" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Grupo" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodProducto" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Descripcion" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="SKU_Proveedor" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodProveedor" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="NombreProveedor" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UM" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UPC" VisibleIndex="9">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PrecioSala" VisibleIndex="11" Caption="Precio Sala Bruto">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PrecioUnitarioSala" VisibleIndex="12" Caption="Precio Unitario Sala Bruto">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Costo" VisibleIndex="15" Caption="Costo Neto">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CostoUnitario" VisibleIndex="16" Caption="Costo Unitario Neto">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Impto" VisibleIndex="17">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Porc_Impuesto" VisibleIndex="18">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CostoBruto" VisibleIndex="19">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CostoBrutoUnitario" VisibleIndex="20">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MargenSala" VisibleIndex="21" Caption="Margen Sala (Margen Bruto)">
                    <PropertiesTextEdit DisplayFormatString="N2">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodProducto_Hijo" VisibleIndex="23">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Descripcion_Hijo" VisibleIndex="24">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UM_Hijo" VisibleIndex="25">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UPC_Hijo" VisibleIndex="26">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PrecioSala_Hijo" VisibleIndex="27" Caption="Precio Sala Hijo Bruto">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PrecioUnitario_Hijo" VisibleIndex="28" Caption="Precio Unitario_Hijo Bruto">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Costo_Hijo" VisibleIndex="30" Caption="Costo Neto Hijo">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CostoBruto_Hijo" VisibleIndex="31">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MargenSala_Hijo" VisibleIndex="32" Caption="Margen Sala Hijo (Margen Bruto)">
                    <PropertiesTextEdit DisplayFormatString="N2">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodProducto_Hijo1" VisibleIndex="34">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Descripcion_Hijo1" VisibleIndex="35">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UM_Hijo1" VisibleIndex="36">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UPC_Hijo1" VisibleIndex="37">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PrecioSala_Hijo1" VisibleIndex="38" Caption="Precio Sala_Hijo1 Bruto">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PrecioUnitarioSala_Hijo1" VisibleIndex="39" Caption="Precio Unitario Sala_Hijo1 Bruto">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Costo_Hijo1" VisibleIndex="42" Caption="Costo Neto Hijo1">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CostoBruto_Hijo1" VisibleIndex="43">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="MargenSala_Hijo1" VisibleIndex="44" Caption="Margen Sala Hijo1 (Margen Bruto)">
                    <PropertiesTextEdit DisplayFormatString="N2">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Flejera" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="CodBarras" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UltimoPrecioCompra" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Precio Distribucion Neto" FieldName="PrecioDistribucion" VisibleIndex="13">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Precio Unitario Distribucion Neto" FieldName="PrecioUnitarioDistribucion" VisibleIndex="14">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Margen Distribucion Neto" FieldName="MargenDistribucion" VisibleIndex="22">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Precio Distribucion_Hijo Neto" FieldName="PrecioDistribucion_Hijo" VisibleIndex="29">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Margen Distribucion_Hijo Neto" FieldName="MargenDistribucion_Hijo" VisibleIndex="33">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Precio Distribucion_Hijo1 Neto" FieldName="PrecioDistribucion_Hijo1" VisibleIndex="40">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Precio UnitarioDistribucion_Hijo1 Neto" FieldName="PrecioUnitarioDistribucion_Hijo1" VisibleIndex="41">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Margen Distribucion_Hijo1 Neto" FieldName="MargenDistribucion_Hijo1" VisibleIndex="45">
                    <PropertiesTextEdit DisplayFormatString="N0">
                    </PropertiesTextEdit>
                </dx:GridViewDataTextColumn>
            </Columns>
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>
        </dx:ASPxGridView>
    </div>

</asp:Content>
