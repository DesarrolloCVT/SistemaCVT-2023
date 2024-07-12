<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PropuestaPrecioVenta.aspx.cs" Inherits="CVT_MermasRecepcion.Mayorista.PropuestaPrecioVenta" %>

<%@ Register Assembly="DevExpress.Web.v22.1, Version=22.1.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cntMaster" runat="server">
    <div id="breadcrumbs">
        <ul>
            <li><a href="../Blank.aspx">Inicio</a></li>
            <li><a>Mayorista</a></li>
            <li><span id="current">Propuesta Precio Venta</span></li>
        </ul>
    </div>

    <div id="tableHeader">
        <span class="tableTitle">Propuesta Precio Venta</span>
        <span class="tab-end"></span>
        <div id="options">
         <%--   <a>
                <asp:ImageButton ID="cmdExcel" runat="server"
                    ImageUrl="~/App_Themes/IDA/ui/ico-file-excel.png" OnClick="cmdExcel_Click"
                    Style="width: 20px; height: 20px;" />
                Exportar Excel</a>&nbsp;--%>
            <%--  <a>
                  <asp:ImageButton ID="cmdNew" runat="server" ImageUrl="~/Images/add.png" OnClick="cmdNew_Click" Style="width: 16px" />Nuevo</a>--%>
        </div>
    </div>
    <br />
    <div>
        <dx:ASPxGridView ID="GvDatos" runat="server" AutoGenerateColumns="False" OnToolbarItemClick="GvDatos_ToolbarItemClick">
            <SettingsPager PageSize="50">
            </SettingsPager>
            <Settings ShowFilterRow="True" AutoFilterCondition="Contains" />
            <SettingsBehavior AllowFocusedRow="True" />
            <Toolbars>
                <dx:GridViewToolbar>
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
            <Columns>
                <dx:GridViewDataTextColumn Caption="Cod.Producto" FieldName="ItemCode" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Descripcion" FieldName="ItemName" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UltimoPrecioCompra" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Porcentaje" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PrecioPromedioSAP" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="UltimoPrecioCompraSAP" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PrecioVentaPropuesto" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PrecioPropuestoIVA" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="PrecioVentaSAP" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="StockActual" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="Unidad" FieldName="Unidad" VisibleIndex="10">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Text="No" Value="N" />
                            <dx:ListEditItem Text="Si" Value="Y" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="Cod Proveedor" FieldName="CodProveedor" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Proveedor" FieldName="Proveedor" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="SKU Proveedor" FieldName="SKUProveedor" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="Default" />
            <SettingsSearchPanel CustomEditorID="tbToolbarSearch" />
            <Styles>
                <FocusedRow BackColor="#FF9933">
                </FocusedRow>
            </Styles>

        </dx:ASPxGridView>
    </div>
</asp:Content>
